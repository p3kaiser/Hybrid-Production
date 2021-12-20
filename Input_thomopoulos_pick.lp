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
    rob(rb_g,1).
    rob(rb_h,1).
    rob(rb_i,1).
    rob(rb_j,1).
    rob(rb_k,1).
    rob(rb_l,1).
    rob(rb_m,1).
    rob(rb_n,1).
    rob(rb_o,1).
    rob(rb_p,1).
    rob(rb_q,1).

%Material (Variante, Operation, Material_ID)
    material(v1,o1,m1).
    material(v1,o1,m2).
    material(v1,o2,m3).
    material(v1,o3,m4).
    material(v1,o3,m5).
    material(v1,o4,m6).
    material(v1,o4,m7).
    material(v1,o4,m8).
    material(v1,o5,m9).
    material(v1,o5,m10).
    material(v1,o6,m11).
    material(v1,o6,m12).
    material(v1,o7,m13).
    material(v1,o8,m14).
    material(v1,o8,m15).
    material(v1,o9,m16).
    material(v1,o10,m12).
    material(v1,o11,m13).
    material(v1,o12,m14).
    material(v1,o13,m15).
    material(v1,o14,m16).
    material(v1,o15,m22).
    material(v1,o16,m17).
    material(v1,o17,m18).
    material(v1,o18,m19).
    material(v1,o19,m20).
    material(v2,o1,m1).
    material(v2,o1,m2).
    material(v2,o2,m3).
    material(v2,o3,m4).
    material(v2,o3,m5).
    material(v2,o4,m6).
    material(v2,o4,m7).
    material(v2,o4,m8).
    material(v2,o5,m9).
    material(v2,o5,m10).
    material(v2,o6,m12).
    material(v2,o7,m13).
    material(v2,o8,m14).
    material(v2,o8,m15).
    material(v2,o9,m16).
    material(v2,o10,m17).
    material(v2,o11,m18).
    material(v2,o12,m19).
    material(v2,o13,m20).
    material(v2,o14,m21).
    material(v2,o15,m22).
    material(v2,o16,m17).
    material(v2,o17,m18).
    material(v2,o18,m19).
    material(v2,o19,m20).
    material(v3,o1,m1).
    material(v3,o1,m2).
    material(v3,o2,m3).
    material(v3,o3,m4).
    material(v3,o3,m5).
    material(v3,o4,m6).
    material(v3,o4,m7).
    material(v3,o4,m8).
    material(v3,o5,m9).
    material(v3,o5,m10).
    material(v3,o6,m12).
    material(v3,o7,m13).
    material(v3,o8,m14).
    material(v3,o8,m15).
    material(v3,o9,m16).
    material(v3,o10,m17).
    material(v3,o11,m18).
    material(v3,o12,m19).
    material(v3,o13,m20).
    material(v3,o14,m21).
    material(v3,o15,m22).
    material(v3,o16,m17).
    material(v3,o17,m18).
    material(v3,o18,m19).
    material(v3,o19,m20).
    material(v1,in,m0).
    material(v1,out,m0).
    material(v2,in,m0).
    material(v2,out,m0).
    material(v3,in,m0).
    material(v3,out,m0).

%KLT (KLT_ID, Material_ID)
    klt(klt0,m0).
    klt(klt1,m1).
    klt(klt2,m1).
    klt(klt3,m2).
    klt(klt4,m2).
    klt(klt5,m3).
    klt(klt6,m4).
    klt(klt7,m5).
    klt(klt8,m5).
    klt(klt9,m6).
    klt(klt10,m7).
    klt(klt11,m8).
    klt(klt12,m9).
    klt(klt13,m10).
    klt(klt14,m11).
    klt(klt15,m12).
    klt(klt16,m13).
    klt(klt17,m14).
    klt(klt18,m15).
    klt(klt19,m16).
    klt(klt20,m16).
    klt(klt21,m12).
    klt(klt22,m13).
    klt(klt23,m14).
    klt(klt24,m15). 
    klt(klt25,m16).
    klt(klt26,m17).
    klt(klt27,m18).
    klt(klt28,m19).
    klt(klt29,m20).
    klt(klt30,m21).
    klt(klt31,m22).