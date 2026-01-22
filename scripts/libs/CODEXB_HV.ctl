#uses "CODEXB_HV$FwCaenChannelA1580Default$install"
#uses "CODEXB_HV$FwFSMConfDB_HV$install"
#uses "CODEXB_HV$FwDevMode$install"

startDomainDevices_CODEXB_HV()
{
	fwFsm_startDomainDevicesNew("CODEXB_HV");
}
