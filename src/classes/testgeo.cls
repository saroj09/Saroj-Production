public class testgeo
{
    public void geofunc()
    {
        string coordinates;
        xmlApacheOrgXmlSoap.Map_x GeoCodeResponse = new xmlApacheOrgXmlSoap.Map_x ();
        list<geoservicesWebservices.GeoObject> geoObjects = new list<geoservicesWebservices.GeoObject>();
        geoservicesWebservices.GeoObject geoObject = new geoservicesWebservices.GeoObject();
        geoObject.address1 = '600 California Street';
        geoObject.city = 'San Francisco';
        geoObject.country = 'USA';
        geoObject.postalcode = '94108';
        geoObject.state = 'CA';
        geoObject.geoId = 'dddddddd';
        geoObjects.add(geoObject);
        geoservicesWebservices.geoservices_cfc newHandle =  new geoservicesWebservices.geoservices_cfc();
        GeoCodeResponse = newHandle.getGeoCode(geoObjects);
        system.debug('********GeoCodeResponse***********'+GeoCodeResponse);
        for (xmlApacheOrgXmlSoap.mapItem gitem  :GeoCodeResponse.item)
        {
            coordinates=gitem.value;
            system.debug('********Co-ordinate***********'+coordinates);
        }
    }
}