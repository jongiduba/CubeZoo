# CubeZoo
Salesforce Practical Assessment

## Overview

This solution demonstrates a simplified profile publishing system where Salesforce acts as the master data source and approved profiles are synchronised to an external CMS.

## 1. Data Model

- **Contact (Profile)** – stores profile information, renamed the Standard Field Label for Contact to Profiles as this serves the same purpose
- **Account (Organisation)** – related organization, renamed the Standard Field Label for Account to Organisation as this serves the same purpose
- **Integration Log** - stores integration logs for reporting purposes

### Custom fields added to Profiles (Contact) Object:
- Status (Draft, Review, Approved, Published)
- Slug
- Sync Status
- Last Sync Date

### Custom fields added to Integration Log:
- Profile
- Status
- Response
- Timestamp

## 2. Publishing Logic

- Implemented using a Record-Triggered Flow
- Triggered when Profile Status = Approved
- Flow invokes an Apex service to handle publishing
- Sync status is updated based on result

## 3. Integration Simulation

- Apex service generates a JSON payload from Profile data
- Simulated API call determines success/failure
- Profile record is updated with:
  - Sync Status
  - Last Sync Date

## 4. Assumptions

- No real CMS endpoint required
- Sync is triggered only on approval

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

## Getting Started

1. Ensure Salesforce CLI is installed
2. Authorize an org: `sf org login web`
3. Deploy metadata: `sf project deploy start`

## Development

Add your Apex classes, custom objects, and triggers in the appropriate directories under `force-app/main/default/`.

## Requirements

- Salesforce CLI v60.0 or higher
- Node.js 18 or higher
Basic success/failure simulation is sufficient
No retry mechanism implemented due to time constraints

5. Improvements
Add retry mechanism
Use Platform Events for decoupling
Implement real API integration
Add monitoring dashboard
>>>>>>> e892b5e5e5ae6e28ec5b7fd80badb5037927444f
