//Write a trigger on Account , when an account insert , 
// automatically account billing address should populate into the account shipping address.
// CopyAddressAccountTrigger.cls OR CopyAddressAccountTrigger.apxt 

trigger CopyAddressAccountTrigger on Account (before insert) {
    CopyAddressAccountTriggerHandler handler = new CopyAddressAccountTriggerHandler();
    if(trigger.inBefore) {
        if(trigger.insert) {
            if(!CheckRecursive.firstCall) {
                CheckRecursive.firstCall = true;
                handler.cloneAddress(trigger.new);
            }
        }
    }
}
