#uses "CODEXB_HV_ALT$FwCaenChannelA1580Default$install"
#uses "CODEXB_HV_ALT$FwCaenChannelDefault$install"
#uses "CODEXB_HV_ALT$FwDevMode$install"
#uses "CODEXB_HV_ALT$FwFSMConfDB_HV$install"

startDomainDevices_CODEXB_HV_ALT()
{
	fwFsm_startDomainDevicesNew("CODEXB_HV_ALT");
}
