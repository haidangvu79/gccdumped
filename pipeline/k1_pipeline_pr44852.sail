// executing pipeline pr44852.c.out.dumped test 
val k1_pipeline_pr44852: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr44852() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let sf: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x10000009),        //goto 16850 <sf+0x30>;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x7001a001),        //compd.ne $r0 = $r1, $r0;;
     _32(0x08000140),        //cb.dnez $r0? 16850 <sf+0x30>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x60040030),        //make $r1 = 48 (0x30);;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _32(0x1000000a),        //goto 16874 <sf+0x54>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6100ffc0),        //addd $r0 = $r0, -1 (0xffffffff);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000001f101b640),        //compw.eq $r0 = $r0, 57 (0x39);;
     _32(0x0c7ffc00),        //cb.wnez $r0? 16830 <sf+0x10>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61040040),        //addd $r1 = $r0, 1 (0x1);;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x20040000),        //lbz $r1 = 0 (0x0)[$r0];;
     _32(0x78043fc1),        //zxbd $r1 = $r1;;
     _32(0x71040041),        //addw $r1 = $r1, 1 (0x1);;
     _32(0x78043fc1),        //zxbd $r1 = $r1;;
     _32(0x78043fc1),        //zxbd $r1 = $r1;;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _64(0x000e4e4ee0004e40),        //make $r0 = 960051513 (0x39393939);;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x60003939),        //make $r0 = 14649 (0x3939);;
     _32(0x2501050c),        //sh 20 (0x14)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2401058c),        //sb 22 (0x16)[$r12] = $r0;;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _32(0x61000080),        //addd $r0 = $r0, 2 (0x2);;
     _32(0x6104040c),        //addd $r1 = $r12, 16 (0x10);;
     _32(0x1fffffd1),        //call 16820 <sf>;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x7001a001),        //compd.ne $r0 = $r1, $r0;;
     _32(0x08000200),        //cb.dnez $r0? 16914 <main+0x6c>;;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _96(0x00000000800000fce004f000),        //make $r1 = 259008 (0x3f3c0);;
     _32(0x18000166),        //call 16ea0 <strcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16918 <main+0x70>;;
     _32(0x18000007),        //call 16930 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
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
     _32(0x980000f3),        //call 16d08 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007ed),        //call 188f8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100010101000; //0x168a8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(sf, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100100110000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000168a8;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
