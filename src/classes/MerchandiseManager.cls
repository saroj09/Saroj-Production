@RestResource(urlMapping='/Merchandise/*')
global with sharing class MerchandiseManager{
	@HttpGet
    global static Merchandise__c GetMerchandisebyID()
    {
        RestRequest req = RestContext.request;
        String merchID = req.requestURI.substring(req.requestURI.LastIndexOf('/')+1);
        Merchandise__c result = [SELECT Name, Description__c, Price__c, Total_Inventory__c FROM Merchandise__c WHERE ID = :merchID];
        return result;
    }
    @HttpPost
    global static string CreateMerchandise(String name, String Description, Decimal price, Double Inventory)
    {
        Merchandise__c m = new Merchandise__c (name = name,
                                              Description__c = Description,
                                              price__c = price,
                                              Total_Inventory__c = Inventory);
        insert m;
        return m.Id;
    }
}