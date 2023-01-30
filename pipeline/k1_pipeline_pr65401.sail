// executing pipeline pr65401 test 
val k1_pipeline_pr65401: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr65401() = {
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
     _32(0x2701020c),        //sd 8 (0x8)[$r12] = $r0;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000020),        //goto 168b8 <foo+0x98>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x640bf000),        //zxhd $r2 = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x79023200),        //sllw $r0 = $r0, 8 (0x8);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x7a040002),        //copyw $r1 = $r2;;
     _32(0x7a011001),        //orw $r0 = $r1, $r0;;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x640bf000),        //zxhd $r2 = $r0;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x250bf040),        //sh.xs $r1[$r0] = $r2;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000001f801b7c0),        //compw.leu $r0 = $r0, 63 (0x3f);;
     _32(0x0c7ff780),        //cb.wnez $r0? 1683c <foo+0x1c>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let bar: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701020c),        //sd 8 (0x8)[$r12] = $r0;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000020),        //goto 16970 <bar+0x98>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x79023200),        //sllw $r0 = $r0, 8 (0x8);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x640bf000),        //zxhd $r2 = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x7a040002),        //copyw $r1 = $r2;;
     _32(0x7a011001),        //orw $r0 = $r1, $r0;;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x640bf000),        //zxhd $r2 = $r0;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x250bf040),        //sh.xs $r1[$r0] = $r2;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000001f801b7c0),        //compw.leu $r0 = $r0, 63 (0x3f);;
     _32(0x0c7ff780),        //cb.wnez $r0? 168f4 <bar+0x1c>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130d80c),        //addd $r12 = $r12, -160 (0xffffff60);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601270c),        //sw 156 (0x9c)[$r12] = $r0;;
     _32(0x10000013),        //goto 169f0 <main+0x60>;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x75001000),        //sbfw $r0 = $r0, 64 (0x40);;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x79023200),        //sllw $r0 = $r0, 8 (0x8);;
     _32(0x6407f000),        //zxhd $r1 = $r0;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x6407f000),        //zxhd $r1 = $r0;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x6108280c),        //addd $r2 = $r12, 160 (0xa0);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x2505de00),        //sh -136 (0xffffff78)[$r0] = $r1;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601270c),        //sw 156 (0x9c)[$r12] = $r0;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _64(0x00000001f801b7c0),        //compw.leu $r0 = $r0, 63 (0x3f);;
     _32(0x0c7ffac0),        //cb.wnez $r0? 169a8 <main+0x18>;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x1fffff87),        //call 16820 <foo>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601270c),        //sw 156 (0x9c)[$r12] = $r0;;
     _32(0x10000015),        //goto 16a64 <main+0xd4>;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x6104280c),        //addd $r1 = $r12, 160 (0xa0);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x2800de00),        //lhz $r0 = -136 (0xffffff78)[$r0];;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _32(0x75001000),        //sbfw $r0 = $r0, 64 (0x40);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x79023200),        //sllw $r0 = $r0, 8 (0x8);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3008270c),        //lwz $r2 = 156 (0x9c)[$r12];;
     _32(0x71011002),        //addw $r0 = $r2, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16a58 <main+0xc8>;;
     _32(0x18000043),        //call 16b60 <abort>;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601270c),        //sw 156 (0x9c)[$r12] = $r0;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _64(0x00000001f801b7c0),        //compw.leu $r0 = $r0, 63 (0x3f);;
     _32(0x0c7ffa40),        //cb.wnez $r0? 16a14 <main+0x84>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601270c),        //sw 156 (0x9c)[$r12] = $r0;;
     _32(0x10000013),        //goto 16ac8 <main+0x138>;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x75001000),        //sbfw $r0 = $r0, 64 (0x40);;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x79023200),        //sllw $r0 = $r0, 8 (0x8);;
     _32(0x6407f000),        //zxhd $r1 = $r0;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x6407f000),        //zxhd $r1 = $r0;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x6108280c),        //addd $r2 = $r12, 160 (0xa0);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x2505de00),        //sh -136 (0xffffff78)[$r0] = $r1;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601270c),        //sw 156 (0x9c)[$r12] = $r0;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _64(0x00000001f801b7c0),        //compw.leu $r0 = $r0, 63 (0x3f);;
     _32(0x0c7ffac0),        //cb.wnez $r0? 16a80 <main+0xf0>;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x1fffff7f),        //call 168d8 <bar>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601270c),        //sw 156 (0x9c)[$r12] = $r0;;
     _32(0x10000015),        //goto 16b3c <main+0x1ac>;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x6104280c),        //addd $r1 = $r12, 160 (0xa0);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x2800de00),        //lhz $r0 = -136 (0xffffff78)[$r0];;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _32(0x79023200),        //sllw $r0 = $r0, 8 (0x8);;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _32(0x75011080),        //sbfw $r0 = $r0, $r2;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71001000),        //addw $r0 = $r0, 64 (0x40);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16b30 <main+0x1a0>;;
     _32(0x1800000d),        //call 16b60 <abort>;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601270c),        //sw 156 (0x9c)[$r12] = $r0;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _64(0x00000001f801b7c0),        //compw.leu $r0 = $r0, 63 (0x3f);;
     _32(0x0c7ffa40),        //cb.wnez $r0? 16aec <main+0x15c>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130280c),        //addd $r12 = $r12, 160 (0xa0);;
     _32(0x0fd00000)        //ret ;;
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

let adr_start:bits(addr_bits) = 0b00010110100110010000; //0x16990
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100011011000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100110010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101101100000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016990;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
