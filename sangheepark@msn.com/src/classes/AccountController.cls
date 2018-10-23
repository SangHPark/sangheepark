public with sharing class AccountController {
    @AuraEnabled
    public static List<Account> findAll() {
      //New comment to test GIT
        return [SELECT Id, Name, Location__Latitude__s, Location__Longitude__s, owner
                FROM Account
                WHERE Location__Latitude__s != NULL AND Location__Longitude__s != NULL
                LIMIT 50];
    }
}