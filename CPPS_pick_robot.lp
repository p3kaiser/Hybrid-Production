
%Distance(Startpoint,Endpoint,Distance)
    distance(WS1,WS2,1) :- workstation(WS1,_,_,_), workstation(WS2,_,_,_), WS1!=WS2.
    distance(WS,WS,0) :- workstation(WS,_,_,_).
    distance(a,WS,1) :- workstation(WS,_,_,_).
    distance(h,WS,1) :- workstation(WS,_,_,_). 
    distance(KLT,WS,1) :- workstation(WS,_,_,_), klt(KLT,_).
    distance(h,KLT,1) :- klt(KLT,_). 

%homeposition(Entity,Position)
    home(E,a) :- employee(E,_,_).
    home(R,h) :- rob(R,_).

%Speed
    speed(E,1) :- employee(E,_,_).
    speed(R,1) :- rob(R,_).
    
% Generate

pick_material(J,O,W,M,T) :- alloc(J,O,W,_,T), material(V,O,M), job(J,V,_,_,_).
{pick_klt(J,O,W,K,M,T) : klt(K,M)}=1 :- pick_material(J,O,W,M,T).
{pick_alloc(J,O,W,K,M,R,T) : rob(R,_)}=1 :- pick_klt(J,O,W,K,M,T).

busy_robot(J,O,R,K,ST,ET) :- pick_alloc(J,O,W,K,_,R,T), pre_arrival_duration(R,K,RD), travel_time(K,W,R,KD), ST=T-RD-KD, ET=T+RD+KD.
:- busy_robot(J1,_,R,_,ST1,ET1), busy_robot(J2,_,R,_,ST2,ET2), ET1>=ST2, ST1<=ET2, J1!=J2.
:- task_robot(R,_,ST1,ET1), busy_robot(_,_,R,_,ST2,ET2),  ET1>=ST2, ST1<=ET2.
:- busy_robot(J,O,R,K1,_,_), busy_robot(J,O,R,K2,_,_), K1!=K2.
:- busy_robot(J,O1,R,_,ST1,ET1), busy_robot(J,O2,R,_,ST2,ET2), ET1>=ST2, ST1<=ET2, O1!=O2.

pre_arrival_duration(E,G,D) :- speed(E,S), home(E,P), distance(P,G,Dis), D=Dis/S.
travel_time(P,G,E,TT) :- speed(E,S), distance(P,G,Dis), TT=Dis/S.

successor(J,O1,O2,T1,T2) :- alloc(J,O1,_,_,T1), alloc(J,O2,_,_,T2), T1<T2.
deviation_suc(J,O1,O2,D) :- successor(J,O1,O2,T1,T2), D=T2-T1.
min_successor(J,O1,O2,X) :- X = #min{(D): deviation_suc(J,O1,_,D)}, deviation_suc(J,O1,O2,_).
next_successor(J,O1,O2,T1,T2) :- min_successor(J,O1,O2,X), successor(J,O1,O2,T1,T2), X==T2-T1.

pick_cost_alloc(J,O,TC) :- busy_robot(J,O,R,_,ST,ET), rob(R,C), TC=(ET-ST)*C.
pick_cost(J,PC) :- PC = #sum {TC,O : pick_cost_alloc(J,O,TC)}, alloc(J,_,_,_,_).

% Output
    %employee (Emp, Workstation, Starttime):
    o_emp(E,W,ST,ET) :- alloc(J,O,W,E,T1), workstation(W,O,D,_), home(E,P), travel_time(P,W,E,WT), ST=T1-WT, ET=T1+D+WT-1.
    %task robot (robot, startpoint, endpoint, starttime, endtime):
    o_task_robot(R,W1,W2,ST,ET) :- task_robot(R,J,_,_), next_successor(J,O1,O2,T1,T2), alloc(J,O1,W1,_,T1), alloc(J,O2,W2,_,T2), travel_time(W1,W2,R,TT), ST=T2-TT, ET=T2.
    %pick robot (robot, klt, workstation, starttime, endtime):
    o_pick_robot(R,K,W,ST,ET) :- pick_alloc(J,O,W,K,M,R,T), busy_robot(J,O,R,K,ST,ET).
    %master schedule
    o_schedule(J,O,W,E,K,M,PR,TR,ST,ET) :- pick_alloc(J,O,W,K,M,PR,ST), alloc(J,O,_,E,_), task_robot(TR,J,_,_), workstation(W,O,D,_), ET=ST+D.

#minimize {PC@2,J : pick_cost(J,PC)}.

#show o_schedule/10.
% #show busy_robot/6.
#show o_task_robot/5.
#show o_pick_robot/5.
#show o_emp/4.