public class JSONTest 
{
	public void func()
	{
		String baseUrl = 'https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=AIzaSyCAI81OCFwKUt19ukHNb6pvaj4b7JQcM8k'  ;

	    HTTPRequest request = new HTTPRequest();              
	    request.setEndpoint(baseUrl);
	    request.setHeader('Content-Type', 'application/json');
	    request.setMethod('GET');
	    request.setTimeout(120000);
	
	    HTTP http = new HTTP();
	    HTTPResponse  response =  http.send(request);    
	    //response.getStatusCode();
	    
	    //GeoCodeResult geo =(GeoCodeResult)JSON.deserialize(response.getBody(),GeoCodeResult.class);
	    //system.debug(geo);
	    
	    JSONParser responseParser = JSON.createParser(response.getBody());
	    //initialize co-ordinates
	    double latitude = null;
	    double longitude = null;
	    while(responseParser.nextToken() != null) {
	      if((responseParser.getCurrentToken() == JSONToken.FIELD_NAME) && (responseParser.getText() == 'location')) {
	        responseParser.nextToken();
	        while(responseParser.nextToken() != JSONToken.END_OBJECT) {
	         
	        String locationText = responseParser.getText();
	         
	        responseParser.nextToken();
	         
	        if (locationText == 'lat')
	           
	        latitude = responseParser.getDoubleValue();
	         
	        else if (locationText == 'lng')
	           
	        longitude = responseParser.getDoubleValue();
	        }
	      }
	    }
	    //update co-ordinates on address if we get them back
	    if(latitude != null) {
	    	system.debug(latitude);
	    	system.debug(longitude);
	      //geoAccount.Location__Latitude__s = latitude;
	      //geoAccount.Location__Longitude__s = longitude;
	      //update geoAccount;
	    }
	    
		
	}
	
	public class GeoCodeResult 
	{
    	public List<Results> results;
    	public String status;

	}

	public class Address_components 
	{
    	public String long_name;
    	public String short_name;
    	public List<String> types;
	}

	public class Results 
	{
    	public List<Address_components> address_components;
	}
}