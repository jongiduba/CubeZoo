/*
 * Developer Name: Jongi Duba
 * Project: CubeZoo Practical Assessment
 * Purpose:
 * Invocable class used by Flow to trigger profile publishing logic.
 * Acts as a bridge between Flow and the service layer
 * Date: 26 March 2026
*/


public with sharing class ProfilePublishInvoker {

    @InvocableMethod(label='Publish Profiles')
    public static void publish(List<Id> profileIds) {
        PublishProfilesService.publishProfiles(profileIds);
    }
}