class: ASS_HV_Domain_v1_CLASS/associated
!panel: HV_Domain_v1.pnl
    state: NOT_READY
    !color: FwStateAttention1
        action: Go_OFF	!visible: 1
        action: Go_STANDBY1(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_STANDBY2(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_READY(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Do_Emergency_OFF	!visible: 1
        action: Load(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Reset	!visible: 1
    state: OFF
    !color: FwStateOKNotPhysics
        action: Go_STANDBY1(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_STANDBY2(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_READY(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Do_Emergency_OFF	!visible: 1
        action: Reset	!visible: 1
    state: RAMPING_STANDBY1
    !color: FwStateAttention2
        action: Do_Emergency_OFF	!visible: 1
        action: Go_OFF	!visible: 1
        action: Go_STANDBY1(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_STANDBY2(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_READY(string RUN_TYPE = "PHYSICS")	!visible: 1
    state: STANDBY1
    !color: FwStateOKNotPhysics
        action: Go_STANDBY2(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_READY(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_OFF	!visible: 1
        action: Reset	!visible: 1
        action: Do_Emergency_OFF	!visible: 1
        action: Go_STANDBY1(string RUN_TYPE = "PHYSICS")	!visible: 1
    state: RAMPING_STANDBY2
    !color: FwStateAttention2
        action: Do_Emergency_OFF	!visible: 1
        action: Go_OFF	!visible: 1
        action: Go_STANDBY1(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_STANDBY2(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_READY(string RUN_TYPE = "PHYSICS")	!visible: 1
    state: STANDBY2
    !color: FwStateOKNotPhysics
        action: Go_READY(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_STANDBY1(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_OFF	!visible: 1
        action: Do_Emergency_OFF	!visible: 1
        action: Reset	!visible: 1
        action: Go_STANDBY2(string RUN_TYPE = "PHYSICS")	!visible: 1
    state: RAMPING_READY
    !color: FwStateAttention2
        action: Do_Emergency_OFF	!visible: 1
        action: FAKE_READY	!visible: 1
        action: Go_OFF	!visible: 1
        action: Go_STANDBY1(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_STANDBY2(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_READY(string RUN_TYPE = "PHYSICS")	!visible: 1
    state: READY
    !color: FwStateOKPhysics
        action: Go_STANDBY2(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_STANDBY1(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_OFF	!visible: 1
        action: Do_Emergency_OFF	!visible: 1
        action: Reset	!visible: 1
        action: Step(int STEP_NR = 0, string RUN_TYPE = "")	!visible: 1
        action: Go_READY(string RUN_TYPE = "PHYSICS")	!visible: 1
    state: RAMPING_OFF
    !color: FwStateAttention2
        action: Do_Emergency_OFF	!visible: 1
        action: Go_OFF	!visible: 1
        action: Go_STANDBY1(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_STANDBY2(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_READY(string RUN_TYPE = "PHYSICS")	!visible: 1
    state: ERROR
    !color: FwStateAttention3
        action: RECOVER	!visible: 1
        action: Do_Emergency_OFF	!visible: 1
    state: EMERGENCY_OFF
    !color: FwStateAttention3
        action: Clear_Emergency	!visible: 1
