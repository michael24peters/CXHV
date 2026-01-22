class: ASS_FwFSMConfDB_DAQ_CLASS/associated
!panel: FwFSMConfDB|FwFSMConfDB_DAQ.pnl
    state: NOT_READY
    !color: FwStateAttention1
        action: LOAD(string sMode = "PHYSICS")	!visible: 1
        action: Configure	!visible: 0
        action: APPLY_RECIPE(string sMode = "PHYSICS")	!visible: 0
    state: READY
    !color: FwStateOKPhysics
        action: UNLOAD	!visible: 1
        action: Start	!visible: 0
        action: LOAD(string sMode = "PHYSICS")	!visible: 0
        action: APPLY_RECIPE(string sMode = "PHYSICS")	!visible: 0
    state: RUNNING
    !color: FwStateOKPhysics
        action: UNLOAD	!visible: 1
        action: Stop	!visible: 0
        action: LOAD(string sMode = "PHYSICS")	!visible: 0
    state: ERROR
    !color: FwStateAttention3
        action: RECOVER	!visible: 1
