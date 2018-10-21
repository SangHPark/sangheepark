@isTest
public class ParkLocatorTest {
    @isTest static void TestParkList() {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String[] actual_val;
        
        actual_val = ParkLocator.country('KOREA');
        
        System.assertEquals(actual_val[1], 'Park B');
    }

}