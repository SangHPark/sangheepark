@RestResource(urlMapping='/Cases/*')
global with sharing class CaseManager {
	@HttpGet
    global static Case getCasebyId() {
        RestRequest request = RestContext.request;
        
        String CaseId = request.requestURI.substring(request.requestURI.lastIndexOf('/') + 1);
        
        Case result = [SELECT CaseNumber, Subject, Status, Origin, Priority
                         FROM CASE
                        WHERE Id = :CaseId];
        return result;
    }
    
    @HttpPost
    global static ID createCase(String subject, String status, String origin, String priority) {
        Case thiscase = new Case(Subject=subject, Status = status, Origin = origin, Priority=priority);
        insert thiscase;
        return thiscase.Id;
    }
    
    @HttpPut
    global static ID upsertCase(String subject, String status, String origin, String priority, String id) {
        Case thiscase = new Case(Id = id, Subject=subject, Status = status, Origin = origin, Priority=priority);
        upsert thiscase;
        return thiscase.Id;
    }
    
    @HttpPatch
    global static ID updateCase() {
        RestRequest request = RestContext.request;
        String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/') + 1);
        
        Case thisCase = [SELECT Id FROM Case WHERE Id = :caseId];
        Map<String, Object> params = (Map<String, Object>)JSON.deserializeUntyped(request.requestbody.tostring());
        
        for (String fieldName : params.keySet()) {
            thisCase.put(fieldName, params.get(fieldName));
        }
        
        update thisCase;
        return thisCase.Id;
    }
}