public with sharing class SideBarSummaryController {

    public Map<String, Integer> oppstage { get; set; }
    
    public SideBarSummaryController() {
        oppStage = new Map<String, Integer>();
        for(AggregateResult ar : [SELECT StageName, count(ID) cnt FROM Opportunity GROUP BY StageName])
        {
            oppStage.put((String)ar.get('StageName'),(Integer)ar.get('cnt')); 
        }
        
        System.debug('Finished the loop -- Steve Park');
    }
}