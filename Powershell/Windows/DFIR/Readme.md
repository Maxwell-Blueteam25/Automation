# 🕵️‍♂️ Windows DFIR Tools (PowerShell)

This subdirectory focuses on **DFIR (Digital Forensics and Incident Response)** tools written in PowerShell, specifically crafted for Windows environments.

---

## 🔍 Current Tool: `PersistenceChecker.ps1`

A lightweight PowerShell script to help identify common persistence mechanisms attackers might use on Windows endpoints.

### ✅ Features:
- Checks common persistence locations (Run keys, Scheduled Tasks, WMI, Services)
- Outputs findings in a structured format for triage
- Easy to run on compromised or suspicious hosts
- No third-party dependencies

---

## 🔒 Use Cases

- First-responder triage
- Threat hunting and root cause analysis
- Blue team investigations
- Malware persistence analysis

---

## 🛠 Built For:

- Security analysts conducting live response or internal investigations
- IR teams needing fast context on potentially compromised machines
- Blue team engineers enhancing endpoint visibility

---

## 🚧 Coming Soon

Planned additions include:
- Memory artifact collection scripts
- Prefetch and ShimCache parsers
- Registry timeline tools
- Integration with ELK or Kusto outputs

---

This section of the repo shows my growing focus on **hands-on security engineering** and building blue team tools that are lightweight, auditable, and fast.

*All scripts are built to be used in isolated or test environments first. For production use, conduct a thorough code review and permission audit.*
