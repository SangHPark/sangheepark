trigger SendConfirmationEmail on Session_Speaker__c (after insert) {
    System.debug('----Trigger Start----');
    List <Id> sessionSpeakerIds = new List<Id>();
    for(Session_Speaker__c newItem : trigger.new) {
        sessionSpeakerIds.add(newItem.id);
    }
    System.debug('Session ID ==> ' + sessionSpeakerIds.get(0));
                 
    List<Session_Speaker__c> sessionSpeakers = 
        [SELECT Session__r.Name,
                Session__r.Session_Date__c,
                Speaker__r.First_Name__c,
                Speaker__r.Last_Name__c,
                Speaker__r.Email__c
           FROM Session_Speaker__c WHERE Id IN :sessionSpeakerIds];
    
    System.debug('sessionSpeakers Count : ' + sessionSpeakers.size());
    
    if (sessionSpeakers.size() > 0) {
        Session_Speaker__c sessionSpeaker = sessionSpeakers[0];
        if (sessionSpeaker.speaker__r.Email__c != null) {
            String address = sessionSpeaker.Speaker__r.Email__c;
            String subject = 'Speaker Confirmation';
            String message = 'Dear ' + sessionSpeaker.Speaker__r.First_Name__c +
                ',\nYour session "' + sessionSpeaker.Session__r.Name + '" on ' +
                sessionSpeaker.Session__r.Session_Date__c + ' is confirmed.\n\n' +
                'Thanks for speaking at the conference!';
            EmailManager.sendMail(address, subject, message);
        }
    }	
}