// executing pipeline pr85582_3.c.out.dumped test 
val k1_pipeline_pr85582_3: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr85582_3() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let f1: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2801040c),        //sq 16 (0x10)[$r12] = $r0r1;;
     _32(0x2609020c),        //sw 8 (0x8)[$r12] = $r2;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x7800ff80),        //andw $r0 = $r0, -2 (0xfffffffe);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x68181000),        //andd $r6 = $r0, 64 (0x40);;
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x7b0a2041),        //srld $r2 = $r1, 1 (0x1);;
     _32(0x6c04ffc0),        //notd $r1 = $r0;;
     _32(0x7b066042),        //srld $r1 = $r2, $r1;;
     _32(0x3808060c),        //ld $r2 = 24 (0x18)[$r12];;
     _32(0x79166002),        //slld $r5 = $r2, $r0;;
     _32(0x7a150141),        //ord $r5 = $r1, $r5;;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x79126001),        //slld $r4 = $r1, $r0;;
     _32(0x6a000004),        //copyd $r0 = $r4;;
     _32(0x6a040006),        //copyd $r1 = $r6;;
     _32(0x70160001),        //cmoved.dnez $r1? $r5 = $r0;;
     _32(0x6a000006),        //copyd $r0 = $r6;;
     _32(0x701200c0),        //cmoved.dnez $r0? $r4 = $r3;;
     _32(0x6a000004),        //copyd $r0 = $r4;;
     _32(0x6a040005),        //copyd $r1 = $r5;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2801040c),        //sq 16 (0x10)[$r12] = $r0r1;;
     _32(0x2609020c),        //sw 8 (0x8)[$r12] = $r2;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x7800ff80),        //andw $r0 = $r0, -2 (0xfffffffe);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x68181000),        //andd $r6 = $r0, 64 (0x40);;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x7a062fc1),        //srad $r1 = $r1, 63 (0x3f);;
     _32(0x3808060c),        //ld $r2 = 24 (0x18)[$r12];;
     _32(0x790e2042),        //slld $r3 = $r2, 1 (0x1);;
     _32(0x6c08ffc0),        //notd $r2 = $r0;;
     _32(0x790a6083),        //slld $r2 = $r3, $r2;;
     _32(0x380c040c),        //ld $r3 = 16 (0x10)[$r12];;
     _32(0x7b126003),        //srld $r4 = $r3, $r0;;
     _32(0x7a110102),        //ord $r4 = $r2, $r4;;
     _32(0x3808060c),        //ld $r2 = 24 (0x18)[$r12];;
     _32(0x7a166002),        //srad $r5 = $r2, $r0;;
     _32(0x6a000005),        //copyd $r0 = $r5;;
     _32(0x6a080006),        //copyd $r2 = $r6;;
     _32(0x70120002),        //cmoved.dnez $r2? $r4 = $r0;;
     _32(0x6a000006),        //copyd $r0 = $r6;;
     _32(0x70160040),        //cmoved.dnez $r0? $r5 = $r1;;
     _32(0x6a000004),        //copyd $r0 = $r4;;
     _32(0x6a040005),        //copyd $r1 = $r5;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let f3: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2801040c),        //sq 16 (0x10)[$r12] = $r0r1;;
     _32(0x2609020c),        //sw 8 (0x8)[$r12] = $r2;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x7800ff80),        //andw $r0 = $r0, -2 (0xfffffffe);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x68181000),        //andd $r6 = $r0, 64 (0x40);;
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x790a2041),        //slld $r2 = $r1, 1 (0x1);;
     _32(0x6c04ffc0),        //notd $r1 = $r0;;
     _32(0x79066042),        //slld $r1 = $r2, $r1;;
     _32(0x3808040c),        //ld $r2 = 16 (0x10)[$r12];;
     _32(0x7b126002),        //srld $r4 = $r2, $r0;;
     _32(0x7a110101),        //ord $r4 = $r1, $r4;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x7b166001),        //srld $r5 = $r1, $r0;;
     _32(0x6a000005),        //copyd $r0 = $r5;;
     _32(0x6a040006),        //copyd $r1 = $r6;;
     _32(0x70120001),        //cmoved.dnez $r1? $r4 = $r0;;
     _32(0x6a000006),        //copyd $r0 = $r6;;
     _32(0x701600c0),        //cmoved.dnez $r0? $r5 = $r3;;
     _32(0x6a000004),        //copyd $r0 = $r4;;
     _32(0x6a040005),        //copyd $r1 = $r5;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _96(0x0010000080000000e0040000),        //make $r1 = 144115188075855872 (0x200000000000000);;
     _32(0x2801140c),        //sq 80 (0x50)[$r12] = $r0r1;;
     _32(0x60080005),        //make $r2 = 5 (0x5);;
     _32(0x3c00140c),        //lq $r0r1 = 80 (0x50)[$r12];;
     _32(0x1fffffa6),        //call 16820 <f1>;;
     _32(0x08000180),        //cb.dnez $r0? 169a4 <main+0x44>;;
     _96(0x0100000080000000e0080000),        //make $r2 = 2305843009213693952 (0x2000000000000000);;
     _32(0x7001a081),        //compd.ne $r0 = $r1, $r2;;
     _32(0x08800080),        //cb.deqz $r0? 169a8 <main+0x48>;;
     _32(0x18000067),        //call 16b40 <abort>;;
     _96(0x0010000080000000e0000000),        //make $r0 = 144115188075855872 (0x200000000000000);;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _32(0x2801100c),        //sq 64 (0x40)[$r12] = $r0r1;;
     _32(0x3c00100c),        //lq $r0r1 = 64 (0x40)[$r12];;
     _32(0x60080040),        //make $r2 = 64 (0x40);;
     _32(0x1fffff97),        //call 16820 <f1>;;
     _32(0x08000180),        //cb.dnez $r0? 169e0 <main+0x80>;;
     _96(0x0010000080000000e0080000),        //make $r2 = 144115188075855872 (0x200000000000000);;
     _32(0x7001a081),        //compd.ne $r0 = $r1, $r2;;
     _32(0x08800080),        //cb.deqz $r0? 169e4 <main+0x84>;;
     _32(0x18000058),        //call 16b40 <abort>;;
     _32(0x3c00100c),        //lq $r0r1 = 64 (0x40)[$r12];;
     _32(0x60080042),        //make $r2 = 66 (0x42);;
     _32(0x1fffff8d),        //call 16820 <f1>;;
     _32(0x08000180),        //cb.dnez $r0? 16a08 <main+0xa8>;;
     _96(0x0040000080000000e0080000),        //make $r2 = 576460752303423488 (0x800000000000000);;
     _32(0x7001a081),        //compd.ne $r0 = $r1, $r2;;
     _32(0x08800080),        //cb.deqz $r0? 16a0c <main+0xac>;;
     _32(0x1800004e),        //call 16b40 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _96(0x0400000080000000e0040000),        //make $r1 = 9223372036854775808 (0x8000000000000000);;
     _32(0x28010c0c),        //sq 48 (0x30)[$r12] = $r0r1;;
     _32(0x60080005),        //make $r2 = 5 (0x5);;
     _32(0x3c000c0c),        //lq $r0r1 = 48 (0x30)[$r12];;
     _32(0x1fffff98),        //call 16888 <f2>;;
     _32(0x08000180),        //cb.dnez $r0? 16a44 <main+0xe4>;;
     _96(0x07c0000080000000e0080000),        //make $r2 = 17870283321406128128 (0xf800000000000000);;
     _32(0x7001a081),        //compd.ne $r0 = $r1, $r2;;
     _32(0x08800080),        //cb.deqz $r0? 16a48 <main+0xe8>;;
     _32(0x1800003f),        //call 16b40 <abort>;;
     _32(0x60080040),        //make $r2 = 64 (0x40);;
     _32(0x3c000c0c),        //lq $r0r1 = 48 (0x30)[$r12];;
     _32(0x1fffff8e),        //call 16888 <f2>;;
     _96(0x0400000080000000e0080000),        //make $r2 = 9223372036854775808 (0x8000000000000000);;
     _32(0x7009a080),        //compd.ne $r2 = $r0, $r2;;
     _32(0x080000c2),        //cb.dnez $r2? 16a70 <main+0x110>;;
     _32(0x6001ffc1),        //compd.ne $r0 = $r1, -1 (0xffffffff);;
     _32(0x08800080),        //cb.deqz $r0? 16a74 <main+0x114>;;
     _32(0x18000034),        //call 16b40 <abort>;;
     _32(0x60080042),        //make $r2 = 66 (0x42);;
     _32(0x3c000c0c),        //lq $r0r1 = 48 (0x30)[$r12];;
     _32(0x1fffff83),        //call 16888 <f2>;;
     _96(0x0700000080000000e0080000),        //make $r2 = 16140901064495857664 (0xe000000000000000);;
     _32(0x7009a080),        //compd.ne $r2 = $r0, $r2;;
     _32(0x080000c2),        //cb.dnez $r2? 16a9c <main+0x13c>;;
     _32(0x6001ffc1),        //compd.ne $r0 = $r1, -1 (0xffffffff);;
     _32(0x08800080),        //cb.deqz $r0? 16aa0 <main+0x140>;;
     _32(0x18000029),        //call 16b40 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _96(0x0400000080000000e0040000),        //make $r1 = 9223372036854775808 (0x8000000000000000);;
     _32(0x2801080c),        //sq 32 (0x20)[$r12] = $r0r1;;
     _32(0x3c000c0c),        //lq $r0r1 = 48 (0x30)[$r12];;
     _32(0x60080005),        //make $r2 = 5 (0x5);;
     _32(0x1fffff8f),        //call 168f8 <f3>;;
     _32(0x08000180),        //cb.dnez $r0? 16ad8 <main+0x178>;;
     _96(0x0040000080000000e0080000),        //make $r2 = 576460752303423488 (0x800000000000000);;
     _32(0x7001a081),        //compd.ne $r0 = $r1, $r2;;
     _32(0x08800080),        //cb.deqz $r0? 16adc <main+0x17c>;;
     _32(0x1800001a),        //call 16b40 <abort>;;
     _32(0x3c000c0c),        //lq $r0r1 = 48 (0x30)[$r12];;
     _32(0x60080040),        //make $r2 = 64 (0x40);;
     _32(0x1fffff85),        //call 168f8 <f3>;;
     _96(0x0400000080000000e0080000),        //make $r2 = 9223372036854775808 (0x8000000000000000);;
     _32(0x7009a080),        //compd.ne $r2 = $r0, $r2;;
     _32(0x08000082),        //cb.dnez $r2? 16b00 <main+0x1a0>;;
     _32(0x08800081),        //cb.deqz $r1? 16b04 <main+0x1a4>;;
     _32(0x18000010),        //call 16b40 <abort>;;
     _32(0x3c000c0c),        //lq $r0r1 = 48 (0x30)[$r12];;
     _32(0x60080042),        //make $r2 = 66 (0x42);;
     _32(0x1fffff7b),        //call 168f8 <f3>;;
     _96(0x0100000080000000e0080000),        //make $r2 = 2305843009213693952 (0x2000000000000000);;
     _32(0x7009a080),        //compd.ne $r2 = $r0, $r2;;
     _32(0x08000082),        //cb.dnez $r2? 16b28 <main+0x1c8>;;
     _32(0x08800081),        //cb.deqz $r1? 16b2c <main+0x1cc>;;
     _32(0x18000006),        //call 16b40 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16f18 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18a48 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100101100000; //0x16960
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f1, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f2, 0b00010110100010001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f3, 0b00010110100011111000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100101100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101101000000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016960;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
