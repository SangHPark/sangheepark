public with sharing class SearchLeads_CX {
String searchText;
    Transient List<Lead> results;
    public Boolean searched {get; set;}
    
    // Constructor
    public SearchLeads_CX(ApexPages.StandardController std) {
        searched=false;
    }
    
    public String getSearchText() {
        return searchText;
    }
    
    public void setSearchText(String s) {
        searchText = s;
    }
    
    public List<Lead> getResults() {
        return results;
    }
    
    public Boolean getMatches()
    {
        return ( (null!=results) && (0!=results.size()) );
    }
    
    public void Search() {
        if (null!=results) {
            results.clear();
        }
    
        if(!String.isBlank(searchText)) { 
			searchText = '*' + searchText + '*';
            results = (List<Lead>)[FIND :searchText RETURNING Lead(Name,Address,City,Company,Country,Email,FirstName,Id,LastName,OwnerId,Phone,State)][0];
            searched=true;
        }
        else
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Please enter the search text'));
        }
        
    }
}