// CopyAddressAccountTriggerHandler.cls OR CopyAddressAccountTriggerHandler.apxc
public with sharing class CopyAddressAccountTriggerHandler {
    public void cloneAddress (list<Account> lstNewAccounts) {
        if(lstNewAccounts != NULL) {
            copyAddressFields(lstNewAccounts);
        }
    }
    
    private void copyAddressFields(List<Account> lstNewAccounts) {
        for(Account account : lstNewAccounts) {
            if(!String.isBlank(account.BillingCity)) {
                account.ShippingStreet      = account.BillingStreet;
                account.ShippingCity        = account.BillingCity;
                account.ShippingState       = account.BillingState;
                account.ShippingPostalCode  = account.BillingPostalCode;
                account.ShippingCountry     = account.BillingCountry;
            }
        }
    }
}
