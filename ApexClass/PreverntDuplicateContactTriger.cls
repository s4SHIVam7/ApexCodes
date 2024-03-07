/*  Trigger on contact to prevent duplicate records based on Contact Email & Contact Phone.
* @Author : Shivam
*/
// PreverntDuplicateContactTriger.apxt // PreverntDuplicateContactTriger.cls

trigger PreverntDuplicateContactTriger on Contact (before Insert, before Update) {
  PreverntDuplicateContactTrigerHandler objHandler = new PreverntDuplicateContactTrigerHandler();
  if(trigger.isBefore && (trigger.Insert || trigger.isBefore)) {
      if(!CheckRecursive.firstCall) {
          CheckRecursive.firstCall = true;
          objHandler.preventDuplicateContact(trigger.new, trigger.oldMap);
      }
  }
}
