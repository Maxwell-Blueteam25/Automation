# 🕵️‍♂️ Windows DFIR Tools (PowerShell)

This subdirectory focuses on DFIR (Digital Forensics and Incident Response) tools written in PowerShell, specifically crafted for Windows environments.

---

## 🔍 Current Tools

### `PersistenceChecker.ps1`
A lightweight PowerShell script to help identify common persistence mechanisms attackers might use on Windows endpoints.

#### ✅ Features:
- Checks common persistence locations (Run keys, Scheduled Tasks, WMI, Services)  
- Outputs findings in a structured format for triage  
- Easy to run on compromised or suspicious hosts  
- No third-party dependencies  

---

### `FileSlicer.ps1`
A PowerShell script designed to speed up artifact analysis across multiple Windows forensic sources, including MFT, USN Journal, and Prefetch files.

#### ✅ Features:
- Parse and report **top executables** and **most common file extensions**  
- Detect **file renames, creation, and deletion events**  
- Build **basic timelines**  
- Hunt for specific strings or filenames  
- Select artifact type: Prefetch, MFT (CSV), or USN Journal (CSV)  
- Designed for repeatable, menu-driven analysis of key artifacts  

---

## 🔒 Use Cases
- First-responder triage  
- Threat hunting and root cause analysis  
- Blue team investigations  
- Malware persistence and activity analysis  
- Streamlining repetitive artifact parsing and timeline building  

---

## 🛠 Built For
- Security analysts conducting live response or internal investigations  
- DFIR practitioners automating repetitive forensic tasks  
- Blue team engineers enhancing endpoint visibility and investigative speed  

---

## 🚧 Coming Soon
Planned additions include:  
- Memory artifact collection scripts  
- Prefetch and ShimCache parsers  
- Enhanced timeline generation with custom timestamp filtering  
- Suspicious activity scoring for events  
- Integration with ELK or Kusto outputs  

---

This section of the repo shows my growing focus on **hands-on security engineering**, building blue team tools that are **lightweight, auditable, and fast**.  

*All scripts are intended for isolated or test environments first. For production use, conduct a thorough code review and permission audit.*

