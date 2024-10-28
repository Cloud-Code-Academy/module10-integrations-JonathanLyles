public with sharing class ContactTriggerHandler {
    public static void TriggerHandler(Boolean isInsert, Boolean isUpdate, List<Contact> contacts){
        for(Contact con : contacts){
            // When a contact is inserted
            // if DummyJSON_Id__c is null, generate a random number between 0 and 100 and set this as the contact's DummyJSON_Id__c value
            if(Trigger.isInsert == true && con.DummyJSON_Id__c == null){
                con.DummyJSON_Id__c = String.valueOf(Math.round((Math.random()*100)));
            //When a contact is inserted
            // if DummyJSON_Id__c is less than or equal to 100, call the getDummyJSONUserFromId API		
            }else if(Trigger.isInsert == true && Integer.valueOf(con.DummyJSON_Id__c) <= 100){
                DummyJSONCallout.getDummyJSONUserFromId(String.valueOf(con.DummyJSON_Id__c));
            //When a contact is updated
            // if DummyJSON_Id__c is greater than 100, call the postCreateDummyJSONUser API
            }else if(Trigger.isUpdate == true && Integer.valueOf(con.DummyJSON_Id__c) > 100){
                DummyJSONCallout.postCreateDummyJSONUser(con.Id);
            }
        }
    }
}