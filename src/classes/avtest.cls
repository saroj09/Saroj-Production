public class avtest
{
	public string uID = 'saroj09@yahoo.com';
	public string pwd = 'KKr4zS';
	public string addr {get; set;}
	//public string addr2 {get; set;}
	public string ct {get; set;}
	public string st {get; set;}
	public string zp {get; set;}
	public string coun {get; set;}
	
	public string msg {get; set;}
	public string fmsg {get; set;}
	
	public void funcnew()
	{
	    wwwStrikeironCom.GlobalAddressVerificationSoap avmain = new wwwStrikeironCom.GlobalAddressVerificationSoap();
	    
	    wsStrikeironCom.LicenseInfo linfo = new wsStrikeironCom.LicenseInfo();
	    
	    wsStrikeironCom.RegisteredUser reguser = new wsStrikeironCom.RegisteredUser();
	    
	    reguser.UserID = uID;
	    reguser.Password = pwd;
	    linfo.RegisteredUser = reguser;
	    avmain.LicenseInfo =  linfo;
	    string localitylines = ct + ', ' + st + ', ' + zp + ', ';
	    wwwStrikeironCom.SIWsOutputOfListing ddd = avmain.BasicVerify(addr, localitylines, coun);
	    system.debug('***Status****' + ddd.ServiceStatus.StatusDescription);
	    system.debug('***FormattedAddress****' + ddd.ServiceResult.Locality);
	    system.debug('***Status Code****' + ddd.ServiceStatus.StatusNbr);
	    msg = ddd.ServiceStatus.StatusDescription;
	    //addr = ddd.ServiceResult.DeliveryAddressLine;
	    fmsg = ddd.ServiceResult.FormattedAddress;
	}
}