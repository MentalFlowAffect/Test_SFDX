public with sharing class AccountProcessor {
	@future
    public static void countContacts(List<Id> accIds){
    	list<Account> updateAccs = new List<Account>();
		// Test
    	for (Id accId : accIds){
    		Integer numContacts = database.countQuery('select count() from Contact where AccountId =\''  + accId + '\'');
    		Account a = [select id from Account where id = :accId];
    		a.Number_of_Contacts__c = numContacts;
    		updateAccs.Add(a);
    	}
    	update updateAccs;
    }
}