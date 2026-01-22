FwFSMConfDB_DAI_initialize(string domain, string device) 
{   
 
  fwFSMConfDB_DUTinitialize(domain, device);  
 
} 


FwFSMConfDB_DAI_valueChanged( string domain, string device, 
      int status, string &fwState ) 
{  
      if(status == 10) 
      { 
            fwState = "OFF"; 
      }
      if(status == 11)  
      {  
            fwState = "EMERGENCY_OFF";  
      } 
      else 
      { 
            fwFSMConfDB_DUTvalueChanged(domain,device, 
                status, fwState); 
	} 
} 

FwFSMConfDB_DAI_doCommand(string domain, string device, string command) 
{ 
 
    if(command == "Switch_ON") 
    { 
        dpSet(device + ".status", 1);      
    } 
    else if(command == "Switch_OFF") 
    { 
        dpSet(device + ".status", 10);     
    } 
    else if(command == "Do_Emergency_OFF")  
    {  
        dpSet(device + ".status", 11);      
    }  
    else if(command == "Clear_Emergency")   
    {   
        dpSet(device + ".status", 0);       
    }   
    else
        fwFSMConfDB_DUTdoCommand(domain, device, command);  
} 

