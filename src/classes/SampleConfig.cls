public class SampleConfig {
    
    public static ScormEngineService GetScormEngineService(){
        
        String appId = '74TTVKS85C';
        String secretKey = 'FJ4pYLTcsMmcl8FgYEnwf6MdFJzXgRNhtV9rblp0';
        String serviceUrl = 'http://cloud.scorm.com/EngineWebServices';
        String origin = 'SarojTest';
        return new ScormEngineService(serviceUrl,appId,secretKey,origin);
    }
}