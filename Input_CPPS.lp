% priority graph model1    
    pre(v1,in,o1).
    pre(v1,o1,o2). pre(v1,o1,o3). 
    pre(v1,o2,o8).
    pre(v1,o3,o4). pre(v1,o3,o5).
    pre(v1,o4,o6).
    pre(v1,o5,o6). pre(v1,o5,o8).
    pre(v1,o6,o7).
    pre(v1,o7,o9).
    pre(v1,o8,o9).
    pre(v1,o9,out).
    
%priority graph model2 
    pre(v2,in,o1).
    pre(v2,o1,o2). pre(v2,o1,o3). pre(v2,o1,o10).
    pre(v2,o2,o8). pre(v2,o2,o15).
    pre(v2,o3,o4). pre(v2,o3,o5).
    pre(v2,o4,o12). pre(v2,o4,o13).
    pre(v2,o5,o12). pre(v2,o5,o13).
    pre(v2,o7,o9).
    pre(v2,o8,o9).
    pre(v2,o9,out).
    pre(v2,o10,o11). pre(v2,o10,o5).
    pre(v2,o11,o12). pre(v2,o11,o13).
    pre(v2,o12,o14). 
    pre(v2,o13,o14). 
    pre(v2,o14,o7). pre(v2,o14,o8). pre(v2,o14,o15). 
    pre(v2,o15,o9).

%task variant: operations that need to be executed for each model
    task_variant(v1,(in;o1;o2;o3;o4;o5;o6;o7;o8;o9;out)).
    task_variant(v2,(in;o1;o2;o3;o4;o5;o7;o8;o9;o10;o11;o12;o13;o14;o15;out)).
    
%operations that need to be executed for each job    
    task(J,O) :- job(J,V,_,_,_), task_variant(V,O).

%Workstations and their abbilities workstation(Nr,abbility,duration,costs)
    workstation(ws1,o1,4,2). workstation(ws1,o2,5,4). workstation(ws1,o9,12,2). workstation(ws1,o10,3,4). workstation(ws1,o11,3,2).
    workstation(ws2,o2,5,2). workstation(ws2,o3,5,4). workstation(ws2,o5,4,2). workstation(ws2,o9,12,2). workstation(ws2,o12,3,4). workstation(ws2,o13,2,2).
    workstation(ws3,o3,5,2). workstation(ws3,o1,4,4). workstation(ws3,o4,6,2). workstation(ws3,o14,2,4). workstation(ws3,o15,10,2).
    workstation(ws4,o6,4,2). workstation(ws4,o7,10,2). workstation(ws4,o8,21,2). workstation(ws4,o10,3,4). workstation(ws4,o11,3,2).
    workstation(ws5,o6,4,2). workstation(ws5,o7,10,2). workstation(ws5,o8,21,2). workstation(ws5,o12,3,4). workstation(ws5,o13,2,2).
    workstation(ws6,o2,5,2). workstation(ws6,o3,5,4). workstation(ws6,o5,4,2). workstation(ws6,o14,2,4). workstation(ws6,o15,10,2).
    workstation(input,in,1,0).
    workstation(output,out,1,0).

%Employees and their abbilities employee(name,abbility,costs)
    employee(emp1,o1,2). employee(emp1,o2,2). employee(emp1,o5,2). employee(emp1,o8,2). employee(emp1,o10,2). employee(emp1,o11,2).
    employee(emp1,o3,2). employee(emp1,o4,2). employee(emp1,o7,2).
    employee(emp2,o1,2). employee(emp2,o2,2). employee(emp2,o6,2). employee(emp2,o9,2). employee(emp2,o12,2). employee(emp2,o13,2).
    employee(emp3,o3,2). employee(emp3,o4,2). employee(emp3,o7,2). employee(emp3,o14,2). employee(emp3,o15,2).
    employee(emp4,o1,2). employee(emp4,o2,2). employee(emp4,o5,2). employee(emp4,o8,2). employee(emp4,o10,2). employee(emp4,o11,2).
    employee(emp5,o1,2). employee(emp5,o2,2). employee(emp5,o6,2). employee(emp5,o9,2). employee(emp5,o12,2). employee(emp5,o13,2).
    employee(emp6,o3,2). employee(emp6,o4,2). employee(emp6,o7,2). employee(emp6,o14,2). employee(emp6,o15,2).
    employee(emp0,in,0). employee(emp00,in,0).
    employee(emp0,out,0). employee(emp00,out,0).

%open jobs(name,model,starttime,endtime,available)
    job(j1,v2,5,160,open).
    job(j2,v2,10,175,open).
    job(j3,v1,15,155,open).
    job(j4,v1,20,150,open).
    job(j5,v1,25,165,open).


%available robots(name,costs)
    rob(rb_a,1).
    rob(rb_b,1).
    rob(rb_c,1).
    rob(rb_d,1).
    rob(rb_e,1).
    
%allocation robot to job    
    taskR(rb_a,j1).
    taskR(rb_b,j2).
    taskR(rb_c,j3).
    taskR(rb_d,j4).
    taskR(rb_e,j5).