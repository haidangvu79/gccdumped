// executing pipeline pr47237.c.out.dumped test 
val k1_pipeline_pr47237: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr47237() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f101b140),        //compw.eq $r0 = $r0, 5 (0x5);;
     _32(0x0c000080),        //cb.wnez $r0? 16844 <foo+0x24>;;
     _32(0x18000056),        //call 16998 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let bar: list_I = 
 [|
     _32(0x6130b80c),        //addd $r12 = $r12, -288 (0xfffffee0);;
     _32(0x2739020c),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2749060c),        //sd 24 (0x18)[$r12] = $r18;;
     _32(0x6138020c),        //addd $r14 = $r12, 8 (0x8);;
     _32(0x2701220e),        //sd 136 (0x88)[$r14] = $r0;;
     _32(0x2705240e),        //sd 144 (0x90)[$r14] = $r1;;
     _32(0x2709260e),        //sd 152 (0x98)[$r14] = $r2;;
     _32(0x270d280e),        //sd 160 (0xa0)[$r14] = $r3;;
     _32(0x27112a0e),        //sd 168 (0xa8)[$r14] = $r4;;
     _32(0x27152c0e),        //sd 176 (0xb0)[$r14] = $r5;;
     _32(0x27192e0e),        //sd 184 (0xb8)[$r14] = $r6;;
     _32(0x271d300e),        //sd 192 (0xc0)[$r14] = $r7;;
     _32(0x2721320e),        //sd 200 (0xc8)[$r14] = $r8;;
     _32(0x2725340e),        //sd 208 (0xd0)[$r14] = $r9;;
     _32(0x2729360e),        //sd 216 (0xd8)[$r14] = $r10;;
     _32(0x272d380e),        //sd 224 (0xe0)[$r14] = $r11;;
     _32(0x6104460e),        //addd $r1 = $r14, 280 (0x118);;
     _32(0x27051e0e),        //sd 120 (0x78)[$r14] = $r1;;
     _32(0x6a04000f),        //copyd $r1 = $r15;;
     _32(0x2705200e),        //sd 128 (0x80)[$r14] = $r1;;
     _32(0x61481e0e),        //addd $r18 = $r14, 120 (0x78);;
     _32(0x2601440e),        //sw 272 (0x110)[$r14] = $r0;;
     _32(0x3000440e),        //lwz $r0 = 272 (0x110)[$r14];;
     _32(0x1fffffd9),        //call 16820 <foo>;;
     _32(0x6a3c0012),        //copyd $r15 = $r18;;
     _32(0x3800000f),        //ld $r0 = 0 (0x0)[$r15];;
     _32(0x6a48000c),        //copyd $r18 = $r12;;
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x2705000c),        //sd 0 (0x0)[$r12] = $r1;;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _32(0x2701020c),        //sd 8 (0x8)[$r12] = $r0;;
     _32(0x3800040f),        //ld $r0 = 16 (0x10)[$r15];;
     _32(0x3804060f),        //ld $r1 = 24 (0x18)[$r15];;
     _32(0x3808080f),        //ld $r2 = 32 (0x20)[$r15];;
     _32(0x380c0a0f),        //ld $r3 = 40 (0x28)[$r15];;
     _32(0x38100c0f),        //ld $r4 = 48 (0x30)[$r15];;
     _32(0x38140e0f),        //ld $r5 = 56 (0x38)[$r15];;
     _32(0x3818100f),        //ld $r6 = 64 (0x40)[$r15];;
     _32(0x381c120f),        //ld $r7 = 72 (0x48)[$r15];;
     _32(0x3820140f),        //ld $r8 = 80 (0x50)[$r15];;
     _32(0x3824160f),        //ld $r9 = 88 (0x58)[$r15];;
     _32(0x3828180f),        //ld $r10 = 96 (0x60)[$r15];;
     _32(0x382c1a0f),        //ld $r11 = 104 (0x68)[$r15];;
     _32(0x383c020f),        //ld $r15 = 8 (0x8)[$r15];;
     _32(0x1fffffc3),        //call 16820 <foo>;;
     _32(0x2701060e),        //sd 24 (0x18)[$r14] = $r0;;
     _32(0x2705080e),        //sd 32 (0x20)[$r14] = $r1;;
     _32(0x27090a0e),        //sd 40 (0x28)[$r14] = $r2;;
     _32(0x270d0c0e),        //sd 48 (0x30)[$r14] = $r3;;
     _32(0x27110e0e),        //sd 56 (0x38)[$r14] = $r4;;
     _32(0x2715100e),        //sd 64 (0x40)[$r14] = $r5;;
     _32(0x2719120e),        //sd 72 (0x48)[$r14] = $r6;;
     _32(0x271d140e),        //sd 80 (0x50)[$r14] = $r7;;
     _32(0x2721160e),        //sd 88 (0x58)[$r14] = $r8;;
     _32(0x2725180e),        //sd 96 (0x60)[$r14] = $r9;;
     _32(0x27291a0e),        //sd 104 (0x68)[$r14] = $r10;;
     _32(0x272d1c0e),        //sd 112 (0x70)[$r14] = $r11;;
     _32(0x6a300012),        //copyd $r12 = $r18;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130fe0e),        //addd $r12 = $r14, -8 (0xfffffff8);;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3848060c),        //ld $r18 = 24 (0x18)[$r12];;
     _32(0x6130480c),        //addd $r12 = $r12, 288 (0x120);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1fffffb6),        //call 16858 <bar>;;
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
     _32(0x980000f3),        //call 16d70 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 188a0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100101110000; //0x16970
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100001011000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100101110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100110011000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016970;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
