FwCaenCrateSY1527Default_initialize(string domain, string device)
{
}

FwCaenCrateSY1527Default_valueChanged( string domain, string device,
      int FrontPanOutP_dot_FrontPanOut, string &fwState )
{
	if (
	(getBit(FrontPanOutP_dot_FrontPanOut, 0)) ||
	(getBit(FrontPanOutP_dot_FrontPanOut, 1)) ||
	(getBit(FrontPanOutP_dot_FrontPanOut, 2)) ||
	(getBit(FrontPanOutP_dot_FrontPanOut, 8)) ||
	(getBit(FrontPanOutP_dot_FrontPanOut, 9)) )
	{
		fwState = "ERROR";
	}
	else if (getBit(FrontPanOutP_dot_FrontPanOut, 3))
	{
		fwState = "READY";
	}
	else 
	{
		fwState = "OFF";
	}
}


FwCaenCrateSY1527Default_doCommand(string domain, string device, string command)
{
	if (command == "Go_OFF")
	{
		dpSet(device+".Commands.Kill",1);
		fwDU_startTimeout(30, domain, device, "ERROR");  
	}
	if (command == "RECOVER")  
	{  
		bool chon; 
		dpGet(device+".FrontPanOutP.CHON",chon); 
		if (chon) 
		{ 
			dpSet(device+".Commands.Kill",1);
			fwDU_startTimeout(30, domain, device, "ERROR");
		} 
		else 
		{ 
			fwDU_startTimeout(0, domain, device, "ERROR"); 
		} 
	}
}
 
