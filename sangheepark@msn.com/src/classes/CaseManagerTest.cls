@isTest
private class CaseManagerTest {
    @isTest static void testGetCaseById() {
        Id recordId = createTestRecord();
        
        RestRequest request = new RestRequest();
        request.requestURI = 
            'https://na34.salesforce.com/services/apexrest/Cases/' + recordId;
        request.httpMethod = 'GET';
        RestContext.request = request;
        
        Case thisCase = CaseManager.getCasebyId();
        
        System.assert(thisCase != null);
        System.assertEquals('Test Case', thisCase.Subject);
    }
	
    @isTest static void testCreateCase() {
    	ID thisCaseId = CaseManager.createCase('Ferocious chipmunk', 'New', 'Phone', 'Low');
        
        System.assert(thisCaseId != null);
        Case thisCase = [SELECT Id, Subject FROM Case WHERE Id = :thisCaseId];
        
        System.assert(thisCaseId != null);
        System.assertEquals(thisCase.Subject, 'Ferocious chipmunk');
    }
    
    @isTest static void testUpsertCase() {
        ID case1Id = CaseManager.upsertCase('Ferocious chipmunk', 'New', 'Phone', 'Low', null); 
        System.assert(case1Id != null);
        Case case1 = [SELECT Id,Subject FROM Case WHERE Id=:case1Id];
        System.assert(case1 != null);
        System.assertEquals(case1.Subject, 'Ferocious chipmunk');
    }
    
    @isTest static void testUpdateCaseFields() {
        Id recordId = createTestRecord();
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://na34.salesforce.com/services/apexrest/Cases/' + recordId;
        request.httpMethod = 'PATCH';
        request.addHeader('Content-Type', 'application/json');
        request.requestBody = Blob.valueOf('{"status":"Working"}');
        RestContext.request = request;
        
        ID thisCaseId = CaseManager.updateCase();
        System.assert(thisCaseId != null);
        Case thisCase = [SELECT Id,Status FROM Case WHERE Id=:thisCaseId];
        System.assert(thisCase != null);
        System.assertEquals(thisCase.Status, 'Working');
    }
    
    static Id createTestRecord() {
        Case caseTest = new Case(Subject = 'Test Case', Status = 'New', Origin = 'Phone', Priority = 'Low');
        insert caseTest;
        return caseTest.Id;
    }
}