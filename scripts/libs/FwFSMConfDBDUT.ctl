#uses "fwFSMConfDB/fwFsmConfDB.ctl"
FwFSMConfDBDUT_initialize(string domain, string device) 
{     
 fwFSMConfDB_DUTinitialize(domain, device);    
} 


FwFSMConfDBDUT_valueChanged( string domain, string device, 
      int status, string &fwState ) 
{
fwFSMConfDB_DUTvalueChanged(domain, device, status, fwState);
} 

FwFSMConfDBDUT_doCommand(string domain, string device, string command)  
{   
 fwFSMConfDB_DUTdoCommand(domain, device, command);  
}  
 

