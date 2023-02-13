// executing pipeline pr37924.c.out.dumped test 
val k1_pipeline_pr37924: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr37924() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let test1: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x7c011001),        //xorw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7b023240),        //srlw $r0 = $r0, 9 (0x9);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let test2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x7c011001),        //xorw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7b023240),        //srlw $r0 = $r0, 9 (0x9);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _32(0x1fffffd4),        //call 16820 <test1>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x0003fffff101b7c0),        //compw.eq $r0 = $r0, 8388607 (0x7fffff);;
     _32(0x0c000080),        //cb.wnez $r0? 168e8 <main+0x38>;;
     _32(0x1800005f),        //call 16a60 <abort>;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x60040040),        //make $r1 = 64 (0x40);;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _32(0x1fffffc9),        //call 16820 <test1>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x0003fffff101b7c0),        //compw.eq $r0 = $r0, 8388607 (0x7fffff);;
     _32(0x0c000080),        //cb.wnez $r0? 16914 <main+0x64>;;
     _32(0x18000054),        //call 16a60 <abort>;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x6004ff80),        //make $r1 = -128 (0xffffff80);;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _32(0x1fffffbe),        //call 16820 <test1>;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x7b0231c0),        //srlw $r0 = $r0, 7 (0x7);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7001b001),        //compw.ne $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16958 <main+0xa8>;;
     _32(0x18000043),        //call 16a60 <abort>;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x6004ffff),        //make $r1 = -1 (0xffffffff);;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _32(0x1fffffad),        //call 16820 <test1>;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x7b0231c0),        //srlw $r0 = $r0, 7 (0x7);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7001b001),        //compw.ne $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 1699c <main+0xec>;;
     _32(0x18000032),        //call 16a60 <abort>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _32(0x1fffffae),        //call 16868 <test2>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x0003fffff101b7c0),        //compw.eq $r0 = $r0, 8388607 (0x7fffff);;
     _32(0x0c000080),        //cb.wnez $r0? 169c8 <main+0x118>;;
     _32(0x18000027),        //call 16a60 <abort>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x60040040),        //make $r1 = 64 (0x40);;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _32(0x1fffffa3),        //call 16868 <test2>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x0003fffff101b7c0),        //compw.eq $r0 = $r0, 8388607 (0x7fffff);;
     _32(0x0c000080),        //cb.wnez $r0? 169f4 <main+0x144>;;
     _32(0x1800001c),        //call 16a60 <abort>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x6004ff80),        //make $r1 = -128 (0xffffff80);;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _32(0x1fffff98),        //call 16868 <test2>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x0003fffff101b7c0),        //compw.eq $r0 = $r0, 8388607 (0x7fffff);;
     _32(0x0c000080),        //cb.wnez $r0? 16a20 <main+0x170>;;
     _32(0x18000011),        //call 16a60 <abort>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x6004ffff),        //make $r1 = -1 (0xffffffff);;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _32(0x1fffff8d),        //call 16868 <test2>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x0003fffff101b7c0),        //compw.eq $r0 = $r0, 8388607 (0x7fffff);;
     _32(0x0c000080),        //cb.wnez $r0? 16a4c <main+0x19c>;;
     _32(0x18000006),        //call 16a60 <abort>;;
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
     _32(0x980000f3),        //call 16e38 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18968 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100010110000; //0x168b0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test1, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test2, 0b00010110100001101000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101001100000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000168b0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
