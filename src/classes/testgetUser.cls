public class testgetUser
{
    public void methodchkUser()
    {
        chkUser.testchkuser_cfc chk = new chkUser.testchkuser_cfc();
        boolean bl = chk.getUser('Gheewalla','lghee@optonline.netx');
        system.debug('*****User found*****'+bl);
    }
}