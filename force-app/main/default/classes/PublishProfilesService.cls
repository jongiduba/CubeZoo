/*
 * Developer Name: Jongi Duba
 * Project: CubeZoo Practical Assessment
 * Purpose:
 * Service class responsible for preparing profile data,
 * generating JSON payloads, simulating CMS integration,
 * and updating sync status and timestamps.
 * Date: 26 March 2026
*/

public class PublishProfilesService {

    @InvocableMethod(label='Publish Profiles')
    public static void publishProfiles(List<Id> profileIds) {

        if (profileIds == null || profileIds.isEmpty()) {
            return;
        }

        // STEP 1: Set Sync_Status = Processing BEFORE callout
        List<Contact> processingUpdates = new List<Contact>();
        for (Id profileId : profileIds) {
            processingUpdates.add(new Contact(
                Id = profileId,
                Sync_Status__c = 'In Progress'
            ));
        }
        update processingUpdates;

        // Fetch profiles
        List<Contact> profiles = [
            SELECT Id, FirstName, LastName, Biography__c, Status__c, Slug__c
            FROM Contact
            WHERE Id IN :profileIds
        ];

        List<Contact> finalUpdates = new List<Contact>();
        List<Integration_Log__c> logs = new List<Integration_Log__c>();

        for (Contact p : profiles) {

            // Build JSON payload
            Map<String, Object> payload = new Map<String, Object>{
                'id' => p.Id,
                'firstName' => p.FirstName,
                'lastName' => p.LastName,
                'bio' => p.Biography__c,
                'slug' => p.Slug__c,
                'status' => p.Status__c
            };

            String jsonBody = JSON.serialize(payload);

            Boolean isSuccess;
            String responseMessage;

            try {
                // Simulate callout
                isSuccess = simulateCallout(jsonBody);
                responseMessage = isSuccess ? 'Simulated Success Response' : 'Simulated Failure Response';

            } catch (Exception e) {
                isSuccess = false;
                responseMessage = e.getMessage();
            }

            // Prepare profile update AFTER callout
            Contact updateProfile = new Contact(
                Id = p.Id,
                Last_Sync_Date__c = System.now(),
                Sync_Status__c = isSuccess ? 'Synced' : 'Failed'
            );

            // Prepare log record
            Integration_Log__c log = new Integration_Log__c(
                Profile__c = p.Id,
                Payload__c = jsonBody,
                Status__c = isSuccess ? 'Success' : 'Failed',
                Response__c = responseMessage,
                Timestamp__c = System.now()
            );

            finalUpdates.add(updateProfile);
            logs.add(log);
        }

        // Commit logs first (optional but cleaner for debugging)
        if (!logs.isEmpty()) {
            insert logs;
        }

        // Final status update
        if (!finalUpdates.isEmpty()) {
            update finalUpdates;
        }
    }

    /**
     * Simulates an external CMS API call
     */
    private static Boolean simulateCallout(String requestBody) {
        return Math.mod(Math.abs(Crypto.getRandomInteger()), 2) == 0;
    }
}