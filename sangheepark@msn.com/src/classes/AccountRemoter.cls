global with sharing class AccountRemoter {
    public String accountName {get; set;}
    public static Account account {get; set;}
    public AccountRemoter() {}
        
	
    @RemoteAction
    global static Account getAccount(String accountName) {
        account= [SELECT Id, Name, Phone, Type, NumberofEmployees
                    FROM Account WHERE name = :accountName];
        return account;
    }
}