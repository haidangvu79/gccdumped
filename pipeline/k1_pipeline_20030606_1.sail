// executing pipeline 20030606_1 test 
val k1_pipeline_20030606_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20030606_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61040100),        //addd $r1 = $r0, 4 (0x4);;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x60040037),        //make $r1 = 55 (0x37);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x0c800180),        //cb.weqz $r0? 1685c <foo+0x3c>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61040100),        //addd $r1 = $r0, 4 (0x4);;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x3004040c),        //lwz $r1 = 16 (0x10)[$r12];;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x6100020c),        //addd $r0 = $r12, 8 (0x8);;
     _32(0x60080014),        //make $r2 = 20 (0x14);;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x18000084),        //call 16a90 <memset>;;
     _32(0x6100020c),        //addd $r0 = $r12, 8 (0x8);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x1fffffe5),        //call 16820 <foo>;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x6100020c),        //addd $r0 = $r12, 8 (0x8);;
     _32(0x75010040),        //sbfd $r0 = $r0, $r1;;
     _32(0x60010100),        //compd.ne $r0 = $r0, 4 (0x4);;
     _32(0x08000240),        //cb.dnez $r0? 168c4 <main+0x5c>;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _64(0x00000001f001b5c0),        //compw.ne $r0 = $r0, 55 (0x37);;
     _32(0x0c000140),        //cb.wnez $r0? 168c4 <main+0x5c>;;
     _32(0x3004030c),        //lwz $r1 = 12 (0xc)[$r12];;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 168c8 <main+0x60>;;
     _32(0x18000019),        //call 16928 <abort>;;
     _32(0x6100020c),        //addd $r0 = $r12, 8 (0x8);;
     _32(0x60080014),        //make $r2 = 20 (0x14);;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x1800006f),        //call 16a90 <memset>;;
     _32(0x6100020c),        //addd $r0 = $r12, 8 (0x8);;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _32(0x1fffffd0),        //call 16820 <foo>;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x6100020c),        //addd $r0 = $r12, 8 (0x8);;
     _32(0x75010040),        //sbfd $r0 = $r0, $r1;;
     _32(0x60010200),        //compd.ne $r0 = $r0, 8 (0x8);;
     _32(0x08000240),        //cb.dnez $r0? 16918 <main+0xb0>;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _64(0x00000001f001b5c0),        //compw.ne $r0 = $r0, 55 (0x37);;
     _32(0x0c000140),        //cb.wnez $r0? 16918 <main+0xb0>;;
     _32(0x3000030c),        //lwz $r0 = 12 (0xc)[$r12];;
     _64(0x00000000f101b080),        //compw.eq $r0 = $r0, 2 (0x2);;
     _32(0x0c000080),        //cb.wnez $r0? 1691c <main+0xb4>;;
     _32(0x18000004),        //call 16928 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 16948 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000179),        //call 16f18 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980008ad),        //call 18bf0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
 |];

let adr_start:bits(addr_bits) = 0b00010110100001101000; //0x16868
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100001101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100100101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100101001000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016868;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
