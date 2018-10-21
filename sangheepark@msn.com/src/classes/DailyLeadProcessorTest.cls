@isTest
public class DailyLeadProcessorTest {
    
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    
    static testmethod void testScheduledJob() {
    	List<Lead> leadlist = new List<Lead>();
        for (Integer i=0; i<200; i++) {
            Lead l = new Lead(FirstName='Test', LastName = String.valueOf(i), Company ='SS');
            leadlist.add(l);
            
        }
        
        insert leadlist;
        
        Test.startTest();
        	String JobId = System.schedule('ScheduleSApexTest',
                                            CRON_EXP,
                                        	new DailyLeadProcessor());
        Test.stopTest();
        
        List<Lead> ld = [SELECT Id FROM Lead WHERE leadsource = 'Dreamforce'];

        System.assertEquals(200, ld.size(),'Tasks were not created');

    }
}