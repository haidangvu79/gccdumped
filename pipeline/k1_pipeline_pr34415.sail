// executing pipeline pr34415.c.out.dumped test 
val k1_pipeline_pr34415: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr34415() = {
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
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _64(0x00000003f401b000),        //compw.le $r0 = $r0, 96 (0x60);;
     _32(0x0c000240),        //cb.wnez $r0? 16870 <foo+0x50>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _64(0x00000003f501b680),        //compw.gt $r0 = $r0, 122 (0x7a);;
     _32(0x0c000140),        //cb.wnez $r0? 16870 <foo+0x50>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x7100f800),        //addw $r0 = $r0, -32 (0xffffffe0);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x10000002),        //goto 16874 <foo+0x54>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _64(0x00000002f001b080),        //compw.ne $r0 = $r0, 66 (0x42);;
     _32(0x0c000100),        //cb.wnez $r0? 16894 <foo+0x74>;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x10000010),        //goto 168d0 <foo+0xb0>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _64(0x00000002f001b040),        //compw.ne $r0 = $r0, 65 (0x41);;
     _32(0x0c0004c0),        //cb.wnez $r0? 168ec <foo+0xcc>;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x2701020c),        //sd 8 (0x8)[$r12] = $r0;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000001f101b2c0),        //compw.eq $r0 = $r0, 43 (0x2b);;
     _32(0x0c7ffe00),        //cb.wnez $r0? 168ac <foo+0x8c>;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x2701020c),        //sd 8 (0x8)[$r12] = $r0;;
     _32(0x3000050c),        //lwz $r0 = 20 (0x14)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x17ffffd2),        //goto 16830 <foo+0x10>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3000050c),        //lwz $r0 = 20 (0x14)[$r12];;
     _64(0x00000000f401b080),        //compw.le $r0 = $r0, 2 (0x2);;
     _32(0x0c000240),        //cb.wnez $r0? 16920 <foo+0x100>;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000001f001b680),        //compw.ne $r0 = $r0, 58 (0x3a);;
     _32(0x0c0000c0),        //cb.wnez $r0? 16920 <foo+0x100>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x2701020c),        //sd 8 (0x8)[$r12] = $r0;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x1fffffb4),        //call 16820 <foo>;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61000080),        //addd $r0 = $r0, 2 (0x2);;
     _32(0x7001a001),        //compd.ne $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100110000; //0x16930
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100110000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016930;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
