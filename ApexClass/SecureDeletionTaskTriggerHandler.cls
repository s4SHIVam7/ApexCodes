public class SecureDeletionTaskTriggerHandler {
String currentUserProfileName = UserInfo.getProfileId();
    public void linkContact(List<Task> tasksToDelete) { 
        if(tasksToDelete != NULL) {
            if (currentUserProfileName != 'System Administrator') {
                for (Task task : tasksToDelete) {
                    task.addError('Only system administrators can delete tasks.');
                }
            }
        }
    }
}
