public class mdf 
{
    public string showmsg{get;set;}
    public Customer__c cs {get; set;}
    public mdf(ApexPages.StandardController controller) 
    {
        if(ApexPages.currentPage().getParameters().get('Id') != null)
        {
            cs = [SELECT Customer_Name__c,Address__c, Phone__c FROM Customer__c WHERE ID = :ApexPages.currentPage().getParameters().get('Id')];
        }
        else
        {
            cs  = new Customer__c();
        }
    }
    
    public void save()
    {
        // cs.Customer_Name__c = cs.Customer_Name__c;
        // cs.Address__c = cs.Address__c;
        //upsert cs ;
        
        chkUser.testchkuser_cfc chk = new chkUser.testchkuser_cfc();
        boolean bl = chk.getUser(cs.Customer_Name__c,cs.Address__c);
        
        if (bl == false)
        {
            upsert cs;
            showmsg = 'Record inserted successfully';
        }
        else
        {
            showmsg = 'Record already exist';
        }
       // system.debug('*****User found*****'+bl);
        
    }

}