@isTest
public class AccountProcessorTest {
    public static testmethod void AccountProcessorTest() {
        Account acc = new Account();
        acc.Name = 'Test Account for Future Methods';
        insert acc;
        
        Contact cont = New Contact();
        cont.FirstName = 'SangHee';
        cont.LastName = 'Park';
        cont.AccountId = acc.Id;
        insert cont;
        
        set<Id> setAccId = new set<Id>();
        setAccId.add(acc.Id);
        
        Test.startTest();
        	AccountProcessor.countContacts(setAccId);
        Test.stopTest();
        
        Account chkacc = [SELECT Number_of_Contacts__c FROM Account WHERE Id = :acc.Id LIMIT 1];
        System.assertEquals(Integer.valueOf(chkacc.Number_of_Contacts__c),1);
    }
}