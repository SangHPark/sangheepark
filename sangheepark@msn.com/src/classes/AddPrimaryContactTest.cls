@isTest
public class AddPrimaryContactTest {
    static testMethod void myTest() {
        List<Account> testAccount = new List<Account>();
        for (Integer i=0; i<50; i++) {
            testAccount.add(new Account(BillingState='CA', Name='Account ' + i));
        }

        for (Integer i=0; i<50; i++) {
            testAccount.add(new Account(BillingState='NY', Name='Account ' + i));
        }
        insert testAccount;
        
        Contact co = new Contact();
        co.FirstName = 'Trail';
        co.LastName = 'Head';
        insert co;
        
        AddPrimaryContact apc = new AddPrimaryContact(co, 'CA');
        Test.startTest();
        	System.enqueueJob(apc);
        Test.stopTest();
        
        List<Account> assertAcc = [select Id, (select Id, firstName from contacts where firstname = 'Trail') from account where BillingState = 'CA' ];
        System.assertEquals(50, assertAcc.size());
        
    }
}