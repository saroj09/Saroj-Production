global class PluginGeocode implements Process.Plugin,Database.AllowsCallouts
{
	global Process.PluginResult invoke(Process.PluginRequest req)
	{
		map<String,Object> result = new Map<String,Object>();
		String AddressStr = (String) req.inputParameters.get('Address');
		
		AddressStr = EncodingUtil.urlEncode(AddressStr,'UTF-8');
		
		String baseUrl = 'https://maps.googleapis.com/maps/api/geocode/json?address=' + AddressStr + '&key=AIzaSyCAI81OCFwKUt19ukHNb6pvaj4b7JQcM8k';
		
		HTTPRequest request = new HTTPRequest();              
	    request.setEndpoint(baseUrl);
	    request.setHeader('Content-Type', 'application/json');
	    request.setMethod('GET');
	    request.setTimeout(120000);
	
	    HTTP http = new HTTP();
	    HTTPResponse  response =  http.send(request);   
	    
	    JSONParser responseParser = JSON.createParser(response.getBody());
	    
	    double latitude = 0;
	    double longitude = 0;
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
	    
	    system.debug(longitude);
	    system.debug(latitude);
	    
	    result.put('LongitudeVal', longitude); 
	    result.put('LatitudeVal', latitude); 
	    
	    return new Process.PluginResult(result); 
	}
	
	global Process.PluginDescribeResult describe() { 
        Process.PluginDescribeResult result = new Process.PluginDescribeResult(); 

        result.inputParameters = new list<Process.PluginDescribeResult.InputParameter>{ 
               new Process.PluginDescribeResult.InputParameter('Address', 
                    Process.PluginDescribeResult.ParameterType.STRING, true)
        };
        
        result.outputParameters = new list<Process.PluginDescribeResult.OutputParameter>{
                new Process.PluginDescribeResult.OutputParameter('LongitudeVal', 
                    Process.PluginDescribeResult.ParameterType.decimal),
         		new Process.PluginDescribeResult.OutputParameter('LatitudeVal', 
                    Process.PluginDescribeResult.ParameterType.decimal)
        }; 
        return result;
     }
}