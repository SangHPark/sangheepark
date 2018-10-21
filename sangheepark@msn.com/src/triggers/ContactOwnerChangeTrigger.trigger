trigger ContactOwnerChangeTrigger on Contact (after update) {
    ProgramFlowExperiment pf = new ProgramFlowExperiment();
    pf.HandleContactUpdateTriggerer(trigger.new, trigger.oldMap);
}