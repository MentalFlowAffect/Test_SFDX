@isTest
private class AccountManagerTest {
        
        @isTest static void testGetAccountById() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://jacobsdevorg-dev-ed.my.salesforce.com/services/apexrest/Accounts/'
            + recordId + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAcc = AccountManager.getAccount();
        // Verify results
        System.assert(thisAcc != null);
        System.assertEquals('Test record', thisAcc.Name);
    }
    
    // Helper method
    static Id createTestRecord() {
        // Create test record
        Account accTest = new Account(
            Name = 'Test record',
            OwnerId = '00536000001a2uG');
            
        insert accTest;

        // Test
        Contact conTest = new Contact(
        	AccountId = accTest.Id,
        	FirstName = 'Jacoby',
        	LastName = 'Laramee',
        	OwnerId = '00536000001a2uG');
        insert conTest;
        
        return accTest.Id;
    } 
}