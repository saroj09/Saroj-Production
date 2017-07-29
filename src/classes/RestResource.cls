@RestResource(urlMapping='/RResource/*')
global with sharing class RestResource { 
    @HttpGet
    global static Map<String,String> getResource() {
        Map<String,String> result = new Map<String,String>();

        result.put('key1', 'value1');
        result.put('key2', 'value2');

        return result;
    }
}