//PreverntDuplicateContactTriger.apxc // PreverntDuplicateContactTriger.cls

public with sharing class PreverntDuplicateContactTrigerHandler {
    set <String> setPhone = new set <String>();
    set <String> setEmail = new set <String>();
    list <Contact> lstCons = new list <Contact>();
    String errorForPhone = 'Record Already Exist With Same Phone Number';
    String errorForEmail = 'Record Already Exist With Same Email';

    public void preventDuplicateContact (list<contact> lstNewCon, map<Id, Contact>oldMapCon) {
      
      if (lstNewCon != NULL) {
        for (Contact objCon : lstNewCon) {
          if ( (objCon.Email != NULL) || (objCon.Phone != NULL) ) {
            setPhone.add(objCon.phone);
            setEmail.add(objCon.Email);
          }
        }
      }

      if(oldMapCon != NULL) {
        for (Contact objCon : lstNewCon) {
          if ( (objCon.phone != oldMapCon.get(objCon.Id).phone) ||
               ( objCon.Email != oldMapCon.get(objCon.Id).Email)
          ) {
            setPhone.add(objCon.phone);
            setEmail.add(objCon.Email);
          }
        }
      }

      lstCons = [ SELECT id, Email, Phone
                  FROM  Contact
                  WHERE Email IN :setEmail
                  OR    Phone in :setPhone];
      
      if(!lstCons.isEmpty()) {
        for (Contact objDupCon : lstCons) {
          if ( !String.isBlank(objDupCon.Email) ) {
            objDupCon.Email.addError(errorForEmail);
          } 
          if ( !string.isBlank(objDupCon.Phone) ) {
            objDupCon.Phone.addError(errorForPhone);
          }
        }

      }

    }
}
