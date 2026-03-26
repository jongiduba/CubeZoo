- [x] Verify that the copilot-instructions.md file in the .github directory is created.

- [x] Clarify Project Requirements
	Project: Salesforce CLI project - CubeZoo Practical Assessment
	Focus areas: Data modelling, workflow lifecycle, Apex coding, external integration, technical judgement

- [x] Scaffold the Project
	Created Salesforce CLI project structure with:
	- force-app/main/default/classes - Apex classes (DataModelController, RecordLifecycleHandler)
	- force-app/main/default/triggers - Trigger handlers (RecordLifecycleTrigger)
	- config/project-scratch-def.json - Scratch org configuration
	- sfdx-project.json - Project configuration

- [x] Customize the Project
	Project structure in place with sample Apex classes and triggers for customization

- [x] Install Required Extensions
	Salesforce extensions already installed:
	- Apex (salesforce.salesforcedx-vscode-apex)
	- Lightning Web Components (salesforce.salesforcedx-vscode-lwc)
	- Salesforce Code Analyzer (salesforce.sfdx-code-analyzer-vscode)
	- Apex Language Server (salesforce.apex-language-server-extension)

- [x] Compile the Project
	No compilation required for Salesforce CLI projects (metadata-driven)

- [x] Create and Run Task
	Not applicable for Salesforce CLI projects

- [x] Launch the Project
	Ready to use - Use Salesforce CLI commands to interact with org

- [ ] Ensure Documentation is Complete

## Project Information

**Project Name:** CubeZoo Practical Assessment
**Type:** Salesforce CLI Project (SFDX)
**Salesforce API Version:** 60.0
**Node.js Version Required:** 18+
**Salesforce CLI Required:** v60.0+

## Development Setup

1. Install Salesforce CLI if not already installed
2. Authenticate org: `sfdx auth:web:login`
3. Create scratch org: `sfdx force:org:create -f config/project-scratch-def.json -a CubeZoo`
4. Push metadata: `sfdx force:source:push -u CubeZoo`

## Key Files

- **sfdx-project.json** - Project metadata configuration
- **config/project-scratch-def.json** - Scratch org definition
- **.forceignore** - Files excluded from source tracking
- **force-app/main/default/** - Apex classes, triggers, and metadata
- **README.md** - Project documentation
