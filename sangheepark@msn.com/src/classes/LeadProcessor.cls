global class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful {
    global Integer recordsProcessed = 0;

	global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id, LeadSource FROM Lead');
	}	

    global void execute(Database.BatchableContext bc, List<Lead> scope){
        List<Lead> leadlist = new List<Lead>();
        for (Lead leads : scope) {
            leads.leadsource = 'DreamForce';
            leadlist.add(leads);
            recordsProcessed = recordsProcessed + 1;
        }
        
        update leadlist;
        
        
    }
 
    global void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' records processed. Done!');
    	AsyncApexJob job = [SELECT Id, Status, NumberOfErrors,
                                JobItemsProcessed,
                                TotalJobItems, CreatedBy.Email
				            FROM AsyncApexJob
				            WHERE Id = :bc.getJobId()];
    }

}