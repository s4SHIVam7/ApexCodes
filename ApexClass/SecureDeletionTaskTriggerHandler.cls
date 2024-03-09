// SecureDeletionTaskTriggerHandler.cls
public with sharing class SecureDeletionTaskTriggerHandler {

    public void deleteTask(List<Task> tasksToDelete) { 
        if(tasksToDelete != NULL) {
            if (!isSystemAdministrator())  {
                for (Task task : tasksToDelete) {
                    task.addError('Only system administrators can delete tasks.');
                }
            }
        }
    }

    private Boolean isSystemAdministrator() {
        String currentUserProfileName = [SELECT Name FROM Profile WHERE Id = :UserInfo.getProfileId() LIMIT 1].Name;
        return currentUserProfileName == 'System Administrator';
    }

}
