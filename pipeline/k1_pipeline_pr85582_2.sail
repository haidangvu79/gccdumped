// executing pipeline pr85582_2.c.out.dumped test 
val k1_pipeline_pr85582_2: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr85582_2() = {
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
     _32(0x78000140),        //andw $r0 = $r0, 5 (0x5);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x68281000),        //andd $r10 = $r0, 64 (0x40);;
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
     _32(0x6a04000a),        //copyd $r1 = $r10;;
     _32(0x70160001),        //cmoved.dnez $r1? $r5 = $r0;;
     _32(0x6a00000a),        //copyd $r0 = $r10;;
     _32(0x701200c0),        //cmoved.dnez $r0? $r4 = $r3;;
     _32(0x2811040c),        //sq 16 (0x10)[$r12] = $r4r5;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x6a180000),        //copyd $r6 = $r0;;
     _32(0x7a022fc0),        //srad $r0 = $r0, 63 (0x3f);;
     _32(0x6a1c0000),        //copyd $r7 = $r0;;
     _32(0x3c00040c),        //lq $r0r1 = 16 (0x10)[$r12];;
     _32(0x7e21d180),        //addcd.i $r8 = $r0, $r6;;
     _32(0x7e25c1c1),        //addcd $r9 = $r1, $r7;;
     _32(0x2821040c),        //sq 16 (0x10)[$r12] = $r8r9;;
     _32(0x3c00040c),        //lq $r0r1 = 16 (0x10)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let f2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2801040c),        //sq 16 (0x10)[$r12] = $r0r1;;
     _32(0x2609020c),        //sw 8 (0x8)[$r12] = $r2;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x78000140),        //andw $r0 = $r0, 5 (0x5);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x68281000),        //andd $r10 = $r0, 64 (0x40);;
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
     _32(0x6a08000a),        //copyd $r2 = $r10;;
     _32(0x70120002),        //cmoved.dnez $r2? $r4 = $r0;;
     _32(0x6a00000a),        //copyd $r0 = $r10;;
     _32(0x70160040),        //cmoved.dnez $r0? $r5 = $r1;;
     _32(0x2811040c),        //sq 16 (0x10)[$r12] = $r4r5;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x6a180000),        //copyd $r6 = $r0;;
     _32(0x7a022fc0),        //srad $r0 = $r0, 63 (0x3f);;
     _32(0x6a1c0000),        //copyd $r7 = $r0;;
     _32(0x3c00040c),        //lq $r0r1 = 16 (0x10)[$r12];;
     _32(0x7e21d180),        //addcd.i $r8 = $r0, $r6;;
     _32(0x7e25c1c1),        //addcd $r9 = $r1, $r7;;
     _32(0x2821040c),        //sq 16 (0x10)[$r12] = $r8r9;;
     _32(0x3c00040c),        //lq $r0r1 = 16 (0x10)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f3: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2801040c),        //sq 16 (0x10)[$r12] = $r0r1;;
     _32(0x2609020c),        //sw 8 (0x8)[$r12] = $r2;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x78000140),        //andw $r0 = $r0, 5 (0x5);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x68281000),        //andd $r10 = $r0, 64 (0x40);;
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
     _32(0x6a04000a),        //copyd $r1 = $r10;;
     _32(0x70120001),        //cmoved.dnez $r1? $r4 = $r0;;
     _32(0x6a00000a),        //copyd $r0 = $r10;;
     _32(0x701600c0),        //cmoved.dnez $r0? $r5 = $r3;;
     _32(0x2811040c),        //sq 16 (0x10)[$r12] = $r4r5;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x6a180000),        //copyd $r6 = $r0;;
     _32(0x7a022fc0),        //srad $r0 = $r0, 63 (0x3f);;
     _32(0x6a1c0000),        //copyd $r7 = $r0;;
     _32(0x3c00040c),        //lq $r0r1 = 16 (0x10)[$r12];;
     _32(0x7e21d180),        //addcd.i $r8 = $r0, $r6;;
     _32(0x7e25c1c1),        //addcd $r9 = $r1, $r7;;
     _32(0x2821040c),        //sq 16 (0x10)[$r12] = $r8r9;;
     _32(0x3c00040c),        //lq $r0r1 = 16 (0x10)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _96(0x0010000080000000e0040000),        //make $r1 = 144115188075855872 (0x200000000000000);;
     _32(0x28011c0c),        //sq 112 (0x70)[$r12] = $r0r1;;
     _32(0x6008000c),        //make $r2 = 12 (0xc);;
     _32(0x3c001c0c),        //lq $r0r1 = 112 (0x70)[$r12];;
     _32(0x1fffff8a),        //call 16820 <f1>;;
     _32(0x2801180c),        //sq 96 (0x60)[$r12] = $r0r1;;
     _32(0x3800180c),        //ld $r0 = 96 (0x60)[$r12];;
     _32(0x60010300),        //compd.ne $r0 = $r0, 12 (0xc);;
     _32(0x080001c0),        //cb.dnez $r0? 16a24 <main+0x54>;;
     _32(0x38001a0c),        //ld $r0 = 104 (0x68)[$r12];;
     _96(0x0100000080000000e0040000),        //make $r1 = 2305843009213693952 (0x2000000000000000);;
     _32(0x7001a040),        //compd.ne $r0 = $r0, $r1;;
     _32(0x08800080),        //cb.deqz $r0? 16a28 <main+0x58>;;
     _32(0x1800002d),        //call 16ad8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _96(0x0400000080000000e0040000),        //make $r1 = 9223372036854775808 (0x8000000000000000);;
     _32(0x2801140c),        //sq 80 (0x50)[$r12] = $r0r1;;
     _32(0x6008000c),        //make $r2 = 12 (0xc);;
     _32(0x3c00140c),        //lq $r0r1 = 80 (0x50)[$r12];;
     _32(0x1fffff9b),        //call 168b0 <f2>;;
     _32(0x2801100c),        //sq 64 (0x40)[$r12] = $r0r1;;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x60010300),        //compd.ne $r0 = $r0, 12 (0xc);;
     _32(0x080001c0),        //cb.dnez $r0? 16a70 <main+0xa0>;;
     _32(0x3800120c),        //ld $r0 = 72 (0x48)[$r12];;
     _96(0x07c0000080000000e0040000),        //make $r1 = 17870283321406128128 (0xf800000000000000);;
     _32(0x7001a040),        //compd.ne $r0 = $r0, $r1;;
     _32(0x08800080),        //cb.deqz $r0? 16a74 <main+0xa4>;;
     _32(0x1800001a),        //call 16ad8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _96(0x0400000080000000e0040000),        //make $r1 = 9223372036854775808 (0x8000000000000000);;
     _32(0x28010c0c),        //sq 48 (0x30)[$r12] = $r0r1;;
     _32(0x3c00140c),        //lq $r0r1 = 80 (0x50)[$r12];;
     _32(0x6008000c),        //make $r2 = 12 (0xc);;
     _32(0x1fffffac),        //call 16940 <f3>;;
     _32(0x2801080c),        //sq 32 (0x20)[$r12] = $r0r1;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x60010300),        //compd.ne $r0 = $r0, 12 (0xc);;
     _32(0x080001c0),        //cb.dnez $r0? 16abc <main+0xec>;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _96(0x0040000080000000e0040000),        //make $r1 = 576460752303423488 (0x800000000000000);;
     _32(0x7001a040),        //compd.ne $r0 = $r0, $r1;;
     _32(0x08800080),        //cb.deqz $r0? 16ac0 <main+0xf0>;;
     _32(0x18000007),        //call 16ad8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130200c),        //addd $r12 = $r12, 128 (0x80);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16eb0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 189e0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100111010000; //0x169d0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f1, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f2, 0b00010110100010110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f3, 0b00010110100101000000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100111010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101011011000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000169d0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
