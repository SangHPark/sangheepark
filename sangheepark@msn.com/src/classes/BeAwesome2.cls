@isTest
public class BeAwesome2 {
    static testMethod void mytest() {
       
        Profile profile_isu = [SELECT Id FROM Profile WHERE Name='Inside Sales User'];
        UserRole role_isu = [SELECT Id FROM UserRole WHERE Name='Inside Sales'];
		
        User isu1 = new User(LastName='Internal Sales User', Email = 'stevepark@msn.com', 
                             UserName = 'isu1@msn.com', Alias = 'isu1', CommunityNickname = 'isu1',
                             TimeZoneSidKey = 'America/New_York', LocaleSidKey = 'en_US', 
                             EmailEncodingKey = 'ISO-8859-1', LanguageLocaleKey = 'en_US',
                             ProfileId = profile_isu.id, UserRoleId = role_isu.id);
        insert isu1;
        System.debug('isu1 user id' + isu1.id);
        
        System.RunAs(isu1) {
           System.debug('Current User: ' + UserInfo.getUserName());    
            Opportunity opp1 = new Opportunity(Name='First ISU Opp', CloseDate = Date.newInstance(2017, 4, 30), 
                                               StageName = 'Closed Won', OwnerId = isu1.id);
            insert opp1;
            System.debug('opp1 id' + opp1.id);
            List<Opportunityshare> shares = [SELECT rowcause, userorgroupid FROM Opportunityshare WHERE OpportunityId = :opp1.id];
            For (Opportunityshare sh : shares ) {
                System.debug('ISU Opp Row Cause :' + sh.rowcause);
                System.debug('ISU Opp userorgroupid :' + sh.userorgroupid);
            }
        }
        
        Profile profile_fsu = [SELECT Id FROM Profile WHERE Name='Field Sales User'];
        UserRole role_fsu = [SELECT Id FROM UserRole WHERE Name='Field Sales'];
        
        System.assertEquals('00e61000000NmAu', profile_fsu.id);
        
        User fsu1 = new User(LastName='Field Sales User', Email = 'stevepark@msn.com', 
                             UserName = 'fsu1@msn.com', Alias = 'fsu1', CommunityNickname = 'fsu1',
                             TimeZoneSidKey = 'America/New_York', LocaleSidKey = 'en_US', 
                             EmailEncodingKey = 'ISO-8859-1', LanguageLocaleKey = 'en_US',
                             ProfileId = profile_fsu.id, UserRoleId = role_fsu.id); 
        insert fsu1;
        System.debug('fsu1 user id' + fsu1.id);
        
        System.runAs(fsu1) {
	        System.debug('Current User: ' + UserInfo.getUserName());    
            Opportunity opp1 = new Opportunity(Name='First FSU Opp', CloseDate = Date.newInstance(2017, 4, 30), 
                                               StageName = 'Closed Won', OwnerId = fsu1.id);
            insert opp1;
            System.debug('opp1 id' + opp1.id);
            List<Opportunityshare> shares = [SELECT rowcause, userorgroupid FROM Opportunityshare WHERE OpportunityId = :opp1.id];
            For (Opportunityshare sh : shares ) {
                System.debug('FSU Opp Row Cause :' + sh.rowcause);
                System.debug('FSU Opp userorgroupid :' + sh.userorgroupid);
            }
        }
        
        
        System.runAs(isu1) {
			Integer cnt = [SELECT count() from Opportunity];
            System.debug('Current User: ' + UserInfo.getUserName());        
            List<Opportunity> opps = [SELECT Name FROM Opportunity];
            For (Opportunity op : opps) {
                System.debug('as ISU, Opp Name : ' + op.name);
            }
        }        
        
        System.RunAs(fsu1) {
            Integer cnt = [SELECT count() from Opportunity];
            List<Opportunity> opps = [SELECT Name FROM Opportunity];
            System.debug('Current User: ' + UserInfo.getUserName());
            For (Opportunity op : opps) {
                System.debug('as fSU, Opp Name : ' + op.name);
            }
        }
    }

    
    @future
    private static void CreateOppforisu(Id isuid) {
        System.debug('Current User: ' + UserInfo.getUserName());    
		Opportunity opp1 = new Opportunity(Name='First ISU Opp', CloseDate = Date.newInstance(2017, 4, 30), 
                                           StageName = 'Closed Won', OwnerId = isuid);
        insert opp1;
        System.debug('opp1 id' + opp1.id);
        List<Opportunityshare> shares = [SELECT rowcause, userorgroupid FROM Opportunityshare WHERE OpportunityId = :opp1.id];
        For (Opportunityshare sh : shares ) {
            System.debug('ISU Opp Row Cause :' + sh.rowcause);
            System.debug('ISU Opp userorgroupid :' + sh.userorgroupid);
        }
    }
    
    @future
    private static void CreateOppforfsu(Id fsuid) {
        System.debug('Current User: ' + UserInfo.getUserName());    
		Opportunity opp1 = new Opportunity(Name='First FSU Opp', CloseDate = Date.newInstance(2017, 4, 30), 
                                           StageName = 'Closed Won', OwnerId = fsuid);
        insert opp1;
        System.debug('opp1 id' + opp1.id);
        List<Opportunityshare> shares = [SELECT rowcause, userorgroupid FROM Opportunityshare WHERE OpportunityId = :opp1.id];
        For (Opportunityshare sh : shares ) {
            System.debug('FSU Opp Row Cause :' + sh.rowcause);
            System.debug('FSU Opp userorgroupid :' + sh.userorgroupid);
        }
    }
    
    @future
    private static void OppCount_isu() {
        Integer cnt = [SELECT count() from Opportunity];
        System.debug('Current User: ' + UserInfo.getUserName());        
        List<Opportunity> opps = [SELECT Name FROM Opportunity];
        For (Opportunity op : opps) {
            System.debug('as ISU, Opp Name : ' + op.name);
        }
    }
    
    @future
    private static void OppCount_fsu() {
        Integer cnt = [SELECT count() from Opportunity];
        List<Opportunity> opps = [SELECT Name FROM Opportunity];
        System.debug('Current User: ' + UserInfo.getUserName());
        For (Opportunity op : opps) {
            System.debug('as fSU, Opp Name : ' + op.name);
        }
    }
}