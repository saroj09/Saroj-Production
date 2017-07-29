public class TestMyProjClass
{
    public Project__c proj {get; private set;}
    public TestMyProjClass()
    {
        proj = [SELECT ID, Project_Name__c FROM Project__c LIMIT 1];
    }
}