@isTest
public class BusScheduleCacheTest {
    static testmethod void dotest() {
        BusScheduleCache mySchedule = new BusScheduleCache();
        Time[] myTime = new Time[]{};
//        List<Time> myTime = new List<Time>();
        myTime.add(Time.newInstance(1,0,0,0));
        mySchedule.putSchedule('25', myTime);
        
        Time[] retTime = mySchedule.getSchedule('25');
//        List<Time> retTime = mySchedule.getSchedule('25');
        String s = string.valueOf(retTime.get(0));
        System.AssertEquals('1', s);
    }
}