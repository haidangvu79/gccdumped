// executing pipeline 950512_1 test 
val k1_pipeline_950512_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_950512_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let f1: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0c800100),        //cb.weqz $r0? 1683c <f1+0x1c>;;
     _64(0x001fffffe000ffc0),        //make $r0 = 2147483647 (0x7fffffff);;
     _32(0x10000003),        //goto 16844 <f1+0x24>;;
     _64(0x001fffffe000ff80),        //make $r0 = 2147483646 (0x7ffffffe);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let f2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0c800140),        //cb.weqz $r0? 16870 <f2+0x20>;;
     _96(0x03ffffff87ffffffe000ffc0),        //make $r0 = 9223372036854775807 (0x7fffffffffffffff);;
     _32(0x10000004),        //goto 1687c <f2+0x2c>;;
     _96(0x03ffffff87ffffffe000ff80),        //make $r0 = 9223372036854775806 (0x7ffffffffffffffe);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffffe2),        //call 16820 <f1>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x03fffffff101b7c0),        //compw.eq $r0 = $r0, 2147483647 (0x7fffffff);;
     _32(0x0c000080),        //cb.wnez $r0? 168b0 <main+0x28>;;
     _32(0x1800001b),        //call 16918 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffdb),        //call 16820 <f1>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x03fffffff101b780),        //compw.eq $r0 = $r0, 2147483646 (0x7ffffffe);;
     _32(0x0c000080),        //cb.wnez $r0? 168cc <main+0x44>;;
     _32(0x18000014),        //call 16918 <abort>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffffe0),        //call 16850 <f2>;;
     _96(0x03ffffff87ffffffe004ffc0),        //make $r1 = 9223372036854775807 (0x7fffffffffffffff);;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 168ec <main+0x64>;;
     _32(0x1800000c),        //call 16918 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffd8),        //call 16850 <f2>;;
     _96(0x03ffffff87ffffffe004ff80),        //make $r1 = 9223372036854775806 (0x7ffffffffffffffe);;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 1690c <main+0x84>;;
     _32(0x18000004),        //call 16918 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 16938 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16d38 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18a10 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
 |];

let adr_start:bits(addr_bits) = 0b00010110100010001000; //0x16888
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f1, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f2, 0b00010110100001010000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100100011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100100111000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016888;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
