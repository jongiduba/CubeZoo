# CubeZoo Practical Assessment

A Salesforce CLI project demonstrating practical Salesforce development skills including data modelling, workflow lifecycle logic, Apex coding structure, and external integration.

## Project Purpose

This exercise evaluates your practical approach to:
- Salesforce data modelling
- Workflow and lifecycle logic
- Apex coding structure
- External integration thinking
- Technical judgement under time constraints

## Project Structure

```
force-app/
  └── main/
      └── default/
          ├── classes/          # Apex classes
          ├── objects/          # Custom objects and standard object customizations
          └── triggers/         # Triggers
config/
  └── project-scratch-def.json  # Scratch org definition
.forceignore                     # Files to ignore in source tracking
sfdx-project.json               # Salesforce CLI project configuration
```

## Key Components

- **DataModelController**: Core business logic handler
- **RecordLifecycleHandler**: Manages record lifecycle and workflow transitions
- **RecordLifecycleTrigger**: Trigger implementation for record management

## Getting Started

1. Ensure Salesforce CLI is installed
2. Authorize an org: `sfdx auth:web:login`
3. Create a scratch org: `sfdx force:org:create -f config/project-scratch-def.json -a CubeZoo`
4. Push source to org: `sfdx force:source:push -u CubeZoo`

## Development

Add your Apex classes, custom objects, and triggers in the appropriate directories under `force-app/main/default/`.

### Useful Commands

- `sfdx force:source:push` - Push source to your org
- `sfdx force:source:pull` - Pull source from your org
- `sfdx apex:execute` - Execute Apex code
- `sfdx force:test:run` - Run Apex tests

## Requirements

- Salesforce CLI v60.0 or higher
- Node.js 18 or higher
