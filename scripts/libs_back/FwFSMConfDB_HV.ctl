FwFSMConfDB_HV_initialize(string domain, string device) 
{   
  
 fwFSMConfDB_DUTinitialize(domain, device);  
 
} 


FwFSMConfDB_HV_valueChanged( string domain, string device, 
      int status, string &fwState ) 
{  
      if(status == 10) 
      { 
            fwState = "OFF"; 
      }
      else if(status == 11)  
      {  
            fwState = "STANDBY1";  
      } 
      else if(status == 12)  
      {  
            fwState = "STANDBY2";  
      } 
      else if(status == 13)   
      {   
            fwState = "EMERGENCY_OFF";   
      }  
      else 
      { 
            fwFSMConfDB_DUTvalueChanged(domain,device, 
                status, fwState); 
	} 
} 

FwFSMConfDB_HV_doCommand(string domain, string device, string command) 
{ 
 
    if(command == "Go_OFF") 
    { 
        dpSet(device + ".status", 10);      
    } 
    else if(command == "Go_STANDBY1") 
    { 
        dpSet(device + ".status", 11);     
    } 
    else if(command == "Go_STANDBY2")  
    {  
        dpSet(device + ".status", 12);      
    }  
    else if(command == "Go_READY")  
    {  
        dpSet(device + ".status", 1);      
    }  
    else if(command == "Go_Emergency_OFF") 
    { 
        dpSet(device + ".status", 13); 
    } 
    else if(command == "Do_Emergency_OFF") 
    { 
        dpSet(device + ".status", 13); 
    } 
    else if(command == "Clear_Emergency") 
    {   
        dpSet(device + ".status", 0);     
    }   
    else
        fwFSMConfDB_DUTdoCommand(domain, device, command);  
} 

