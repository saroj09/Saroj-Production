public class TestMyPageController
{
    public list<ResourceWrapper> resources {get; set;}
    public static string message {get; set;}
    public  TestMyPageController()
    {
        message = '';
        resources = new list<ResourceWrapper>();
        list<resource__c> records = [SELECT Name FROM resource__c];
        for (resource__c record: records)
        {
           resources.add(new ResourceWrapper(record)); 
        }
    }
    
    public PageReference doSomething()
    {
        for (ResourceWrapper wrapper: resources)
        {
            if (wrapper.selected)
            {
                message = message  + wrapper.data.Id + ' ';
                system.debug(wrapper.data.Id);
            }
        }
        return null;
    }
    
    public class ResourceWrapper
    {
        public Resource__c data {get; set;}
        public boolean selected {get; set;}
        public ResourceWrapper(Resource__c  data)
        {
            this.data = data;
            this.selected = false;
        }
    }
}