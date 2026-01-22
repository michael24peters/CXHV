class: ASS_FwFSMConfDBDUT_CLASS/associated
!panel: FwFSMConfDB|FwFSMConfDBDUT.pnl
    state: NOT_READY
    !color: FwStateOKNotPhysics
        action: LOAD(string sMode = "PHYSICS")	!visible: 1
    state: READY
    !color: FwStateOKPhysics
        action: APPLY_RECIPE	!visible: 0
        action: LOAD(string sMode = "PHYSICS")	!visible: 1
        action: UNLOAD	!visible: 1
    state: ERROR
    !color: FwStateAttention3
        action: RECOVER	!visible: 1
