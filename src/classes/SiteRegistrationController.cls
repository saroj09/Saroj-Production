public without sharing class SiteRegistrationController 
{
	public User user;
	public String firstname {get; set;}
    public String lastname {get; set;}
    public String email {get; set {email = value == null ? value : value.trim(); } }
    public String confirmEmail {get; set;}
    public String User_Interests{get; set;}
    public String timezone { get; set;}
    public String locale { get; set;}
    public String password {get; set {password = value == null ? value : value.trim(); } }
    public String confirmPassword {get; set { confirmPassword = value == null ? value : value.trim(); } }
    public datetime executionTime = datetime.now();
    
    public String userId;
    
    public boolean IsUserInterestinURL{get;set;}
    public String uInParameter {get; set;}
	
	public SiteRegistrationController(ApexPages.StandardController stdController)
	{
		this.user = (User)stdController.getRecord();
	}
	
	public boolean isValidPassword() 
	{
        return password == confirmPassword;
    }
    public boolean isValidEmail() 
    {
        return email == confirmEmail;
    }
    
     public PageReference checkLogin()
     {
        PageReference p;
        system.debug('*****###USERTYPE '+userInfo.getUserType());
        
        if (userInfo.getUserType() == 'Guest'){
            p = null;
        }else{
            p = new PageReference('/LoginRedirection');
            p.setRedirect(true);   
        }
                
        return p;
    }
    public PageReference registerUser()
    {
    	if(firstname == null || firstname == '' 
           || lastname == null || lastname == '' 
           || email == null || email == ''
           || confirmEmail == null || confirmEmail == ''
           || password == null || password == '' 
           || confirmPassword == null || confirmPassword == '' 
           || Locale == ' ' 
           || timezone == ' '
           )               
           {
              ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Please correct all information.');
              ApexPages.addMessage(msg);
              return null;
           }
           
           if (!isValidPassword()) 
           {
          		ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Password do not match');
          		ApexPages.addMessage(msg);
            	return null;
           }
           
           String emailRegex = '([a-zA-Z0-9_\\-\\.]+)@((\\[a-z]{1,3}\\.[a-z]{1,3}\\.[a-z]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})';
           Pattern MyPattern = Pattern.compile(emailRegex);
           Matcher MyMatcher = MyPattern.matcher(email);
           if (!MyMatcher.matches()) 
           {
            	ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Email is not correct format.');
            	ApexPages.addMessage(msg);
            	return null;
           }
           
           if (!isValidEmail()) 
           {
           		ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Email do not match.');
          		ApexPages.addMessage(msg);
            	return null;
           }
           
           	user.Username = email;
        	user.Email = email;
        	user.FirstName = firstname;
        	user.LastName = lastname;
        	string NickName = Email+executionTime.getTime();
        	Integer NickNameLen=NickName.length();
        	if(NickNameLen>40)
          		NickName = NickName.right(40); 
        	else
          		NickName = email+executionTime.getTime();  
          	user.CommunityNickname = NickName;
          	user.TimeZoneSidKey = 'Pacific/Chatham';
          	user.LocaleSidKey = 'en_US';
          	Id Portal_Account_Id = '001i000001xLOh2';
          	userId = Site.createPortalUser(user, Portal_Account_Id , password,false);
           
           return null;
    }
}