global class MySchedulableClass implements Schedulable {
	global void execute(SchedulableContext ctx)
    {
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE ID = :ctx.getTriggerId()];
        System.debug(ct.CronExpression);
        System.debug(ct.TimesTriggered);
        
        Merchandise__c m = new Merchandise__c (Name = 'Scheduled Job Item',
                                              Description__c = 'Created By Scheduler',
                                              Price__c = 1,
                                              Total_Inventory__c = 1000);
        insert m;
    }
}