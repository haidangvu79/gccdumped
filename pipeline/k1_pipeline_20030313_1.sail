// executing pipeline 20030313_1.c.out.dumped test 
val k1_pipeline_20030313_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20030313_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let bar: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let foo: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _64(0x00000000f101b300),        //compw.eq $r0 = $r0, 12 (0xc);;
     _32(0x0c000080),        //cb.wnez $r0? 16870 <foo+0x28>;;
     _32(0x180000c5),        //call 16b80 <abort>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x60010040),        //compd.ne $r0 = $r0, 1 (0x1);;
     _32(0x08000180),        //cb.dnez $r0? 16894 <foo+0x4c>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x610102c0),        //compd.eq $r0 = $r0, 11 (0xb);;
     _32(0x08000080),        //cb.dnez $r0? 16898 <foo+0x50>;;
     _32(0x180000bb),        //call 16b80 <abort>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61000400),        //addd $r0 = $r0, 16 (0x10);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x60010080),        //compd.ne $r0 = $r0, 2 (0x2);;
     _32(0x08000180),        //cb.dnez $r0? 168c0 <foo+0x78>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61000600),        //addd $r0 = $r0, 24 (0x18);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x61010300),        //compd.eq $r0 = $r0, 12 (0xc);;
     _32(0x08000080),        //cb.dnez $r0? 168c4 <foo+0x7c>;;
     _32(0x180000b0),        //call 16b80 <abort>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61000800),        //addd $r0 = $r0, 32 (0x20);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x600100c0),        //compd.ne $r0 = $r0, 3 (0x3);;
     _32(0x08000180),        //cb.dnez $r0? 168ec <foo+0xa4>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61000a00),        //addd $r0 = $r0, 40 (0x28);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x61010340),        //compd.eq $r0 = $r0, 13 (0xd);;
     _32(0x08000080),        //cb.dnez $r0? 168f0 <foo+0xa8>;;
     _32(0x180000a5),        //call 16b80 <abort>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61000c00),        //addd $r0 = $r0, 48 (0x30);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x60010100),        //compd.ne $r0 = $r0, 4 (0x4);;
     _32(0x08000180),        //cb.dnez $r0? 16918 <foo+0xd0>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61000e00),        //addd $r0 = $r0, 56 (0x38);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x61010380),        //compd.eq $r0 = $r0, 14 (0xe);;
     _32(0x08000080),        //cb.dnez $r0? 1691c <foo+0xd4>;;
     _32(0x1800009a),        //call 16b80 <abort>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61001000),        //addd $r0 = $r0, 64 (0x40);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x60010140),        //compd.ne $r0 = $r0, 5 (0x5);;
     _32(0x08000180),        //cb.dnez $r0? 16944 <foo+0xfc>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61001200),        //addd $r0 = $r0, 72 (0x48);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x610103c0),        //compd.eq $r0 = $r0, 15 (0xf);;
     _32(0x08000080),        //cb.dnez $r0? 16948 <foo+0x100>;;
     _32(0x1800008f),        //call 16b80 <abort>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61001400),        //addd $r0 = $r0, 80 (0x50);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x60010180),        //compd.ne $r0 = $r0, 6 (0x6);;
     _32(0x08000180),        //cb.dnez $r0? 16970 <foo+0x128>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61001600),        //addd $r0 = $r0, 88 (0x58);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x61010400),        //compd.eq $r0 = $r0, 16 (0x10);;
     _32(0x08000080),        //cb.dnez $r0? 16974 <foo+0x12c>;;
     _32(0x18000084),        //call 16b80 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130a80c),        //addd $r12 = $r12, -352 (0xfffffea0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601570c),        //sw 348 (0x15c)[$r12] = $r0;;
     _32(0x3000570c),        //lwz $r0 = 348 (0x15c)[$r12];;
     _32(0x71040040),        //addw $r1 = $r0, 1 (0x1);;
     _32(0x2605570c),        //sw 348 (0x15c)[$r12] = $r1;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104580c),        //addd $r1 = $r12, 352 (0x160);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x2705ae00),        //sd -328 (0xfffffeb8)[$r0] = $r1;;
     _32(0x3000570c),        //lwz $r0 = 348 (0x15c)[$r12];;
     _32(0x71040040),        //addw $r1 = $r0, 1 (0x1);;
     _32(0x2605570c),        //sw 348 (0x15c)[$r12] = $r1;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104580c),        //addd $r1 = $r12, 352 (0x160);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x6004000b),        //make $r1 = 11 (0xb);;
     _32(0x2705ae00),        //sd -328 (0xfffffeb8)[$r0] = $r1;;
     _32(0x3000570c),        //lwz $r0 = 348 (0x15c)[$r12];;
     _32(0x71040040),        //addw $r1 = $r0, 1 (0x1);;
     _32(0x2605570c),        //sw 348 (0x15c)[$r12] = $r1;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104580c),        //addd $r1 = $r12, 352 (0x160);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _32(0x2705ae00),        //sd -328 (0xfffffeb8)[$r0] = $r1;;
     _32(0x3000570c),        //lwz $r0 = 348 (0x15c)[$r12];;
     _32(0x71040040),        //addw $r1 = $r0, 1 (0x1);;
     _32(0x2605570c),        //sw 348 (0x15c)[$r12] = $r1;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104580c),        //addd $r1 = $r12, 352 (0x160);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x6004000c),        //make $r1 = 12 (0xc);;
     _32(0x2705ae00),        //sd -328 (0xfffffeb8)[$r0] = $r1;;
     _32(0x3000570c),        //lwz $r0 = 348 (0x15c)[$r12];;
     _32(0x71040040),        //addw $r1 = $r0, 1 (0x1);;
     _32(0x2605570c),        //sw 348 (0x15c)[$r12] = $r1;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104580c),        //addd $r1 = $r12, 352 (0x160);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x60040003),        //make $r1 = 3 (0x3);;
     _32(0x2705ae00),        //sd -328 (0xfffffeb8)[$r0] = $r1;;
     _32(0x1fffff74),        //call 16820 <bar>;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x3000570c),        //lwz $r0 = 348 (0x15c)[$r12];;
     _32(0x71080040),        //addw $r2 = $r0, 1 (0x1);;
     _32(0x2609570c),        //sw 348 (0x15c)[$r12] = $r2;;
     _32(0x38040001),        //ld $r1 = 0 (0x0)[$r1];;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6108580c),        //addd $r2 = $r12, 352 (0x160);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x2705ae00),        //sd -328 (0xfffffeb8)[$r0] = $r1;;
     _32(0x3000570c),        //lwz $r0 = 348 (0x15c)[$r12];;
     _32(0x71040040),        //addw $r1 = $r0, 1 (0x1);;
     _32(0x2605570c),        //sw 348 (0x15c)[$r12] = $r1;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104580c),        //addd $r1 = $r12, 352 (0x160);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x60040004),        //make $r1 = 4 (0x4);;
     _32(0x2705ae00),        //sd -328 (0xfffffeb8)[$r0] = $r1;;
     _32(0x1fffff60),        //call 16820 <bar>;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x3000570c),        //lwz $r0 = 348 (0x15c)[$r12];;
     _32(0x71080040),        //addw $r2 = $r0, 1 (0x1);;
     _32(0x2609570c),        //sw 348 (0x15c)[$r12] = $r2;;
     _32(0x38040201),        //ld $r1 = 8 (0x8)[$r1];;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6108580c),        //addd $r2 = $r12, 352 (0x160);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x2705ae00),        //sd -328 (0xfffffeb8)[$r0] = $r1;;
     _32(0x3000570c),        //lwz $r0 = 348 (0x15c)[$r12];;
     _32(0x71040040),        //addw $r1 = $r0, 1 (0x1);;
     _32(0x2605570c),        //sw 348 (0x15c)[$r12] = $r1;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104580c),        //addd $r1 = $r12, 352 (0x160);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x60040005),        //make $r1 = 5 (0x5);;
     _32(0x2705ae00),        //sd -328 (0xfffffeb8)[$r0] = $r1;;
     _32(0x1fffff4c),        //call 16820 <bar>;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x3000570c),        //lwz $r0 = 348 (0x15c)[$r12];;
     _32(0x71080040),        //addw $r2 = $r0, 1 (0x1);;
     _32(0x2609570c),        //sw 348 (0x15c)[$r12] = $r2;;
     _32(0x38040401),        //ld $r1 = 16 (0x10)[$r1];;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6108580c),        //addd $r2 = $r12, 352 (0x160);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x2705ae00),        //sd -328 (0xfffffeb8)[$r0] = $r1;;
     _32(0x3000570c),        //lwz $r0 = 348 (0x15c)[$r12];;
     _32(0x71040040),        //addw $r1 = $r0, 1 (0x1);;
     _32(0x2605570c),        //sw 348 (0x15c)[$r12] = $r1;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104580c),        //addd $r1 = $r12, 352 (0x160);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x60040006),        //make $r1 = 6 (0x6);;
     _32(0x2705ae00),        //sd -328 (0xfffffeb8)[$r0] = $r1;;
     _32(0x1fffff38),        //call 16820 <bar>;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x3000570c),        //lwz $r0 = 348 (0x15c)[$r12];;
     _32(0x71080040),        //addw $r2 = $r0, 1 (0x1);;
     _32(0x2609570c),        //sw 348 (0x15c)[$r12] = $r2;;
     _32(0x38040601),        //ld $r1 = 24 (0x18)[$r1];;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6108580c),        //addd $r2 = $r12, 352 (0x160);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x2705ae00),        //sd -328 (0xfffffeb8)[$r0] = $r1;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x3004570c),        //lwz $r1 = 348 (0x15c)[$r12];;
     _32(0x1fffff35),        //call 16848 <foo>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16ba0 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16fa0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18c78 <_exit>
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
     _32(0x98000161),        //call 17138 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16bdc <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18c78 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100110001000; //0x16988
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100001001000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100110001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101110000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110101110100000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016988;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
