public class BusScheduleCache {
    private Cache.OrgPartition part;
    public BusScheduleCache() {
        part = Cache.Org.getPartition('local.BusSchedule');
    }
    
    public void putSchedule(String busLine, Time[] schedule) {
        System.debug('Bus Line:' + busLine);
        System.debug('Time:' + schedule.get(0));
        System.debug('Partition name:' + part.getName());
        part.put(busLine, schedule);
        
        
    }
       
    public Time[] getSchedule(String busLine) {
        
        Time def_am_time = Time.newInstance(8,0,0,0);
        Time def_pm_time = Time.newInstance(17,0,0,0);
        
        
        Time[] return_schedule = new Time[]{};
            
//        String tmp = string.valueof(def_am_time);
        
 //       System.debug('default AM:' +tmp );
        if (part != null) {
            if (part.contains(busLine)) {
                System.debug('It in it for BusLine:' + busLine);
	        	return_schedule = (Time[])part.get(busLine);   
    	        System.debug('return Schedule:' + return_schedule.get(0));
            }
            else {
                System.debug('Nothing for BusLine : ' + busLine);
	         	return_schedule.add(def_am_time);
		        return_schedule.add(def_pm_time);
            }
        } else{
         	return_schedule.add(def_am_time);
	        return_schedule.add(def_pm_time);
        }
        return return_schedule; 
    }

}