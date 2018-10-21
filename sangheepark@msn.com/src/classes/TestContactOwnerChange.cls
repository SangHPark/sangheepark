@isTest
private class TestContactOwnerChange {

    static testMethod void TestOwnerChange() {
        // TO DO: implement unit test
        List<Contact> newcontacts = initTestContacts('c', 5);
        
        user u = initTestUser('myname', 'a_myname');
        
        System.runAs(u)
        {
        	insert newcontacts;
        }
        
        Test.StartTest();
        
        for (Contact ct:newcontacts) {
        	ct.OwnerID = UserInfo.getUserID();
        	ct.Email = 'someone@somewhere.com';
        }
        
        update newcontacts;
        
        Test.StopTest();
        
        System.AssertEquals(newcontacts.size(), ProgramFlowExperiment.EmailCounter);
        
    }
    
    public static List<Contact> initTestContacts(String Prefix, Integer count)
    {
    	List<Contact> results = new List<Contact>();
    	for (Integer x=1; x<count; x++) {
    		results.add(new Contact(LastName = prefix + '_' + string.ValueOf(x),
    								email = prefix + '_' + string.valueOf(x) + '@apexfundamental.com'));
    	}
    	return results; 
    }
    
    public static User initTestUser(String username, String thealiass) {
    	User u = new User(Alias = thealiass,
    					  Email = username + '@apexfundamental.com',
    					  FirstName='Joe', LastName = username,
    					  TimeZoneSidKey = 'America/New_York',
    					  UserName = username + '@apexfundamental.com',
    					  LocaleSidKey='en_US',
    					  EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');
    					  
    	u.ProfileID = userinfo.getProfileId();
    	return u;
    }
}