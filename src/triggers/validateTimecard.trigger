trigger validateTimecard on Timecard__c (before insert, before update) {
TimecardManager.handleTimeCardChanges(Trigger.old, Trigger.new);
}