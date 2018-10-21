trigger ExampleTrigger on Contact (after insert, after delete) {
    if(Trigger.isInsert) {
        Integer recordCount = Trigger.New.Size();
        EmailManager.sendMail('steve.sanghee@gmail.com','Trailhead Trigger Tutorial',
                             recordCount + ' contact(s) were inserted');
    }
    else if(Trigger.isDelete) {
        
    }
}