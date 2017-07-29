public class Configuration
{
    private String appId = null;
    private String securityKey = null;
    private String scormEngineServiceUrl = null;
    private String origin = 'rusticisoftware.javalibrary.1.1.2';

    public Configuration(String scormEngineServiceUrl, String appId, String securityKey, String origin)
    {
        this.appId = appId;
        this.securityKey = securityKey;
        this.scormEngineServiceUrl = scormEngineServiceUrl;
        this.origin = origin;
    }
    
     public String getAppId()
    {
        return appId;
    }
    public void setAppId(String appId)
    {
        this.appId = appId;
    }

     public String getSecurityKey()
    {
        return securityKey;
    }
    public void setSecurityKey(String securityKey)
    {
        this.securityKey = securityKey;
    }

    /// <summary>
    /// URL to the service, ex: http://services.scorm.com/EngineWebServices
    /// </summary>
    public String getScormEngineServiceUrl()
    {
        return scormEngineServiceUrl;
    }
    public void setScormEngineServiceUrl(String scormEngineServiceUrl)
    {
        this.scormEngineServiceUrl = scormEngineServiceUrl;
    } 
    
    /// <summary>
    /// The origin string that defines the organization, application name and version
    /// of the software accessing the Cloud service.
    /// </summary>
    public String getOrigin()
    {
        return origin;
    }
    public void setOrigin(String origin)
    {
        this.origin = origin;
    }
}