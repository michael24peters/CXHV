class: ASS_FwFSMConfDB_HV_CLASS/associated
!panel: FwFSMConfDB|FwFSMConfDB_HV.pnl
    state: NOT_READY
    !color: FwStateAttention1
        action: LOAD(string sMode = "PHYSICS")	!visible: 1
        action: Go_STANDBY1	!visible: 0
        action: Go_STANDBY2	!visible: 0
        action: Go_OFF	!visible: 0
        action: Go_READY	!visible: 0
        action: Go_Emergency_OFF	!visible: 0
        action: APPLY_RECIPE(string sMode = "PHYSICS")	!visible: 0
        action: Do_Emergency_OFF	!visible: 0
    state: OFF
    !color: FwStateOKNotPhysics
        action: LOAD(string sMode = "PHYSICS")	!visible: 0
        action: Go_STANDBY1	!visible: 0
        action: Go_STANDBY2	!visible: 0
        action: Go_READY	!visible: 0
        action: UNLOAD	!visible: 1
        action: Go_Emergency_OFF	!visible: 0
        action: APPLY_RECIPE(string sMode = "PHYSICS")	!visible: 0
        action: Go_OFF	!visible: 0
        action: Do_Emergency_OFF	!visible: 0
    state: STANDBY1
    !color: FwStateOKNotPhysics
        action: LOAD(string sMode = "PHYSICS")	!visible: 0
        action: Go_OFF	!visible: 0
        action: Go_STANDBY2	!visible: 0
        action: Go_READY	!visible: 0
        action: UNLOAD	!visible: 1
        action: Go_Emergency_OFF	!visible: 0
        action: APPLY_RECIPE(string sMode = "PHYSICS")	!visible: 0
        action: Go_STANDBY1	!visible: 0
        action: Do_Emergency_OFF	!visible: 0
    state: STANDBY2
    !color: FwStateOKNotPhysics
        action: LOAD(string sMode = "PHYSICS")	!visible: 0
        action: Go_OFF	!visible: 0
        action: Go_STANDBY1	!visible: 0
        action: Go_READY	!visible: 0
        action: UNLOAD	!visible: 1
        action: Go_Emergency_OFF	!visible: 0
        action: APPLY_RECIPE(string sMode = "PHYSICS")	!visible: 0
        action: Go_STANDBY2	!visible: 0
        action: Do_Emergency_OFF	!visible: 0
    state: READY
    !color: FwStateOKPhysics
        action: APPLY_RECIPE(string sMode = "PHYSICS")	!visible: 0
        action: Go_OFF	!visible: 0
        action: Go_STANDBY1	!visible: 0
        action: Go_STANDBY2	!visible: 0
        action: UNLOAD	!visible: 1
        action: LOAD(string sMode = "PHYSICS")	!visible: 0
        action: Go_Emergency_OFF	!visible: 0
        action: Go_READY	!visible: 0
        action: Do_Emergency_OFF	!visible: 0
    state: ERROR
    !color: FwStateAttention3
        action: RECOVER	!visible: 1
        action: Do_Emergency_OFF	!visible: 1
    state: EMERGENCY_OFF
    !color: FwStateAttention3
        action: Clear_Emergency	!visible: 1
