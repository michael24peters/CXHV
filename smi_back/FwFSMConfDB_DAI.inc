class: ASS_FwFSMConfDB_DAI_CLASS/associated
!panel: FwFSMConfDB|FwFSMConfDB_DAI.pnl
    state: NOT_READY
    !color: FwStateAttention1
        action: LOAD(string sMode = "PHYSICS")	!visible: 1
        action: Switch_ON	!visible: 0
        action: Switch_OFF	!visible: 0
        action: Do_Emergency_OFF	!visible: 0
        action: APPLY_RECIPE(string sMode = "PHYSICS")	!visible: 0
    state: OFF
    !color: FwStateOKNotPhysics
        action: Switch_ON	!visible: 0
        action: APPLY_RECIPE(string sMode = "PHYSICS")	!visible: 0
        action: LOAD(string sMode = "PHYSICS")	!visible: 0
        action: UNLOAD	!visible: 1
        action: Do_Emergency_OFF	!visible: 0
    state: READY
    !color: FwStateOKPhysics
        action: APPLY_RECIPE(string sMode = "PHYSICS")	!visible: 0
        action: Switch_OFF	!visible: 0
        action: Switch_ON	!visible: 0
        action: UNLOAD	!visible: 1
        action: LOAD(string sMode = "PHYSICS")	!visible: 0
        action: Do_Emergency_OFF	!visible: 0
    state: ERROR
    !color: FwStateAttention3
        action: RECOVER	!visible: 1
        action: Do_Emergency_OFF	!visible: 0
    state: EMERGENCY_OFF
    !color: FwStateAttention3
        action: Clear_Emergency	!visible: 1
