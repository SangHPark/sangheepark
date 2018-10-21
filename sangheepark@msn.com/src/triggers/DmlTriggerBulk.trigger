trigger DmlTriggerBulk on Account (after update) {
    List<Opportunity> relatedOpps = [SELECT Id, Name, Probability FROM Opportunity WHERE AccountId IN :Trigger.New];
    
    List<Opportunity> oppsToUpdate = new List<Opportunity>();
    
    for (Opportunity opp: relatedopps) {
        if ((opp.Probability >= 50) && (opp.Probability <100)) {
            opp.Description = 'New Opps Desc by DMLLTRIGGERBULK';
            oppsToUpdate.add(opp);
        }
    }

    update oppsToUpdate;
}