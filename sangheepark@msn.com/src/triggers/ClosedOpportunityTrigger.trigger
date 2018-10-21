trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> tasklist = new List<Task>();
        
    for (Opportunity opps : [SELECT Id FROM Opportunity WHERE Id IN :Trigger.New AND StageName = 'Closed Won'])
    {
        taskList.add(new Task(Subject = 'Follow Up Test Task', WhatId = opps.Id));
    }
    
    if (taskList.size() >0) {
        insert taskList;
    }
    
}