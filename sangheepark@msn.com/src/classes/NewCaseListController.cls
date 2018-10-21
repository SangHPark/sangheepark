public class NewCaseListController {
    
    public List<Case> getNewCases() {
        List<Case> result = Database.query (
            'SELECT Id, CaseNumber FROM CASE ' + 
            'WHERE status = \'NEW\' ' );
        return result;
        
    }
}