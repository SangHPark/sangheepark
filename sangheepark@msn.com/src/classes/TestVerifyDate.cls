@isTest
private class TestVerifyDate {
    @isTest static void DateWithin30DaysTest() {
        Date dt1 = Date.newInstance(2016,12,4);
        Date dt2 = Date.newInstance(2017,1,1);
        Date rt_dt = VerifyDate.CheckDates(dt1, dt2);
        System.assertEquals(rt_dt, dt2);
        
        Date dt3 = Date.newInstance(2016,12,4);
        Date dt4 = Date.newInstance(2017,2,1);
        Date rt_dt1 = VerifyDate.CheckDates(dt3, dt4);
        System.assertEquals(rt_dt1, Date.newInstance(2016, 12, 31));
    }
}