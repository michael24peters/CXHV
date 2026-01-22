#uses "fwFSM/fwDevMajorityDU.ctl"

FwDevMajority_initialize(string domain, string device)
{
  fwDevMajorityDU_initialize(domain, device);
}
FwDevMajority_valueChanged( string domain, string device,
      dyn_string bad_devices, string &fwState )
{
  fwDevMajorityDU_valueChanged( domain, device, bad_devices, fwState );
}


FwDevMajority_doCommand(string domain, string device, string command)
{
  fwDevMajorityDU_doCommand(domain, device, command);
}

