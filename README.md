# Mobile Device Forensics — Case Study II
**School of Informatics & IT | AY 2022/2023 Apr Semester (Level 2)**  
**Diploma in Cybersecurity & Digital Forensics**  
**Subject: Mobile Device Forensics (MDF) — CCF2C04**

---

## Team Members (Group 1 — Practical Class P03)

| Student ID | Name |
|---|---|
| 2100296I  | Jonathan New Kah Hwee |
| 2100321E | Chiok Sin Yee Fraser |
| 2102369B | Bryton Foo Ming Sheng |
| 2100407B | Kelton Kung Jun Wei |

**Date Submitted:** 25 May 2023

---

## Table of Contents

1. [Workload Distribution](#1-workload-distribution)
2. [Background Information](#2-background-information)
3. [Executive Summary](#3-executive-summary)
4. [The Forensics Model Phases](#4-the-forensics-model-phases)
   - 4.1 [Preparation](#41-preparation)
   - 4.2 [Survey & Acquisition of Evidence](#42-survey--acquisition-of-evidence)
   - 4.3 [Preservation](#43-preservation)
   - 4.4 [Examination / Analysis](#44-examinationanalysis)
   - 4.5 [Presentation](#45-presentation)
5. [Conclusion](#5-conclusion)
   - 5.1 [Legal Implications](#51-legal-implications)
   - 5.2 [Team Learning Points](#52-team-learning-points)
6. [Tools Used](#6-tools-used)
7. [References](#7-references)
8. [Appendix](#8-appendix)

---

## 1. Workload Distribution

| Name | Responsibilities |
|---|---|
| **Bryton** | Analysed artefacts from Jack's and Sonny's phones; created Search Warrant; handled Examination/Analysis and Survey & Acquisition phases; created Chain of Custody form |
| **Fraser** | Analysed artefacts from Jack's and Sonny's phones; cross-checked with DI Process Model Checklist; handled Presentation Phase and Legal Implications; handled Preparation and Preservation phases |
| **Kelton** | Analysed artefacts from Jack's and Sonny's phones; created Search Warrant; handled Examination/Analysis and Survey & Acquisition phases |
| **Jonathan** | Analysed artefacts from Jack's and Sonny's phones; created Timeline of events; handled Preparation and Presentation phases |

---

## 2. Background Information

On 24 April 2021, Hazel Casey and her fiancé Jack Ballow were to be married. While Jack waited at the chapel with his officiator Sonny Williams, three officers arrived with grim news — Hazel had been found murdered at her home.

The three had been close friends since Temasek Polytechnic, where they all studied Cybersecurity and Digital Forensics. Sonny and Jack were study buddies from Year 1, with Hazel joining them in Year 2. Before the incident, each had pursued separate careers:

- **Sonny Williams** — Cybersecurity Managing Consultant (private sector)
- **Jack Ballow** — Technician at his alma mater
- **Hazel Casey** — Cybersecurity Engineer at a well-known organisation

On their 10th meetup, Jack revealed to Sonny his plans to marry Hazel and asked Sonny to officiate. Sonny, who had developed feelings for Hazel, finally confessed to her — but was rejected and told to move on.

---

## 3. Executive Summary

After investigation, the team concluded that Hazel Casey was **assassinated by a hired assassin (xxbaemaxx) contracted by Jack Ballow**.

Key evidence supporting this conclusion:

- A receipt was found sent to Jack from **xxbaemaxx** stating: *"Assassination of Hazel Casey at her house @ 25th April 2021, 06:00H"* — billed at **$1,000** (**Evidence Item SW001**).
- Jack's communications revealed he became enraged after Hazel sent a message appearing to call off the wedding (**Evidence Item SE004**). He demanded an answer, responding furiously — *"better answer me now! NOW!"*
- Hazel later clarified it was an April Fool's prank, calling it a *"harmless little prank"* and apologising.
- Despite the apology, Jack posted a Facebook quote indicating he was still deeply hurt (**Evidence Item A020**), and contracted xxbaemaxx the very next day.

The team deduced Jack's motive was rage — believing he had been led on by Hazel before their wedding day.

---

## 4. The Forensics Model Phases

### 4.1 Preparation

The team established the approach for handling the digital investigation upon receiving the seized mobile devices from Investigating Police Officer, Staff Sergeant Jordan Tan. Supporting documents created during this phase:

- **DI Process Model Checklist** *(Appendix 8.1)* — Framework providing a step-by-step investigation guideline.
- **Search Warrant** *(Appendix 8.2)* — Authorisation to search Jack Ballow's office for additional evidence.
- **Chain of Custody** *(Appendix 8.3)* — Documentation ensuring evidence integrity and admissibility in court.

The team also applied **Locard's Exchange Principle** — that any contact between two items results in an exchange — to guide the Preservation and Examination phases, helping to link suspects, victims, and the crime scene.

---

### 4.2 Survey & Acquisition of Evidence

#### 4.2.1 Reasoning for Survey

Scrutiny at this phase is paramount. Identifying potential sources of digital and physical evidence allows the team to make informed decisions about what to preserve and analyse.

#### 4.2.2 Physical Investigation

- Seized mobile devices of both Jack Ballow and Sonny Williams.
- Determined cause of death: **multiple stab wounds to the neck and stomach**.
- Reviewed alibis of both suspects.
- Issued and obtained approval for a **Search Warrant** to search Jack's office at Telepark (5 Tampines Central 6, Singapore 529482), approved by District Judge Mr Lim Chee Yong.
- The search uncovered a **receipt for the assassination of Hazel Casey**.

#### 4.2.3 Evidence Acquisition

> **Legend:**
> - **A###** — Artefact
> - **SE###** — Supporting Evidence
> - **SW###** — Search Warrant Evidence

| Item | Filename | Description | SHA-256 Hash |
|---|---|---|---|
| **A003** | `IMG_20210510_061453.jpg` | Photo taken from Jack's office; ExifTool used to extract GPS coordinates linking to Telepark building | `b78f8bf525ddce097adce06b3804c88d7ab37e33ad63265e62cf0a43516cde5c` |
| **A004** | `notes.txt` | Passphrase file for PGP decryption — password: `password` | `03e5a1a737c5fa75043f11a9805ff994bee77da8c2593f8dd23d615f4149f5aa` |
| **A005** | `privatekey.jackballow187@protonmail.com.asc` | Jack Ballow's PGP private key; used to decrypt ProtonMail messages | `5951ba9c29aa21a136406c9d3674a89b1ddcc614316d964ac6c7e6859f653faf` |
| **A006** | `amFja2JhbGxvdzE4N0Bwcm90b25tYWlsLmNvbQ==-MessagesDatabase` | Cached ProtonMail database from Jack's phone | `2cca5bc690d5f04b14e73de9b753961825b355e1fc6b9fae042e0e1742d91148` |
| **A007** | `decryptedMessage.txt` | Decrypted ProtonMail conversation between Jack and Hazel (April Fool's prank) | — |
| **A008** | `service.html` | Decrypted ProtonMail message — receipt for assassination service from xxbaemaxx to Jack | — |
| **A009** | `GraphStore.sqlite3` (Jack) | Facebook cache database from Jack's phone | — |
| **A010** | `notificationOfMarriage.txt` | Facebook post by Sonny about Jack and Hazel's wedding announcement | — |
| **A011** | `sonnyNewOffice.txt` | Sonny's post about Jack moving into his office | — |
| **A012** | `KLTrip.txt` | Sonny's post about his KL trip | — |
| **A013** | `newOfficeFound.txt` | Sonny's post about getting his new private office | — |
| **A014** | `addictedMurderRelatedSeries.txt` | Sonny's post about watching *How to Get Away with Murder* | — |
| **A015** | `GraphStore.sqlite3` (Sonny) | Facebook cache database from Sonny's phone | — |
| **A016** | `notes.txt` (Sonny) | Passphrase file for Sonny's PGP decryption | `03e5a1a737c5fa75043f11a9805ff994bee77da8c2593f8dd23d615f4149f5aa` |
| **A017** | `privatekey.sonnywilliams272.asc` | Sonny Williams's PGP private key | `dfa4803c606fabdd3334c648559c2ebdf1a5e3913f2857dd219a3fa17fa0a09b` |
| **A018** | `wedding.txt` | Jack's wedding announcement post from Sonny's phone | — |
| **A019** | `turkey.txt` | Jack's Turkey trip announcement | — |
| **A020** | `hellHath.txt` | Jack's Facebook post quoting *"Hell hath no fury like a woman scorned"* | — |
| **A021** | `jackOffice.txt` | Jack's post about his new office | — |
| **A022** | `bestGirl.txt` | Jack's congratulatory post to Hazel on her new job | — |

**Acquisition commands (ADB):**

```bash
# Pull image from Jack's phone
adb pull /storage/self/primary/DCIM/Camera/IMG_20210510_061453.jpg

# Pull notes.txt
adb pull /storage/self/primary/Download/notes.txt

# Pull PGP private key
adb pull /storage/self/primary/Download/privatekey.jackballow187@protonmail.com.asc

# Pull ProtonMail database
adb pull /data/data/ch.protonmail.android/databases/ amFja2JhbGxvdzE4N0Bwcm90b25tYWlsLmNvbQ==-MessagesDatabase

# Pull Facebook cache database
adb pull /data/data/com.facebook.katana/cache/graph_store_cache/100067511029705/GraphStore.sqlite3
```

**PGP decryption commands:**

```bash
# Decrypt Jack-Hazel email
gpg --decrypt encryptedMessage.txt.gpg > decryptedMessage.txt

# Decrypt receipt (service.html)
gpg --decrypt receiptEncrypted.txt.gpg > service.html
```

> **Note:** The passphrase for both private keys was `password` (found in A004/A016).

---

### 4.3 Preservation

This phase involves isolating and securing digital evidence to prevent alteration, as well as collecting volatile data before any risk of device shutdown.

#### 4.3.1 Chain of Custody (CoC)

**Purpose:**
- Preserves the evidence's integrity and prevents contamination.
- Documents the chronological handling of evidence — who possessed it, when, and how it was transferred.
- Ensures evidence is admissible in court.

**Steps taken:**
1. Saved original OVA files and created bit-for-bit **Golden Copies** for working.
2. Photographed and screenshotted all physical and digital evidence.
3. Documented timestamps of all evidence handling.
4. Generated **SHA-256 hash values** using HashMyFiles to verify copy integrity.

#### 4.3.2 Airplane Mode

Upon receiving the devices, both phones were immediately set to **Airplane Mode** via ADB commands (not the UI) to prevent network communication and data synchronisation, while maintaining forensic soundness.

#### 4.3.3 Volatile Data

The team followed the **Order of Volatility** when collecting data:

- **Tier 1 & 2 Volatile (collected first):** RAM, cache, clipboard contents, scheduled tasks.
- **Non-volatile (collected after):** Registry settings, audit policies, system event logs, browser history.

---

### 4.4 Examination/Analysis

#### 4.4.1 Analysis of Extracted Data

**Text Files:**

| Artefact | Key Finding |
|---|---|
| **A004** — `notes.txt` (Jack) | PGP passphrase: `password` |
| **A007** — `decryptedMessage.txt` | Hazel's April Fool's prank about calling off the wedding; Jack's furious response |
| **A008** — `service.html` | Receipt from xxbaemaxx for assassination of Hazel; dated 2 April 2021 |
| **A010** — `notificationOfMarriage.txt` | Sonny's public post accepting the news of the wedding; suggests he may have moved on |
| **A011** — `sonnyNewOffice.txt` | Jack moved into Sonny's office; Sonny was happy |
| **A012** — `KLtrip.txt` | Sonny's KL holiday — used for temporal analysis |
| **A013** — `newOfficeFound.txt` | Sonny acquiring new private office |
| **A014** — `addictedMurderRelatedSeries.txt` | Sonny hooked on *How to Get Away with Murder* — flagged as suspicious |
| **A016** — `notes.txt` (Sonny) | Same PGP passphrase as Jack's notes |
| **A018** — `wedding.txt` | Jack's official wedding announcement |
| **A020** — `hellHath.txt` | Jack's post: *"Hell hath no fury like a woman scorned"* — unresolved anger |
| **A021** — `jackOffice.txt` | Jack bragging about new office without crediting Sonny |
| **A022** — `bestGirl.txt` | Jack congratulating Hazel on new job — shows earlier positive relationship |

**Graphics Files:**

- **A003 (Jack's Office Photo):** Taken inside Jack's office; building reflection identified as OCBC Tampines Centre One, placing location at **Telepark, 5 Tampines Central 6, Singapore 529482** (confirmed via ExifTool GPS coordinates + Google Maps).
- **SW002 (Search Warrant Photo):** Jack's desk with sticky notes revealing: a **12pm meeting**, **Wi-Fi SSID and password**, and a **potential device password**.

---

#### 4.4.2 Temporal Analysis

| Date | Event |
|---|---|
| 24 Feb 2021 | Sonny's KL trip |
| 4 Mar 2021 | Jack's Turkey trip |
| 16 Mar 2021 | Sonny moved into his own private office |
| 20 Mar 2021 | Jack moved in with Sonny at his office |
| 1 Apr 2021 | Hazel and Jack argument (April Fool's prank) |
| 2 Apr 2021 | Jack posted Facebook quote; contracted xxbaemaxx for assassination service (11:30am via ProtonMail) |
| 4 Apr 2021 | Sonny posted about *How to Get Away with Murder* |
| 17 Apr 2021, 21:00 | Official wedding announcement — Jack & Hazel, officiated by Sonny |
| 17 Apr 2021, 23:00 | Sonny's private reaction — surprise and jealousy about the wedding |
| 25 Apr 2021, 06:00 | Scheduled assassination of Hazel Casey |

---

#### 4.4.3 Relational Analysis

```
Jack Ballow ─── (engaged) ─── Hazel Casey
     │                             │
     └── (close friends) ──── Sonny Williams
                                   │
                            (unrequited love → Hazel)

Jack Ballow ─── (contracted) ─── xxbaemaxx (assassin)
```

- **Jack Ballow:** Engaged to Hazel; close friends with Sonny; works as technician at alma mater.
- **Hazel Casey:** Engaged to Jack; close friends with Jack and Sonny; Cybersecurity Engineer.
- **Sonny Williams:** Developed feelings for Hazel since Polytechnic; close friends with both; Cybersecurity Managing Consultant.
- **xxbaemaxx:** Hired by Jack to assassinate Hazel.

---

#### 4.4.4 Functional Analysis

- The ProtonMail conversation (SE004) shows a suspicious **9-hour communication gap (10:00H–19:00H)** between Hazel and Jack, suggesting strained communication.
- Jack's Facebook post on **2 April 2021** confirms the prank was not resolved emotionally.
- On the **same day**, Jack contracted xxbaemaxx — directly linking the prank to the assassination order.

---

### 4.5 Presentation

#### Hypothesis 1: Sonny Williams Killed Hazel Casey

**Motive:** Jealousy over Jack marrying his crush Hazel. Sonny may have killed Hazel to hurt both her and Jack after years of unrequited love.

**Supporting evidence:** Sonny's failed confession to Hazel; his suspicious interest in *How to Get Away with Murder* (A014); his position as wedding officiator as possible cover.

**Refutation:** There is insufficient direct evidence tying Sonny to the crime scene. His public posts suggest he accepted the situation. The series may have been watched for entertainment only.

---

#### Hypothesis 2: xxbaemaxx (Hired by Jack) Killed Hazel Casey ✅ *Concluded*

**Motive:** Jack's fury over Hazel's April Fool's prank. Feeling cheated and humiliated, he acted on impulse and contracted an assassin the day after the argument.

**Supporting evidence:**
- Assassination receipt (SW001) addressed to Jack, with Hazel's name, location, and time.
- ProtonMail conversation (A008) between Jack and xxbaemaxx confirming the deal on 2 April 2021.
- Facebook post (A020) confirming Jack's unresolved anger.
- Jack's email response to Hazel (SE004) showing extreme fury.

**Refutation:** Their long friendship makes it seem extreme — but the team concluded the evidence outweighs this assumption.

---

#### 4.5.2 Conclusion of Investigation

The team concluded that **Hazel Casey was murdered by xxbaemaxx, hired by Jack Ballow**.

The chain of events:
1. **1 April 2021** — Hazel's prank about calling off the wedding enraged Jack.
2. **2 April 2021** — Jack posted a furious Facebook quote and contracted xxbaemaxx at 11:30am via ProtonMail.
3. A receipt was discovered (via approved Search Warrant) confirming the assassination was scheduled for **25 April 2021, 06:00H** at Hazel's home.

Further investigation into xxbaemaxx and additional questioning of Jack would bring full closure to the case.

---

## 5. Conclusion

### 5.1 Legal Implications

Based on the evidence, both **xxbaemaxx** and **Jack Ballow** have violated the **Penal Code 1871 (Singapore)**:

| Person | Offence | Section |
|---|---|---|
| **xxbaemaxx** | Murder | Section 300 |
| **xxbaemaxx** | Attempt to murder (pre-meditated) | Section 307 |
| **xxbaemaxx** | Punishment for murder | Section 302 — death or life imprisonment with caning |
| **Jack Ballow** | Abetment — instigating the murder | Section 109 (Chapter 5) — subject to equivalent punishment |

### 5.2 Team Learning Points

**Highs:**
- Workload was divided equally and effectively; all members contributed meaningfully.
- The team bonded through the investigation process, supporting one another in analysing complex files and forensic tools.

**Lows:**
- Multiple iterations were needed to satisfy Search Warrant requirements.
- Limited useful metadata within the devices extended the time needed to locate hidden files and databases.

Overall, the team gained hands-on experience with the DI Model, ADB, mobile forensic tools, and digital investigation methodology — skills applicable to future internships, major projects, and careers in cybersecurity.

---

## 6. Tools Used

| Tool | Purpose |
|---|---|
| **ADB (Android Debug Bridge)** | Primary acquisition tool; used to issue commands to devices and pull files without tampering with evidence |
| **HashMyFiles** | Calculated SHA-256, MD5, and SHA-1 hash values of seized devices and artefacts |
| **DB Browser for SQLite** | Opened and analysed SQLite databases from Facebook and ProtonMail app caches |
| **ExifTool** | Extracted GPS coordinates and metadata from image files (A003) |
| **Google Maps** | Used GPS coordinates from ExifTool to verify Jack's office location via Street View |
| **GPG (GnuPG)** | Decrypted PGP-encrypted ProtonMail messages using extracted private keys |

---

## 7. References

- Singapore Statutes Online — Penal Code 1871: https://sso.agc.gov.sg/act/pc1871
- R3 — What is a Golden Copy?: https://www.r3.com/blog/what-is-a-golden-copy/
- InfoSec Institute — Computer Forensics Chain of Custody: https://resources.infosecinstitute.com/topic/computer-forensics-chain-custody/
- Studocu — Chain of Custody Form: https://www.studocu.com/en-au/document/university-of-technology-sydney/digital-forensics/chain-of-custody-form/13416010

---

## 8. Appendix

### 8.1 Digital Investigation (DI) Process Model Checklist

**Section A — Preparation**

| Description | Jack | Sonny |
|---|---|---|
| Obtain valid search warrant with affidavits and description of search location | ✓ | ✓ |
| Prepare digital camera for crime scene documentation | N/A | N/A |
| Standby Chain of Custody document; secure evidence in faraday bag | ✓ | ✓ |
| Prepare fieldwork toolkit and forensic tools | N/A | N/A |
| Organise documents for recording investigation notes | N/A | N/A |
| Establish basis for investigation based on factual knowledge | ✓ | ✓ |
| Generate plan of action using investigation process model | ✓ | ✓ |

**Section B — Survey/Identification**

| Description | Jack | Sonny |
|---|---|---|
| Obtain information from surveying suspects' office (IoT devices) | ✓ | ✓ |
| Search for local and remote backups of electronic devices | ✓ | ✓ |
| Look for presence of encryption or data concealment | ✓ | ✓ |
| Indicate OS type of mobile devices (iOS/Android) | ✓ | ✓ |
| Identify location of victim/suspect at specified time via GPS logs | ✓ | ✓ |
| Interview neighbours, witnesses, police officers | N/A | N/A |
| Mark important details on sketch map | N/A | N/A |
| Look for hard-copy evidence (secret notes, shredded papers) | N/A | N/A |
| Collect call & message data from past few days | N/A | N/A |

**Section C — Preservation**

| Description | Jack | Sonny |
|---|---|---|
| Review and update Chain of Custody | ✓ | ✓ |
| Acquire golden copy of mobile device | ✓ | ✓ |
| Use Faraday Bag to store and isolate mobile devices | ✓ | ✓ |
| Look for other evidence requiring preservation | ✓ | ✓ |
| Check for remote storage locations | ✓ | ✓ |
| Confirm log files are copied or backed up | ✓ | ✓ |
| Verify volatile data has been copied | ✓ | ✓ |
| Ensure order of volatility is applied | ✓ | ✓ |
| Check if mobile devices are kept switched on | ✓ | ✓ |
| Confirm log rotation is disabled | ✓ | ✓ |
| Verify relevant data backed up from central servers | ✓ | ✓ |
| Hash values of relevant files generated | ✓ | ✓ |

**Section D — Examination/Analysis**

| Description | Jack | Sonny |
|---|---|---|
| Check for fingerprints or blood stains on murder weapon | N/A | N/A |
| Account for anomalies from ISP logs | N/A | N/A |
| Verify examination done on duplicate image, not golden copy | ✓ | ✓ |
| Look for motives/threats in communication platforms | ✓ | ✓ |
| Check browser history for anomalies | N/A | N/A |
| Check for deleted files | ✓ | ✓ |
| Check if deleted files are recoverable | ✓ | ✓ |
| Check for encrypted files | ✓ | ✓ |
| Check if encrypted files can be decrypted | ✓ | ✓ |
| Create chronological timeline of events | ✓ | ✓ |
| Create relationship diagram between parties | ✓ | ✓ |
| Verify evidence has not been tampered with | ✓ | ✓ |
| Determine if evidence indicates suspects committed the crime | ✓ | ✓ |
| Gain insight into offender's intent and motives | ✓ | ✓ |
| Document all investigation steps | ✓ | ✓ |

**Section E — Presentation**

| Description | Jack | Sonny |
|---|---|---|
| Time of the crime established | ✓ | ✓ |
| Determine if time of crime is related to artefacts | ✓ | ✓ |
| Ensure all evidence preserved by Chain of Custody | ✓ | ✓ |
| Label individual who examined the evidence | ✓ | ✓ |
| Label case number | ✓ | ✓ |
| Ensure forensic report is complete | ✓ | ✓ |
| Provide credits to report authors | ✓ | ✓ |
| Time of report writing recorded | ✓ | ✓ |
| State hypotheses from investigation | ✓ | ✓ |
| Describe how the crime was conducted | ✓ | ✓ |
| Check applicable laws for the crime | ✓ | ✓ |
| Look for similar comparable cases | ✓ | ✓ |
| Determine relevancy of artefacts to the case | ✓ | ✓ |

---

### 8.2 Search Warrant

**Singapore Police Force — Chapter 295**
*Arrests, Searches, and Investigation of Offences — Part I*

**Issued to:** Aurelius, Andany, Jeshua, Zaqi, Wei Lin

**Location:** Telepark, 5 Tampines Central 6, Singapore 529482

**Validity:** 3 weeks from 23 May 2022

**Approved by:** Mr Lim Chee Yong, District Judge

**Reason for Search:**
- Jack's office was identified from GPS metadata in artefact A003 as being located in Telepark.
- The team sought to investigate sticky notes and devices at Jack's desk for connections to the case.
- Items of interest: Wi-Fi router logs, electronic devices, any connection between xxbaemaxx and Jack, and the assassination receipt.

---

### 8.3 Evidence Chain of Custody Tracking Form

**Case Number:** CC5612629  
**Submitting Officer:** Aurelius Ng Ker Fong, PI529230F  
**Victim:** Hazel Casey  
**Suspects:** Jack Ballow and Sonny Williams  
**Date/Time Seized:** 25 April 2021  
**Location of Seizure:** St Andrew's Cathedral, 11 St Andrew's Rd, Singapore 178959

**Evidence Items:**

| Item # | Qty | Description |
|---|---|---|
| 01 | 1 | Jack Ballow's mobile phone — `VM-GENY-JACK.ova` (0.98 GB) — MD5: `1350bc8f8f86183ea46ccc15d701ae8d` / SHA256: `480287495739b9771fc71d63f99fd05dbe413feee45f8d7c5768971b6ca715a8` |
| 02 | 1 | Sonny Williams's mobile phone — `VM-GENY-SONNY.ova` (0.99 GB) — MD5: `f232966a5b9903fb188ef5b519f0399f` / SHA256: `c2d88b3237fb7b41b1476c1899768e18b607bba3e36ccdb2af19b0fd94c8c6ea` |

**Chain of Custody Log:**

| Item # | Date/Time | Released By | Received By | Comments |
|---|---|---|---|---|
| 01 | 25 Apr 2021 | SSGT Jordan Tan, SPF529230I | Investigator Andany, PI240421E | Analysis of metadata of mobile phones |

---

### 8.4 Evidence Inventory & Supporting Images

| Item | Device | Description | Hash (SHA-256) |
|---|---|---|---|
| **A001** | Sonny's Phone | Android 10, API 29, Model: VM-GENY-SONNY, Manufacturer: Genymobile | MD5: `f232966a5b9903fb188ef5b519f0399f` |
| **A002** | Jack's Phone | Android 10, API 29, Model: VM-GENY-JACK, Manufacturer: Genymobile | MD5: `1350bc8f8f86183ea46ccc15d701ae8d` |
| **A003** | Jack's Phone | `IMG_20210510_061453.jpg` — Photo from Jack's office at Telepark | `b78f8bf525ddce097adce06b3804c88d7ab37e33ad63265e62cf0a43516cde5c` |
| **SE001** | — | Google Street View of location identified from A003 | — |
| **SE002** | — | ExifTool output showing metadata details of A003 | — |
| **A004** | Jack's Phone | `notes.txt` — PGP passphrase file | `03e5a1a737c5fa75043f11a9805ff994bee77da8c2593f8dd23d615f4149f5aa` |
| **A005** | Jack's Phone | Jack Ballow's PGP private key (ProtonMail) | `5951ba9c29aa21a136406c9d3674a89b1ddcc614316d964ac6c7e6859f653faf` |
| **A006** | Jack's Phone | ProtonMail messages database — encrypted conversation between Jack & Hazel | `2cca5bc690d5f04b14e73de9b753961825b355e1fc6b9fae042e0e1742d91148` |
| **SE003** | Jack's Phone | Screenshots of uploading private key to GPG; password: `password` | — |
| **SE004** | Jack's Phone | HTML version of decrypted message from A007 | — |
| **A007** | Jack's Phone | Encrypted + decrypted ProtonMail conversation between Jack and Hazel | — |
| **A008** | Jack's Phone | Message between xxbaemaxx and Jack Ballow | — |
| **A010** | Jack's Phone | Sonny's Facebook post about the wedding announcement | — |
| **A011** | Jack's Phone | Sonny's post about Jack moving into his office | — |
| **A012** | Jack's Phone | Sonny's post about returning from KL trip | — |
| **A013** | Jack's Phone | Sonny's post about buying new office space | — |
| **A014** | Jack's Phone | Sonny's post about watching *How to Get Away with Murder* | — |
| **A015** | Sonny's Phone | Facebook cache database (`GraphStore.sqlite3`) | — |
| **A016** | Sonny's Phone | `notes.txt` — PGP passphrase file | `03e5a1a737c5fa75043f11a9805ff994bee77da8c2593f8dd23d615f4149f5aa` |
| **A017** | Sonny's Phone | Sonny's PGP private key | `dfa4803c606fabdd3334c648559c2ebdf1a5e3913f2857dd219a3fa17fa0a09b` |
| **A018** | Sonny's Phone | Jack's wedding announcement post | — |
| **A019** | Sonny's Phone | Jack's Turkey trip announcement | — |
| **A020** | Sonny's Phone | Jack's *"Hell hath no fury"* Facebook post | — |
| **A021** | Sonny's Phone | Jack's new office announcement | — |
| **A022** | Sonny's Phone | Jack congratulating Hazel on new job | — |
| **SW001** | Search Warrant | `Receipt.pdf` — Assassination service receipt | `81e28e6c99a616beeb2eae46d25de3dac065204f8e8e6ef56d41fb5fc576bc61` |
| **SW002** | Search Warrant | Sticky note photos from Jack's desk — Wi-Fi SSID/password, meeting note, device password | `9aa2bf2246eb4facd2bceaa6b32a113581b4efbe4eef9525081f7c82e4a41800` |

---

*Report submitted: 25 May 2022 | Group 1 — P03 | MDF CCF2C04 | Temasek Polytechnic*
