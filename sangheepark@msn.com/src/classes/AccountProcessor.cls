public class AccountProcessor {
    @future
    public static void countContacts(Set<Id> AccountIds) {
        List<Account> acc_list = [SELECT id, Number_of_Contacts__c, (select id from Contacts) from ACCOUNT where id in :AccountIds]; 
        for (Account acc : acc_list) {
            List<Contact> cont_list = acc.contacts;
            
            acc.Number_of_Contacts__c = cont_list.size();
        }
        
        update acc_list;
        
    }
}