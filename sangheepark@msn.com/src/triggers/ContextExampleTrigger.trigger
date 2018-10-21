trigger ContextExampleTrigger on Account (before insert, after insert, after delete) {
    if (Trigger.isInsert) {
        if (Trigger.isBefore) {
            // Process before insert
            System.debug('Before Insert');
        } else if (Trigger.isAfter) {
            // Process after insert
            System.debug('After Insert');
        }        
    }
    else if (Trigger.isDelete) {
        // Process after delete
        System.debug('Deleted ...');
    }
}