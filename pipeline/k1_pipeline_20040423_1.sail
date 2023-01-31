// executing pipeline 20040423_1.c.out.dumped test 
val k1_pipeline_20040423_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20040423_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let sub1: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x2601080c),        //sw 32 (0x20)[$r12] = $r0;;
     _32(0x2605060c),        //sw 24 (0x18)[$r12] = $r1;;
     _32(0x3000080c),        //lwz $r0 = 32 (0x20)[$r12];;
     _32(0x71000080),        //addw $r0 = $r0, 2 (0x2);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x6903f001),        //sxwd $r0 = $r1;;
     _32(0x6a180000),        //copyd $r6 = $r0;;
     _32(0x601c0000),        //make $r7 = 0 (0x0);;
     _32(0x7b022ec6),        //srld $r0 = $r6, 59 (0x3b);;
     _32(0x793e2147),        //slld $r15 = $r7, 5 (0x5);;
     _32(0x7a3d03c0),        //ord $r15 = $r0, $r15;;
     _32(0x793a2146),        //slld $r14 = $r6, 5 (0x5);;
     _32(0x6903f001),        //sxwd $r0 = $r1;;
     _32(0x6100ffc0),        //addd $r0 = $r0, -1 (0xffffffff);;
     _32(0x27011e0c),        //sd 120 (0x78)[$r12] = $r0;;
     _32(0x6903f001),        //sxwd $r0 = $r1;;
     _32(0x6a100000),        //copyd $r4 = $r0;;
     _32(0x60140000),        //make $r5 = 0 (0x0);;
     _32(0x7b022ec4),        //srld $r0 = $r4, 59 (0x3b);;
     _32(0x792e2145),        //slld $r11 = $r5, 5 (0x5);;
     _32(0x7a2d02c0),        //ord $r11 = $r0, $r11;;
     _32(0x792a2144),        //slld $r10 = $r4, 5 (0x5);;
     _32(0x6903f001),        //sxwd $r0 = $r1;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0x7b022f42),        //srld $r0 = $r2, 61 (0x3d);;
     _32(0x792620c3),        //slld $r9 = $r3, 3 (0x3);;
     _32(0x7a250240),        //ord $r9 = $r0, $r9;;
     _32(0x792220c2),        //slld $r8 = $r2, 3 (0x3);;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f001b080),        //compw.ne $r0 = $r0, 2 (0x2);;
     _32(0x0c000440),        //cb.wnez $r0? 168f0 <sub1+0xd0>;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x2701140c),        //sd 80 (0x50)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x2701160c),        //sd 88 (0x58)[$r12] = $r0;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x2701180c),        //sd 96 (0x60)[$r12] = $r0;;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x27011a0c),        //sd 104 (0x68)[$r12] = $r0;;
     _32(0x3800120c),        //ld $r0 = 72 (0x48)[$r12];;
     _32(0x27011c0c),        //sd 112 (0x70)[$r12] = $r0;;
     _32(0x6903f001),        //sxwd $r0 = $r1;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x79023080),        //sllw $r0 = $r0, 2 (0x2);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1000000a),        //goto 16914 <sub1+0xf4>;;
     _32(0x6903f001),        //sxwd $r0 = $r1;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x71011040),        //addw $r0 = $r0, $r1;;
     _32(0x79023080),        //sllw $r0 = $r0, 2 (0x2);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3838040c),        //ld $r14 = 16 (0x10)[$r12];;
     _32(0x6130200c),        //addd $r12 = $r12, 128 (0x80);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60040003),        //make $r1 = 3 (0x3);;
     _32(0x60000014),        //make $r0 = 20 (0x14);;
     _32(0x1fffffbb),        //call 16820 <sub1>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000008f101b200),        //compw.eq $r0 = $r0, 264 (0x108);;
     _32(0x0c000080),        //cb.wnez $r0? 1694c <main+0x2c>;;
     _32(0x18000006),        //call 16960 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16d38 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18868 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100100000; //0x16920
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(sub1, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100101100000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016920;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
