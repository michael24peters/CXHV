FwCaenChannelA1580Default_initialize(string domain, string device)
{
}

FwCaenChannelA1580Default_valueChanged( string domain, string device,
      int actual_dot_status, string &fwState )
{
	float v0;  
	bool onOff; 
	string v0_READY;  
	string v0_SB2;  
	string v0_SB1; 
	string mode;  
	string configurator; 
 	string obj; 
	string state;  
	 
	fwCU_getDevName(domain, device, obj);  
	 
	fwDU_getState(domain, device, state);  
//DebugTN(domain, device, actual_dot_status);
	  
	if (state == "EMERGENCY_OFF")  
	{  
		fwState = "";  
	} 
	//OFF  
      else 
	if (actual_dot_status == 0)  
	{  
		fwState = "OFF";  
	}  
	//ON  
	else  
	if (actual_dot_status == 1)   
	{   
		dpGet(device+".settings.v0",v0);   
  
		configurator = fwFSMConfDB_getDomainConfigurator(domain); 
		mode = fwFSMConfDB_getCurrentMode(configurator); 
		lbFSMConfDB_GetValueFromRecipe(domain, obj, "settings.v0", mode, "Go_READY", v0_READY); 
		lbFSMConfDB_GetValueFromRecipe(domain, obj, "settings.v0", mode, "Go_STANDBY2", v0_SB2); 
		lbFSMConfDB_GetValueFromRecipe(domain, obj, "settings.v0", mode, "Go_STANDBY1", v0_SB1); 
//DebugTN(domain, device, actual_dot_status, v0);
  
   if (v0 == 0)
   {
//     delay(5);
  		dpGet(device+".settings.onOff",onOff);    
//DebugTN("ON onoff", domain, device, actual_dot_status, onOff);
		 if (!onOff)
       fwState = "OFF";
     else
       fwState = "ERROR";
   }
		else if (v0 == v0_READY)    
		{  
			fwState = "READY";    
		}  
		else if (v0 == v0_SB2)    
		{   
			fwState = "STANDBY2";    
		}   
		else if (v0 == v0_SB1)    
		{   
			fwState = "STANDBY1";    
		}   
		else     
		{    
			fwState = "ERROR";    
		}    
	}   
	//RAMPING UP  
	else if (getBit(actual_dot_status, 1))   
	{     
		dpGet(device+".settings.onOff",onOff);    
//DebugTN("up onoff", domain, device, actual_dot_status, onOff);
		if (onOff)    
		{   
			dpGet(device+".settings.v0",v0);    
//DebugTN("up onoff", domain, device, actual_dot_status, onOff, v0);
  
			configurator = fwFSMConfDB_getDomainConfigurator(domain); 
			mode = fwFSMConfDB_getCurrentMode(configurator); 
			lbFSMConfDB_GetValueFromRecipe(domain, obj, "settings.v0", mode, "Go_READY", v0_READY); 
			lbFSMConfDB_GetValueFromRecipe(domain, obj, "settings.v0", mode, "Go_STANDBY2", v0_SB2); 
			lbFSMConfDB_GetValueFromRecipe(domain, obj, "settings.v0", mode, "Go_STANDBY1", v0_SB1); 
  
			if (v0 == v0_READY)    
			{   
				fwState = "RAMPING_READY";    
			}   
			else if (v0 == v0_SB2)    
			{   
				fwState = "RAMPING_STANDBY2";     
			}   
			else if (v0 == v0_SB1)    
			{   
				fwState = "RAMPING_STANDBY1";    
			}   
			else     
			{    
				fwState = "ERROR";    
			}    
		}   
		else   
		{   
			fwState = "RAMPING_OFF";    
		}   
	}     
	//RAMPING DOWN  
	else if (getBit(actual_dot_status, 2))    
	{      
		dpGet(device+".settings.onOff",onOff);     
//DebugTN("down onoff", domain, device, actual_dot_status, onOff);
		if (onOff)     
		{    
			dpGet(device+".settings.v0",v0);     
//DebugTN("down onoff", domain, device, actual_dot_status, onOff, v0);

			configurator = fwFSMConfDB_getDomainConfigurator(domain); 
			mode = fwFSMConfDB_getCurrentMode(configurator); 
			lbFSMConfDB_GetValueFromRecipe(domain, obj, "settings.v0", mode, "Go_READY", v0_READY); 
			lbFSMConfDB_GetValueFromRecipe(domain, obj, "settings.v0", mode, "Go_STANDBY2", v0_SB2); 
			lbFSMConfDB_GetValueFromRecipe(domain, obj, "settings.v0", mode, "Go_STANDBY1", v0_SB1); 
  
			if (v0 == v0_READY)     
			{    
				fwState = "RAMPING_READY";     
			}    
			else if (v0 == v0_SB2)     
			{    
				fwState = "RAMPING_STANDBY2";      
			}    
			else if (v0 == v0_SB1)     
			{    
				fwState = "RAMPING_STANDBY1";     
			}    
			else      
			{     
				fwState = "ERROR";     
			}     
		}    
		else    
		{    
			fwState = "RAMPING_OFF";     
		}    
	}      
	//ERROR  
	else   
	{   
//DebugTN("error", domain, device, actual_dot_status);
		fwState = "ERROR";   
	} 
}
FwCaenChannelA1580Default_doCommand(string domain, string device, string command)
{ 
string runType; 

	if (command == "Do_Emergency_OFF")   
	{   
		fwDU_setState(domain, device, "EMERGENCY_OFF");    
		dpSet(device+".settings.onOff",0,device+".settings.v0",0);    
	}   
	else if (command == "Clear_Emergency")   
	{   
		fwDU_setState(domain, device, "OFF");  
		dpSet(device+".settings.onOff",0,device+".settings.v0",0);    
	} 	  
	else if (command == "RECOVER")  
	{  
		dpSet(device+".settings.onOff",1,device+".settings.v0",0);  
		dpSet(device+".settings.onOff",0,device+".settings.v0",0);  
	}  
	else if (command == "Go_OFF")   
	{   
		dpSet(device+".settings.onOff",0,device+".settings.v0",0);   
	}   
	else 
	{ 
    float old_v0, v0;
    int status;
  
    fwDU_getCommandParameter(domain, device, "RUN_TYPE", runType);  
  
    dpGet(device+".settings.v0",old_v0);   
    fwFSMConfDB_ApplyRecipeFromCache(domain, device, command, runType);  
    dpGet(device+".settings.v0",v0);   
//DebugTN("Old",domain, device, runType, command, old_v0, v0);
    if(old_v0 == v0)
    {
      dpGet(device+".actual.status",status);   
      dpSet(device+".actual.status",status);
    }
  }
}

