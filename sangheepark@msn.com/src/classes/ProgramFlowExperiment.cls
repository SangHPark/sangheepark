public class ProgramFlowExperiment {
	
	public static Integer EmailCounter = 0;
	
	public void SendEmail() {
		EmailCounter ++;
		System.Debug('Queueing email to send');
	}
	
	public void SendQueueEmails() {
		System.debug('Sending Email Queue');
	}
	
	public void HandleContactUpdateTriggerer (List<Contact> newlist, Map<ID, Contact> oldmap) {
		
		for (Contact ct : newlist)
		{
			if (ct.OwnerID != oldmap.get(ct.ID).OwnerID)
			{
				SendEmail();
			}
		}
		
		SendQueueEmails();
	} 
    
}