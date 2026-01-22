class: ASS_FwChildMode_CLASS/associated
!panel: FwChildMode.pnl
    state: Excluded
    !color: FwStateOKNotPhysics
        action: Include(string OWNER = "", string EXCLUSIVE = "YES")	!visible: 1
        action: Manual	!visible: 0
        action: Ignore	!visible: 0
        action: LockOut	!visible: 1
        action: Exclude(string OWNER = "")	!visible: 1
        action: ExcludePerm(string OWNER = "")	!visible: 0
        action: Exclude&LockOut(string OWNER = "")	!visible: 0
    state: Included
    !color: FwStateOKPhysics
        action: Exclude(string OWNER = "")	!visible: 1
        action: Manual(string OWNER = "")	!visible: 1
        action: Ignore(string OWNER = "")	!visible: 1
        action: ExcludeAll(string OWNER = "")	!visible: 1
        action: Include(string OWNER = "", string EXCLUSIVE = "YES")	!visible: 1
        action: Free(string OWNER = "")	!visible: 0
        action: SetMode(string OWNER = "", string EXCLUSIVE = "YES")	!visible: 0
        action: ExcludePerm(string OWNER = "")	!visible: 0
        action: Exclude&LockOut(string OWNER = "")	!visible: 1
    state: Manual
    !color: FwStateOKNotPhysics
        action: Include(string OWNER = "", string EXCLUSIVE = "YES")	!visible: 1
        action: Exclude(string OWNER = "")	!visible: 1
        action: Ignore	!visible: 0
        action: Free(string OWNER = "")	!visible: 0
        action: ExcludeAll(string OWNER = "")	!visible: 1
        action: Manual	!visible: 0
        action: Exclude&LockOut(string OWNER = "")	!visible: 1
    state: Ignored
    !color: FwStateOKNotPhysics
        action: Include(string OWNER = "", string EXCLUSIVE = "YES")	!visible: 1
        action: Exclude(string OWNER = "")	!visible: 1
        action: Manual(string OWNER = "")	!visible: 0
        action: SetMode(string OWNER = "", string EXCLUSIVE = "YES")	!visible: 0
        action: Free(string OWNER = "")	!visible: 0
        action: ExcludeAll(string OWNER = "")	!visible: 1
    state: LockedOut
    !color: FwStateOKNotPhysics
        action: UnLockOut	!visible: 1
        action: UnLockOut&Include(string OWNER = "", string EXCLUSIVE = "YES")	!visible: 1
        action: LockOutPerm	!visible: 0
    state: ExcludedPerm
    !color: FwStateOKNotPhysics
        action: Include(string OWNER = "", string EXCLUSIVE = "YES")	!visible: 1
        action: LockOut	!visible: 1
        action: Exclude(string OWNER = "")	!visible: 0
    state: LockedOutPerm
    !color: FwStateOKNotPhysics
        action: UnLockOut	!visible: 1
        action: UnLockOut&Include(string OWNER = "", string EXCLUSIVE = "YES")	!visible: 1
        action: LockOut	!visible: 0
