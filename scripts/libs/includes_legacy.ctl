// # includes_legacy.ctl #

// This is a 'fallback' library containing appropriate #uses statements for
// component main libraries which follows the JCOP naming naming convention.
// The aim of this library is to provide a 'safety-net' solution, after
// deprecating the policy of loading all libraries through config file entries
// in JCOP Framework. Please consult JCOPFramework-releaseNotes.txt for detailed
// information.

//=================================================================================

// * Usage *
// Open the project config file and locate the [ui] and [ctrl] sections in it.
// Add the following entry to both listed sections, to include all of
// the libraries, that previously were loaded by default by UI and CTRL managers
// as they had their own config file entries:
// LoadCtrlLibs = "includes_legacy.ctl"

//=================================================================================

// * Deprecation notice *
// Use of this file is considered deprecated. It should be used only in emergency
// cases, eg. dependency-resolution problems in a production system.
// * Adding library-loading statement to the config file is STRONGLY DISCOURAGED
// by the JCOP CB. *

//=================================================================================

// Please note that the content of this file is automatically recreated after
// each installation/reinstallation/removal of components' set by Installation
// Tool. This file should not be edited manually, as any custom entries are not
// preserved during file recreation.
// When none of the installed components provides a main library that follows
// the JCOP naming convention, the file is either removed (if prevoiously existed)
// or not created. If file is removed while entries, which load it, exist in the
// config file, they should be removed manually to avoid 'library could not be
// found' warning being displayed to the log at the moment, when each UI or CTRL
// manager starts.

//=================================================================================

#uses "fwAccessControl/fwAccessControl.ctc"
#uses "fwCaen/fwCaen.ctl"
#uses "fwConfigurationDB/fwConfigurationDB.ctl"
#uses "fwDeviceEditorNavigator/fwDeviceEditorNavigator.ctl"
#uses "fwFSM/fwFsm.ctl"
#uses "fwFSMConfDB/fwFsmConfDB.ctl"
#uses "fwTrending/fwTrending.ctl"
#uses "fwXML/fwXML.ctl"

private global int INCLUDES_LEGACY_WARNING =
    throwError(makeError("fwInstallation",PRIO_WARNING, ERR_CONTROL, 1,
                         "Use of includes_legacy.ctl file is deprecated. " +
                         "Please include components directly."));

