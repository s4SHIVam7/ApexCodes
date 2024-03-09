//Write a trigger, only system admin user should be able to delete the task.
//SecureDeletionTaskTrigger.cls
trigger SecureDeletionTaskTrigger on Task(before delete) {
	SecureDeletionTaskTriggerHandler objHandler = new SecureDeletionTaskTriggerHandler();
	if (trigger.isBefore){
		if (trigger.isDelete) {
			if(!CheckRecursive.firstCall) {
				CheckRecursive.firstCall = true;
				objHandler.deleteTask(trigger.old);
			}
		}
	}
}
