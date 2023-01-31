// executing pipeline 20050604_1.c.out.dumped test 
val k1_pipeline_20050604_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20050604_1() = {
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
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000000f),        //goto 16868 <foo+0x48>;;
     _64(0x00200000e0040300),        //make $r1 = 2147483660 (0x8000000c);;
     _96(0x0000000080000117e0002800),        //make $r0 = 285856 (0x45ca0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x71013001),        //addhq $r0 = $r1, $r0;;
     _96(0x0000000080000117e0042800),        //make $r1 = 285856 (0x45ca0);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f801b040),        //compw.leu $r0 = $r0, 1 (0x1);;
     _32(0x0c7ffbc0),        //cb.wnez $r0? 16830 <foo+0x10>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000012),        //goto 168c8 <foo+0xa8>;;
     _96(0x020d000080106400e0080000),        //make $r2 = 4728779609838977024 (0x41a0000041900000);;
     _64(0x00106c00e00c0000),        //make $r3 = 1102053376 (0x41b00000);;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x3c000000),        //lq $r0r1 = 0 (0x0)[$r0];;
     _32(0x58077002),        //faddwq $r0r1 = $r2r3, $r0r1;;
     _96(0x0000000080000117e0082400),        //make $r2 = 285840 (0x45c90);;
     _32(0x28010002),        //sq 0 (0x0)[$r2] = $r0r1;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f801b040),        //compw.leu $r0 = $r0, 1 (0x1);;
     _32(0x0c7ffb00),        //cb.wnez $r0? 16884 <foo+0x64>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1fffffcb),        //call 16820 <foo>;;
     _96(0x0000000080000117e0002800),        //make $r0 = 285856 (0x45ca0);;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _64(0x00000000f001b600),        //compw.ne $r0 = $r0, 24 (0x18);;
     _32(0x0c000400),        //cb.wnez $r0? 16954 <main+0x6c>;;
     _96(0x0000000080000117e0002800),        //make $r0 = 285856 (0x45ca0);;
     _32(0x28000080),        //lhz $r0 = 2 (0x2)[$r0];;
     _32(0x080002c0),        //cb.dnez $r0? 16954 <main+0x6c>;;
     _96(0x0000000080000117e0002800),        //make $r0 = 285856 (0x45ca0);;
     _32(0x28000100),        //lhz $r0 = 4 (0x4)[$r0];;
     _32(0x08000180),        //cb.dnez $r0? 16954 <main+0x6c>;;
     _96(0x0000000080000117e0002800),        //make $r0 = 285856 (0x45ca0);;
     _32(0x28000180),        //lhz $r0 = 6 (0x6)[$r0];;
     _32(0x08800080),        //cb.deqz $r0? 16958 <main+0x70>;;
     _32(0x18000027),        //call 169f0 <abort>;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00108400e0040000),        //make $r1 = 1108344832 (0x42100000);;
     _32(0x73030040),        //fcompw.une $r0 = $r0, $r1;;
     _32(0x08000600),        //cb.dnez $r0? 169d4 <main+0xec>;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _64(0x00108800e0040000),        //make $r1 = 1109393408 (0x42200000);;
     _32(0x73030040),        //fcompw.une $r0 = $r0, $r1;;
     _32(0x08000400),        //cb.dnez $r0? 169d4 <main+0xec>;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x30000200),        //lwz $r0 = 8 (0x8)[$r0];;
     _64(0x00108c00e0040000),        //make $r1 = 1110441984 (0x42300000);;
     _32(0x73030040),        //fcompw.une $r0 = $r0, $r1;;
     _32(0x08000200),        //cb.dnez $r0? 169d4 <main+0xec>;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x30000300),        //lwz $r0 = 12 (0xc)[$r0];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x72030040),        //fcompw.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 169d8 <main+0xf0>;;
     _32(0x18000007),        //call 169f0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
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
     _32(0x980000f3),        //call 16dc8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 188f8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100011101000; //0x168e8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100011101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100111110000, num_instr, mI);
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
