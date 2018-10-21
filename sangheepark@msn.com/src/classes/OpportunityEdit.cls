public class OpportunityEdit {
    //    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.INFO,'In APEX Extension');    
    
    public opportunity opp {get; set;}
    
    public OpportunityEdit(apexPages.StandardController sc) {
        string oppid = apexPages.currentPage().getParameters().get('id');
        opp = new Opportunity();
        DescribeSObjectResult describeResult = Opportunity.getSObjectType().getDescribe();
        List<String> fieldNames = new List<String>( describeResult.fields.getMap().keySet() );
        String query =  ' SELECT ' +  String.join( fieldNames, ',' ) + ',' + 'Recordtype.name' + ' FROM ' + describeResult.getName() +' WHERE ' +' id = :oppId ' + ' LIMIT 1 ';
        opp = database.query(query);
    }
    
    public pageReference saveOpp() {
        try {
            update opp;
            return new pageReference('/'+opp.id);
        } catch(exception e) {
            ApexPages.addMessages(e);
            return null;
            
        }
    }
    
    public pageReference saveNCreateNewOpp() {
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,'saveNCreateNewOpp'));
        
        return null;
    }    
    
}