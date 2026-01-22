FwFSMConfDB_DAQ_initialize(string domain, string device) 
{   
  
 fwFSMConfDB_DUTinitialize(domain, device);  
 
} 


FwFSMConfDB_DAQ_valueChanged( string domain, string device, 
      int status, string &fwState ) 
{  
      if(status == 10) 
      { 
            fwState = "RUNNING"; 
      }
      else 
      { 
            fwFSMConfDB_DUTvalueChanged(domain,device, 
                status, fwState); 
	} 
} 

FwFSMConfDB_DAQ_doCommand(string domain, string device, string command) 
{ 
 
    if(command == "Configure") 
    { 
        dpSet(device + ".status", 1);      
    } 
    else if(command == "Start") 
    { 
        dpSet(device + ".status", 10);     
    } 
    else if(command == "Stop")  
    {  
        dpSet(device + ".status", 1);       
    }  
    else
    {
        if(command == "UNLOAD")
        {
          if(isFunctionDefined("fwHw_clearCurrentRecipe"))
            fwHw_clearCurrentRecipe();
        }
        fwFSMConfDB_DUTdoCommand(domain, device, command);
    }
} 

