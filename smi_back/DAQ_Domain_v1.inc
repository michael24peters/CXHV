class: ASS_DAQ_Domain_v1_CLASS/associated
!panel: DAQ_Domain_v1.pnl
    state: NOT_READY
    !color: FwStateAttention1
        action: Configure(int PART_ID = 0, string RUN_TYPE = "PHYSICS", int N_STEPS = 0, string RUN_INFO_DP = "")	!visible: 1
        action: Load(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Unload	!visible: 1
        action: Reset	!visible: 1
        action: Stop	!visible: 0
    state: UNKNOWN
    !color: FwStateAttention2
        action: Reset	!visible: 1
    state: CONFIGURING
    !color: FwStateAttention1
        action: FAKE_READY	!visible: 1
        action: Reset	!visible: 1
    state: READY
    !color: FwStateOKNotPhysics
        action: Start(int RUN_NUMBER = 0)	!visible: 1
        action: Reset	!visible: 1
    state: RUNNING
    !color: FwStateOKPhysics
        action: Stop	!visible: 1
        action: Reset	!visible: 1
        action: Step(int STEP_NR = 0, string RUN_TYPE = "")	!visible: 1
    state: ERROR
    !color: FwStateAttention3
        action: Recover	!visible: 1
        action: Reset	!visible: 1
