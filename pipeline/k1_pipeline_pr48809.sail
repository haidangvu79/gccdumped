// executing pipeline pr48809.c.out.dumped test 
val k1_pipeline_pr48809: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr48809() = {
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
     _32(0x2401060c),        //sb 24 (0x18)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x2400060c),        //lbs $r0 = 24 (0x18)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f505b1c0),        //compw.gt $r1 = $r0, 7 (0x7);;
     _32(0x0c0006c1),        //cb.wnez $r1? 168ac <foo+0x8c>;;
     _64(0x07fffffef305b080),        //compw.ge $r1 = $r0, 4294967234 (0xffffffc2);;
     _32(0x0c000341),        //cb.wnez $r1? 16880 <foo+0x60>;;
     _32(0x10000087),        //goto 16a6c <foo+0x24c>;;
     _32(0x7100fe00),        //addw $r0 = $r0, -8 (0xfffffff8);;
     _64(0x00000002f905b680),        //compw.gtu $r1 = $r0, 90 (0x5a);;
     _32(0x0c0020c1),        //cb.wnez $r1? 16a6c <foo+0x24c>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _96(0x00000000800000fce100f000),        //addd $r0 = $r0, 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x0fd80000),        //igoto $r0;;
     _32(0x71000f80),        //addw $r0 = $r0, 62 (0x3e);;
     _64(0x00000002f905b140),        //compw.gtu $r1 = $r0, 69 (0x45);;
     _32(0x0c001e01),        //cb.wnez $r1? 16a6c <foo+0x24c>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _96(0x00000000800000fde100a600),        //addd $r0 = $r0, 259736 (0x3f698);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x0fd80000),        //igoto $r0;;
     _64(0x00000003f505b080),        //compw.gt $r1 = $r0, 98 (0x62);;
     _32(0x0c001b81),        //cb.wnez $r1? 16a6c <foo+0x24c>;;
     _64(0x00000000f305b200),        //compw.ge $r1 = $r0, 8 (0x8);;
     _32(0x0c7ff941),        //cb.wnez $r1? 16854 <foo+0x34>;;
     _32(0x1000006a),        //goto 16a6c <foo+0x24c>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000067),        //goto 16a6c <foo+0x24c>;;
     _32(0x60000007),        //make $r0 = 7 (0x7);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000064),        //goto 16a6c <foo+0x24c>;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000061),        //goto 16a6c <foo+0x24c>;;
     _32(0x60000013),        //make $r0 = 19 (0x13);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000005e),        //goto 16a6c <foo+0x24c>;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000005b),        //goto 16a6c <foo+0x24c>;;
     _32(0x60000011),        //make $r0 = 17 (0x11);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000058),        //goto 16a6c <foo+0x24c>;;
     _32(0x6000001f),        //make $r0 = 31 (0x1f);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000055),        //goto 16a6c <foo+0x24c>;;
     _32(0x60000008),        //make $r0 = 8 (0x8);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000052),        //goto 16a6c <foo+0x24c>;;
     _32(0x6000001c),        //make $r0 = 28 (0x1c);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000004f),        //goto 16a6c <foo+0x24c>;;
     _32(0x60000010),        //make $r0 = 16 (0x10);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000004c),        //goto 16a6c <foo+0x24c>;;
     _32(0x6000001f),        //make $r0 = 31 (0x1f);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000049),        //goto 16a6c <foo+0x24c>;;
     _32(0x6000000c),        //make $r0 = 12 (0xc);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000046),        //goto 16a6c <foo+0x24c>;;
     _32(0x6000000f),        //make $r0 = 15 (0xf);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000043),        //goto 16a6c <foo+0x24c>;;
     _32(0x6000006f),        //make $r0 = 111 (0x6f);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000040),        //goto 16a6c <foo+0x24c>;;
     _32(0x60000011),        //make $r0 = 17 (0x11);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000003d),        //goto 16a6c <foo+0x24c>;;
     _32(0x6000000a),        //make $r0 = 10 (0xa);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000003a),        //goto 16a6c <foo+0x24c>;;
     _32(0x6000001f),        //make $r0 = 31 (0x1f);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000037),        //goto 16a6c <foo+0x24c>;;
     _32(0x60000007),        //make $r0 = 7 (0x7);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000034),        //goto 16a6c <foo+0x24c>;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000031),        //goto 16a6c <foo+0x24c>;;
     _32(0x60000013),        //make $r0 = 19 (0x13);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000002e),        //goto 16a6c <foo+0x24c>;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000002b),        //goto 16a6c <foo+0x24c>;;
     _32(0x6000006b),        //make $r0 = 107 (0x6b);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000028),        //goto 16a6c <foo+0x24c>;;
     _32(0x6000001f),        //make $r0 = 31 (0x1f);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000025),        //goto 16a6c <foo+0x24c>;;
     _32(0x60000008),        //make $r0 = 8 (0x8);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000022),        //goto 16a6c <foo+0x24c>;;
     _32(0x6000001c),        //make $r0 = 28 (0x1c);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000001f),        //goto 16a6c <foo+0x24c>;;
     _32(0x6000006a),        //make $r0 = 106 (0x6a);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000001c),        //goto 16a6c <foo+0x24c>;;
     _32(0x6000001f),        //make $r0 = 31 (0x1f);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000019),        //goto 16a6c <foo+0x24c>;;
     _32(0x60000066),        //make $r0 = 102 (0x66);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000016),        //goto 16a6c <foo+0x24c>;;
     _32(0x60000069),        //make $r0 = 105 (0x69);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000013),        //goto 16a6c <foo+0x24c>;;
     _32(0x6000006f),        //make $r0 = 111 (0x6f);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000010),        //goto 16a6c <foo+0x24c>;;
     _32(0x60000011),        //make $r0 = 17 (0x11);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000000d),        //goto 16a6c <foo+0x24c>;;
     _32(0x6000000a),        //make $r0 = 10 (0xa);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000000a),        //goto 16a6c <foo+0x24c>;;
     _32(0x6000001f),        //make $r0 = 31 (0x1f);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000007),        //goto 16a6c <foo+0x24c>;;
     _32(0x60000012),        //make $r0 = 18 (0x12);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000004),        //goto 16a6c <foo+0x24c>;;
     _32(0x60000013),        //make $r0 = 19 (0x13);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000062),        //make $r0 = 98 (0x62);;
     _32(0x1fffff66),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f001b480),        //compw.ne $r0 = $r0, 18 (0x12);;
     _32(0x0c000240),        //cb.wnez $r0? 16abc <main+0x44>;;
     _32(0x60000061),        //make $r0 = 97 (0x61);;
     _32(0x1fffff60),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000140),        //cb.dnez $r0? 16abc <main+0x44>;;
     _32(0x60000063),        //make $r0 = 99 (0x63);;
     _32(0x1fffff5c),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16ac0 <main+0x48>;;
     _32(0x18000029),        //call 16b60 <abort>;;
     _32(0x6000ffc2),        //make $r0 = -62 (0xffffffc2);;
     _32(0x1fffff57),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f001b4c0),        //compw.ne $r0 = $r0, 19 (0x13);;
     _32(0x0c000240),        //cb.wnez $r0? 16af8 <main+0x80>;;
     _32(0x6000ffc1),        //make $r0 = -63 (0xffffffc1);;
     _32(0x1fffff51),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000140),        //cb.dnez $r0? 16af8 <main+0x80>;;
     _32(0x6000ffc3),        //make $r0 = -61 (0xffffffc3);;
     _32(0x1fffff4d),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16afc <main+0x84>;;
     _32(0x1800001a),        //call 16b60 <abort>;;
     _32(0x6000001c),        //make $r0 = 28 (0x1c);;
     _32(0x1fffff48),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000003f001b240),        //compw.ne $r0 = $r0, 105 (0x69);;
     _32(0x0c000340),        //cb.wnez $r0? 16b44 <main+0xcc>;;
     _32(0x6000001b),        //make $r0 = 27 (0x1b);;
     _32(0x1fffff42),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000003f001b180),        //compw.ne $r0 = $r0, 102 (0x66);;
     _32(0x0c0001c0),        //cb.wnez $r0? 16b44 <main+0xcc>;;
     _32(0x6000001d),        //make $r0 = 29 (0x1d);;
     _32(0x1fffff3c),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000003f101b3c0),        //compw.eq $r0 = $r0, 111 (0x6f);;
     _32(0x0c000080),        //cb.wnez $r0? 16b48 <main+0xd0>;;
     _32(0x18000007),        //call 16b60 <abort>;;
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
     _32(0x980000f3),        //call 16f38 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18a68 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101001111000; //0x16a78
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101001111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101101100000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016a78;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
