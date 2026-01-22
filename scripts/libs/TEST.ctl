#uses "TEST$FwCaenChannelDefault$install"
#uses "TEST$FwFSMConfDB_HV$install"
#uses "TEST$FwDevMode$install"

startDomainDevices_TEST()
{
	fwFsm_startDomainDevicesNew("TEST");
}
