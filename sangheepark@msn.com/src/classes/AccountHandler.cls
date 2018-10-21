public class AccountHandler {
    public static Account insertNewAccount(String accName) {
        try {
        	Account myAcct = new Account(Name = accName);    
            insert myAcct;
            return myAcct;
        } catch (DMLException e) {
            System.debug('A DML Error occured: ' + e.getMessage());
            return null;
        }		
    }
}