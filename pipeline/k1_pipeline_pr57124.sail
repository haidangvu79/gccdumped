// executing pipeline pr57124 test 
val k1_pipeline_pr57124: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr57124() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x25010f8c),        //sh 62 (0x3e)[$r12] = $r0;;
     _32(0x28000f8c),        //lhz $r0 = 62 (0x3e)[$r12];;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _32(0x79023400),        //sllw $r0 = $r0, 16 (0x10);;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x25010c8c),        //sh 50 (0x32)[$r12] = $r0;;
     _32(0x28000c8c),        //lhz $r0 = 50 (0x32)[$r12];;
     _32(0x26010b0c),        //sw 44 (0x2c)[$r12] = $r0;;
     _32(0x28000c8c),        //lhz $r0 = 50 (0x32)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x30040d0c),        //lwz $r1 = 52 (0x34)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x26010a0c),        //sw 40 (0x28)[$r12] = $r0;;
     _32(0x30000a0c),        //lwz $r0 = 40 (0x28)[$r12];;
     _32(0x2601090c),        //sw 36 (0x24)[$r12] = $r0;;
     _32(0x3000090c),        //lwz $r0 = 36 (0x24)[$r12];;
     _64(0x007ffffff901b7c0),        //compw.gtu $r0 = $r0, 268435455 (0xfffffff);;
     _32(0x0c000080),        //cb.wnez $r0? 16898 <foo+0x78>;;
     _32(0x18000013),        //call 168e0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000019)        //call 16900 <exit>;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x6000fffb),        //make $r0 = -5 (0xfffffffb);;
     _32(0x2501060c),        //sh 24 (0x18)[$r12] = $r0;;
     _32(0x6000fff6),        //make $r0 = -10 (0xfffffff6);;
     _32(0x2501040c),        //sh 16 (0x10)[$r12] = $r0;;
     _32(0x6104040c),        //addd $r1 = $r12, 16 (0x10);;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x1fffffd7),        //call 16820 <foo>;;
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
     _32(0x98000105),        //call 16d00 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 189d8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
 |];

let adr_start:bits(addr_bits) = 0b00010110100010100000; //0x168a0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100011100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100100000000, num_instr, mI);
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
