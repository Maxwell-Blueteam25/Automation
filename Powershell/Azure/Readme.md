# ☁️ Azure PowerShell Automations

This folder contains Azure-focused PowerShell scripts, primarily built for automation scenarios using Azure Automation, Entra ID (Azure AD), and integrations with Power Automate.

## 📌 Key Scripts

### 🔸 `Automated-Onboarding-Form.ps1`
Creates users in Entra ID from a Power Automate trigger. HR submits a Microsoft Form → Power Automate parses the submission → this script creates the user with all required attributes.

### 🔸 `Bulk-Onboarding-From-Excel.ps1`
Reads an Excel file and creates multiple Entra ID users. Designed for fast HR-driven onboarding from a standardized spreadsheet template.

## 🧠 Highlights

- Supports both one-off and bulk user creation
- Parses common attributes: display name, department, title, UPN, etc.
- Clean logging to track created vs. skipped users
- Can be extended to assign licenses, groups, or send notifications

## 🔐 Requirements

- Azure Automation account (for runbook usage)
- `Az` PowerShell module installed
- `ImportExcel` module (for Excel-based scripts)
- Graph API permissions to create users

## 📄 Notes

- Scripts currently default to a basic password scheme; password reset policies can be enforced via Conditional Access or follow-up runbooks.
- These scripts are ideal for startups or small teams building their automation muscle without full-scale identity governance in place.

## 🧪 Testing

Tested in:
- Azure Automation Identity
- Local PowerShell session with elevated permissions

## 🚀 Next Steps

- License assignment automation
- Auto group assignment
- MFA configuration onboarding

---

*Always review scripts before use in production.*
