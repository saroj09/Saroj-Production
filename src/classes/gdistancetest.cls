public class gdistancetest
{
    public void tfunc()
    {
        sarojtest.testgeodistance_cfc handlr = new sarojtest.testgeodistance_cfc();
        string dis = handlr.getDistance('fromLongitude=-118.165209&fromLatitude=34.162838','toLatitude=38.603520&toLongitude=-121.248060');
        system.debug('*****Distnce*****'+dis);
    }
}