public with sharing class AccountSearchController {
    
    Transient public List<account> acc{get;set;}
    
    public string searchString{get;set;}
    
    public void search() {
        try {
            string searchWord = searchString + '%';
            acc = [SELECT AccountNumber, AccountSource, Active__c, AnnualRevenue, BillingAddress, BillingCity, BillingCountry, BillingPostalCode, BillingState, BillingStreet,
                   		  Description, DunsNumber, Fax, Id, Industry, Name, NumberOfEmployees, Phone, Type , website
                   FROM Account
                   WHERE Name like : searchWord];
        } catch (System.QueryException ex) {
            ApexPages.addMessages(ex);
        }
        
    }

}