global class UpdateContactAddresses implements Database.Batchable<sObject>, Database.Stateful {
    global Integer recordsProcessed = 0;
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT ID, BillingStreet, BillingCity, BillingState, ' +
            'BillingPostalCode, (SELECT ID, MailingStreet, MailingCity, ' +
            'MailingState, MailingPostalCode From Contacts) FROM Account ' +
            'WHERE BillingCountry = \'USA\'');
    }
    
    global void execute(Database.BatchableContext bc, List<Account> scope) {
        List<Contact> con_list = new List<Contact>();
        for(Account acc : scope ) {
            for (Contact con : acc.contacts) {
                con.MailingStreet = acc.BillingStreet;
                con.MailingCity = acc.BillingCity;
                con.MailingState = acc.BillingState;
                con.MailingPostalCode = acc.BillingPostalCode;
                
                con_list.add(con);
                recordsProcessed = recordsProcessed + 1;
            }
            
        }
        update con_list;
    }
    
    global void finish(Database.BatchableContext bc) {
        System.debug(recordsProcessed+ ' records processed. Good Jobs');
        AsyncApexJob job = [SELECT Id, Status, NumberofErrors,
                           JobItemsProcessed, 
                           TotalJobItems, CreatedBy.Email
                           FROM AsyncApexJob
                           WHERE Id = :bc.getJobId()];
    }
}