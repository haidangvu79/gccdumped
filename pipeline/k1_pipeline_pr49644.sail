// executing pipeline pr49644.c.out.dumped test 
val k1_pipeline_pr49644: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr49644() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let main: list_I = 
 [|
     _32(0x6130a80c),        //addd $r12 = $r12, -352 (0xfffffea0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x61001e0c),        //addd $r0 = $r12, 120 (0x78);;
     _32(0x2701560c),        //sd 344 (0x158)[$r12] = $r0;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x27054e0c),        //sd 312 (0x138)[$r12] = $r1;;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _32(0x2701500c),        //sd 320 (0x140)[$r12] = $r0;;
     _96(0x01ff800080000000e0000000),        //make $r0 = 4607182418800017408 (0x3ff0000000000000);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x0200000080000000e0000000),        //make $r0 = 4611686018427387904 (0x4000000000000000);;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _96(0x0200400080000000e0000000),        //make $r0 = 4613937818241073152 (0x4008000000000000);;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _96(0x0200800080000000e0000000),        //make $r0 = 4616189618054758400 (0x4010000000000000);;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _96(0x0200a00080000000e0000000),        //make $r0 = 4617315517961601024 (0x4014000000000000);;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _96(0x0200c00080000000e0000000),        //make $r0 = 4618441417868443648 (0x4018000000000000);;
     _32(0x2701100c),        //sd 64 (0x40)[$r12] = $r0;;
     _96(0x0200e00080000000e0000000),        //make $r0 = 4619567317775286272 (0x401c000000000000);;
     _32(0x2701120c),        //sd 72 (0x48)[$r12] = $r0;;
     _96(0x0201000080000000e0000000),        //make $r0 = 4620693217682128896 (0x4020000000000000);;
     _32(0x2701140c),        //sd 80 (0x50)[$r12] = $r0;;
     _96(0x0201100080000000e0000000),        //make $r0 = 4621256167635550208 (0x4022000000000000);;
     _32(0x2701160c),        //sd 88 (0x58)[$r12] = $r0;;
     _96(0x0201200080000000e0000000),        //make $r0 = 4621819117588971520 (0x4024000000000000);;
     _32(0x2701180c),        //sd 96 (0x60)[$r12] = $r0;;
     _96(0x0201300080000000e0000000),        //make $r0 = 4622382067542392832 (0x4026000000000000);;
     _32(0x27011a0c),        //sd 104 (0x68)[$r12] = $r0;;
     _96(0x0201400080000000e0000000),        //make $r0 = 4622945017495814144 (0x4028000000000000);;
     _32(0x27011c0c),        //sd 112 (0x70)[$r12] = $r0;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x2701540c),        //sd 336 (0x150)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601530c),        //sw 332 (0x14c)[$r12] = $r0;;
     _32(0x10000013),        //goto 1696c <main+0x14c>;;
     _32(0x3800540c),        //ld $r0 = 336 (0x150)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705540c),        //sd 336 (0x150)[$r12] = $r1;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38044e0c),        //ld $r1 = 312 (0x138)[$r12];;
     _32(0x380c500c),        //ld $r3 = 320 (0x140)[$r12];;
     _32(0x58097040),        //fmuld $r2 = $r0, $r1;;
     _32(0x6a040003),        //copyd $r1 = $r3;;
     _32(0x580d7040),        //fmuld $r3 = $r0, $r1;;
     _32(0x3800560c),        //ld $r0 = 344 (0x158)[$r12];;
     _32(0x61040400),        //addd $r1 = $r0, 16 (0x10);;
     _32(0x2705560c),        //sd 344 (0x158)[$r12] = $r1;;
     _32(0x6a040003),        //copyd $r1 = $r3;;
     _32(0x27090000),        //sd 0 (0x0)[$r0] = $r2;;
     _32(0x27050200),        //sd 8 (0x8)[$r0] = $r1;;
     _32(0x3000530c),        //lwz $r0 = 332 (0x14c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601530c),        //sw 332 (0x14c)[$r12] = $r0;;
     _32(0x3000530c),        //lwz $r0 = 332 (0x14c)[$r12];;
     _64(0x00000000f401b140),        //compw.le $r0 = $r0, 5 (0x5);;
     _32(0x0c7ffac0),        //cb.wnez $r0? 16924 <main+0x104>;;
     _32(0x61001e0c),        //addd $r0 = $r12, 120 (0x78);;
     _32(0x61001800),        //addd $r0 = $r0, 96 (0x60);;
     _32(0x3804560c),        //ld $r1 = 344 (0x158)[$r12];;
     _32(0x7001a001),        //compd.ne $r0 = $r1, $r0;;
     _32(0x08000180),        //cb.dnez $r0? 169a4 <main+0x184>;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x61000c00),        //addd $r0 = $r0, 48 (0x30);;
     _32(0x3804540c),        //ld $r1 = 336 (0x150)[$r12];;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 169a8 <main+0x188>;;
     _32(0x18000007),        //call 169c0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130580c),        //addd $r12 = $r12, 352 (0x160);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16d98 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 188c8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100111000000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016820;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
