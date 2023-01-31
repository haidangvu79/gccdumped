// executing pipeline 20000112_1 test 
val k1_pipeline_20000112_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20000112_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let special_format: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x6004002a),        //make $r1 = 42 (0x2a);;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x180001c8),        //call 16f58 <strchr>;;
     _32(0x08000340),        //cb.dnez $r0? 16870 <special_format+0x50>;;
     _32(0x60040056),        //make $r1 = 86 (0x56);;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x180001c4),        //call 16f58 <strchr>;;
     _32(0x08000240),        //cb.dnez $r0? 16870 <special_format+0x50>;;
     _32(0x60040053),        //make $r1 = 83 (0x53);;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x180001c0),        //call 16f58 <strchr>;;
     _32(0x08000140),        //cb.dnez $r0? 16870 <special_format+0x50>;;
     _32(0x6004006e),        //make $r1 = 110 (0x6e);;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x180001bc),        //call 16f58 <strchr>;;
     _32(0x088000c0),        //cb.deqz $r0? 16878 <special_format+0x58>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x10000002),        //goto 1687c <special_format+0x5c>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x1fffffde),        //call 16820 <special_format>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 168b8 <main+0x28>;;
     _32(0x18000013),        //call 16900 <abort>;;
     _96(0x00000000800000fce000f200),        //make $r0 = 259016 (0x3f3c8);;
     _32(0x1fffffd7),        //call 16820 <special_format>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000180),        //cb.dnez $r0? 168e4 <main+0x54>;;
     _96(0x00000000800000fce000f400),        //make $r0 = 259024 (0x3f3d0);;
     _32(0x18000075),        //call 16ab0 <printf>;;
     _32(0x18000008),        //call 16900 <abort>;;
     _96(0x00000000800000fce000f800),        //make $r0 = 259040 (0x3f3e0);;
     _32(0x18000070),        //call 16ab0 <printf>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 16920 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x9800012d),        //call 16dc0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98002ca3),        //call 21ba0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
 |];

let adr_start:bits(addr_bits) = 0b00010110100010010000; //0x16890
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(special_format, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100100000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100100100000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016890;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
