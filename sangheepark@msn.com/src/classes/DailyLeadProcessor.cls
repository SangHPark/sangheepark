global class DailyLeadProcessor implements Schedulable {
    global void execute(SchedulableContext ctx) {
        List<Lead> listlead = [SELECT id FROM LEAD];
        
        List<Lead> leads = new List<Lead>();
        for (Lead l : listlead) {
            l.leadsource = 'Dreamforce';
            leads.add(l);
        }
        
        update leads;
    }
}