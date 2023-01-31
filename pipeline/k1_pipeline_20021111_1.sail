// executing pipeline 20021111_1 test 
val k1_pipeline_20021111_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20021111_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let aim_callhandler: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x26050c0c),        //sw 48 (0x30)[$r12] = $r1;;
     _32(0x7a000002),        //copyw $r0 = $r2;;
     _32(0x7a040003),        //copyw $r1 = $r3;;
     _32(0x25010a0c),        //sh 40 (0x28)[$r12] = $r0;;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x2501080c),        //sh 32 (0x20)[$r12] = $r0;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _32(0x0c0000c0),        //cb.wnez $r0? 16858 <aim_callhandler+0x38>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000020),        //goto 168d4 <aim_callhandler+0xb4>;;
     _32(0x2800080c),        //lhz $r0 = 32 (0x20)[$r12];;
     _64(0x000007fff001b7c0),        //compw.ne $r0 = $r0, 65535 (0xffff);;
     _32(0x0c0000c0),        //cb.wnez $r0? 16870 <aim_callhandler+0x50>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000001a),        //goto 168d4 <aim_callhandler+0xb4>;;
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x0e000080),        //cb.wlez $r0? 16888 <aim_callhandler+0x68>;;
     _32(0x18000023),        //call 16910 <abort>;;
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x28000a0c),        //lhz $r0 = 40 (0x28)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x0000003fe00cffc0),        //make $r3 = 65535 (0xffff);;
     _32(0x7a080000),        //copyw $r2 = $r0;;
     _32(0x30040c0c),        //lwz $r1 = 48 (0x30)[$r12];;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _32(0x1fffffd5),        //call 16820 <aim_callhandler>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffc7),        //call 16820 <aim_callhandler>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16930 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16d30 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18a08 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
 |];

let adr_start:bits(addr_bits) = 0b00010110100011101000; //0x168e8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(aim_callhandler, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100011101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100100010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100100110000, num_instr, mI);
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
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
