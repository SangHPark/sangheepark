@isTest
private class SidebarSummaryControllerTest {
    static testMethod void SidebarTest() {
        Account acc = New Account(Name='Steve Account');
        insert acc;
        
        Opportunity opp = New Opportunity(AccountId=acc.Id, Name='Steve Opp', StageName='Prospecting', CloseDate=Date.today());
        insert opp;
        
        SidebarSummaryController ctrl = new SidebarSummaryController();
        Test.startTest();
        Map<String, Integer> teststages = ctrl.oppStage;
        Test.stopTest();
        //System.assertNotEquals(null,teststages);
        System.assertEquals(testStages.size(), 1);
        
    }
}