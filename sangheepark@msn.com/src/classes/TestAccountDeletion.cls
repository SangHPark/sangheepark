@isTest
public class TestAccountDeletion {
    @isTest static void TestDeleteAccountWithOneOpportunity() {
        Account acc = new Account(Name='Test Account');
        insert acc;
        
        Opportunity opp = new Opportunity(Name=acc.Name + ' Opportunity',
                                         StageName='Prospecting',
                                         CloseDate=System.today().addMonths(1),
                                         AccountId = acc.Id);
        insert opp;
        Test.startTest();
        Database.DeleteResult result = Database.delete(acc, false);
        Test.stopTest();
        
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('Cannot delete account with related opportunities.',
                             result.getErrors()[0].getMessage());
    }
}