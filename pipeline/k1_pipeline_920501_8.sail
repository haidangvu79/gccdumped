// executing pipeline 920501_8.c.out.dumped test 
val k1_pipeline_920501_8: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_920501_8() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let va: list_I = 
 [|
     _32(0x6130c00c),        //addd $r12 = $r12, -256 (0xffffff00);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741100c),        //sd 64 (0x40)[$r12] = $r16;;
     _32(0x270d2e0c),        //sd 184 (0xb8)[$r12] = $r3;;
     _32(0x2811300c),        //sq 192 (0xc0)[$r12] = $r4r5;;
     _32(0x2819340c),        //sq 208 (0xd0)[$r12] = $r6r7;;
     _32(0x2821380c),        //sq 224 (0xe0)[$r12] = $r8r9;;
     _32(0x28293c0c),        //sq 240 (0xf0)[$r12] = $r10r11;;
     _32(0x2601160c),        //sw 88 (0x58)[$r12] = $r0;;
     _32(0x2705140c),        //sd 80 (0x50)[$r12] = $r1;;
     _32(0x2609120c),        //sw 72 (0x48)[$r12] = $r2;;
     _32(0x61002e0c),        //addd $r0 = $r12, 184 (0xb8);;
     _32(0x2701180c),        //sd 96 (0x60)[$r12] = $r0;;
     _32(0x3800180c),        //ld $r0 = 96 (0x60)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705180c),        //sd 96 (0x60)[$r12] = $r1;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x2601270c),        //sw 156 (0x9c)[$r12] = $r0;;
     _32(0x3800180c),        //ld $r0 = 96 (0x60)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705180c),        //sd 96 (0x60)[$r12] = $r1;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x2601260c),        //sw 152 (0x98)[$r12] = $r0;;
     _32(0x3800180c),        //ld $r0 = 96 (0x60)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705180c),        //sd 96 (0x60)[$r12] = $r1;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x2601250c),        //sw 148 (0x94)[$r12] = $r0;;
     _32(0x3800180c),        //ld $r0 = 96 (0x60)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705180c),        //sd 96 (0x60)[$r12] = $r1;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x2601240c),        //sw 144 (0x90)[$r12] = $r0;;
     _32(0x3800180c),        //ld $r0 = 96 (0x60)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705180c),        //sd 96 (0x60)[$r12] = $r1;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x2601230c),        //sw 140 (0x8c)[$r12] = $r0;;
     _32(0x3800180c),        //ld $r0 = 96 (0x60)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705180c),        //sd 96 (0x60)[$r12] = $r1;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x2601220c),        //sw 136 (0x88)[$r12] = $r0;;
     _32(0x3800180c),        //ld $r0 = 96 (0x60)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705180c),        //sd 96 (0x60)[$r12] = $r1;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x2601210c),        //sw 132 (0x84)[$r12] = $r0;;
     _32(0x3800180c),        //ld $r0 = 96 (0x60)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705180c),        //sd 96 (0x60)[$r12] = $r1;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x2601200c),        //sw 128 (0x80)[$r12] = $r0;;
     _32(0x3800180c),        //ld $r0 = 96 (0x60)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705180c),        //sd 96 (0x60)[$r12] = $r1;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x26011f0c),        //sw 124 (0x7c)[$r12] = $r0;;
     _32(0x3800180c),        //ld $r0 = 96 (0x60)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705180c),        //sd 96 (0x60)[$r12] = $r1;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x26011e0c),        //sw 120 (0x78)[$r12] = $r0;;
     _32(0x3800180c),        //ld $r0 = 96 (0x60)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705180c),        //sd 96 (0x60)[$r12] = $r1;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x26011d0c),        //sw 116 (0x74)[$r12] = $r0;;
     _32(0x3800180c),        //ld $r0 = 96 (0x60)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705180c),        //sd 96 (0x60)[$r12] = $r1;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x26011c0c),        //sw 112 (0x70)[$r12] = $r0;;
     _32(0x3800180c),        //ld $r0 = 96 (0x60)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705180c),        //sd 96 (0x60)[$r12] = $r1;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x26011b0c),        //sw 108 (0x6c)[$r12] = $r0;;
     _32(0x30001b0c),        //lwz $r0 = 108 (0x6c)[$r12];;
     _32(0x26010a0c),        //sw 40 (0x28)[$r12] = $r0;;
     _32(0x30001c0c),        //lwz $r0 = 112 (0x70)[$r12];;
     _32(0x2601080c),        //sw 32 (0x20)[$r12] = $r0;;
     _32(0x30001d0c),        //lwz $r0 = 116 (0x74)[$r12];;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x30001e0c),        //lwz $r0 = 120 (0x78)[$r12];;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x30001f0c),        //lwz $r0 = 124 (0x7c)[$r12];;
     _32(0x2601020c),        //sw 8 (0x8)[$r12] = $r0;;
     _32(0x3000200c),        //lwz $r0 = 128 (0x80)[$r12];;
     _32(0x2601000c),        //sw 0 (0x0)[$r12] = $r0;;
     _32(0x302c210c),        //lwz $r11 = 132 (0x84)[$r12];;
     _32(0x3028220c),        //lwz $r10 = 136 (0x88)[$r12];;
     _32(0x3024230c),        //lwz $r9 = 140 (0x8c)[$r12];;
     _32(0x3020240c),        //lwz $r8 = 144 (0x90)[$r12];;
     _32(0x301c250c),        //lwz $r7 = 148 (0x94)[$r12];;
     _32(0x3018260c),        //lwz $r6 = 152 (0x98)[$r12];;
     _32(0x3014270c),        //lwz $r5 = 156 (0x9c)[$r12];;
     _32(0x3010120c),        //lwz $r4 = 72 (0x48)[$r12];;
     _32(0x380c140c),        //ld $r3 = 80 (0x50)[$r12];;
     _32(0x3008160c),        //lwz $r2 = 88 (0x58)[$r12];;
     _96(0x00000000800000fce004f000),        //make $r1 = 259008 (0x3f3c0);;
     _96(0x0000000080000117e0004000),        //make $r0 = 285952 (0x45d00);;
     _32(0x180001bc),        //call 170b8 <sprintf>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840100c),        //ld $r16 = 64 (0x40)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130400c),        //addd $r12 = $r12, 256 (0x100);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x27410e0c),        //sd 56 (0x38)[$r12] = $r16;;
     _32(0x6000000f),        //make $r0 = 15 (0xf);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x6000000e),        //make $r0 = 14 (0xe);;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x6000000d),        //make $r0 = 13 (0xd);;
     _32(0x2601020c),        //sw 8 (0x8)[$r12] = $r0;;
     _32(0x6000000c),        //make $r0 = 12 (0xc);;
     _32(0x2601000c),        //sw 0 (0x0)[$r12] = $r0;;
     _32(0x602c000b),        //make $r11 = 11 (0xb);;
     _32(0x6028000a),        //make $r10 = 10 (0xa);;
     _32(0x60240009),        //make $r9 = 9 (0x9);;
     _32(0x60200008),        //make $r8 = 8 (0x8);;
     _32(0x601c0007),        //make $r7 = 7 (0x7);;
     _32(0x60180006),        //make $r6 = 6 (0x6);;
     _32(0x60140005),        //make $r5 = 5 (0x5);;
     _32(0x60100004),        //make $r4 = 4 (0x4);;
     _32(0x600c0003),        //make $r3 = 3 (0x3);;
     _32(0x60080002),        //make $r2 = 2 (0x2);;
     _96(0x01ff800080000000e0040000),        //make $r1 = 4607182418800017408 (0x3ff0000000000000);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffff77),        //call 16820 <va>;;
     _96(0x0000000080000117e0044000),        //make $r1 = 285952 (0x45d00);;
     _96(0x00000000800000fce000fc00),        //make $r0 = 259056 (0x3f3f0);;
     _32(0x180001be),        //call 17158 <strcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16a70 <main+0x90>;;
     _32(0x18000003),        //call 16a78 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16a98 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16e98 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980023ad),        //call 1f940 <_exit>
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
     _32(0x98000b0b),        //call 196d8 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fde0000800),        //make $r0 = 259104 (0x3f420);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16ad4 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x9800239b),        //call 1f940 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100111100000; //0x169e0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(va, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100111100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101001111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110101010011000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000169e0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
