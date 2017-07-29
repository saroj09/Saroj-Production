public class TimecardManager
{
    public class TimecardException extends Exception{}
    public static void handleTimeCardChanges (List<Timecard__c> oldTimecards, List<Timecard__c> newTimecards)
    {
        Set<ID> ResourceIDs = new Set<ID>();
        for (Timecard__c timecard : newTimecards)
        {
         ResourceIDs.add(timecard.Resource__c);
        }
        List<Assignment__c> assignments = [SELECT ID, Start_Date__c, End_Date__c, Resource__c FROM Assignment__c WHERE Resource__c IN :ResourceIDs];
        if (assignments.size() == 0)
        {
            throw new TimecardException('No assignments');
        }
        boolean hasAssignment;
        for (Timecard__c timecard : newTimecards)
        {
            hasAssignment = false;
            for (Assignment__c assignment : assignments)
            {
                if (assignment.Resource__c == timecard.Resource__c && timecard.Week_Ending__c - 6 >= assignment.Start_Date__c && timecard.Week_Ending__c <= assignment.End_Date__c)
                {
                    hasAssignment = true;
                    break;
                }
            }
            if (!hasAssignment)
            {
                timecard.addError('No Assignment for resource' + timecard.Resource__c + ', week ending ' + timecard.Week_Ending__c);
            }
        }
    }
}