@isTest
private class TestInvoiceStatementDeletion{
	static testmethod void TestDeleteInvoicewithLineItem()
    {
        Invoice_Statement__c inv = TestDataFactory.CreateOneInvoiceStatement(true);
        Test.startTest();
        Database.DeleteResult result = Database.delete(inv, false);
        Test.stopTest();
        
        System.assert(!result.isSuccess());
    }
}