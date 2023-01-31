// executing pipeline pr86714.c.out.dumped test 
val k1_pipeline_pr86714: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr86714() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0002300),        //make $r0 = 285836 (0x45c8c);;
     _32(0x60046161),        //make $r1 = 24929 (0x6161);;
     _32(0x25050000),        //sh 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000001f001b440),        //compw.ne $r0 = $r0, 49 (0x31);;
     _32(0x0c000a40),        //cb.wnez $r0? 16920 <main+0x100>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x20000040),        //lbz $r0 = 1 (0x1)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000001f001b480),        //compw.ne $r0 = $r0, 50 (0x32);;
     _32(0x0c000840),        //cb.wnez $r0? 16920 <main+0x100>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x20000080),        //lbz $r0 = 2 (0x2)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000001f001b4c0),        //compw.ne $r0 = $r0, 51 (0x33);;
     _32(0x0c000640),        //cb.wnez $r0? 16920 <main+0x100>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x200000c0),        //lbz $r0 = 3 (0x3)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000003f001b600),        //compw.ne $r0 = $r0, 120 (0x78);;
     _32(0x0c000440),        //cb.wnez $r0? 16920 <main+0x100>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x20000100),        //lbz $r0 = 4 (0x4)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000003f001b040),        //compw.ne $r0 = $r0, 97 (0x61);;
     _32(0x0c000240),        //cb.wnez $r0? 16920 <main+0x100>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x20000140),        //lbz $r0 = 5 (0x5)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000003f101b040),        //compw.eq $r0 = $r0, 97 (0x61);;
     _32(0x0c000080),        //cb.wnez $r0? 16924 <main+0x104>;;
     _32(0x18000012),        //call 16968 <abort>;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x60080006),        //make $r2 = 6 (0x6);;
     _96(0x00000000800000fce004f200),        //make $r1 = 259016 (0x3f3c8);;
     _32(0x18000051),        //call 16a88 <memcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16954 <main+0x134>;;
     _32(0x18000006),        //call 16968 <abort>;;
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
     _32(0x98000115),        //call 16dc8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007df),        //call 188f8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100101101000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016820;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
