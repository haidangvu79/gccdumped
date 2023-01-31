// executing pipeline 920501_9.c.out.dumped test 
val k1_pipeline_920501_9: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_920501_9() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let proc1: list_I = 
 [|
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x0fd00000)        //ret ;;
 |];

let proc2: list_I = 
 [|
     _64(0x00048d15e0009e00),        //make $r0 = 305419896 (0x12345678);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let proc3: list_I = 
 [|
     _96(0x0555de6687448d15e0009e00),        //make $r0 = 12302652056957900408 (0xaabbccdd12345678);;
     _32(0x0fd00000)        //ret ;;
 |];

let proc4: list_I = 
 [|
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x0fd00000)        //ret ;;
 |];

let proc5: list_I = 
 [|
     _64(0x002aaef3e0003740),        //make $r0 = 2864434397 (0xaabbccdd);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let print_longlong: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2705020c),        //sd 8 (0x8)[$r12] = $r1;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x7b022800),        //srld $r0 = $r0, 32 (0x20);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x08800300),        //cb.deqz $r0? 168b4 <print_longlong+0x54>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _64(0x003fffffe800ffc0),        //andd $r0 = $r0, 4294967295 (0xffffffff);;
     _32(0x6a0c0000),        //copyd $r3 = $r0;;
     _32(0x3808060c),        //ld $r2 = 24 (0x18)[$r12];;
     _96(0x00000000800000fce004f000),        //make $r1 = 259008 (0x3f3c0);;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x180001f1),        //call 17070 <sprintf>;;
     _32(0x1000000a),        //goto 168d8 <print_longlong+0x78>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _64(0x003fffffe800ffc0),        //andd $r0 = $r0, 4294967295 (0xffffffff);;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _96(0x00000000800000fce004f400),        //make $r1 = 259024 (0x3f3d0);;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x180001e7),        //call 17070 <sprintf>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x1fffffc9),        //call 16820 <proc1>;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x6a000002),        //copyd $r0 = $r2;;
     _32(0x1fffffd4),        //call 16860 <print_longlong>;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x00000000800000fce000f600),        //make $r0 = 259032 (0x3f3d8);;
     _32(0x180001fa),        //call 17110 <strcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16938 <main+0x48>;;
     _32(0x1800003f),        //call 16a30 <abort>;;
     _32(0x1fffffbc),        //call 16828 <proc2>;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x6a000002),        //copyd $r0 = $r2;;
     _32(0x1fffffc5),        //call 16860 <print_longlong>;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x00000000800000fce000f800),        //make $r0 = 259040 (0x3f3e0);;
     _32(0x180001eb),        //call 17110 <strcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16974 <main+0x84>;;
     _32(0x18000030),        //call 16a30 <abort>;;
     _32(0x1fffffb1),        //call 16838 <proc3>;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x6a000002),        //copyd $r0 = $r2;;
     _32(0x1fffffb6),        //call 16860 <print_longlong>;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x00000000800000fce000fc00),        //make $r0 = 259056 (0x3f3f0);;
     _32(0x180001dc),        //call 17110 <strcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 169b0 <main+0xc0>;;
     _32(0x18000021),        //call 16a30 <abort>;;
     _32(0x1fffffa6),        //call 16848 <proc4>;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x6a000002),        //copyd $r0 = $r2;;
     _32(0x1fffffa7),        //call 16860 <print_longlong>;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x00000000800000fde0000200),        //make $r0 = 259080 (0x3f408);;
     _32(0x180001cd),        //call 17110 <strcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 169ec <main+0xfc>;;
     _32(0x18000012),        //call 16a30 <abort>;;
     _32(0x1fffff99),        //call 16850 <proc5>;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x6a000002),        //copyd $r0 = $r2;;
     _32(0x1fffff98),        //call 16860 <print_longlong>;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x00000000800000fde0000800),        //make $r0 = 259104 (0x3f420);;
     _32(0x180001be),        //call 17110 <strcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16a28 <main+0x138>;;
     _32(0x18000003),        //call 16a30 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16a50 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16e50 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980023af),        //call 1f900 <_exit>
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
     _32(0x98000b0b),        //call 19690 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fde0000c00),        //make $r0 = 259120 (0x3f430);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16a8c <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x9800239d),        //call 1f900 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100011110000; //0x168f0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(proc1, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(proc2, 0b00010110100000101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(proc3, 0b00010110100000111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(proc4, 0b00010110100001001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(proc5, 0b00010110100001010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(print_longlong, 0b00010110100001100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100011110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101000110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110101001010000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000168f0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
