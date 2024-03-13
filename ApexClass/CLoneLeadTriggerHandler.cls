// CLoneLeadTriggerHandler.cls OR CLoneLeadTriggerHandler.apxc

public with sharing class CLoneLeadTriggerHandler{
  private List<Lead> leadsToInsert = new List<Lead>();
  public void cloneLead(List<Lead> newLeads) {
    if(newLeads != NUll) {
      try {
            processLeads(newLeads);
        } catch (Exception e) {
            System.debug(LoggingLevel.ERROR,'Error Occured :: ' + e.getMessage());
        }
      }
    }    
    

    private void processLeads(List<Lead> leads) {
       try {
        for (Lead lead : leads) {
             // lead.clone(deepClone,preserveId,isSavePoint,preserveReadonlyTimestamps)
            Lead duplicateLead = lead.clone(false, true, false, false);
            leadsToInsert.add(duplicateLead);
        }
        if(!leadsToInsert.isEmpty()) {
            insert leadsToInsert;
        }
    } catch (Exception e) {
        System.debug(LoggingLevel.ERROR,'Error Occured :: ' + e.getMessage());
    }
}


