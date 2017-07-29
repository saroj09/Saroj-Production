trigger HandleProductPriceChange on Merchandise__c (after update) {
List<Line_Item__c> openLineItems =
[Select l.Unit_Price__c, l.Field1__r.Price__c From Line_Item__c l
WHERE l.Field2__r.Status__c = 'Negotiating'
AND l.Field1__r.id IN  :Trigger.New
FOR UPDATE
];
for (Line_Item__c li: openLineItems)
    {
        if (li.Field1__r.Price__c < li.Unit_Price__c)
        {
            li.Unit_Price__c = li.Field1__r.Price__c;
        }
    }
update openLineItems;
}