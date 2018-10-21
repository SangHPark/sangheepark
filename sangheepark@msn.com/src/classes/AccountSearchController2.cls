public with sharing class AccountSearchController2 {
    
    public List<account> acc{
        get {
            if (setCon != null) {
                return (List<Account>)setCon.getRecords();
            }    
            else {
                return null;
            }
        }
        set;
    }
    
    public string searchString{get;set;}
    
    public ApexPages.StandardSetController setCon{get;set;}
    
    public void search() {
        try {
            string searchWord = searchString + '%';
            setCon = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT AccountNumber, AccountSource, Active__c, AnnualRevenue, BillingAddress, BillingCity, BillingCountry, BillingPostalCode, BillingState, BillingStreet,
                                  Description, DunsNumber, Fax, Id, Industry, Name, NumberOfEmployees, Phone, Type , website
                   FROM Account
                   WHERE Name like : searchWord]));
        } catch (System.QueryException ex) {
            ApexPages.addMessages(ex);
        }
        
    }

}