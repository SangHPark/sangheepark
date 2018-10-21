public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String sName) {
        List<List<sObject>> sResult = [FIND :sName IN ALL FIELDS 
                                       RETURNING CONTACT(firstname, lastname), LEAD (firstname, lastname)];
        return sResult;
    }

}