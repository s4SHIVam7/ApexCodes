// Create a duplicate lead when a lead in insert.
// CloneLeadTrigger.cls OR CloneLeadTrigger.apxt

trigger CloneLeadTrigger on Lead (after insert) {
  CloneLeadTriggerHandler objHandler = new CloneLeadTriggerHandler();
  if(trigger.isAfter) {
    if(trigger.isInsert) {
      if(!CheckRecursive.firstCall) {
          CheckRecursive.firstCall = true;
          objHandler.cloneLead(trigger.new);
      }
    }
  }
}
