// executing pipeline vprintf_1.c.out.dumped test 
val k1_pipeline_vprintf_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_vprintf_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let inner: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x27050a0c),        //sd 40 (0x28)[$r12] = $r1;;
     _32(0x28090c0c),        //sq 48 (0x30)[$r12] = $r2r3;;
     _32(0x2811100c),        //sq 64 (0x40)[$r12] = $r4r5;;
     _32(0x2819140c),        //sq 80 (0x50)[$r12] = $r6r7;;
     _32(0x2821180c),        //sq 96 (0x60)[$r12] = $r8r9;;
     _32(0x28291c0c),        //sq 112 (0x70)[$r12] = $r10r11;;
     _32(0x2601020c),        //sw 8 (0x8)[$r12] = $r0;;
     _32(0x61000a0c),        //addd $r0 = $r12, 40 (0x28);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x61000a0c),        //addd $r0 = $r12, 40 (0x28);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _64(0x00000000f901b280),        //compw.gtu $r0 = $r0, 10 (0xa);;
     _32(0x0c002cc0),        //cb.wnez $r0? 16b30 <inner+0x310>;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _96(0x00000000800000fde1000000),        //addd $r0 = $r0, 259072 (0x3f400);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x0fd80000),        //igoto $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x1800035e),        //call 17610 <vprintf>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x18000358),        //call 17610 <vprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b140),        //compw.eq $r0 = $r0, 5 (0x5);;
     _32(0x0c002740),        //cb.wnez $r0? 16b34 <inner+0x314>;;
     _32(0x180000e7),        //call 16c60 <abort>;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x1800020f),        //call 17110 <puts>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x00000000800000fce000f200),        //make $r0 = 259016 (0x3f3c8);;
     _32(0x18000349),        //call 17610 <vprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b180),        //compw.eq $r0 = $r0, 6 (0x6);;
     _32(0x0c002400),        //cb.wnez $r0? 16b3c <inner+0x31c>;;
     _32(0x180000d8),        //call 16c60 <abort>;;
     _32(0x60000061),        //make $r0 = 97 (0x61);;
     _32(0x18000120),        //call 16d88 <putchar>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x00000000800000fce000f400),        //make $r0 = 259024 (0x3f3d0);;
     _32(0x1800033c),        //call 17610 <vprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c002140),        //cb.wnez $r0? 16b44 <inner+0x324>;;
     _32(0x180000cb),        //call 16c60 <abort>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x00000000800000fce000f600),        //make $r0 = 259032 (0x3f3d8);;
     _32(0x18000331),        //call 17610 <vprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08801f80),        //cb.deqz $r0? 16b4c <inner+0x32c>;;
     _32(0x180000c2),        //call 16c60 <abort>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x00000000800000fce000f800),        //make $r0 = 259040 (0x3f3e0);;
     _32(0x18000328),        //call 17610 <vprintf>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x00000000800000fce000f800),        //make $r0 = 259040 (0x3f3e0);;
     _32(0x18000322),        //call 17610 <vprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b140),        //compw.eq $r0 = $r0, 5 (0x5);;
     _32(0x0c001bc0),        //cb.wnez $r0? 16b54 <inner+0x334>;;
     _32(0x180000b1),        //call 16c60 <abort>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x00000000800000fce000f800),        //make $r0 = 259040 (0x3f3e0);;
     _32(0x18000317),        //call 17610 <vprintf>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x00000000800000fce000f800),        //make $r0 = 259040 (0x3f3e0);;
     _32(0x18000311),        //call 17610 <vprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b180),        //compw.eq $r0 = $r0, 6 (0x6);;
     _32(0x0c001800),        //cb.wnez $r0? 16b5c <inner+0x33c>;;
     _32(0x180000a0),        //call 16c60 <abort>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x00000000800000fce000f800),        //make $r0 = 259040 (0x3f3e0);;
     _32(0x18000306),        //call 17610 <vprintf>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x00000000800000fce000f800),        //make $r0 = 259040 (0x3f3e0);;
     _32(0x18000300),        //call 17610 <vprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c001440),        //cb.wnez $r0? 16b64 <inner+0x344>;;
     _32(0x1800008f),        //call 16c60 <abort>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x00000000800000fce000f800),        //make $r0 = 259040 (0x3f3e0);;
     _32(0x180002f5),        //call 17610 <vprintf>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x00000000800000fce000f800),        //make $r0 = 259040 (0x3f3e0);;
     _32(0x180002ef),        //call 17610 <vprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08801100),        //cb.deqz $r0? 16b6c <inner+0x34c>;;
     _32(0x18000080),        //call 16c60 <abort>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x00000000800000fce000fa00),        //make $r0 = 259048 (0x3f3e8);;
     _32(0x180002e6),        //call 17610 <vprintf>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x00000000800000fce000fa00),        //make $r0 = 259048 (0x3f3e8);;
     _32(0x180002e0),        //call 17610 <vprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000d40),        //cb.wnez $r0? 16b74 <inner+0x354>;;
     _32(0x1800006f),        //call 16c60 <abort>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x00000000800000fce000fc00),        //make $r0 = 259056 (0x3f3f0);;
     _32(0x180002d5),        //call 17610 <vprintf>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x00000000800000fce000fc00),        //make $r0 = 259056 (0x3f3f0);;
     _32(0x180002cf),        //call 17610 <vprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b1c0),        //compw.eq $r0 = $r0, 7 (0x7);;
     _32(0x0c000980),        //cb.wnez $r0? 16b7c <inner+0x35c>;;
     _32(0x1800005e),        //call 16c60 <abort>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x00000000800000fce000fe00),        //make $r0 = 259064 (0x3f3f8);;
     _32(0x180002c4),        //call 17610 <vprintf>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x00000000800000fce000fe00),        //make $r0 = 259064 (0x3f3f8);;
     _32(0x180002be),        //call 17610 <vprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b080),        //compw.eq $r0 = $r0, 2 (0x2);;
     _32(0x0c0005c0),        //cb.wnez $r0? 16b84 <inner+0x364>;;
     _32(0x1800004d),        //call 16c60 <abort>;;
     _32(0x1800004c),        //call 16c60 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x10000014),        //goto 16b88 <inner+0x368>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x10000012),        //goto 16b88 <inner+0x368>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x10000010),        //goto 16b88 <inner+0x368>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x1000000e),        //goto 16b88 <inner+0x368>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x1000000c),        //goto 16b88 <inner+0x368>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x1000000a),        //goto 16b88 <inner+0x368>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x10000008),        //goto 16b88 <inner+0x368>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x10000006),        //goto 16b88 <inner+0x368>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x10000004),        //goto 16b88 <inner+0x368>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x10000002),        //goto 16b88 <inner+0x368>;;
     _32(0x7f03f000),        //nop ;;
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
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff1c),        //call 16820 <inner>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffff1a),        //call 16820 <inner>;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x1fffff18),        //call 16820 <inner>;;
     _32(0x60000003),        //make $r0 = 3 (0x3);;
     _32(0x1fffff16),        //call 16820 <inner>;;
     _96(0x00000000800000fce004f000),        //make $r1 = 259008 (0x3f3c0);;
     _32(0x60000004),        //make $r0 = 4 (0x4);;
     _32(0x1fffff11),        //call 16820 <inner>;;
     _96(0x00000000800000fce004f200),        //make $r1 = 259016 (0x3f3c8);;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1fffff0c),        //call 16820 <inner>;;
     _96(0x00000000800000fce004f400),        //make $r1 = 259024 (0x3f3d0);;
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x1fffff07),        //call 16820 <inner>;;
     _96(0x00000000800000fce004f600),        //make $r1 = 259032 (0x3f3d8);;
     _32(0x60000007),        //make $r0 = 7 (0x7);;
     _32(0x1fffff02),        //call 16820 <inner>;;
     _32(0x60040078),        //make $r1 = 120 (0x78);;
     _32(0x60000008),        //make $r0 = 8 (0x8);;
     _32(0x1ffffeff),        //call 16820 <inner>;;
     _96(0x00000000800000fce004f200),        //make $r1 = 259016 (0x3f3c8);;
     _32(0x60000009),        //make $r0 = 9 (0x9);;
     _32(0x1ffffefa),        //call 16820 <inner>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x6000000a),        //make $r0 = 10 (0xa);;
     _32(0x1ffffef7),        //call 16820 <inner>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
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
     _32(0x980001dd),        //call 173e0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98002c99),        //call 21ed8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101110100000; //0x16ba0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(inner, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101110100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110110001100000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016ba0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
