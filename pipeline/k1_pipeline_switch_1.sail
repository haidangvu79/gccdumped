// executing pipeline switch_1 test 
val k1_pipeline_switch_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_switch_1() = {
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
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7100ff00),        //addw $r0 = $r0, -4 (0xfffffffc);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f905b1c0),        //compw.gtu $r1 = $r0, 7 (0x7);;
     _32(0x78043fc1),        //zxbd $r1 = $r1;;
     _32(0x08000241),        //cb.dnez $r1? 16864 <foo+0x44>;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x79026001),        //slld $r0 = $r1, $r0;;
     _32(0x68002940),        //andd $r0 = $r0, 165 (0xa5);;
     _32(0x60010000),        //compd.ne $r0 = $r0, 0 (0x0);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x088000c0),        //cb.deqz $r0? 16864 <foo+0x44>;;
     _32(0x6000001e),        //make $r0 = 30 (0x1e);;
     _32(0x10000002),        //goto 16868 <foo+0x48>;;
     _32(0x6000001f),        //make $r0 = 31 (0x1f);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000030),        //goto 16944 <main+0xd4>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x1fffffe5),        //call 16820 <foo>;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f001b100),        //compw.ne $r0 = $r0, 4 (0x4);;
     _32(0x0c000180),        //cb.wnez $r0? 168b8 <main+0x48>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f101b780),        //compw.eq $r0 = $r0, 30 (0x1e);;
     _32(0x0c000880),        //cb.wnez $r0? 16938 <main+0xc8>;;
     _32(0x1800002d),        //call 16968 <abort>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f001b180),        //compw.ne $r0 = $r0, 6 (0x6);;
     _32(0x0c000180),        //cb.wnez $r0? 168dc <main+0x6c>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f101b780),        //compw.eq $r0 = $r0, 30 (0x1e);;
     _32(0x0c000640),        //cb.wnez $r0? 16938 <main+0xc8>;;
     _32(0x18000024),        //call 16968 <abort>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f001b240),        //compw.ne $r0 = $r0, 9 (0x9);;
     _32(0x0c000180),        //cb.wnez $r0? 16900 <main+0x90>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f101b780),        //compw.eq $r0 = $r0, 30 (0x1e);;
     _32(0x0c000400),        //cb.wnez $r0? 16938 <main+0xc8>;;
     _32(0x1800001b),        //call 16968 <abort>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f001b2c0),        //compw.ne $r0 = $r0, 11 (0xb);;
     _32(0x0c000180),        //cb.wnez $r0? 16924 <main+0xb4>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f101b780),        //compw.eq $r0 = $r0, 30 (0x1e);;
     _32(0x0c0001c0),        //cb.wnez $r0? 16938 <main+0xc8>;;
     _32(0x18000012),        //call 16968 <abort>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f101b7c0),        //compw.eq $r0 = $r0, 31 (0x1f);;
     _32(0x0c000080),        //cb.wnez $r0? 16938 <main+0xc8>;;
     _32(0x1800000d),        //call 16968 <abort>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000002f401b040),        //compw.le $r0 = $r0, 65 (0x41);;
     _32(0x0c7ff380),        //cb.wnez $r0? 16888 <main+0x18>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16d40 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18870 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100001110000; //0x16870
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100001110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100101101000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016870;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
