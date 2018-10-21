global with sharing class HotelRemoter {
	@remoteAction
    global static List<Hotel__c> fineAll() {
        return [SELECT Id, Name, Location__Latitude__s, Location__Longitude__s FROM Hotel__c];
    }
}