public class ScormEngineService
{
    private Configuration configuration = null;
    /*private CourseService courseService = null;
    private RegistrationService registrationService = null;
    private UploadService uploadService = null;
    private FtpService ftpService = null;
    private ExportService exportService = null;
    private ReportingService reportingService = null;
    private TaggingService taggingService = null;
    private DispatchService dispatchService = null;
    private DebugService debugService = null;
    private InvitationService invitationService = null;
    private StatementForwardService stmtFrwdService = null;
    */

    /// <summary>
    /// SCORM Engine Service constructor that that takes the three required properties.
    /// </summary>
    /// <param name="scormEngineServiceUrl">URL to the service, ex: http://services.scorm.com/EngineWebServices</param>
    /// <param name="appId">The Application ID obtained by registering with the SCORM Engine Service</param>
    /// <param name="securityKey">The security key (password) linked to the application ID</param>
    /// <param name="origin">The origin string that defines the organization, application name and version</param>
    public ScormEngineService(String scormEngineServiceUrl, String appId, String securityKey, String origin)
    {
        this.configuration  = new Configuration(scormEngineServiceUrl, appId, securityKey, origin);
        
    }

    /// <summary>
    /// SCORM Engine Service constructor that takes a single configuration parameter
    /// </summary>
    /// <param name="config">The Configuration object to be used to configure the Scorm Engine Service client</param>
    /*public ScormEngineService(Configuration config)
    {
        configuration = config;
        courseService = new CourseService(configuration, this);
        registrationService = new RegistrationService(configuration, this);
        invitationService = new InvitationService(configuration, this);
        uploadService = new UploadService(configuration, this);
        ftpService = new FtpService(configuration, this);
        exportService = new ExportService(configuration, this);
        reportingService = new ReportingService(configuration, this);
        taggingService = new TaggingService(configuration, this);
        dispatchService = new DispatchService(configuration, this);
        debugService = new DebugService(configuration, this);
        stmtFrwdService = new StatementForwardService(configuration, this);
    }
*/
    /// <summary>
    /// Contains all SCORM Engine Package-level (i.e., course) functionality.
    /// </summary>
   // public CourseService getCourseService()
    //{
     //   return courseService;
    //}

    /// <summary>
    /// Contains all SCORM Engine Package-level (i.e., course) functionality.
    /// </summary>
   // public RegistrationService getRegistrationService()
   // {
      //  return registrationService;
    //}


    /// <summary>
    /// SCORM Cloud invitation functionality.
    /// </summary>
    //public InvitationService getInvitationService()
   // {
    //    return invitationService;
    //}

    /// <summary>
    /// Contains all SCORM Engine Upload/File Management functionality.
    /// </summary>
   // public UploadService getUploadService()
   //{
    //    return uploadService;
   // }

    /// <summary>
    /// Contains all SCORM Engine FTP Management functionality.
    /// </summary>
   // public FtpService getFtpService()
   // {
  //      return ftpService;
  //  }
    
    /// <summary>
    /// Contains all SCORM Engine Data Export functionality.
    /// </summary>
   // public ExportService getExportService()
   // {
   //     return exportService;
 //   }
    
    /// <summary>
    /// Contains SCORM Cloud reporting methods.
    /// </summary>
   /* public ReportingService getReportingService()
    {
        return reportingService;
    }*/
    
    /// <summary>
    /// Contains SCORM Cloud tagging methods.
    /// </summary>
   /* public TaggingService getTaggingService()
    {
        return taggingService;
    }*/
    
    /// <summary>
    /// Contains methods for accessing SCORM dispatch
    /// </summary>
   /* public DispatchService getDispatchService() {
        return dispatchService;
    }*/
    
    /// <summary>
    /// Contains methods for accessing Tin Can statement forwarding
    /// </summary>
    /*public StatementForwardService getStatementForwardService() {
        return stmtFrwdService;
    }*/

    /// <summary>
    /// Contains SCORM Cloud debug methods.
    /// </summary>
   /* public DebugService getDebugService(){
        return debugService;
    }*/
    
    /// <summary>
    /// The Application ID obtained by registering with the SCORM Engine Service
    /// </summary>
    public String getAppId()
    {
        return configuration.getAppId();
    }

    /// <summary>
    /// set a new Application Id for service calls
    /// </summary>
    public ScormEngineService setAppId(String newAppId)
    {
        configuration.setAppId(newAppId);
        return this;
    }

    /// <summary>
    /// The security key (password) linked to the Application ID
    /// </summary>
    public String getSecurityKey()
    {
            return configuration.getSecurityKey();
    }

    /// <summary>
    /// The security key (password) linked to the Application ID
    /// </summary>
    public ScormEngineService setSecurityKey(String newSecurityKey)
    {
            configuration.setSecurityKey(newSecurityKey);
            return this;
    }

    /// <summary>
    /// URL to the service, ex: http://cloud.scorm.com/EngineWebServices
    /// </summary>
    public String getScormEngineServiceUrl()
    {
            return configuration.getScormEngineServiceUrl();
    }
    
    public String getOrigin()
    {
        return configuration.getOrigin();
    }

   /* public ServiceRequest CreateNewRequest()
    {
        return new ServiceRequest(this.configuration);
    }*/

    
}