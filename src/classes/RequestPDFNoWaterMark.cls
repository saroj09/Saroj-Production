public with sharing class RequestPDFNoWaterMark {
    //public String EnvelopeID;
    public string PDFBytesinStr {get;set;}
   
    public RequestPDFNoWaterMark()
    {
        PDFBytesinStr ='';
    }

    public void createPDF()
    {
        String accountId = '42cb871b-beda-4631-983b-712f0d1b204d';
        String userId = 'abd8f050-aa19-4c78-b6e3-3b7cebe19eae';
        String password = 'priya@99';
        String integratorsKey = 'TEST-133e9675-8bf7-46b7-a2a8-06cd6d5128cd';
        String webServiceUrl 
        = 'https://demo.docusign.net/api/3.0/dsapi.asmx';
        String EnvelopeID = System.currentPageReference().getParameters().get('EnvID');
        DocuSignAPI.APIServiceSoap dsApiSend 
            = new DocuSignAPI.APIServiceSoap();
        dsApiSend.endpoint_x = webServiceUrl;

        //Set Authentication
        String auth = '<DocuSignCredentials><Username>'+ userId 
            +'</Username><Password>' + password 
            + '</Password><IntegratorKey>' + integratorsKey 
            + '</IntegratorKey></DocuSignCredentials>';
        System.debug('Setting authentication to: ' + auth);
            
        dsApiSend.inputHttpHeaders_x = new Map<String, String>();
        dsApiSend.inputHttpHeaders_x.put('X-DocuSign-Authentication', 
            auth);
 
        
        System.debug('Calling the API');
        try {
            DocuSignAPI.EnvelopePDF es 
            = dsApiSend.RequestPDFNoWaterMark(EnvelopeID);
           PDFBytesinStr = es.PDFBytes;
             //PDFBytesinStr = EncodingUtil.base64Decode(es.PDFBytes);
           // PDFBytesinStr =  EncodingUtil.base64Encode(es.PDFBytes);
        } catch ( CalloutException e) {
            System.debug('Exception - ' + e );
            envelopeId = 'Exception - ' + e;
        }
      
    }
}