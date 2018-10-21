public with sharing class ListOpportunitiesController {
    List<Opportunity> opps;
    
    public List<Opportunity> getOpps() {
        opps = [select id, Name, Amount, StageName, Type, Probability, CloseDate, ExpectedRevenue From Opportunity];
        return opps;
    }

}