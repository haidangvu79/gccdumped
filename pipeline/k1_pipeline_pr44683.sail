// executing pipeline pr44683.c.out.dumped test 
val k1_pipeline_pr44683: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr44683() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let copysign_bug: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x080002c0),        //cb.dnez $r0? 16860 <copysign_bug+0x40>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _96(0x01ff000080000000e0040000),        //make $r1 = 4602678819172646912 (0x3fe0000000000000);;
     _32(0x58017040),        //fmuld $r0 = $r0, $r1;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x7b030001),        //fcompd.une $r0 = $r1, $r0;;
     _32(0x080000c0),        //cb.dnez $r0? 16860 <copysign_bug+0x40>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1000000e),        //goto 16894 <copysign_bug+0x74>;;
     _96(0x01ff800080000000e0040000),        //make $r1 = 4607182418800017408 (0x3ff0000000000000);;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6b03ffc0),        //extfs $r0 = $r0, 63 (0x3f), 63 (0x3f);;
     _32(0x6307ffc0),        //insf $r1 = $r0, 63 (0x3f), 63 (0x3f);;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x7c030040),        //fcompd.olt $r0 = $r0, $r1;;
     _32(0x088000c0),        //cb.deqz $r0? 16890 <copysign_bug+0x70>;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x10000002),        //goto 16894 <copysign_bug+0x74>;;
     _32(0x60000003),        //make $r0 = 3 (0x3);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _96(0x0400000080000000e0000000),        //make $r0 = 9223372036854775808 (0x8000000000000000);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x1fffffd8),        //call 16820 <copysign_bug>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b080),        //compw.eq $r0 = $r0, 2 (0x2);;
     _32(0x0c000080),        //cb.wnez $r0? 168d8 <main+0x38>;;
     _32(0x18000007),        //call 168f0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
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
     _32(0x980000f3),        //call 16cc8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 187f8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100010100000; //0x168a0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(copysign_bug, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100011110000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000168a0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
