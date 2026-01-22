class: TOP_HV_Domain_v1_CLASS
!panel: HV_Domain_v1.pnl
    state: NOT_READY
    !color: FwStateAttention1
        when ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES in_state {ERROR,EMERGENCY_OFF} )  move_to ERROR
        when ( all_in FWCAENCHANNELDEFAULT_FWSETSTATES in_state {RAMPING_STANDBY1,STANDBY1} )  move_to RAMPING_STANDBY1
        when ( all_in FWCAENCHANNELDEFAULT_FWSETSTATES in_state {RAMPING_STANDBY2,STANDBY2} )  move_to RAMPING_STANDBY2
        when ( all_in FWCAENCHANNELDEFAULT_FWSETSTATES in_state {RAMPING_READY,READY} )  move_to RAMPING_READY
        when ( all_in FWCAENCHANNELDEFAULT_FWSETSTATES in_state {RAMPING_OFF,OFF} )  move_to RAMPING_OFF
        action: Go_OFF	!visible: 1
            do Go_OFF all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_OFF, OFF} ) then
                move_to NOT_READY
            endif
            move_to RAMPING_OFF
        action: Go_STANDBY1(string RUN_TYPE = "PHYSICS")	!visible: 1
            do Go_STANDBY1(RUN_TYPE=RUN_TYPE) all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_STANDBY1, STANDBY1} ) then
                move_to NOT_READY
            endif
            move_to RAMPING_STANDBY1
        action: Go_STANDBY2(string RUN_TYPE = "PHYSICS")	!visible: 1
            do Go_STANDBY2(RUN_TYPE=RUN_TYPE) all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_STANDBY2, STANDBY2} ) then
                move_to NOT_READY
            endif
            move_to RAMPING_STANDBY2
        action: Go_READY(string RUN_TYPE = "PHYSICS")	!visible: 1
            do Go_READY(RUN_TYPE=RUN_TYPE) all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_READY, READY} )  then
                    move_to NOT_READY
            endif
            move_to RAMPING_READY
        action: Do_Emergency_OFF	!visible: 1
            do Do_Emergency_OFF all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state EMERGENCY_OFF )  then
              move_to ERROR
            endif
            move_to EMERGENCY_OFF
        action: Load(string RUN_TYPE = "PHYSICS")	!visible: 1
            do Reset all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            do LOAD(RUN_TYPE=RUN_TYPE,sMode=RUN_TYPE) all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            move_to NOT_READY
        action: Reset	!visible: 1
            do Reset all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            move_to NOT_READY
    state: OFF
    !color: FwStateOKNotPhysics
        when ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES in_state {ERROR,EMERGENCY_OFF} )  move_to ERROR
        when ( all_in FWCAENCHANNELDEFAULT_FWSETSTATES in_state {RAMPING_STANDBY1,STANDBY1} )  move_to RAMPING_STANDBY1
        when ( all_in FWCAENCHANNELDEFAULT_FWSETSTATES in_state {RAMPING_STANDBY2,STANDBY2} )  move_to RAMPING_STANDBY2
        when ( all_in FWCAENCHANNELDEFAULT_FWSETSTATES in_state {RAMPING_READY,READY} )  move_to RAMPING_READY
        when ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state OFF )  move_to NOT_READY
        action: Go_STANDBY1(string RUN_TYPE = "PHYSICS")	!visible: 1
            do Go_STANDBY1(RUN_TYPE=RUN_TYPE) all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_STANDBY1, STANDBY1} ) then
                move_to NOT_READY
            endif
            move_to RAMPING_STANDBY1
        action: Go_STANDBY2(string RUN_TYPE = "PHYSICS")	!visible: 1
            do Go_STANDBY2(RUN_TYPE=RUN_TYPE) all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_STANDBY2, STANDBY2} ) then
                move_to NOT_READY
            endif
            move_to RAMPING_STANDBY2
        action: Go_READY(string RUN_TYPE = "PHYSICS")	!visible: 1
            do Go_READY(RUN_TYPE=RUN_TYPE) all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_READY, READY} )  then
                    move_to NOT_READY
            endif
            move_to RAMPING_READY
        action: Do_Emergency_OFF	!visible: 1
            do Do_Emergency_OFF all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state EMERGENCY_OFF )  then
              move_to ERROR
            endif
            move_to EMERGENCY_OFF
        action: Reset	!visible: 1
            do Reset all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            move_to NOT_READY
    state: RAMPING_STANDBY1
    !color: FwStateAttention2
        when ( all_in FWCAENCHANNELDEFAULT_FWSETSTATES in_state STANDBY1 )  move_to STANDBY1
        when ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_STANDBY1,STANDBY1} )  move_to NOT_READY
        action: Do_Emergency_OFF	!visible: 1
            do Do_Emergency_OFF all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state EMERGENCY_OFF )  then
              move_to ERROR
            endif
            move_to EMERGENCY_OFF
        action: Go_OFF	!visible: 1
            do Go_OFF all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_OFF, OFF} ) then
                move_to NOT_READY
            endif
            move_to RAMPING_OFF
        action: Go_STANDBY1(string RUN_TYPE = "PHYSICS")	!visible: 1
            do Go_STANDBY1(RUN_TYPE=RUN_TYPE) all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_STANDBY1, STANDBY1} ) then
                move_to NOT_READY
            endif
            move_to RAMPING_STANDBY1
        action: Go_STANDBY2(string RUN_TYPE = "PHYSICS")	!visible: 1
            do Go_STANDBY2(RUN_TYPE=RUN_TYPE) all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_STANDBY2, STANDBY2} ) then
                move_to NOT_READY
            endif
            move_to RAMPING_STANDBY2
        action: Go_READY(string RUN_TYPE = "PHYSICS")	!visible: 1
            do Go_READY(RUN_TYPE=RUN_TYPE) all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_READY, READY} )  then
                    move_to NOT_READY
            endif
            move_to RAMPING_READY
    state: STANDBY1
    !color: FwStateOKNotPhysics
        when ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES in_state {ERROR,EMERGENCY_OFF} )  move_to ERROR
        when ( all_in FWCAENCHANNELDEFAULT_FWSETSTATES in_state {RAMPING_OFF,OFF} )  move_to RAMPING_OFF
        when ( all_in FWCAENCHANNELDEFAULT_FWSETSTATES in_state {RAMPING_STANDBY2,STANDBY2} )  move_to RAMPING_STANDBY2
        when ( all_in FWCAENCHANNELDEFAULT_FWSETSTATES in_state {RAMPING_READY,READY} )  move_to RAMPING_READY
        when ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state STANDBY1 )  move_to NOT_READY
        action: Go_STANDBY2(string RUN_TYPE = "PHYSICS")	!visible: 1
            do Go_STANDBY2(RUN_TYPE=RUN_TYPE) all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_STANDBY2, STANDBY2} ) then
                move_to NOT_READY
            endif
            move_to RAMPING_STANDBY2
        action: Go_READY(string RUN_TYPE = "PHYSICS")	!visible: 1
            do Go_READY(RUN_TYPE=RUN_TYPE) all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_READY, READY} )  then
                    move_to NOT_READY
            endif
            move_to RAMPING_READY
        action: Go_OFF	!visible: 1
            do Go_OFF all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_OFF, OFF} ) then
                move_to NOT_READY
            endif
            move_to RAMPING_OFF
        action: Reset	!visible: 1
            do Reset all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            move_to NOT_READY
        action: Do_Emergency_OFF	!visible: 1
            do Do_Emergency_OFF all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state EMERGENCY_OFF )  then
              move_to ERROR
            endif
            move_to EMERGENCY_OFF
        action: Go_STANDBY1(string RUN_TYPE = "PHYSICS")	!visible: 1
            do Go_STANDBY1(RUN_TYPE=RUN_TYPE) all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_STANDBY1, STANDBY1} ) then
                move_to NOT_READY
            endif
            move_to RAMPING_STANDBY1
    state: RAMPING_STANDBY2
    !color: FwStateAttention2
        when ( all_in FWCAENCHANNELDEFAULT_FWSETSTATES in_state STANDBY2 )  move_to STANDBY2
        when ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_STANDBY2,STANDBY2} )  move_to NOT_READY
        action: Do_Emergency_OFF	!visible: 1
            do Do_Emergency_OFF all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state EMERGENCY_OFF )  then
              move_to ERROR
            endif
            move_to EMERGENCY_OFF
        action: Go_OFF	!visible: 1
            do Go_OFF all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_OFF, OFF} ) then
                move_to NOT_READY
            endif
            move_to RAMPING_OFF
        action: Go_STANDBY1(string RUN_TYPE = "PHYSICS")	!visible: 1
            do Go_STANDBY1(RUN_TYPE=RUN_TYPE) all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_STANDBY1, STANDBY1} ) then
                move_to NOT_READY
            endif
            move_to RAMPING_STANDBY1
        action: Go_STANDBY2(string RUN_TYPE = "PHYSICS")	!visible: 1
            do Go_STANDBY2(RUN_TYPE=RUN_TYPE) all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_STANDBY2, STANDBY2} ) then
                move_to NOT_READY
            endif
            move_to RAMPING_STANDBY2
        action: Go_READY(string RUN_TYPE = "PHYSICS")	!visible: 1
            do Go_READY(RUN_TYPE=RUN_TYPE) all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_READY, READY} )  then
                    move_to NOT_READY
            endif
            move_to RAMPING_READY
    state: STANDBY2
    !color: FwStateOKNotPhysics
        when ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES in_state {ERROR,EMERGENCY_OFF} )  move_to ERROR
        when ( all_in FWCAENCHANNELDEFAULT_FWSETSTATES in_state {RAMPING_STANDBY1,STANDBY1} )  move_to RAMPING_STANDBY1
        when ( all_in FWCAENCHANNELDEFAULT_FWSETSTATES in_state {RAMPING_READY,READY} )  move_to RAMPING_READY
        when ( all_in FWCAENCHANNELDEFAULT_FWSETSTATES in_state {RAMPING_OFF,OFF} )  move_to RAMPING_OFF
        when ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state STANDBY2 )  move_to NOT_READY
        action: Go_READY(string RUN_TYPE = "PHYSICS")	!visible: 1
            do Go_READY(RUN_TYPE=RUN_TYPE) all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_READY, READY} )  then
                    move_to NOT_READY
            endif
            move_to RAMPING_READY
        action: Go_STANDBY1(string RUN_TYPE = "PHYSICS")	!visible: 1
            do Go_STANDBY1(RUN_TYPE=RUN_TYPE) all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_STANDBY1, STANDBY1} ) then
                move_to NOT_READY
            endif
            move_to RAMPING_STANDBY1
        action: Go_OFF	!visible: 1
            do Go_OFF all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_OFF, OFF} ) then
                move_to NOT_READY
            endif
            move_to RAMPING_OFF
        action: Do_Emergency_OFF	!visible: 1
            do Do_Emergency_OFF all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state EMERGENCY_OFF )  then
              move_to ERROR
            endif
            move_to EMERGENCY_OFF
        action: Reset	!visible: 1
            do Reset all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            move_to NOT_READY
        action: Go_STANDBY2(string RUN_TYPE = "PHYSICS")	!visible: 1
            do Go_STANDBY2(RUN_TYPE=RUN_TYPE) all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_STANDBY2, STANDBY2} ) then
                move_to NOT_READY
            endif
            move_to RAMPING_STANDBY2
    state: RAMPING_READY
    !color: FwStateAttention2
        when ( all_in FWCAENCHANNELDEFAULT_FWSETSTATES in_state READY )  move_to READY
        when ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_READY,READY} )  move_to NOT_READY
        action: Do_Emergency_OFF	!visible: 1
            do Do_Emergency_OFF all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state EMERGENCY_OFF )  then
              move_to ERROR
            endif
            move_to EMERGENCY_OFF
        action: FAKE_READY	!visible: 1
            do FAKE_READY all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            move_to READY
        action: Go_OFF	!visible: 1
            do Go_OFF all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_OFF, OFF} ) then
                move_to NOT_READY
            endif
            move_to RAMPING_OFF
        action: Go_STANDBY1(string RUN_TYPE = "PHYSICS")	!visible: 1
            do Go_STANDBY1(RUN_TYPE=RUN_TYPE) all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_STANDBY1, STANDBY1} ) then
                move_to NOT_READY
            endif
            move_to RAMPING_STANDBY1
        action: Go_STANDBY2(string RUN_TYPE = "PHYSICS")	!visible: 1
            do Go_STANDBY2(RUN_TYPE=RUN_TYPE) all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_STANDBY2, STANDBY2} ) then
                move_to NOT_READY
            endif
            move_to RAMPING_STANDBY2
        action: Go_READY(string RUN_TYPE = "PHYSICS")	!visible: 1
            do Go_READY(RUN_TYPE=RUN_TYPE) all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_READY, READY} )  then
                    move_to NOT_READY
            endif
            move_to RAMPING_READY
    state: READY
    !color: FwStateOKPhysics
        when ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES in_state {ERROR,EMERGENCY_OFF} )  move_to ERROR
        when ( all_in FWCAENCHANNELDEFAULT_FWSETSTATES in_state {RAMPING_STANDBY1,STANDBY1} )  move_to RAMPING_STANDBY1
        when ( all_in FWCAENCHANNELDEFAULT_FWSETSTATES in_state {RAMPING_STANDBY2,STANDBY2} )  move_to RAMPING_STANDBY2
        when ( all_in FWCAENCHANNELDEFAULT_FWSETSTATES in_state {RAMPING_OFF,OFF} )  move_to RAMPING_OFF
        when ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state READY )  move_to NOT_READY
        action: Go_STANDBY2(string RUN_TYPE = "PHYSICS")	!visible: 1
            do Go_STANDBY2(RUN_TYPE=RUN_TYPE) all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_STANDBY2, STANDBY2} ) then
                move_to NOT_READY
            endif
            move_to RAMPING_STANDBY2
        action: Go_STANDBY1(string RUN_TYPE = "PHYSICS")	!visible: 1
            do Go_STANDBY1(RUN_TYPE=RUN_TYPE) all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_STANDBY1, STANDBY1} ) then
                move_to NOT_READY
            endif
            move_to RAMPING_STANDBY1
        action: Go_OFF	!visible: 1
            do Go_OFF all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_OFF, OFF} ) then
                move_to NOT_READY
            endif
            move_to RAMPING_OFF
        action: Do_Emergency_OFF	!visible: 1
            do Do_Emergency_OFF all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state EMERGENCY_OFF )  then
              move_to ERROR
            endif
            move_to EMERGENCY_OFF
        action: Reset	!visible: 1
            do Reset all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            move_to NOT_READY
        action: Step(int STEP_NR = 0, string RUN_TYPE = "")	!visible: 1
            do Step(STEP_NR=STEP_NR, RUN_TYPE=RUN_TYPE) all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( all_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state READY ) then
                move_to NOT_READY
            endif
            move_to READY
        action: Go_READY(string RUN_TYPE = "PHYSICS")	!visible: 1
            do Go_READY(RUN_TYPE=RUN_TYPE) all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_READY, READY} )  then
                    move_to NOT_READY
            endif
            move_to RAMPING_READY
    state: RAMPING_OFF
    !color: FwStateAttention2
        when ( all_in FWCAENCHANNELDEFAULT_FWSETSTATES in_state OFF )  move_to OFF
        when ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_OFF,OFF} )  move_to NOT_READY
        action: Do_Emergency_OFF	!visible: 1
            do Do_Emergency_OFF all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state EMERGENCY_OFF )  then
              move_to ERROR
            endif
            move_to EMERGENCY_OFF
        action: Go_OFF	!visible: 1
            do Go_OFF all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_OFF, OFF} ) then
                move_to NOT_READY
            endif
            move_to RAMPING_OFF
        action: Go_STANDBY1(string RUN_TYPE = "PHYSICS")	!visible: 1
            do Go_STANDBY1(RUN_TYPE=RUN_TYPE) all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_STANDBY1, STANDBY1} ) then
                move_to NOT_READY
            endif
            move_to RAMPING_STANDBY1
        action: Go_STANDBY2(string RUN_TYPE = "PHYSICS")	!visible: 1
            do Go_STANDBY2(RUN_TYPE=RUN_TYPE) all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_STANDBY2, STANDBY2} ) then
                move_to NOT_READY
            endif
            move_to RAMPING_STANDBY2
        action: Go_READY(string RUN_TYPE = "PHYSICS")	!visible: 1
            do Go_READY(RUN_TYPE=RUN_TYPE) all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {RAMPING_READY, READY} )  then
                    move_to NOT_READY
            endif
            move_to RAMPING_READY
    state: ERROR
    !color: FwStateAttention3
        when ( all_in FWCAENCHANNELDEFAULT_FWSETSTATES in_state EMERGENCY_OFF )  move_to EMERGENCY_OFF
        when ( all_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state {ERROR,EMERGENCY_OFF} )  move_to NOT_READY
        action: RECOVER	!visible: 1
            do RECOVER all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES in_state ERROR ) then
                move_to ERROR
            endif
            move_to NOT_READY
        action: Do_Emergency_OFF	!visible: 1
            do Do_Emergency_OFF all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            if ( any_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state EMERGENCY_OFF )  then
              move_to ERROR
            endif
            move_to EMERGENCY_OFF
    state: EMERGENCY_OFF
    !color: FwStateAttention3
        when ( all_in FWCAENCHANNELDEFAULT_FWSETSTATES not_in_state EMERGENCY_OFF )  move_to NOT_READY
        action: Clear_Emergency	!visible: 1
            do Clear_Emergency all_in FWCAENCHANNELDEFAULT_FWSETACTIONS
            move_to NOT_READY

object: CXHV01 is_of_class TOP_HV_Domain_v1_CLASS

class: FwChildrenMode_CLASS
!panel: FwChildrenMode.pnl
    state: Complete
    !color: _3DFace
        when ( any_in FWDEVMODE_FWSETSTATES in_state DISABLED )  move_to IncompleteDev
    state: Incomplete
    !color: FwStateAttention2
    state: IncompleteDev
    !color: FwStateAttention1
        when (  ( all_in FWDEVMODE_FWSETSTATES not_in_state DISABLED )  ) move_to Complete
    state: IncompleteDead
    !color: FwStateAttention3

object: CXHV01_FWCNM is_of_class FwChildrenMode_CLASS

class: FwMode_CLASS
!panel: FwMode.pnl
    state: Excluded
    !color: FwStateOKNotPhysics
        action: Take(string OWNER = "", string EXCLUSIVE = "YES")	!visible: 1
            move_to InLocal
        action: Include(string OWNER = "", string EXCLUSIVE = "YES")	!visible: 0
            move_to Included
        action: Manual	!visible: 0
            move_to Manual
        action: Ignore	!visible: 0
            move_to Ignored
    state: Included
    !color: FwStateOKPhysics
        action: Exclude(string OWNER = "")	!visible: 0
            move_to Excluded
        action: Manual(string OWNER = "")	!visible: 0
            move_to Manual
        action: Ignore(string OWNER = "")	!visible: 0
            move_to Ignored
        action: ExcludeAll(string OWNER = "")	!visible: 0
            move_to Excluded
        action: Include(string OWNER = "", string EXCLUSIVE = "YES")	!visible: 0
            move_to Included
        action: Free(string OWNER = "")	!visible: 0
            move_to Included
        action: SetMode(string OWNER = "", string EXCLUSIVE = "YES")	!visible: 0
    state: InLocal
    !color: FwStateOKNotPhysics
        action: Release(string OWNER = "")	!visible: 1
            move_to Excluded
        action: ReleaseAll(string OWNER = "")	!visible: 1
            move_to Excluded
        action: SetMode(string OWNER = "", string EXCLUSIVE = "YES")	!visible: 0
        action: Take(string OWNER = "", string EXCLUSIVE = "YES")	!visible: 1
            move_to InLocal
    state: Manual
    !color: FwStateOKNotPhysics
        action: Include(string OWNER = "", string EXCLUSIVE = "YES")	!visible: 0
            move_to Included
        action: Take(string OWNER = "")	!visible: 1
            move_to InManual
        action: Exclude(string OWNER = "")	!visible: 0
            move_to Excluded
        action: Ignore	!visible: 0
            move_to Ignored
        action: Free(string OWNER = "")	!visible: 0
            move_to Excluded
        action: ExcludeAll(string OWNER = "")	!visible: 0
            move_to Excluded
    state: InManual
    !color: FwStateOKNotPhysics
        action: Release(string OWNER = "")	!visible: 1
            move_to Manual
        action: SetMode(string OWNER = "", string EXCLUSIVE = "YES")	!visible: 0
        action: ReleaseAll(string OWNER = "")	!visible: 0
            move_to Excluded
        action: SetInLocal	!visible: 0
            move_to InLocal
    state: Ignored
    !color: FwStateOKNotPhysics
        action: Include	!visible: 0
            move_to Included
        action: Exclude(string OWNER = "")	!visible: 0
            move_to Excluded
        action: Manual	!visible: 0
            move_to Manual
        action: SetMode(string OWNER = "", string EXCLUSIVE = "YES")	!visible: 0
        action: Free(string OWNER = "")	!visible: 0
            move_to Included
        action: ExcludeAll(string OWNER = "")	!visible: 0
            move_to Excluded

object: CXHV01_FWM is_of_class FwMode_CLASS

class: FwCaenChannelDefault_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from FWCAENCHANNELDEFAULT_FWSETSTATES
            remove &VAL_OF_Device from FWCAENCHANNELDEFAULT_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in FWCAENCHANNELDEFAULT_FWSETSTATES
            insert &VAL_OF_Device in FWCAENCHANNELDEFAULT_FWSETACTIONS
            move_to READY

object: FwCaenChannelDefault_FWDM is_of_class FwCaenChannelDefault_FwDevMode_CLASS


class: FwCaenChannelDefault_CLASS/associated
!panel: FwCaenChannel|lbCaenHV/lbCaenHV_DetailsChannel.pnl
    state: READY
    !color: FwStateOKPhysics
        action: Go_STANDBY1(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_STANDBY2(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_OFF	!visible: 1
        action: Do_Emergency_OFF	!visible: 1
        action: Go_READY(string RUN_TYPE = "PHYSICS")	!visible: 1
    state: RAMPING_READY
    !color: FwStateAttention2
        action: Do_Emergency_OFF	!visible: 1
        action: Go_STANDBY1(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_STANDBY2(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_OFF	!visible: 1
        action: Go_READY(string RUN_TYPE = "PHYSICS")	!visible: 1
    state: OFF
    !color: FwStateOKNotPhysics
        action: Go_STANDBY1(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_STANDBY2(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_READY(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Do_Emergency_OFF	!visible: 1
        action: Go_OFF	!visible: 1
    state: RAMPING_OFF
    !color: FwStateAttention2
        action: Do_Emergency_OFF	!visible: 1
        action: Go_STANDBY1(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_STANDBY2(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_OFF	!visible: 1
        action: Go_READY(string RUN_TYPE = "PHYSICS")	!visible: 1
    state: STANDBY1
    !color: FwStateOKNotPhysics
        action: Go_STANDBY2(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_OFF	!visible: 1
        action: Go_READY(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Do_Emergency_OFF	!visible: 1
        action: Go_STANDBY1(string RUN_TYPE = "PHYSICS")	!visible: 1
    state: RAMPING_STANDBY1
    !color: FwStateAttention2
        action: Do_Emergency_OFF	!visible: 1
        action: Go_STANDBY1(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_STANDBY2(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_OFF	!visible: 1
        action: Go_READY(string RUN_TYPE = "PHYSICS")	!visible: 1
    state: STANDBY2
    !color: FwStateOKNotPhysics
        action: Go_READY(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_STANDBY1(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_OFF	!visible: 1
        action: Do_Emergency_OFF	!visible: 1
        action: Go_STANDBY2(string RUN_TYPE = "PHYSICS")	!visible: 1
    state: RAMPING_STANDBY2
    !color: FwStateAttention2
        action: Do_Emergency_OFF	!visible: 1
        action: Go_STANDBY1(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_STANDBY2(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_OFF	!visible: 1
        action: Go_READY(string RUN_TYPE = "PHYSICS")	!visible: 1
    state: ERROR
    !color: FwStateAttention3
        action: Go_READY(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_STANDBY1(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_STANDBY2(string RUN_TYPE = "PHYSICS")	!visible: 1
        action: Go_OFF	!visible: 1
        action: RECOVER	!visible: 1
        action: Do_Emergency_OFF	!visible: 1
    state: EMERGENCY_OFF
    !color: FwStateAttention3
        action: Clear_Emergency	!visible: 1

object: CAEN:cxcaen01:board01:channel000 is_of_class FwCaenChannelDefault_CLASS

object: CAEN:cxcaen01:board01:channel001 is_of_class FwCaenChannelDefault_CLASS

object: CAEN:cxcaen01:board01:channel002 is_of_class FwCaenChannelDefault_CLASS

object: CAEN:cxcaen01:board01:channel003 is_of_class FwCaenChannelDefault_CLASS

object: CAEN:cxcaen01:board01:channel004 is_of_class FwCaenChannelDefault_CLASS

object: CAEN:cxcaen01:board01:channel005 is_of_class FwCaenChannelDefault_CLASS

object: CAEN:cxcaen01:board01:channel006 is_of_class FwCaenChannelDefault_CLASS

object: CAEN:cxcaen01:board01:channel007 is_of_class FwCaenChannelDefault_CLASS

object: CAEN:cxcaen01:board01:channel008 is_of_class FwCaenChannelDefault_CLASS

object: CAEN:cxcaen01:board01:channel009 is_of_class FwCaenChannelDefault_CLASS

object: CAEN:cxcaen01:board01:channel010 is_of_class FwCaenChannelDefault_CLASS

object: CAEN:cxcaen01:board01:channel011 is_of_class FwCaenChannelDefault_CLASS

objectset: FWCAENCHANNELDEFAULT_FWSETSTATES is_of_class VOID {CAEN:cxcaen01:board01:channel000,
	CAEN:cxcaen01:board01:channel001,
	CAEN:cxcaen01:board01:channel002,
	CAEN:cxcaen01:board01:channel003,
	CAEN:cxcaen01:board01:channel004,
	CAEN:cxcaen01:board01:channel005,
	CAEN:cxcaen01:board01:channel006,
	CAEN:cxcaen01:board01:channel007,
	CAEN:cxcaen01:board01:channel008,
	CAEN:cxcaen01:board01:channel009,
	CAEN:cxcaen01:board01:channel010,
	CAEN:cxcaen01:board01:channel011 }
objectset: FWCAENCHANNELDEFAULT_FWSETACTIONS is_of_class VOID {CAEN:cxcaen01:board01:channel000,
	CAEN:cxcaen01:board01:channel001,
	CAEN:cxcaen01:board01:channel002,
	CAEN:cxcaen01:board01:channel003,
	CAEN:cxcaen01:board01:channel004,
	CAEN:cxcaen01:board01:channel005,
	CAEN:cxcaen01:board01:channel006,
	CAEN:cxcaen01:board01:channel007,
	CAEN:cxcaen01:board01:channel008,
	CAEN:cxcaen01:board01:channel009,
	CAEN:cxcaen01:board01:channel010,
	CAEN:cxcaen01:board01:channel011 }

class: FwDevMode_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from FWDEVMODE_FWSETSTATES
            remove &VAL_OF_Device from FWDEVMODE_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in FWDEVMODE_FWSETSTATES
            insert &VAL_OF_Device in FWDEVMODE_FWSETACTIONS
            move_to READY

object: FwDevMode_FWDM is_of_class FwDevMode_FwDevMode_CLASS


class: FwDevMode_CLASS/associated
!panel: FwDevMode.pnl
    state: ENABLED
    !color: FwStateOKPhysics
    state: DISABLED
    !color: FwStateAttention1

object: CXHV01_FWDM is_of_class FwDevMode_CLASS

objectset: FWDEVMODE_FWSETSTATES is_of_class VOID {CXHV01_FWDM }
objectset: FWDEVMODE_FWSETACTIONS is_of_class VOID {CXHV01_FWDM }


objectset: FWCHILDREN_FWSETACTIONS union {FWCAENCHANNELDEFAULT_FWSETACTIONS } is_of_class VOID
objectset: FWCHILDREN_FWSETSTATES union {FWCAENCHANNELDEFAULT_FWSETSTATES } is_of_class VOID

