//Generated by wsdl2apex

public class sarojtest {
    public class testgeodistance_cfc {
        public String endpoint_x = 'https://cfdev.intraxinc.com/sarojtest/testgeodistance.cfc';
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'http://rpc.xml.coldfusion', 'rpcXmlColdfusion', 'http://sarojtest', 'sarojtest'};
        public String getDistance(String posDistance,String accomDistance) {
            sarojtest.getDistance_element request_x = new sarojtest.getDistance_element();
            sarojtest.getDistanceResponse_element response_x;
            request_x.posDistance = posDistance;
            request_x.accomDistance = accomDistance;
            Map<String, sarojtest.getDistanceResponse_element> response_map_x = new Map<String, sarojtest.getDistanceResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://sarojtest',
              'getDistance',
              'http://sarojtest',
              'getDistanceResponse',
              'sarojtest.getDistanceResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.getDistanceReturn;
        }
    }
    public class getDistanceResponse_element {
        public String getDistanceReturn;
        private String[] getDistanceReturn_type_info = new String[]{'getDistanceReturn','http://sarojtest',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sarojtest','true','false'};
        private String[] field_order_type_info = new String[]{'getDistanceReturn'};
    }
    public class getDistance_element {
        public String posDistance;
        public String accomDistance;
        private String[] posDistance_type_info = new String[]{'posDistance','http://sarojtest',null,'1','1','false'};
        private String[] accomDistance_type_info = new String[]{'accomDistance','http://sarojtest',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sarojtest','true','false'};
        private String[] field_order_type_info = new String[]{'posDistance','accomDistance'};
    }
}