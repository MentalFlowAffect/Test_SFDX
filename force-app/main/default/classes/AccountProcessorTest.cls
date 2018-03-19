@isTest
public with sharing class AccountProcessorTest {
    
    @isTest
    public static void testAccountProcessor(){
    	Account a = new Account();
    	a.Name = 'Test Account';
    	insert a;
    	
    	Contact c = new Contact();
    	c.FirstName = 'Test';
    	c.LastNAme = 'Person';
    	c.AccountId = a.Id;
    	insert c;
    	
    	List<Id> accIds = new List<Id>();
    	accIds.Add(a.Id);
    	test.startTest();
    	AccountProcessor.countContacts(accIds);
        test.stopTest();
    }
}