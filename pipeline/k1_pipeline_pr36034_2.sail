// executing pipeline pr36034_2.c.out.dumped test 
val k1_pipeline_pr36034_2: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr36034_2() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let test: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000009c),        //goto 16a9c <test+0x27c>;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x79023080),        //sllw $r0 = $r0, 2 (0x2);;
     _32(0x71011040),        //addw $r0 = $r0, $r1;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x71011040),        //addw $r0 = $r0, $r1;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x780cffc0),        //zxwd $r3 = $r0;;
     _96(0x00000000800000f8e0040200),        //make $r1 = 253960 (0x3e008);;
     _32(0x6903f002),        //sxwd $r0 = $r2;;
     _32(0x3806f001),        //ld.xs $r1 = $r0[$r1];;
     _96(0x0000000080000117e0088200),        //make $r2 = 286216 (0x45e08);;
     _32(0x6903f003),        //sxwd $r0 = $r3;;
     _32(0x2707f002),        //sd.xs $r0[$r2] = $r1;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x79023080),        //sllw $r0 = $r0, 2 (0x2);;
     _32(0x71011040),        //addw $r0 = $r0, $r1;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x71011040),        //addw $r0 = $r0, $r1;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x780cffc0),        //zxwd $r3 = $r0;;
     _96(0x00000000800000f8e0040200),        //make $r1 = 253960 (0x3e008);;
     _32(0x6903f002),        //sxwd $r0 = $r2;;
     _32(0x3806f001),        //ld.xs $r1 = $r0[$r1];;
     _96(0x0000000080000117e0088200),        //make $r2 = 286216 (0x45e08);;
     _32(0x6903f003),        //sxwd $r0 = $r3;;
     _32(0x2707f002),        //sd.xs $r0[$r2] = $r1;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x79023080),        //sllw $r0 = $r0, 2 (0x2);;
     _32(0x71011040),        //addw $r0 = $r0, $r1;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71000080),        //addw $r0 = $r0, 2 (0x2);;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x71011040),        //addw $r0 = $r0, $r1;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71000080),        //addw $r0 = $r0, 2 (0x2);;
     _32(0x780cffc0),        //zxwd $r3 = $r0;;
     _96(0x00000000800000f8e0040200),        //make $r1 = 253960 (0x3e008);;
     _32(0x6903f002),        //sxwd $r0 = $r2;;
     _32(0x3806f001),        //ld.xs $r1 = $r0[$r1];;
     _96(0x0000000080000117e0088200),        //make $r2 = 286216 (0x45e08);;
     _32(0x6903f003),        //sxwd $r0 = $r3;;
     _32(0x2707f002),        //sd.xs $r0[$r2] = $r1;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x79023080),        //sllw $r0 = $r0, 2 (0x2);;
     _32(0x71011040),        //addw $r0 = $r0, $r1;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x710000c0),        //addw $r0 = $r0, 3 (0x3);;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x71011040),        //addw $r0 = $r0, $r1;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x710000c0),        //addw $r0 = $r0, 3 (0x3);;
     _32(0x780cffc0),        //zxwd $r3 = $r0;;
     _96(0x00000000800000f8e0040200),        //make $r1 = 253960 (0x3e008);;
     _32(0x6903f002),        //sxwd $r0 = $r2;;
     _32(0x3806f001),        //ld.xs $r1 = $r0[$r1];;
     _96(0x0000000080000117e0088200),        //make $r2 = 286216 (0x45e08);;
     _32(0x6903f003),        //sxwd $r0 = $r3;;
     _32(0x2707f002),        //sd.xs $r0[$r2] = $r1;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x79023080),        //sllw $r0 = $r0, 2 (0x2);;
     _32(0x71011040),        //addw $r0 = $r0, $r1;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71000100),        //addw $r0 = $r0, 4 (0x4);;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x71011040),        //addw $r0 = $r0, $r1;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71000100),        //addw $r0 = $r0, 4 (0x4);;
     _32(0x780cffc0),        //zxwd $r3 = $r0;;
     _96(0x00000000800000f8e0040200),        //make $r1 = 253960 (0x3e008);;
     _32(0x6903f002),        //sxwd $r0 = $r2;;
     _32(0x3806f001),        //ld.xs $r1 = $r0[$r1];;
     _96(0x0000000080000117e0088200),        //make $r2 = 286216 (0x45e08);;
     _32(0x6903f003),        //sxwd $r0 = $r3;;
     _32(0x2707f002),        //sd.xs $r0[$r2] = $r1;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x79023080),        //sllw $r0 = $r0, 2 (0x2);;
     _32(0x71011040),        //addw $r0 = $r0, $r1;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71000140),        //addw $r0 = $r0, 5 (0x5);;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x71011040),        //addw $r0 = $r0, $r1;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71000140),        //addw $r0 = $r0, 5 (0x5);;
     _32(0x780cffc0),        //zxwd $r3 = $r0;;
     _96(0x00000000800000f8e0040200),        //make $r1 = 253960 (0x3e008);;
     _32(0x6903f002),        //sxwd $r0 = $r2;;
     _32(0x3806f001),        //ld.xs $r1 = $r0[$r1];;
     _96(0x0000000080000117e0088200),        //make $r2 = 286216 (0x45e08);;
     _32(0x6903f003),        //sxwd $r0 = $r3;;
     _32(0x2707f002),        //sd.xs $r0[$r2] = $r1;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f401b100),        //compw.le $r0 = $r0, 4 (0x4);;
     _32(0x0c7fd880),        //cb.wnez $r0? 16830 <test+0x10>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x1fffff55),        //call 16820 <test>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000022),        //goto 16b60 <main+0xa0>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x10000018),        //goto 16b44 <main+0x84>;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x71011040),        //addw $r0 = $r0, $r1;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _96(0x0000000080000117e0048200),        //make $r1 = 286216 (0x45e08);;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x3802f001),        //ld.xs $r0 = $r0[$r1];;
     _96(0x05ff800080000000e0040000),        //make $r1 = 13830554455654793216 (0xbff0000000000000);;
     _32(0x7b030040),        //fcompd.une $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16b38 <main+0x78>;;
     _32(0x18000015),        //call 16b88 <abort>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f401b140),        //compw.le $r0 = $r0, 5 (0x5);;
     _32(0x0c7ff980),        //cb.wnez $r0? 16ae8 <main+0x28>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f401b100),        //compw.le $r0 = $r0, 4 (0x4);;
     _32(0x0c7ff700),        //cb.wnez $r0? 16adc <main+0x1c>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16f60 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18a90 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101011000000; //0x16ac0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101011000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101110001000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016ac0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
