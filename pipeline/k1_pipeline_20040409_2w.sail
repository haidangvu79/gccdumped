// executing pipeline 20040409_2w.c.out.dumped test 
val k1_pipeline_20040409_2w: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20040409_2w() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let test3: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x07e00000f1000000),        //addw $r0 = $r0, -2147483648 (0xffffffff80000000);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000004fc008d00),        //xorw $r0 = $r0, 4660 (0x1234);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test4: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000004fc008d00),        //xorw $r0 = $r0, 4660 (0x1234);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x07e00000f1000000),        //addw $r0 = $r0, -2147483648 (0xffffffff80000000);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test5: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x07e00000f1000000),        //addw $r0 = $r0, -2147483648 (0xffffffff80000000);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000004fc008d00),        //xorw $r0 = $r0, 4660 (0x1234);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test6: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000004fc008d00),        //xorw $r0 = $r0, 4660 (0x1234);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x07e00000f1000000),        //addw $r0 = $r0, -2147483648 (0xffffffff80000000);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test9: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _64(0x07e00000e000003f),        //make $r0 = -2147483648 (0xffffffff80000000);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x60001234),        //make $r0 = 4660 (0x1234);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3004040c),        //lwz $r1 = 16 (0x10)[$r12];;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x7c011001),        //xorw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let test10: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x60001234),        //make $r0 = 4660 (0x1234);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _64(0x07e00000e000003f),        //make $r0 = -2147483648 (0xffffffff80000000);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3004040c),        //lwz $r1 = 16 (0x10)[$r12];;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x7c011001),        //xorw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let test11: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _64(0x07e00000e000003f),        //make $r0 = -2147483648 (0xffffffff80000000);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x60001234),        //make $r0 = 4660 (0x1234);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3004040c),        //lwz $r1 = 16 (0x10)[$r12];;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x75011040),        //sbfw $r0 = $r0, $r1;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x7c011001),        //xorw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let test12: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x60001234),        //make $r0 = 4660 (0x1234);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _64(0x07e00000e000003f),        //make $r0 = -2147483648 (0xffffffff80000000);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3004040c),        //lwz $r1 = 16 (0x10)[$r12];;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x7c011001),        //xorw $r0 = $r1, $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x75011040),        //sbfw $r0 = $r0, $r1;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let test: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x1fffff8a),        //call 16820 <test3>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004040c),        //lwz $r1 = 16 (0x10)[$r12];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16a10 <test+0x30>;;
     _32(0x18000057),        //call 16b68 <abort>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x1fffff8f),        //call 16850 <test4>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004040c),        //lwz $r1 = 16 (0x10)[$r12];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16a2c <test+0x4c>;;
     _32(0x18000050),        //call 16b68 <abort>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x1fffff94),        //call 16880 <test5>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004040c),        //lwz $r1 = 16 (0x10)[$r12];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16a48 <test+0x68>;;
     _32(0x18000049),        //call 16b68 <abort>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x1fffff99),        //call 168b0 <test6>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004040c),        //lwz $r1 = 16 (0x10)[$r12];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16a64 <test+0x84>;;
     _32(0x18000042),        //call 16b68 <abort>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x1fffff9e),        //call 168e0 <test9>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004040c),        //lwz $r1 = 16 (0x10)[$r12];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16a80 <test+0xa0>;;
     _32(0x1800003b),        //call 16b68 <abort>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x1fffffa7),        //call 16920 <test10>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004040c),        //lwz $r1 = 16 (0x10)[$r12];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16a9c <test+0xbc>;;
     _32(0x18000034),        //call 16b68 <abort>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x1fffffb0),        //call 16960 <test11>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004040c),        //lwz $r1 = 16 (0x10)[$r12];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16ab8 <test+0xd8>;;
     _32(0x1800002d),        //call 16b68 <abort>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x1fffffb9),        //call 169a0 <test12>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004040c),        //lwz $r1 = 16 (0x10)[$r12];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16ad4 <test+0xf4>;;
     _32(0x18000026),        //call 16b68 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _64(0x07e00004e0048d3f),        //make $r1 = -2147478988 (0xffffffff80001234);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffb8),        //call 169e0 <test>;;
     _64(0x07e00000e004003f),        //make $r1 = -2147483648 (0xffffffff80000000);;
     _32(0x60001234),        //make $r0 = 4660 (0x1234);;
     _32(0x1fffffb4),        //call 169e0 <test>;;
     _32(0x60041234),        //make $r1 = 4660 (0x1234);;
     _64(0x07e00000e000003f),        //make $r0 = -2147483648 (0xffffffff80000000);;
     _32(0x1fffffb0),        //call 169e0 <test>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _64(0x07e00004e0008d3f),        //make $r0 = -2147478988 (0xffffffff80001234);;
     _32(0x1fffffac),        //call 169e0 <test>;;
     _32(0x6004edcb),        //make $r1 = -4661 (0xffffedcb);;
     _64(0x001fffffe000ffc0),        //make $r0 = 2147483647 (0x7fffffff);;
     _32(0x1fffffa8),        //call 169e0 <test>;;
     _64(0x001ffffbe00472c0),        //make $r1 = 2147478987 (0x7fffedcb);;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1fffffa4),        //call 169e0 <test>;;
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
     _32(0x980000f3),        //call 16f40 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18a70 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101011101000; //0x16ae8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test3, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test4, 0b00010110100001010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test5, 0b00010110100010000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test6, 0b00010110100010110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test9, 0b00010110100011100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test10, 0b00010110100100100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test11, 0b00010110100101100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test12, 0b00010110100110100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test, 0b00010110100111100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101011101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101101101000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016ae8;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
