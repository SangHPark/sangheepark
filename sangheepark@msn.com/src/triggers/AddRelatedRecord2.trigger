trigger AddRelatedRecord2 on Account (after insert, after update) {
    List<Opportunity> oppList = new List<Opportunity>();
    for (Account a : [SELECT Id, Name FROM Account
                       WHERE Id IN :Trigger.New AND
                      Id NOT IN (SELECT AccountId FROM Opportunity)]) {
        oppList.add(new Opportunity(Name=a.name + ' Opportunity New',
                                    StageName='Prospecting',
                                    CloseDate=System.today().addMonths(1),
                                    AccountId = a.Id));
        }
    
    if (oppList.size() >0) {
//        insert oppList;
    }
}