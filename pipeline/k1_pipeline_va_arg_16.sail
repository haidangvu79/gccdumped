// executing pipeline va_arg_16.c.out.dumped test 
val k1_pipeline_va_arg_16: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_va_arg_16() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let vafunction: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x28090c0c),        //sq 48 (0x30)[$r12] = $r2r3;;
     _32(0x2811100c),        //sq 64 (0x40)[$r12] = $r4r5;;
     _32(0x2819140c),        //sq 80 (0x50)[$r12] = $r6r7;;
     _32(0x2821180c),        //sq 96 (0x60)[$r12] = $r8r9;;
     _32(0x28291c0c),        //sq 112 (0x70)[$r12] = $r10r11;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2705020c),        //sd 8 (0x8)[$r12] = $r1;;
     _32(0x61000c0c),        //addd $r0 = $r12, 48 (0x30);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _96(0x02045e0080000000e0040000),        //make $r1 = 4651022146422702080 (0x408bc00000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 1686c <vafunction+0x4c>;;
     _32(0x18000090),        //call 16aa8 <abort>;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _96(0x020479c080000000e0040000),        //make $r1 = 4651998512748167168 (0x408f380000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16888 <vafunction+0x68>;;
     _32(0x18000089),        //call 16aa8 <abort>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x01ff800080000000e0040000),        //make $r1 = 4607182418800017408 (0x3ff0000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 168b0 <vafunction+0x90>;;
     _32(0x1800007f),        //call 16aa8 <abort>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x0200000080000000e0040000),        //make $r1 = 4611686018427387904 (0x4000000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 168d8 <vafunction+0xb8>;;
     _32(0x18000075),        //call 16aa8 <abort>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x0200400080000000e0040000),        //make $r1 = 4613937818241073152 (0x4008000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16900 <vafunction+0xe0>;;
     _32(0x1800006b),        //call 16aa8 <abort>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x0200800080000000e0040000),        //make $r1 = 4616189618054758400 (0x4010000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16928 <vafunction+0x108>;;
     _32(0x18000061),        //call 16aa8 <abort>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x0200a00080000000e0040000),        //make $r1 = 4617315517961601024 (0x4014000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16950 <vafunction+0x130>;;
     _32(0x18000057),        //call 16aa8 <abort>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x0200c00080000000e0040000),        //make $r1 = 4618441417868443648 (0x4018000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16978 <vafunction+0x158>;;
     _32(0x1800004d),        //call 16aa8 <abort>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x0200e00080000000e0040000),        //make $r1 = 4619567317775286272 (0x401c000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 169a0 <vafunction+0x180>;;
     _32(0x18000043),        //call 16aa8 <abort>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x0201000080000000e0040000),        //make $r1 = 4620693217682128896 (0x4020000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 169c8 <vafunction+0x1a8>;;
     _32(0x18000039),        //call 16aa8 <abort>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x0201100080000000e0040000),        //make $r1 = 4621256167635550208 (0x4022000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 169f0 <vafunction+0x1d0>;;
     _32(0x1800002f),        //call 16aa8 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130200c),        //addd $r12 = $r12, 128 (0x80);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x0201100080000000e0280000),        //make $r10 = 4621256167635550208 (0x4022000000000000);;
     _96(0x0201000080000000e0240000),        //make $r9 = 4620693217682128896 (0x4020000000000000);;
     _96(0x0200e00080000000e0200000),        //make $r8 = 4619567317775286272 (0x401c000000000000);;
     _96(0x0200c00080000000e01c0000),        //make $r7 = 4618441417868443648 (0x4018000000000000);;
     _96(0x0200a00080000000e0180000),        //make $r6 = 4617315517961601024 (0x4014000000000000);;
     _96(0x0200800080000000e0140000),        //make $r5 = 4616189618054758400 (0x4010000000000000);;
     _96(0x0200400080000000e0100000),        //make $r4 = 4613937818241073152 (0x4008000000000000);;
     _96(0x0200000080000000e00c0000),        //make $r3 = 4611686018427387904 (0x4000000000000000);;
     _96(0x01ff800080000000e0080000),        //make $r2 = 4607182418800017408 (0x3ff0000000000000);;
     _96(0x020479c080000000e0040000),        //make $r1 = 4651998512748167168 (0x408f380000000000);;
     _96(0x02045e0080000000e0000000),        //make $r0 = 4651022146422702080 (0x408bc00000000000);;
     _32(0x1fffff62),        //call 16820 <vafunction>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 16ac8 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16ec8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18ba0 <_exit>
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
     _32(0x98000161),        //call 17060 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16b04 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18ba0 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101000001000; //0x16a08
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(vafunction, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101000001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101010101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110101011001000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016a08;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
