# Tools Used

A reference guide for all forensic tools used in this investigation, including purpose, version, and relevant commands.

---

## ADB (Android Debug Bridge)

**Version:** Included with Android SDK Platform Tools  
**Download:** https://developer.android.com/tools/releases/platform-tools  
**Purpose:** Primary acquisition tool — used to connect to mobile devices and pull files without interacting with the device UI.

### Key Commands Used

```bash
# Connect to device
adb connect <ip_address>:5555

# Verify connected devices
adb devices

# Enable airplane mode (forensically sound — avoids touching device UI)
adb shell settings put global airplane_mode_on 1
adb shell am broadcast -a android.intent.action.AIRPLANE_MODE

# Pull a specific file
adb pull /storage/self/primary/DCIM/Camera/IMG_20210510_061453.jpg

# Pull an entire directory
adb pull /data/data/com.facebook.katana/cache/graph_store_cache/100067511029705/

# Pull ProtonMail database
adb pull /data/data/ch.protonmail.android/databases/ <output_filename>
```

---

## HashMyFiles

**Version:** 2.x (NirSoft)  
**Download:** https://www.nirsoft.net/utils/hash_my_files.html  
**Purpose:** Generates MD5, SHA-1, and SHA-256 hash values for files to verify integrity and ensure Golden Copies match originals.

### Usage Notes

- Load files via drag-and-drop or File > Add Files
- Export hash report via Options > Save All Items
- Hash values were recorded for all seized OVA files and extracted artefacts

---

## DB Browser for SQLite (DB4S)

**Version:** 3.12.x  
**Download:** https://sqlitebrowser.org/  
**Purpose:** Opened and browsed SQLite database files from Facebook (`GraphStore.sqlite3`) and ProtonMail app caches.

### Workflow Used

1. File > Open Database → select `.sqlite3` file
2. Navigate to **Browse Data** tab
3. Filter rows by `typename` column to locate relevant entries
4. Click on BLOB/DATA field → export content to `.txt` file

### Databases Analysed

| Database | Source | Contents |
|---|---|---|
| `GraphStore.sqlite3` | Jack's Phone — Facebook cache | Posts, stories, notifications |
| `GraphStore.sqlite3` | Sonny's Phone — Facebook cache | Posts, stories, notifications |
| `amFja2JhbGxvdzE4N0Bwcm90b25tYWlsLmNvbQ==-MessagesDatabase` | Jack's Phone — ProtonMail cache | Encrypted PGP email messages |

---

## ExifTool

**Version:** 12.x  
**Download:** https://exiftool.org/  
**Purpose:** Extracted metadata (GPS coordinates, timestamps, device info) from image files.

### Key Commands Used

```bash
# Extract all metadata from an image
exiftool IMG_20210510_061453.jpg

# Extract GPS coordinates only
exiftool -GPSLatitude -GPSLongitude IMG_20210510_061453.jpg

# Output metadata to a text file
exiftool IMG_20210510_061453.jpg > exiftool_output.txt
```

### Output Used

GPS coordinates from `A003` were fed into Google Maps to confirm Jack's office location at **Telepark, 5 Tampines Central 6, Singapore 529482**.

---

## GPG (GnuPG)

**Version:** 2.x  
**Download:** https://gnupg.org/  
**Purpose:** Decrypted PGP-encrypted ProtonMail messages using private keys extracted from both devices.

### Key Commands Used

```bash
# Import a private key
gpg --import privatekey.jackballow187@protonmail.com.asc

# Decrypt a PGP message to plaintext
gpg --decrypt encryptedMessage.txt.gpg > decryptedMessage.txt

# Decrypt a PGP message to HTML
gpg --decrypt receiptEncrypted.txt.gpg > service.html
```

> **Note:** Passphrase for both private keys was `password` (found in `A004` and `A016`).

### Keys Used

| Key File | Owner | Hash (SHA-256) |
|---|---|---|
| `privatekey.jackballow187@protonmail.com.asc` | Jack Ballow | `5951ba9c29aa21a136406c9d3674a89b1ddcc614316d964ac6c7e6859f653faf` |
| `privatekey.sonnywilliams272.asc` | Sonny Williams | `dfa4803c606fabdd3334c648559c2ebdf1a5e3913f2857dd219a3fa17fa0a09b` |

---

## Google Maps

**Platform:** Web (maps.google.com)  
**Purpose:** Verified physical location of Jack's office using GPS coordinates extracted via ExifTool. Used Street View to visually confirm the building as Telepark.

---

## Environment

| Component | Details |
|---|---|
| **Host OS** | Kali Linux |
| **Device Emulation** | Genymotion (Android 10, API 29) |
| **Device Models** | `VM-GENY-JACK`, `VM-GENY-SONNY` |
| **ADB Connection** | Over network (`<ip>:5555`) |

---

*MDF CCF2C04 — Group 1 — Temasek Polytechnic — AY 2022/2023*
