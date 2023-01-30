// executing pipeline 20031215_1 test 
val k1_pipeline_20031215_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20031215_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let test1: list_I = 
 [|
     _96(0x00000000800000fce004f000),        //make $r1 = 259008 (0x3f3c0);;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x20000200),        //lbz $r0 = 8 (0x8)[$r0];;
     _32(0x08800340),        //cb.deqz $r0? 1687c <test1+0x5c>;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test2: list_I = 
 [|
     _96(0x00000000800000fce004f000),        //make $r1 = 259008 (0x3f3c0);;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x20000200),        //lbz $r0 = 8 (0x8)[$r0];;
     _32(0x08800340),        //cb.deqz $r0? 168e4 <test2+0x5c>;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x6004ffff),        //make $r1 = -1 (0xffffffff);;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test3: list_I = 
 [|
     _96(0x00000000800000fce004f000),        //make $r1 = 259008 (0x3f3c0);;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x20000200),        //lbz $r0 = 8 (0x8)[$r0];;
     _32(0x08800340),        //cb.deqz $r0? 1694c <test3+0x5c>;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1fffffaf),        //call 16820 <test1>;;
     _32(0x1fffffc8),        //call 16888 <test2>;;
     _32(0x1fffffe1),        //call 168f0 <test3>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100101011000; //0x16958
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test1, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test2, 0b00010110100010001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test3, 0b00010110100011110000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100101011000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016958;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
