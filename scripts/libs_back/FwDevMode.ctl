#uses "fwFSM/fwDevModeDU.ctl"

FwDevMode_initialize(string domain, string device)
{
  fwDevModeDU_initialize(domain, device);
}

FwDevMode_valueChanged( string domain, string device,
      dyn_string disabled, string &fwState )
{
  fwDevModeDU_valueChanged( domain, device, disabled, fwState );
}



FwDevMode_doCommand(string domain, string device, string command)
{
  fwDevModeDU_doCommand(domain, device, command);
}


