public class ContactsListController {
    private String sortOrder = 'LastName';
    
    public List<Contact> getContacts() {
        List<Contact> results = Database.query(
            'SELECT id, FirstName, LastName, Title, Email ' +
            'FROM Contact ' +
            'ORDER BY ' + sortOrder + ' ASC ' +
            'LIMIT 10'
        );
        return results;
    }
    
    public void sortbyLastName() {
        this.sortOrder = 'LastName';
    }
    
    public void sortbyFirstName() {
        this.sortOrder = 'FirstName';
    }
}