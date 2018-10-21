public with sharing class SpeakerControllerExtension {
    
    public blob picture {get; set;}
    public String errorMessage {get; set;}
    
    private final Speaker__c speaker;
    private ApexPages.StandardController stdController;
    
    public SpeakerControllerExtension (ApexPages.StandardController stdController){
        this.speaker = (Speaker__c)stdController.getRecord();
        
    }
    
    public PageReference save() {
        errorMessage = '';
        try {
            upsert speaker;
            if (picture != null) {
                Attachment attachment = New Attachment();
                attachment.Body = picture;
                attachment.Name = 'speaker_' + speaker.id + '.jpg';
                attachment.ParentId = speaker.id;
                attachment.ContentType = 'application/jpg';
                insert attachment;
                speaker.Picture_Path__c = '/servlet/servlet.FileDownload?file=' + attachment.Id;	
                update speaker;
            }
        	return new ApexPages.StandardController(speaker).view();
        }
        catch(System.Exception ex) {
            errorMessage = ex.getMessage();
            return null;
        }
    }
    
}