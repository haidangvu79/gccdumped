// executing pipeline 990211_1 test 
val k1_pipeline_990211_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_990211_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let func: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0d800100),        //cb.wgez $r0? 16844 <func+0x24>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0d000080),        //cb.wltz $r0? 16844 <func+0x24>;;
     _32(0x1800007e),        //call 16a38 <abort>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0e000100),        //cb.wlez $r0? 16858 <func+0x38>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0e800080),        //cb.wgtz $r0? 16858 <func+0x38>;;
     _32(0x18000079),        //call 16a38 <abort>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0d000100),        //cb.wltz $r0? 1686c <func+0x4c>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0d800080),        //cb.wgez $r0? 1686c <func+0x4c>;;
     _32(0x18000074),        //call 16a38 <abort>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0e800100),        //cb.wgtz $r0? 16880 <func+0x60>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0e000080),        //cb.wlez $r0? 16880 <func+0x60>;;
     _32(0x1800006f),        //call 16a38 <abort>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000002f501b300),        //compw.gt $r0 = $r0, 76 (0x4c);;
     _32(0x0c000180),        //cb.wnez $r0? 168a4 <func+0x84>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000002f401b300),        //compw.le $r0 = $r0, 76 (0x4c);;
     _32(0x0c000080),        //cb.wnez $r0? 168a4 <func+0x84>;;
     _32(0x18000066),        //call 16a38 <abort>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000002f401b340),        //compw.le $r0 = $r0, 77 (0x4d);;
     _32(0x0c000180),        //cb.wnez $r0? 168c8 <func+0xa8>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000002f501b340),        //compw.gt $r0 = $r0, 77 (0x4d);;
     _32(0x0c000080),        //cb.wnez $r0? 168c8 <func+0xa8>;;
     _32(0x1800005d),        //call 16a38 <abort>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000002f401b300),        //compw.le $r0 = $r0, 76 (0x4c);;
     _32(0x0c000180),        //cb.wnez $r0? 168ec <func+0xcc>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000002f501b300),        //compw.gt $r0 = $r0, 76 (0x4c);;
     _32(0x0c000080),        //cb.wnez $r0? 168ec <func+0xcc>;;
     _32(0x18000054),        //call 16a38 <abort>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000002f501b340),        //compw.gt $r0 = $r0, 77 (0x4d);;
     _32(0x0c000180),        //cb.wnez $r0? 16910 <func+0xf0>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000002f401b340),        //compw.le $r0 = $r0, 77 (0x4d);;
     _32(0x0c000080),        //cb.wnez $r0? 16910 <func+0xf0>;;
     _32(0x1800004b),        //call 16a38 <abort>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0d000100),        //cb.wltz $r0? 16924 <func+0x104>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0d800080),        //cb.wgez $r0? 16924 <func+0x104>;;
     _32(0x18000046),        //call 16a38 <abort>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0e800100),        //cb.wgtz $r0? 16938 <func+0x118>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0e000080),        //cb.wlez $r0? 16938 <func+0x118>;;
     _32(0x18000041),        //call 16a38 <abort>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0d800100),        //cb.wgez $r0? 1694c <func+0x12c>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0d000080),        //cb.wltz $r0? 1694c <func+0x12c>;;
     _32(0x1800003c),        //call 16a38 <abort>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0e000100),        //cb.wlez $r0? 16960 <func+0x140>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0e800080),        //cb.wgtz $r0? 16960 <func+0x140>;;
     _32(0x18000037),        //call 16a38 <abort>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000002f401b300),        //compw.le $r0 = $r0, 76 (0x4c);;
     _32(0x0c000180),        //cb.wnez $r0? 16984 <func+0x164>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000002f501b300),        //compw.gt $r0 = $r0, 76 (0x4c);;
     _32(0x0c000080),        //cb.wnez $r0? 16984 <func+0x164>;;
     _32(0x1800002e),        //call 16a38 <abort>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000002f501b340),        //compw.gt $r0 = $r0, 77 (0x4d);;
     _32(0x0c000180),        //cb.wnez $r0? 169a8 <func+0x188>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000002f401b340),        //compw.le $r0 = $r0, 77 (0x4d);;
     _32(0x0c000080),        //cb.wnez $r0? 169a8 <func+0x188>;;
     _32(0x18000025),        //call 16a38 <abort>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000002f501b300),        //compw.gt $r0 = $r0, 76 (0x4c);;
     _32(0x0c000180),        //cb.wnez $r0? 169cc <func+0x1ac>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000002f401b300),        //compw.le $r0 = $r0, 76 (0x4c);;
     _32(0x0c000080),        //cb.wnez $r0? 169cc <func+0x1ac>;;
     _32(0x1800001c),        //call 16a38 <abort>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000002f401b340),        //compw.le $r0 = $r0, 77 (0x4d);;
     _32(0x0c000180),        //cb.wnez $r0? 169f0 <func+0x1d0>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000002f501b340),        //compw.gt $r0 = $r0, 77 (0x4d);;
     _32(0x0c000080),        //cb.wnez $r0? 169f0 <func+0x1d0>;;
     _32(0x18000013),        //call 16a38 <abort>;;
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
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff82),        //call 16820 <func>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffff80),        //call 16820 <func>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16e10 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18940 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101000001000; //0x16a08
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(func, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101000001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101000111000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016a08;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
