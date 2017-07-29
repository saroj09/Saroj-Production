public class xmlread 
{
	public static integer errorCounter = 0;
	public static string appErrorMsg = '';
	
	public static void xmlfunc() 
	{
		Http h = new Http();
       HttpRequest req = new HttpRequest();
     
        Dom.Document doc = new Dom.Document();
        List<dom.XmlNode> nodelist = new List<dom.XmlNode>();
        
         doc.load(Constants.CreateCustomerXMLTemplate);
         nodelist =  doc.getRootElement().getChildElements();
         
         //system.debug('nodelist ****'+nodelist);
         
         for (dom.XmlNode node : nodelist)
         {	
              //system.debug('*node***'+node);
         	if(node.getName() == 'operation')
        	{
         		List<dom.XmlNode> childnodelist =  node.getChildElements();
         		for(dom.XmlNode childnode : childnodelist)
         		{
           			//system.debug('*childnode***'+childnode); 
           			if(childnode.getName()=='content')
           			{
            			List<dom.XmlNode> nextchildnodelist =  childnode.getChildElements();
            			for(dom.Xmlnode nextchild: nextchildnodelist)
            			{
            				//system.debug('*nextchild***'+nextchild);
            				if(nextchild.getName()=='function') 
            				{
	             				List<dom.XmlNode> next2childnodelist =  nextchild.getChildElements();
	             				for(dom.Xmlnode next2child: next2childnodelist)
	             				{
	              					//system.debug('*next2child***'+next2child);
	              					if(next2child.getName()=='create_contact')           
						            {  
						            	List<dom.XmlNode> next3childnodelist =  next2child.getChildElements();
						              	for(dom.Xmlnode next3child: next3childnodelist)
						              	{  
						                	//system.debug('*next3child***'+next3child);
						                	String objFieldName = Constants.IntAcctXMLNode2SObjField.get(next3child.getName());
                    						//system.debug('*objFieldName***'+objFieldName); 
                    						
                    						if (next3child.getName() == 'contactname' && objFieldName != null && objFieldName != '')
                    						{
						                        //if (acc.get(objFieldName)!= null)
						                        //{                          
						                           // String textval = (String)acc.get(objFieldName);
						                            String textval = 'Saroj Tripathy';
						                            next3child.addTextNode(textval);                              
						                        //}
						                       /* else
						                        {
						                            errorCounter = errorCounter+1;
						                            appErrorMsg = appErrorMsg +  objFieldName + ' cannot be blank;';
						                        }*/
						                    
						                    }
                    						
						              	}
						            }
	             				}
            				}
            			}
           			}
         		}
        	}
         }
         
        string xmlData = doc.toXmlString();
        system.debug('*****xmlData*******'+xmlData);
	}
}