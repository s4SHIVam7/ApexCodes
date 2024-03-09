// SecureDeletionTaskTriggerHandler.cls
public class SecureDeletionTaskTriggerHandler {

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
        return currentUserProfileName == 'System Administrator';
    }

}
