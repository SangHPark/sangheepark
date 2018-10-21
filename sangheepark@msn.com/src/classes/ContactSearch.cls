public class ContactSearch {
    public static List<Contact> searchForContacts(String lname, String mpostalcode) {
        Contact[] mycontacts = [SELECT ID, Name FROM Contact WHERE lastname = :lname and MailingPostalCode = :mpostalcode];
        return mycontacts;
        
    }
}