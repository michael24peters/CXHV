class: ASS_SAFETY_Domain_CLASS/associated
!panel: SAFETY_Domain.pnl
    state: NOT_READY
    !color: FwStateAttention1
        action: Do_Emergency_OFF	!visible: 0
        action: Reset	!visible: 1
    state: READY
    !color: FwStateOKPhysics
        action: Do_Emergency_OFF	!visible: 0
        action: Reset	!visible: 1
    state: ERROR
    !color: FwStateAttention3
        action: Recover	!visible: 1
        action: Do_Emergency_OFF	!visible: 0
    state: EMERGENCY_OFF
    !color: FwStateAttention3
        action: Clear_Emergency	!visible: 2
