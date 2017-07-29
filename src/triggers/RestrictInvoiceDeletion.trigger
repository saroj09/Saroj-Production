trigger RestrictInvoiceDeletion on Invoice_Statement__c (before Delete) {
for (invoice_statement__c invoice : [SELECT ID FROM invoice_statement__c WHERE
                                     ID IN (SELECT Field2__c FROM Line_Item__c)
                                     AND
                                     ID IN :Trigger.Old
                                    ])
	{
        Trigger.oldMap.get(invoice.ID).addError('Can not Delete invoice statement with line items');
	}
}