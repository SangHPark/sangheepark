@isTest
public class TestRestrictContactByName {
    @isTest static void TestDeleteInvalidName() {
        Test.startTest();
        Contact con = new Contact(FirstName = 'Steve', LastName = 'INVALIDNAME');
        insert con;
        Test.stopTest();
        
        List<CONTACT> insertedcont = [SELECT Id FROM CONTACT WHERE LastName = 'INVALIDNAME'];
        
        System.assertEquals(0,insertedcont.size());
    }
}