// CopyAddressAccountTriggerHandler.cls OR CopyAddressAccountTriggerHandler.apxc
public with sharing class CopyAddressAccountTriggerHandler {
    public void cloneAddress (list<Account> lstNewAccounts) {
        if(lstNewAccounts != NULL) {
            copyAddressFields(lstNewAccounts);
        }
    }

    private void copyAddressFields(List<Account> lstNewAccounts) {
        for(Account account : lstNewAccounts) {
            try {
                    if(!String.isBlank(account.BillingStreet)) {
                        account.ShippingStreet = account.BillingStreet;
                    }
                    if(!String.isBlank(account.BillingCity)) {
                        account.ShippingCity = account.BillingCity;
                    }
                    if(!String.isBlank(account.BillingState)) {
                        account.ShippingState = account.BillingState;
                    }
                    if(!String.isBlank(account.BillingPostalCode)) {
                        account.ShippingPostalCode = account.BillingPostalCode;
                    }
                    if(!String.isBlank(account.BillingCountry)) {
                        account.ShippingCountry     = account.BillingCountry;
                    }
            } catch (Exception e) {
                system.debug(LoggingLevel.ERROR,'Error Occured :: '+e.getMessage());
            }
        }
    }
}
