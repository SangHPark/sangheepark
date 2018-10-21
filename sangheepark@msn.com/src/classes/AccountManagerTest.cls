@isTest
private class AccountManagerTest {
    @isTest static void testGetIdName() {
        ID recordId = createTestRecord();
        RestRequest request = new RestRequest();
        request.requestURI = 
            'https://na34.salesforce.com/services/apexrest/Accounts/' + recordId + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        
        Account thisAcc = AccountManager.getAccount();
        
        System.assert(thisAcc != null);
        System.assertEquals('Test Record', thisAcc.Name);
    }
    
    static Id createTestRecord() {
        Account testAcc = new Account(Name = 'Test Record');
        insert testAcc;
        
        Contact testCon = new Contact(LastName = 'Test', AccountId = testAcc.Id);
        return testAcc.Id;
    }
}