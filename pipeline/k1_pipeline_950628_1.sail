// executing pipeline 950628_1.c.out.dumped test 
val k1_pipeline_950628_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_950628_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let g: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2401040c),        //sb 16 (0x10)[$r12] = $r0;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x2401044c),        //sb 17 (0x11)[$r12] = $r0;;
     _32(0x60000003),        //make $r0 = 3 (0x3);;
     _32(0x2401048c),        //sb 18 (0x12)[$r12] = $r0;;
     _32(0x60000004),        //make $r0 = 4 (0x4);;
     _32(0x2501050c),        //sh 20 (0x14)[$r12] = $r0;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2800050c),        //lhz $r0 = 20 (0x14)[$r12];;
     _32(0x2501070c),        //sh 28 (0x1c)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x6103f001),        //insf $r0 = $r1, 31 (0x1f), 0 (0x0);;
     _32(0x2804070c),        //lhz $r1 = 28 (0x1c)[$r12];;
     _32(0x6203f801),        //insf $r0 = $r1, 47 (0x2f), 32 (0x20);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x1fffffe9),        //call 16820 <g>;;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _32(0x2505040c),        //sh 16 (0x10)[$r12] = $r1;;
     _32(0x6507f400),        //extfz $r1 = $r0, 31 (0x1f), 16 (0x10);;
     _32(0x2505048c),        //sh 18 (0x12)[$r12] = $r1;;
     _32(0x6603f800),        //extfz $r0 = $r0, 47 (0x2f), 32 (0x20);;
     _32(0x2501050c),        //sh 20 (0x14)[$r12] = $r0;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2800050c),        //lhz $r0 = 20 (0x14)[$r12];;
     _32(0x2501070c),        //sh 28 (0x1c)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x6103f001),        //insf $r0 = $r1, 31 (0x1f), 0 (0x0);;
     _32(0x2804070c),        //lhz $r1 = 28 (0x1c)[$r12];;
     _32(0x6203f801),        //insf $r0 = $r1, 47 (0x2f), 32 (0x20);;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1fffffe5),        //call 16870 <f>;;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _32(0x2505080c),        //sh 32 (0x20)[$r12] = $r1;;
     _32(0x6507f400),        //extfz $r1 = $r0, 31 (0x1f), 16 (0x10);;
     _32(0x2505088c),        //sh 34 (0x22)[$r12] = $r1;;
     _32(0x6603f800),        //extfz $r0 = $r0, 47 (0x2f), 32 (0x20);;
     _32(0x2501090c),        //sh 36 (0x24)[$r12] = $r0;;
     _32(0x2000080c),        //lbz $r0 = 32 (0x20)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c000940),        //cb.wnez $r0? 1699c <main+0xcc>;;
     _32(0x1fffffd9),        //call 16870 <f>;;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _32(0x25050a0c),        //sh 40 (0x28)[$r12] = $r1;;
     _32(0x6507f400),        //extfz $r1 = $r0, 31 (0x1f), 16 (0x10);;
     _32(0x25050a8c),        //sh 42 (0x2a)[$r12] = $r1;;
     _32(0x6603f800),        //extfz $r0 = $r0, 47 (0x2f), 32 (0x20);;
     _32(0x25010b0c),        //sh 44 (0x2c)[$r12] = $r0;;
     _32(0x20000a4c),        //lbz $r0 = 41 (0x29)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000000f001b080),        //compw.ne $r0 = $r0, 2 (0x2);;
     _32(0x0c000640),        //cb.wnez $r0? 1699c <main+0xcc>;;
     _32(0x1fffffcd),        //call 16870 <f>;;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _32(0x25050c0c),        //sh 48 (0x30)[$r12] = $r1;;
     _32(0x6507f400),        //extfz $r1 = $r0, 31 (0x1f), 16 (0x10);;
     _32(0x25050c8c),        //sh 50 (0x32)[$r12] = $r1;;
     _32(0x6603f800),        //extfz $r0 = $r0, 47 (0x2f), 32 (0x20);;
     _32(0x25010d0c),        //sh 52 (0x34)[$r12] = $r0;;
     _32(0x20000c8c),        //lbz $r0 = 50 (0x32)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000000f001b0c0),        //compw.ne $r0 = $r0, 3 (0x3);;
     _32(0x0c000340),        //cb.wnez $r0? 1699c <main+0xcc>;;
     _32(0x1fffffc1),        //call 16870 <f>;;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _32(0x25050e0c),        //sh 56 (0x38)[$r12] = $r1;;
     _32(0x6507f400),        //extfz $r1 = $r0, 31 (0x1f), 16 (0x10);;
     _32(0x25050e8c),        //sh 58 (0x3a)[$r12] = $r1;;
     _32(0x6603f800),        //extfz $r0 = $r0, 47 (0x2f), 32 (0x20);;
     _32(0x25010f0c),        //sh 60 (0x3c)[$r12] = $r0;;
     _32(0x28000f0c),        //lhz $r0 = 60 (0x3c)[$r12];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _64(0x00000000f101b100),        //compw.eq $r0 = $r0, 4 (0x4);;
     _32(0x0c000080),        //cb.wnez $r0? 169a0 <main+0xd0>;;
     _32(0x18000003),        //call 169a8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 169c8 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16dc8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18aa0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0xf838ffc0),        //zxwd $r14 = $r0
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x98000161),        //call 16f60 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16a04 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18aa0 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100011010000; //0x168d0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(g, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100001110000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100011010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100110101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100111001000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000168d0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
