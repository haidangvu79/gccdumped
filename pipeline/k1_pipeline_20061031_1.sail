// executing pipeline 20061031_1.c.out.dumped test 
val k1_pipeline_20061031_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20061031_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let ff: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let f: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2501060c),        //sh 24 (0x18)[$r12] = $r0;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x2501078c),        //sh 30 (0x1e)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2501070c),        //sh 28 (0x1c)[$r12] = $r0;;
     _32(0x10000019),        //goto 168bc <f+0x84>;;
     _32(0x2804078c),        //lhz $r1 = 30 (0x1e)[$r12];;
     _32(0x2800060c),        //lhz $r0 = 24 (0x18)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x2501078c),        //sh 30 (0x1e)[$r12] = $r0;;
     _32(0x2c00070c),        //lhs $r0 = 28 (0x1c)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffffea),        //call 16820 <ff>;;
     _32(0x2c00078c),        //lhs $r0 = 30 (0x1e)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _96(0x00000000800000fce004f000),        //make $r1 = 259008 (0x3f3c0);;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x2002e001),        //lbz $r0 = $r0[$r1];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000000f001b440),        //compw.ne $r0 = $r0, 17 (0x11);;
     _32(0x0c000040),        //cb.wnez $r0? 168a8 <f+0x70>;;
     _32(0x2800070c),        //lhz $r0 = 28 (0x1c)[$r12];;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x2501070c),        //sh 28 (0x1c)[$r12] = $r0;;
     _32(0x2c00070c),        //lhs $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f401b040),        //compw.le $r0 = $r0, 1 (0x1);;
     _32(0x0c7ff940),        //cb.wnez $r0? 1685c <f+0x24>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1fffffd0),        //call 16838 <f>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100011101000; //0x168e8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(ff, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100000111000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100011101000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000168e8;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
