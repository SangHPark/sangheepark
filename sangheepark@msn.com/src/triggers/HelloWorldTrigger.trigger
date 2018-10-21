trigger HelloWorldTrigger on Account (before insert) {
//    System.debug('Hello World! This is from Before Insert Trigger');
    for (Account a : Trigger.New) {
        a.Description = 'New Description';
    }
    
}