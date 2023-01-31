// executing pipeline pr36093.c.out.dumped test 
val k1_pipeline_pr36093: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr36093() = {
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
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _96(0x0000000080000117e0004000),        //make $r0 = 285952 (0x45d00);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000001d),        //goto 168b8 <main+0x98>;;
     _32(0x3404070c),        //lws $r1 = 28 (0x1c)[$r12];;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x790221c0),        //slld $r0 = $r0, 7 (0x7);;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x2701020c),        //sd 8 (0x8)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x1000000c),        //goto 1689c <main+0x7c>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x71001840),        //addw $r0 = $r0, 97 (0x61);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x78083fc0),        //zxbd $r2 = $r0;;
     _32(0x3804020c),        //ld $r1 = 8 (0x8)[$r12];;
     _32(0x3400060c),        //lws $r0 = 24 (0x18)[$r12];;
     _32(0x240be001),        //sb $r0[$r1] = $r2;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000004f401b000),        //compw.le $r0 = $r0, 128 (0x80);;
     _32(0x0c7ffc80),        //cb.wnez $r0? 16870 <main+0x50>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f401b0c0),        //compw.le $r0 = $r0, 3 (0x3);;
     _32(0x0c7ff840),        //cb.wnez $r0? 16848 <main+0x28>;;
     _96(0x0000000080000117e0004000),        //make $r0 = 285952 (0x45d00);;
     _64(0x18000000a00080c0),        //lbz $r0 = 515 (0x203)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000003f101b100),        //compw.eq $r0 = $r0, 100 (0x64);;
     _32(0x0c000080),        //cb.wnez $r0? 168f0 <main+0xd0>;;
     _32(0x18000007),        //call 16908 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
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
     _32(0x980000f3),        //call 16ce0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18810 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100100001000, num_instr, mI);
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
