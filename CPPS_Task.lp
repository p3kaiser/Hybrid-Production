time(1..360).

%Distance(Startpoint,Endpoint,Distance)
    distance(WS1,WS2,1) :- workstation(WS1,_,_,_), workstation(WS2,_,_,_), WS1!=WS2.
    distance(WS,WS,0) :- workstation(WS,_,_,_).
    distance(a,WS,1) :- workstation(WS,_,_,_).
    distance(h,WS,1) :- workstation(WS,_,_,_).


%homeposition(Entity,Position)
    home(E,a) :- employee(E,_,_).
    home(R,h) :- rob(R,_).


%Speed
    speed(E,1) :- employee(E,_,_).
    speed(R,1) :- rob(R,_).

    
%Problem Encoding
%Generate
{alloc(J,O,W,E,T) : workstation(W,O,_,_), employee(E,O,_), time(T), job(J,_,RT,DT,_), T>=RT, T<DT}=1 :- task(J,O), job(J,_,_,_,open).

%Implementation of priority graph
    :- alloc(J,O1,W1,_,T1), alloc(J,O2,_,_,T2), workstation(W1,O1,D,_), pre(V,O1,O2), job(J,V,_,_,_), T1+D>T2.

%Allocation of WS, Emp, Job for the duration of the task
    busy_workstation(J,O,W,ST,ET) :- alloc(J,O,W,_,ST), workstation(W,O,D,_), ET=ST+D-1.
    busy_employee(J,E,O,ST,ET) :- alloc(J,O,W,E,T1), workstation(W,O,D,_), home(E,P), travel_time(P,W,E,WT), ST=T1-WT, ET=T1+D+WT-1.
    busy_job(J,O,ST,ET) :- alloc(J,O,W,_,ST), workstation(W,O,D,_), ET=ST+D-1.

    :- busy_workstation(J1,_,W,ST1,ET1), busy_workstation(J2,_,W,ST2,ET2), ET1>=ST2, ST1<=ET2, J1!=J2.
    :- busy_employee(J1,E,_,ST1,ET1), busy_employee(J2,E,_,ST2,ET2), ET1>=ST2, ST1<=ET2, J1!=J2.
    :- busy_job(J,O1,ST1,ET1),  busy_job(J,O2,ST2,ET2), ET1>=ST2, ST1<=ET2, O1!=O2.

%Time between two Entities
    travel_time(P,G,E,TT) :- speed(E,S), distance(P,G,Dis), TT=Dis/S.

%task robot new
    task_robot(R,J,ST,ET) :- taskR(R,J), job(J,_,RT,DT,_), home(R,P), travel_time(P,input,R,D), ST=RT-D, travel_time(P,output,R,D1), ET=DT+D1-1.
    :- task_robot(R,J1,ST1,ET1), task_robot(R,J2,ST2,ET2), ET1>=ST2, ST1<=ET2, J1!=J2.
    :- alloc(J,O1,W1,_,T1), alloc(J,O2,W2,_,T2), workstation(W1,O1,D,_), taskR(R,J), travel_time(W1,W2,R,TT), successor(J,O1,O2,T1,T2), T1+D+TT>T2.
    successor(J,O1,O2,T1,T2) :- alloc(J,O1,_,_,T1), alloc(J,O2,_,_,T2), T1<T2.

%Last task of a Job has to be finished at the completion time
:- alloc(J,_,output,_,X), workstation(output,_,D,_), job(J,_,_,DT,_), X+D!=DT.
%Pickup at release time
:- alloc(J,_,input,_,X), workstation(input,_,_,_), job(J,_,RT,_,_), X!=RT.

%Calculation of total costs for the optimization
    choice(J,O,C) :- alloc(J,O,W,E,T), workstation(W,O,D,CW), employee(E,O,CE), C=CW+CE.
    task_cost(J,CT) :- CT = #sum {C,O : choice(J,O,C)}, job(J,_,_,_,_).
    task_robot_cost(J,CTR) :- task_robot(R,J,ST,ET), rob(R,CR), CTR=(CR*(ET-ST)).
    total_cost(J,TC) :- task_cost(J,CT), task_robot_cost(J,CTR), TC=CT+CTR.

%Optimization Statements
#minimize {TC@2,J : total_cost(J,TC)}.

% Show Statements
    #show alloc/5.
    % #show total_cost/2.
    #show task_robot/4.
    % #show o_emp/3.
    % #show o_task_robot/4.
    % #show travel_time/4.
    % #show taskR/2.
    % #show successor/5.
    % #show waiting/2.
    % #show busy_task_robot/4.
    % #show min_successor/4.
    % #show next_successor/5.
    % #show busy_employee/5.
    % #show job/5.

%*
*********************************************LEGEND**********************************************
    J=Job
    O=Operation
    W=Workstation
    E=Employee
    T=Time
    D=Duration
    V=Variant
    P=Position
    S=Speed
    Dis=Distance
    R=Robot
    RT=ReleaseTime
    DT=DueTime(CompletionTime)
    ST=StartTime
    ET=Endtime
    CW=CostWorkstation
    CE=CostEmployee
    CR=CostRobot
    CTR=CostTaskRobot
    C=Cost
    CT=CostTask
    TC=TotalCost
    TT=TravelTime
    X,Y=Variables
*%