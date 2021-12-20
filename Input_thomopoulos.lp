% priority graph model1    
    pre(v1,in,o1). pre(v1,in,o2). pre(v1,in,o4). pre(v1,in,o5).
    pre(v1,o1,o6). pre(v1,o1,o7). 
    pre(v1,o2,o7). pre(v1,o2,o9).
    pre(v1,o4,o11).
    pre(v1,o5,o11).
    pre(v1,o6,out).
    pre(v1,o7,o12).
    pre(v1,o9,o15).
    pre(v1,o11,o13). pre(v1,o11,o14).
    pre(v1,o12,o15).
    pre(v1,o13,o17).
    pre(v1,o14,o18). pre(v1,o14,o19).
    pre(v1,o15,out).
    pre(v1,o17,o19).
    pre(v1,o18,out).
    pre(v1,o19,out).
% priority graph model2
    pre(v2,in,o2). pre(v2,in,o3). pre(v2,in,o5).
    pre(v2,o1,o7). 
    pre(v2,o2,o7). pre(v2,o2,o8). pre(v2,o2,o9).
    pre(v2,o3,o9). pre(v2,o3,o16).
    pre(v2,o5,o11).
    pre(v2,o7,o12).
    pre(v2,o8,o12).
    pre(v2,o9,o15).
    pre(v2,o11,o14). pre(v2,o11,o16).
    pre(v2,o12,o15).
    pre(v2,o14,o18). pre(v2,o14,o19).
    pre(v2,o15,out).
    pre(v2,o16,out).
    pre(v2,o17,o19).
    pre(v2,o18,out).
    pre(v2,o19,out).
% priority graph model3
    pre(v3,in,o1). pre(v3,in,o2). pre(v3,in,o3). pre(v3,in,o5).
    pre(v3,o1,o7). 
    pre(v3,o2,o7). pre(v3,o2,o8). pre(v3,o2,o9).
    pre(v3,o3,o9). pre(v3,o3,o10).
    pre(v3,o5,o11).
    pre(v3,o7,o12).
    pre(v3,o8,o12).
    pre(v3,o9,o15).
    pre(v3,o10,out).
    pre(v3,o11,o13). pre(v3,o11,o14).
    pre(v3,o12,o15).
    pre(v3,o14,o18).
    pre(v3,o15,out).
    pre(v3,o18,out).

%task variant: operations that need to be executed for each model
    task_variant(v1,(in;o1;o2;o4;o5;o6;o7;o9;o11;o12;o13;o14;o15;o17;o18;o19;out)). %15
    task_variant(v2,(in;o2;o3;o5;o7;o8;o9;o11;o12;o14;o15;o16;o17;o18;o19;out)). %14
    task_variant(v3,(in;o1;o2;o3;o5;o7;o8;o9;o10;o11;o12;o13;o14;o15;o18;out)). %14
    
%operations that need to be executed for each job    
    task(J,O) :- job(J,V,_,_,_), task_variant(V,O).

%Workstations and their abbilities workstation(Nr,abbility,duration,costs)
    workstation(ws1,o1,5,2). workstation(ws1,o2,4,4). workstation(ws1,o9,4,2). workstation(ws1,o10,2,4). workstation(ws1,o11,3,2). workstation(ws1,o18,3,2).
    workstation(ws2,o2,8,2). workstation(ws2,o3,2,4). workstation(ws2,o5,2,2). workstation(ws2,o9,3,2). workstation(ws2,o12,1,4). workstation(ws2,o13,1,2).
    workstation(ws3,o3,4,2). workstation(ws3,o1,10,4). workstation(ws3,o4,4,2). workstation(ws3,o14,2,4). workstation(ws3,o15,7,2). workstation(ws3,o17,5,2).
    workstation(ws4,o6,2,2). workstation(ws4,o7,4,2). workstation(ws4,o8,5,2). workstation(ws4,o11,3,2). workstation(ws4,o15,15,2). workstation(ws4,o18,5,2).
    workstation(ws5,o6,2,10). workstation(ws5,o7,5,2). workstation(ws5,o8,5,2). workstation(ws5,o12,3,4). workstation(ws5,o13,1,2). workstation(ws5,o14,2,2). workstation(ws5,o18,3,2).
    workstation(ws6,o2,12,2). workstation(ws6,o5,2,2). workstation(ws6,o14,2,4). workstation(ws6,o15,10,2). workstation(ws6,o17,5,2). workstation(ws6,o19,4,2).
    workstation(ws7,o5,2,2). workstation(ws7,o7,6,2). workstation(ws7,o9,2,2). workstation(ws7,o11,3,2). workstation(ws7,o12,5,2). workstation(ws7,o16,1,2). workstation(ws7,o19,3,2).
    workstation(input,in,1,0).
    workstation(output,out,1,0).

%Employees and their abbilities employee(name,abbility,costs)
    employee(emp1,o1,2). employee(emp1,o2,2). employee(emp1,o5,2). employee(emp1,o8,2). employee(emp1,o10,2). employee(emp1,o11,2).
    employee(emp1,o3,2). employee(emp1,o4,2). employee(emp1,o7,2).
    employee(emp2,o1,2). employee(emp2,o2,2). employee(emp2,o6,2). employee(emp2,o9,2). employee(emp2,o12,2). employee(emp2,o13,2).
    employee(emp3,o3,2). employee(emp3,o4,2). employee(emp3,o7,2). employee(emp3,o14,2). employee(emp3,o15,2). employee(emp3,o17,2). employee(emp3,o18,2).
    employee(emp4,o1,2). employee(emp4,o2,2). employee(emp4,o5,2). employee(emp4,o8,2). employee(emp4,o10,2). employee(emp4,o11,2). employee(emp4,o19,2). employee(emp4,o18,2).
    employee(emp5,o1,2). employee(emp5,o2,2). employee(emp5,o6,2). employee(emp5,o9,2). employee(emp5,o12,2). employee(emp5,o13,2). employee(emp5,o17,2).
    employee(emp6,o3,2). employee(emp6,o4,2). employee(emp6,o7,2). employee(emp6,o14,2). employee(emp6,o15,2). employee(emp6,o19,2).
    employee(emp7,o5,2). employee(emp7,o8,2). employee(emp7,o10,2). employee(emp7,o16,2). employee(emp7,o18,2).
    employee(emp0,in,0). employee(emp00,in,0).
    employee(emp0,out,0). employee(emp00,out,0).

%open jobs(name,model,starttime,endtime,available)
    job(j1,v2,5,120,open).
    job(j2,v2,10,135,open).
    job(j3,v1,15,115,open).
    job(j4,v1,20,130,open).
    job(j5,v3,25,125,open).
    job(j6,v3,30,140,open).


%available robots(name,costs)
    rob(rb_a,1).
    rob(rb_b,1).
    rob(rb_c,1).
    rob(rb_d,1).
    rob(rb_e,1).
    rob(rb_f,1).
    
%allocation robot to job    
    taskR(rb_a,j1).
    taskR(rb_b,j2).
    taskR(rb_c,j3).
    taskR(rb_d,j4).
    taskR(rb_e,j5).
    taskR(rb_f,j6).