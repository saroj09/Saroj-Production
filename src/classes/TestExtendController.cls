public class TestExtendController
{
    public string newRid {get; set;}
    private apexpages.standardcontroller controller;
    public TestExtendController(apexpages.standardcontroller controller)
    {
        this.controller = controller;
    }
    public pageReference dosomething()
    {
        newRid = 'New ' + controller.getid();
        return null;
    }
}