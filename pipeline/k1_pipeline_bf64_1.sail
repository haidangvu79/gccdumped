// executing pipeline bf64_1 test 
val k1_pipeline_bf64_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_bf64_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let sub: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6b03f300),        //extfs $r0 = $r0, 63 (0x3f), 12 (0xc);;
     _96(0x000043b285048d15ea009e00),        //ord $r0 = $r0, 2381903268435576 (0x8765412345678);;
     _32(0x79022300),        //slld $r0 = $r0, 12 (0xc);;
     _32(0x7a022300),        //srad $r0 = $r0, 12 (0xc);;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x6307f300),        //insf $r1 = $r0, 63 (0x3f), 12 (0xc);;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let sub2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6b033000),        //extfs $r0 = $r0, 51 (0x33), 0 (0x0);;
     _96(0x000043b285048d15ea009e00),        //ord $r0 = $r0, 2381903268435576 (0x8765412345678);;
     _32(0x79022300),        //slld $r0 = $r0, 12 (0xc);;
     _32(0x7a022300),        //srad $r0 = $r0, 12 (0xc);;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x63073000),        //insf $r1 = $r0, 51 (0x33), 0 (0x0);;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
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
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x60040123),        //make $r1 = 291 (0x123);;
     _32(0x6003b001),        //insf $r0 = $r1, 11 (0xb), 0 (0x0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x0003ffc0e00403f8),        //make $r1 = -1099243257841 (0xffffff000fff000f);;
     _32(0x6303f301),        //insf $r0 = $r1, 63 (0x3f), 12 (0xc);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _64(0x0003ffc0e00403f8),        //make $r1 = -1099243257841 (0xffffff000fff000f);;
     _32(0x63033001),        //insf $r0 = $r1, 51 (0x33), 0 (0x0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3000050c),        //lwz $r0 = 20 (0x14)[$r12];;
     _32(0x60040123),        //make $r1 = 291 (0x123);;
     _32(0x6103f501),        //insf $r0 = $r1, 31 (0x1f), 20 (0x14);;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x1fffffca),        //call 16820 <sub>;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x1fffffd7),        //call 16860 <sub2>;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x00000003e800ffc0),        //andd $r0 = $r0, 4095 (0xfff);;
     _32(0x600148c0),        //compd.ne $r0 = $r0, 291 (0x123);;
     _32(0x08000240),        //cb.dnez $r0? 16940 <main+0xa0>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x07fffffce8000000),        //andd $r0 = $r0, -4096 (0xfffffffffffff000);;
     _96(0x07ffaa0f87fd59fce0040000),        //make $r1 = 18443720416555429888 (0xfff541fff567f000);;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16944 <main+0xa4>;;
     _32(0x18000016),        //call 16998 <abort>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _96(0x07ff800080000000e8000000),        //andd $r0 = $r0, 18442240474082181120 (0xfff0000000000000);;
     _96(0x0091800080000000e0040000),        //make $r1 = 1310547491564814336 (0x1230000000000000);;
     _32(0x7001a040),        //compd.ne $r0 = $r0, $r1;;
     _32(0x08000280),        //cb.dnez $r0? 1698c <main+0xec>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _96(0x00007fff87ffffffe800ffc0),        //andd $r0 = $r0, 4503599627370495 (0xfffffffffffff);;
     _96(0x00007ffa8507ffd5e0049fc0),        //make $r1 = 4502861429823103 (0xfff541fff567f);;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16990 <main+0xf0>;;
     _32(0x18000003),        //call 16998 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 169b8 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16db8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18a90 <_exit>
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
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(sub, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(sub2, 0b00010110100001100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100110011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100110111000, num_instr, mI);
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
