public class SendNDAController{
    
    //private Candidates__c signer;
    private Account signer;
    //private EmailTemplate eTemplate;
    public String errmsg {get; set;}
    private String id;    // id of current Candidate object
    private String auth;
    private String envelopeId;
    private String[] recipients;
    

    //=============================
    //===== Strings to modify =====
    private String accountId = '42cb871b-beda-4631-983b-712f0d1b204d';
    private String userId = 'abd8f050-aa19-4c78-b6e3-3b7cebe19eae';
    private String password = 'priya@99';
    private String integratorsKey = 'TEST-133e9675-8bf7-46b7-a2a8-06cd6d5128cd';
    private String templateId = '88EF3BA9-46C3-4642-8976-58FF38DD2CD7'; // TODO: Put your Template ID here
    private String devHost = 'https://cs3.salesforce.com/'; // TODO: Salesforce host URL
    //=============================
   // private PageReference page;
    private String webServiceUrl = 'https://demo.docusign.net/api/3.0/dsapi.asmx';

    //===== Ctor =====            
    public SendNDAController() {//ApexPages.StandardController controller
        // init signer
        id = ApexPages.currentPage().getParameters().get('id');
           
        if (id == null) {
            signer = new Account();
        }
        else {
            /*signer = [SELECT id, First_Name__c, 
                    Name, Candidate_Address__c,
                    Main_Email__c
                    from Candidates__c                    
                WHERE id = :id];*/
           //  eTemplate = [Select id,Body,Subject,DeveloperName from EmailTemplate where DeveloperName = 'ConsultantNDA' ];
           
          // signer = [SELECT FirstName,LastName, PersonEmail FROM Account WHERE WHERE id = :id];
      
             
        }
        
       
        
        //Set Authentication
        auth = '<DocuSignCredentials><Username>'+ userId 
            +'</Username><Password>' + password 
            + '</Password><IntegratorKey>' + integratorsKey 
            + '</IntegratorKey></DocuSignCredentials>';
        System.debug('Setting authentication to: ' + auth);

        
    }
     /*public EmailTemplate getETemplate() {
        return eTemplate;
        
    }*/
   
    
  
   
//===== Private methods =====
    // Send the envelope    
    private PageReference SendNDANow() {
        envelopeId = '';
        string token = '';
        DocuSignAPI.ApiServiceSOAP dsApiSend = dsapi_send();
        
        // create envelope info
        DocuSignAPI.EnvelopeInformation envelope = new DocuSignAPI.EnvelopeInformation();
        envelope.Subject = 'Email Subject';
        envelope.EmailBlurb = 'Email Body';
        envelope.AccountId  = accountId; 
    
        // Recipient Information
        DocuSignAPI.Recipient recipient = new DocuSignAPI.Recipient();
        recipient.ID = 1;
        recipient.Type_x = 'Signer';
        recipient.RoutingOrder = 1;
        recipient.Email = 'saroj09@yahoo.com';//signer.PersonEmail;
        recipient.UserName = 'Test Signer Name';//signer.FirstName +' '+signer.LastName;
        recipient.RoleName = 'Signer';
        
        recipient.CaptiveInfo = new DocuSignAPI.RecipientCaptiveInfo();
        recipient.CaptiveInfo.ClientUserId = 'Test Signer Name';
        
        // Role assignments
        DocuSignAPI.TemplateReferenceRoleAssignment roleAssignment = new DocuSignAPI.TemplateReferenceRoleAssignment();
        roleAssignment.RoleName = recipient.RoleName;
        roleAssignment.RecipientID = recipient.ID;
        
        // Create array of recipients
        DocuSignAPI.ArrayOfRecipient1 signers = new DocuSignAPI.ArrayOfRecipient1();
        signers.Recipient = new DocuSignAPI.Recipient[1];
        signers.Recipient[0] = recipient;
        
       
       
        // Create object for the NDA server-side template
        DocuSignAPI.TemplateReference ndaTemplate = new DocuSignAPI.TemplateReference();
        ndaTemplate.Template = templateId;
        ndaTemplate.TemplateLocation = 'Server';
        
        // Add role assignment
        ndaTemplate.RoleAssignments = new DocuSignAPI.ArrayOfTemplateReferenceRoleAssignment();
        ndaTemplate.RoleAssignments.RoleAssignment = new DocuSignAPI.TemplateReferenceRoleAssignment[1];
        ndaTemplate.RoleAssignments.RoleAssignment[0] = roleAssignment;
        
        // Add data for fields
        DocuSignAPI.TemplateReferenceFieldDataDataValue fd1 = new DocuSignAPI.TemplateReferenceFieldDataDataValue();
        fd1.TabLabel = 'AP Name';
        fd1.Value =  'Test Signer Name';//signer.FirstName +' '+signer.LastName;
        
       
         // Add data for fields
        DocuSignAPI.TemplateReferenceFieldDataDataValue fd2 = new DocuSignAPI.TemplateReferenceFieldDataDataValue();
        fd2.TabLabel = 'AP City';
        fd2.Value = 'Test City';
        
        // Add data for fields
        DocuSignAPI.TemplateReferenceFieldDataDataValue fd3 = new DocuSignAPI.TemplateReferenceFieldDataDataValue();
        fd3.TabLabel = 'AP Country';
        fd3.Value = 'Test Country';
        
        ndaTemplate.FieldData = new DocuSignAPI.TemplateReferenceFieldData();
        ndaTemplate.FieldData.DataValues = new DocuSignAPI.ArrayOfTemplateReferenceFieldDataDataValue();
        ndaTemplate.FieldData.DataValues.DataValue = new DocuSignAPI.TemplateReferenceFieldDataDataValue[3];
        ndaTemplate.FieldData.DataValues.DataValue[0] = fd1;
        ndaTemplate.FieldData.DataValues.DataValue[1] = fd2;
        ndaTemplate.FieldData.DataValues.DataValue[2] = fd3;

        // create array of template references
        DocuSignAPI.ArrayOfTemplateReference templateReferences = new DocuSignAPI.ArrayOfTemplateReference();
        templateReferences.TemplateReference = new DocuSignAPI.TemplateReference[1]; 
        templateReferences.TemplateReference[0] = ndaTemplate;
                
        System.debug('Calling CreateEnvelopeFromTemplates');
        try {
            DocuSignAPI.EnvelopeStatus es = dsApiSend.CreateEnvelopeFromTemplates(templateReferences, signers, envelope, true);
            envelopeId = es.EnvelopeID;
            token = getSigningURL('APC AP', 'abd8f050-aa19-4c78-b6e3-3b7cebe19eae', 'priya@99', 'TEST-133e9675-8bf7-46b7-a2a8-06cd6d5128cd', 'https://demo.docusign.net/api/3.0/dsapi.asmx', '/apex/sendNDAPage', envelopeId, 'Test Signer Name', 'saroj09@yahoo.com', 'ObjID', 'PT');
        } catch ( CalloutException e) {
            System.debug('Exception - ' + e );
            errMsg = 'Exception - ' + e;
           // return true;    //TODO: send to error landing place
        }
   
      
        //return token;
        PageReference reference=new PageReference(token);
      	reference.setRedirect(true);
      	return reference;
    }
	
	 public static string getSigningURL(string ProgramName, string DocuSignUserName, string DocuSignPwd, string DocuSignIntKey, string DocuSignEndURL, string urlBase, string envelopeId, string userName, string Email, string ObjId, string uTypeStr) 
    {
        DocuSignAPI.APIServiceSoap dsApiSend = new DocuSignAPI.APIServiceSoap();

        String auth = '<DocuSignCredentials><Username>' + DocuSignUserName +
            + '</Username><Password>' + DocuSignPwd +
            + '</Password><IntegratorKey>' + DocuSignIntKey +
            + '</IntegratorKey></DocuSignCredentials>';
                                
        dsApiSend.inputHttpHeaders_x = new Map<String, String>();
        dsApiSend.inputHttpHeaders_x.put('X-DocuSign-Authentication', auth);
        dsApiSend.endpoint_x = DocuSignEndURL;        

        DocuSignAPI.RequestRecipientTokenAuthenticationAssertion assertion = new DocuSignAPI.RequestRecipientTokenAuthenticationAssertion();
        assertion.AssertionID = '2222221111133333';//GuidGenerator.generateGUID();
        assertion.AuthenticationInstant = DateTime.Now();
        assertion.AuthenticationMethod = 'Password';
        assertion.SecurityDomain = 'Request Recipient Token';
        
        DocuSignAPI.RequestRecipientTokenClientURLs urls = new DocuSignAPI.RequestRecipientTokenClientURLs();
        
        urls.OnSigningComplete = urlBase + '?event=SignComplete&uname=' + userName + '&ObjId=' + ObjId + '&uTypeStr=' + uTypeStr + '&ProgramName=' + ProgramName;
        urls.OnViewingComplete = urlBase + '?event=ViewComplete&uname=' + userName + '&ObjId=' + ObjId + '&uTypeStr=' + uTypeStr + '&ProgramName=' + ProgramName;
        urls.OnCancel = urlBase + '?event=Cancel&uname=' + userName + '&ObjId=' + ObjId + '&uTypeStr=' + uTypeStr + '&ProgramName=' + ProgramName;
        urls.OnDecline = urlBase + '?event=Decline&uname=' + userName + '&ObjId=' + ObjId + '&uTypeStr=' + uTypeStr + '&ProgramName=' + ProgramName;
        urls.OnSessionTimeout = urlBase + '?event=Timeout&uname=' + userName + '&ObjId=' + ObjId + '&uTypeStr=' + uTypeStr + '&ProgramName=' + ProgramName;
        urls.OnTTLExpired = urlBase + '?event=TTLExpired&uname=' + userName + '&ObjId=' + ObjId + '&uTypeStr=' + uTypeStr + '&ProgramName=' + ProgramName;
        urls.OnIdCheckFailed = urlBase + '?event=IDCheck&uname=' + userName + '&ObjId=' + ObjId + '&uTypeStr=' + uTypeStr + '&ProgramName=' + ProgramName;
        urls.OnAccessCodeFailed = urlBase + '?event=AccessCode&uname=' + userName + '&ObjId=' + ObjId + '&uTypeStr=' + uTypeStr + '&ProgramName=' + ProgramName;
        urls.OnException = urlBase + '?event=Exception&uname=' + userName + '&ObjId=' + ObjId + '&uTypeStr=' + uTypeStr + '&ProgramName=' + ProgramName;
        
        if(!Test.isRunningTest()){
            return dsApiSend.RequestRecipientToken(envelopeId, userName, userName, Email, assertion, urls);
        }
        else{
            return null;
        }
    }
    // Get the proxy for the dsapi-send wsdl
    private DocuSignAPI.APIServiceSoap dsapi_send() {
        // Get DSapi and authenticate
        DocuSignAPI.APIServiceSoap dsApiSend = new DocuSignAPI.APIServiceSoap();
        dsApiSend.endpoint_x = webServiceUrl;
        dsApiSend.inputHttpHeaders_x = new Map<String, String>();
        dsApiSend.inputHttpHeaders_x.put('X-DocuSign-Authentication', auth);
        return dsApiSend;
    }
    
      
   public PageReference sendNDA(){
      
    return sendNDANow();
    
    /*PageReference pg = page.ndaSubmit;
    pg.setRedirect(true);
       return pg; */
      // return null;  
    
       
   }
    { 


    } 
    
}