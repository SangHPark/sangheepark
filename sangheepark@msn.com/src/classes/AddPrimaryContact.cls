public class AddPrimaryContact implements Queueable {
    
    private Contact c;
    private String ST;
    public AddPrimaryContact (Contact aCon, String aST) {
        this.c = aCon;
        this.ST = aST;
    }
    
    public void execute(QueueableContext context) {
        List<Account> listAccount = [SELECT Id, Name, (SELECT id, FirstName, LastName FROM CONTACTS) 
                                       FROM ACCOUNT WHERE BillingState = :ST LIMIT 200];
        
        List<Contact> listContact = new List<Contact>();
        for (Account acc : listAccount) {
            Contact cont = c.clone(false,false,false,false);
            cont.AccountId = acc.id;
            listContact.add(cont);
        }
        
        if (listContact.size() >0) {
            insert listContact;
        }
        
        
    }
}