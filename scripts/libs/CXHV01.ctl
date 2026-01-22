#uses "CXHV01$FwCaenChannelDefault$install"
#uses "CXHV01$FwFSMConfDB_HV$install"
#uses "CXHV01$FwDevMode$install"

startDomainDevices_CXHV01()
{
	fwFsm_startDomainDevicesNew("CXHV01");
}
