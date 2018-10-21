public class RandomContactFactory {
	public static List<Contact> generateRandomContacts (Integer numofContacts, String lname) {
        List<Contact> conts= new List<Contact>();
        for (Integer i = 0 ; i < numofContacts; i ++) {
            Contact c = new Contact(firstname='FirstName' + i, LastName=lname);
            conts.add(c);
        }
        
        insert conts;
        
        return conts;
    }
}