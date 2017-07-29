global class MyDocuSignSchedulableClass_New implements Schedulable {
    global void execute(SchedulableContext ctx)
    {
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE ID = :ctx.getTriggerId()];
        System.debug(ct.CronExpression);
        System.debug(ct.TimesTriggered);
        
        SendToDocuSignController_New.SendNow('800i0000000KdRJ');
    }
}