// executing pipeline cvt_1.c.out.dumped test 
val k1_pipeline_cvt_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_cvt_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let g1: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x46033000),        //fixedd.rz $r0 = $r0, 0 (0x0);;
     _32(0x44030000),        //floatd.rn $r0 = $r0, 0 (0x0);;
     _32(0x46033000),        //fixedd.rz $r0 = $r0, 0 (0x0);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let g2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x46033000),        //fixedd.rz $r0 = $r0, 0 (0x0);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2739020c),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x44030000),        //floatd.rn $r0 = $r0, 0 (0x0);;
     _32(0x1fffffeb),        //call 16820 <g1>;;
     _32(0x6a380000),        //copyd $r14 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x44030000),        //floatd.rn $r0 = $r0, 0 (0x0);;
     _32(0x1fffffef),        //call 16840 <g2>;;
     _32(0x7101a00e),        //compd.eq $r0 = $r14, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16894 <f+0x3c>;;
     _32(0x18000026),        //call 16928 <abort>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x44030000),        //floatd.rn $r0 = $r0, 0 (0x0);;
     _32(0x1fffffe9),        //call 16840 <g2>;;
     _32(0x44030000),        //floatd.rn $r0 = $r0, 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _64(0x0001d6f3e0004540),        //make $r0 = 123456789 (0x75bcd15);;
     _32(0x1fffffe2),        //call 16858 <f>;;
     _96(0x020ceb7985150000e0040000),        //make $r1 = 4728057454347157504 (0x419d6f3454000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 168ec <main+0x34>;;
     _32(0x18000010),        //call 16928 <abort>;;
     _64(0x0001d6f3e0004540),        //make $r0 = 123456789 (0x75bcd15);;
     _32(0x1fffffd9),        //call 16858 <f>;;
     _32(0x6a380000),        //copyd $r14 = $r0;;
     _96(0x020ceb7985150000e0000000),        //make $r0 = 4728057454347157504 (0x419d6f3454000000);;
     _32(0x1fffffce),        //call 16840 <g2>;;
     _32(0x44030000),        //floatd.rn $r0 = $r0, 0 (0x0);;
     _32(0x7a03000e),        //fcompd.oeq $r0 = $r14, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 1691c <main+0x64>;;
     _32(0x18000004),        //call 16928 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 16948 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16d48 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18a20 <_exit>
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
     _32(0x98000161),        //call 16ee0 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16984 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18a20 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100010111000; //0x168b8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(g1, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(g2, 0b00010110100001000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100001011000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100100101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100101001000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000168b8;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
