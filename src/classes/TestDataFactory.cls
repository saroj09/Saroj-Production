@isTest
public class TestDataFactory{
	public static Invoice_statement__c CreateOneInvoiceStatement(Boolean withLineItem)
    {
        Invoice_Statement__c testInvoice = createInvoiceStatement();
        if (withLineItem == true)
        {
            Merchandise__c m = CreateMerchandiseItem('Orange Juice');
            AddLineItem(testInvoice,m);
        }
        return testInvoice;
    }
    
    private static Merchandise__c CreateMerchandiseItem (String merchName)
    {
        Merchandise__c m = new Merchandise__c (Name=merchName,
                                              Description__c = 'Fresh Juice',
                                              Price__c = 2,
                                              Total_Inventory__c = 1000);
        insert m;
        return m;
    }
    private static Invoice_Statement__c createInvoiceStatement ()
    {
        Invoice_Statement__c inv = new Invoice_Statement__c (Description__c = 'Test Invoice By Saroj 18');
        insert inv;
        return inv;
    }
    private static Line_Item__c AddLineItem (Invoice_Statement__c inv, Merchandise__c m)
    {
        Line_Item__c lineitem = new Line_Item__c (Field2__c = inv.id,
                                                 Field1__c = m.id,
                                                 Unit_Price__c = m.Price__c,
                                                 Units_Sold__c = 5);
        insert lineitem;
        return lineitem;
    }
    
}