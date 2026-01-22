class: ASS_DAI_Domain_v1_CLASS/associated
!panel: DAI_Domain_v1.pnl
    state: NOT_READY
    !color: FwStateAttention1
        action: Switch_ON(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Switch_OFF	!visible: 1
        action: Do_Emergency_OFF	!visible: 0
        action: Load(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Reset	!visible: 1
    state: READY
    !color: FwStateOKPhysics
        action: Switch_OFF	!visible: 1
        action: Do_Emergency_OFF	!visible: 0
        action: Reset	!visible: 1
    state: OFF
    !color: FwStateOKNotPhysics
        action: Switch_ON(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Do_Emergency_OFF	!visible: 0
        action: Reset	!visible: 1
    state: ERROR
    !color: FwStateAttention3
        action: Recover	!visible: 1
        action: Do_Emergency_OFF	!visible: 0
    state: EMERGENCY_OFF
    !color: FwStateAttention3
        action: Clear_Emergency	!visible: 2
