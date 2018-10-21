public with sharing class AccountSearchRemoting {
	@RemoteAction
    public static List<Account> searchAccounts(String accountName) {
        
        String searchWord = accountName + '%';
        return [SELECT AccountNumber, Name
                  FROM Account
                 WHERE Name like : searchWord];
    }
}