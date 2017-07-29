public class rptlist
{
    public report[] getallrpts()
    {
        folder[] ff = [select id from folder where developername = 'Merchandise_Reports'];
        id fid = (ff.isEmpty()) ? null : ff[0].id;
        report[] rpts = [select id, name, description from report where ownerid = : fid and ownerid != null order by name];
        return (rpts.isEmpty() == null) ? null : rpts; 
    }
    
    public PageReference getUrl()
    {
        string str = '/' + ApexPages.currentPage().getParameters().get('guid') + '?csv=1';
        return new PageReference(str);
    }
}