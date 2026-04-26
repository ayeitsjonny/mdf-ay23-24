#!/bin/bash
# =============================================================================
# acquire.sh
# Evidence Acquisition Script — MDF Case Study II
# Mobile Device Forensics (CCF2C04) — Group 5
# Temasek Polytechnic — AY 2023/2024
# =============================================================================
# Usage: bash acquire.sh
# Run from the root of the MDF-Case-Study-II directory
# Requires: ADB, GPG
# =============================================================================

# Colour output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No colour

echo -e "${YELLOW}=============================================${NC}"
echo -e "${YELLOW}  MDF Case Study II — Evidence Acquisition  ${NC}"
echo -e "${YELLOW}=============================================${NC}"

# -----------------------------------------------------------------------------
# STEP 0 — VERIFY ADB CONNECTION
# -----------------------------------------------------------------------------
echo -e "\n${YELLOW}[*] Checking ADB connection...${NC}"
adb devices

echo -e "\n${YELLOW}[*] Enabling Airplane Mode (forensically sound)...${NC}"
adb shell settings put global airplane_mode_on 1
adb shell am broadcast -a android.intent.action.AIRPLANE_MODE
echo -e "${GREEN}[+] Airplane Mode enabled.${NC}"

# -----------------------------------------------------------------------------
# STEP 1 — CREATE OUTPUT DIRECTORIES
# -----------------------------------------------------------------------------
echo -e "\n${YELLOW}[*] Creating output directories...${NC}"
mkdir -p evidence/jack
mkdir -p evidence/sonny
mkdir -p evidence/search-warrant/SW002_sticky-notes
mkdir -p supporting-evidence/SE003_gpg-key-import
echo -e "${GREEN}[+] Directories created.${NC}"

# =============================================================================
# JACK BALLOW'S DEVICE
# =============================================================================
echo -e "\n${YELLOW}=============================================${NC}"
echo -e "${YELLOW}  Acquiring from Jack Ballow's Device        ${NC}"
echo -e "${YELLOW}=============================================${NC}"

# A003 — Office photo
echo -e "\n${YELLOW}[*] Pulling A003 — Office image...${NC}"
adb pull /storage/self/primary/DCIM/Camera/IMG_20210510_061453.jpg \
    evidence/jack/A003_IMG_20210510_061453.jpg
echo -e "${GREEN}[+] A003 acquired.${NC}"

# A004 — PGP passphrase note
echo -e "\n${YELLOW}[*] Pulling A004 — notes.txt (PGP passphrase)...${NC}"
adb pull /storage/self/primary/Download/notes.txt \
    evidence/jack/A004_notes.txt
echo -e "${GREEN}[+] A004 acquired.${NC}"

# A005 — Jack's PGP private key
echo -e "\n${YELLOW}[*] Pulling A005 — PGP private key (Jack)...${NC}"
adb pull "/storage/self/primary/Download/privatekey.jackballow187@protonmail.com.asc" \
    "evidence/jack/A005_privatekey.jackballow187.asc"
echo -e "${GREEN}[+] A005 acquired.${NC}"

# A006 — ProtonMail messages database
echo -e "\n${YELLOW}[*] Pulling A006 — ProtonMail messages database...${NC}"
adb pull "/data/data/ch.protonmail.android/databases/amFja2JhbGxvdzE4N0Bwcm90b25tYWlsLmNvbQ==-MessagesDatabase" \
    evidence/jack/A006_MessagesDatabase
echo -e "${GREEN}[+] A006 acquired.${NC}"

# A009 — Facebook GraphStore database (Jack)
echo -e "\n${YELLOW}[*] Pulling A009 — Facebook GraphStore (Jack)...${NC}"
adb pull /data/data/com.facebook.katana/cache/graph_store_cache/100067511029705/GraphStore.sqlite3 \
    evidence/jack/A009_GraphStore.sqlite3
echo -e "${GREEN}[+] A009 acquired.${NC}"

# =============================================================================
# SONNY WILLIAMS'S DEVICE
# =============================================================================
echo -e "\n${YELLOW}=============================================${NC}"
echo -e "${YELLOW}  Acquiring from Sonny Williams's Device     ${NC}"
echo -e "${YELLOW}=============================================${NC}"

# A016 — Sonny's PGP passphrase note
echo -e "\n${YELLOW}[*] Pulling A016 — notes.txt (Sonny)...${NC}"
adb pull /storage/self/primary/Download/notes.txt \
    evidence/sonny/A016_notes.txt
echo -e "${GREEN}[+] A016 acquired.${NC}"

# A017 — Sonny's PGP private key
echo -e "\n${YELLOW}[*] Pulling A017 — PGP private key (Sonny)...${NC}"
adb pull /storage/self/primary/Download/privatekey.sonnywilliams272.asc \
    evidence/sonny/A017_privatekey.sonnywilliams272.asc
echo -e "${GREEN}[+] A017 acquired.${NC}"

# A015 — Facebook GraphStore database (Sonny)
echo -e "\n${YELLOW}[*] Pulling A015 — Facebook GraphStore (Sonny)...${NC}"
adb pull /data/data/com.facebook.katana/cache/graph_store_cache/100067511029706/GraphStore.sqlite3 \
    evidence/sonny/A015_GraphStore.sqlite3
echo -e "${GREEN}[+] A015 acquired.${NC}"

# =============================================================================
# HASH VERIFICATION
# =============================================================================
echo -e "\n${YELLOW}=============================================${NC}"
echo -e "${YELLOW}  Generating SHA-256 Hashes                 ${NC}"
echo -e "${YELLOW}=============================================${NC}"

echo -e "\n${YELLOW}[*] Generating hash values for all acquired files...${NC}"
find evidence/ -type f | while read file; do
    hash=$(sha256sum "$file" | awk '{print $1}')
    echo -e "${GREEN}[+]${NC} $file"
    echo "    SHA-256: $hash"
done

echo -e "\n${YELLOW}[*] Saving hashes to hashes.txt...${NC}"
sha256sum evidence/jack/* evidence/sonny/* > hashes.txt
echo -e "${GREEN}[+] hashes.txt saved.${NC}"

# =============================================================================
# PGP DECRYPTION
# =============================================================================
echo -e "\n${YELLOW}=============================================${NC}"
echo -e "${YELLOW}  PGP Decryption                            ${NC}"
echo -e "${YELLOW}=============================================${NC}"

# Import Jack's private key
echo -e "\n${YELLOW}[*] Importing Jack's PGP private key...${NC}"
gpg --import "evidence/jack/A005_privatekey.jackballow187.asc"
echo -e "${GREEN}[+] Key imported.${NC}"

# Import Sonny's private key
echo -e "\n${YELLOW}[*] Importing Sonny's PGP private key...${NC}"
gpg --import evidence/sonny/A017_privatekey.sonnywilliams272.asc
echo -e "${GREEN}[+] Key imported.${NC}"

# Decrypt Jack-Hazel conversation (passphrase: password)
echo -e "\n${YELLOW}[*] Decrypting A007 — Jack & Hazel email conversation...${NC}"
echo "password" | gpg --batch --yes --passphrase-fd 0 \
    --decrypt evidence/jack/A006_MessagesDatabase > evidence/jack/A007_decryptedMessage.txt
echo -e "${GREEN}[+] A007 decrypted.${NC}"

# Decrypt assassination receipt
echo -e "\n${YELLOW}[*] Decrypting A008 — Service receipt (xxbaemaxx)...${NC}"
echo "password" | gpg --batch --yes --passphrase-fd 0 \
    --decrypt evidence/jack/A006_MessagesDatabase > evidence/jack/A008_service.html
echo -e "${GREEN}[+] A008 decrypted.${NC}"

# =============================================================================
# EXIFTOOL — METADATA EXTRACTION
# =============================================================================
echo -e "\n${YELLOW}=============================================${NC}"
echo -e "${YELLOW}  Metadata Extraction (ExifTool)            ${NC}"
echo -e "${YELLOW}=============================================${NC}"

echo -e "\n${YELLOW}[*] Extracting metadata from A003...${NC}"
exiftool evidence/jack/A003_IMG_20210510_061453.jpg
exiftool evidence/jack/A003_IMG_20210510_061453.jpg > supporting-evidence/SE002_exiftool-output.txt
echo -e "${GREEN}[+] Metadata extracted and saved to SE002_exiftool-output.txt${NC}"

# =============================================================================
# DONE
# =============================================================================
echo -e "\n${GREEN}=============================================${NC}"
echo -e "${GREEN}  Acquisition complete.                      ${NC}"
echo -e "${GREEN}  All files saved to evidence/               ${NC}"
echo -e "${GREEN}  Hashes saved to hashes.txt                 ${NC}"
echo -e "${GREEN}=============================================${NC}"
