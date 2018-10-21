public class OpportunityCustomButtons {
    public Opportunity oppty {get; set;}
    
    public OpportunityCustomButtons(apexPages.standardController sc) {
        string oppId = ApexPages.currentPage().getParameters().get('id');
        oppty = [select id,description from opportunity where id=:oppId];
    }
    
    public pagereference saveNSubmitForApproval() {
        try {
            update oppty;
            pageReference pf= new pagereference('/apex/MyOppCustomButtonPage?id='+oppty.id);
            return pf;
        } catch (exception ex) {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,ex.getMessage()));
            return null;
        }
        
    }
}