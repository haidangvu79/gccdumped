// executing pipeline 20020615_1.c.out.dumped test 
val k1_pipeline_20020615_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20020615_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let line_hints: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x2709020c),        //sd 8 (0x8)[$r12] = $r2;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x75010040),        //sbfd $r0 = $r0, $r1;;
     _32(0x2701160c),        //sd 88 (0x58)[$r12] = $r0;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x38040200),        //ld $r1 = 8 (0x8)[$r0];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _32(0x75010040),        //sbfd $r0 = $r0, $r1;;
     _32(0x2701140c),        //sd 80 (0x50)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _32(0x2601130c),        //sw 76 (0x4c)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x30000200),        //lwz $r0 = 8 (0x8)[$r0];;
     _32(0x2601120c),        //sw 72 (0x48)[$r12] = $r0;;
     _32(0x3000130c),        //lwz $r0 = 76 (0x4c)[$r12];;
     _32(0x0c800100),        //cb.weqz $r0? 1688c <line_hints+0x6c>;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x65000000),        //negd $r0 = $r0;;
     _32(0x2701160c),        //sd 88 (0x58)[$r12] = $r0;;
     _32(0x3000120c),        //lwz $r0 = 72 (0x48)[$r12];;
     _32(0x0c800100),        //cb.weqz $r0? 168a0 <line_hints+0x80>;;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _32(0x65000000),        //negd $r0 = $r0;;
     _32(0x2701140c),        //sd 80 (0x50)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x08800340),        //cb.deqz $r0? 168dc <line_hints+0xbc>;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x3000130c),        //lwz $r0 = 76 (0x4c)[$r12];;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _32(0x2701160c),        //sd 88 (0x58)[$r12] = $r0;;
     _32(0x3000120c),        //lwz $r0 = 72 (0x48)[$r12];;
     _32(0x2601130c),        //sw 76 (0x4c)[$r12] = $r0;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x2701140c),        //sd 80 (0x50)[$r12] = $r0;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _32(0x2601120c),        //sw 72 (0x48)[$r12] = $r0;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x64000000),        //absd $r0 = $r0;;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _32(0x64000000),        //absd $r0 = $r0;;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _32(0x08800480),        //cb.deqz $r0? 16940 <line_hints+0x120>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x7a022100),        //srad $r0 = $r0, 4 (0x4);;
     _32(0x38040a0c),        //ld $r1 = 40 (0x28)[$r12];;
     _32(0x7501a001),        //compd.gt $r0 = $r1, $r0;;
     _32(0x08000340),        //cb.dnez $r0? 16940 <line_hints+0x120>;;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _32(0x0a0000c0),        //cb.dlez $r0? 16920 <line_hints+0x100>;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x10000002),        //goto 16924 <line_hints+0x104>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2601110c),        //sw 68 (0x44)[$r12] = $r0;;
     _32(0x3000130c),        //lwz $r0 = 76 (0x4c)[$r12];;
     _32(0x0c800680),        //cb.weqz $r0? 16994 <line_hints+0x174>;;
     _32(0x3000110c),        //lwz $r0 = 68 (0x44)[$r12];;
     _32(0x7c0000c0),        //xorw $r0 = $r0, 3 (0x3);;
     _32(0x2601110c),        //sw 68 (0x44)[$r12] = $r0;;
     _32(0x10000016),        //goto 16994 <line_hints+0x174>;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x08800480),        //cb.deqz $r0? 1698c <line_hints+0x16c>;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x7a022100),        //srad $r0 = $r0, 4 (0x4);;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x7501a001),        //compd.gt $r0 = $r1, $r0;;
     _32(0x08000340),        //cb.dnez $r0? 1698c <line_hints+0x16c>;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x098000c0),        //cb.dgez $r0? 1696c <line_hints+0x14c>;;
     _32(0x60000008),        //make $r0 = 8 (0x8);;
     _32(0x10000002),        //goto 16970 <line_hints+0x150>;;
     _32(0x60000004),        //make $r0 = 4 (0x4);;
     _32(0x2601110c),        //sw 68 (0x44)[$r12] = $r0;;
     _32(0x3000120c),        //lwz $r0 = 72 (0x48)[$r12];;
     _32(0x0c8001c0),        //cb.weqz $r0? 16994 <line_hints+0x174>;;
     _32(0x3000110c),        //lwz $r0 = 68 (0x44)[$r12];;
     _32(0x7c000300),        //xorw $r0 = $r0, 12 (0xc);;
     _32(0x2601110c),        //sw 68 (0x44)[$r12] = $r0;;
     _32(0x10000003),        //goto 16994 <line_hints+0x174>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601110c),        //sw 68 (0x44)[$r12] = $r0;;
     _32(0x3000110c),        //lwz $r0 = 68 (0x44)[$r12];;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000f8e0000600),        //make $r0 = 253976 (0x3e018);;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _96(0x00000000800000f8e0040200),        //make $r1 = 253960 (0x3e008);;
     _96(0x00000000800000f8e0001200),        //make $r0 = 254024 (0x3e048);;
     _32(0x1fffff93),        //call 16820 <line_hints>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c000740),        //cb.wnez $r0? 16a58 <main+0xb8>;;
     _96(0x00000000800000f8e0001500),        //make $r0 = 254036 (0x3e054);;
     _96(0x00000000800000f8e0040a00),        //make $r1 = 253992 (0x3e028);;
     _96(0x00000000800000f8e0080e00),        //make $r2 = 254008 (0x3e038);;
     _32(0x1fffff85),        //call 16820 <line_hints>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f001b200),        //compw.ne $r0 = $r0, 8 (0x8);;
     _32(0x0c0003c0),        //cb.wnez $r0? 16a58 <main+0xb8>;;
     _96(0x00000000800000f8e0001800),        //make $r0 = 254048 (0x3e060);;
     _96(0x00000000800000f8e0040a00),        //make $r1 = 253992 (0x3e028);;
     _96(0x00000000800000f8e0080e00),        //make $r2 = 254008 (0x3e038);;
     _32(0x1fffff77),        //call 16820 <line_hints>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b100),        //compw.eq $r0 = $r0, 4 (0x4);;
     _32(0x0c000080),        //cb.wnez $r0? 16a5c <main+0xbc>;;
     _32(0x18000004),        //call 16a68 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 16a88 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16e88 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18b60 <_exit>
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
     _32(0x98000161),        //call 17020 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fde0000000),        //make $r0 = 259072 (0x3f400);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16ac4 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18b60 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100110100000; //0x169a0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(line_hints, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100110100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101001101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110101010001000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000169a0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
