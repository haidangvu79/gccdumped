// executing pipeline 991118_1.c.out.dumped test 
val k1_pipeline_991118_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_991118_1() = {
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
     _96(0x000043b285048d15ec009e00),        //xord $r0 = $r0, 2381903268435576 (0x8765412345678);;
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
     _96(0x000043b285048d15ec009e00),        //xord $r0 = $r0, 2381903268435576 (0x8765412345678);;
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

let sub3: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6b03f2c0),        //extfs $r0 = $r0, 63 (0x3f), 11 (0xb);;
     _96(0x0000c3b285048d15ec009e00),        //xord $r0 = $r0, 6885502895806072 (0x18765412345678);;
     _32(0x790222c0),        //slld $r0 = $r0, 11 (0xb);;
     _32(0x7a0222c0),        //srad $r0 = $r0, 11 (0xb);;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x6307f2c0),        //insf $r1 = $r0, 63 (0x3f), 11 (0xb);;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let sub4: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6b034000),        //extfs $r0 = $r0, 52 (0x34), 0 (0x0);;
     _96(0x0000c3b285048d15ec009e00),        //xord $r0 = $r0, 6885502895806072 (0x18765412345678);;
     _32(0x790222c0),        //slld $r0 = $r0, 11 (0xb);;
     _32(0x7a0222c0),        //srad $r0 = $r0, 11 (0xb);;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x63074000),        //insf $r1 = $r0, 52 (0x34), 0 (0x0);;
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
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x1fffffb9),        //call 16820 <sub>;;
     _96(0x00000000800000f8e0040200),        //make $r1 = 253960 (0x3e008);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x00000000800000f8e0000400),        //make $r0 = 253968 (0x3e010);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x1fffffc0),        //call 16860 <sub2>;;
     _96(0x00000000800000f8e0040400),        //make $r1 = 253968 (0x3e010);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _64(0x00000003e800ffc0),        //andd $r0 = $r0, 4095 (0xfff);;
     _32(0x600148c0),        //compd.ne $r0 = $r0, 291 (0x123);;
     _32(0x08000300),        //cb.dnez $r0? 169c0 <main+0xa0>;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _64(0x07fffffce8000000),        //andd $r0 = $r0, -4096 (0xfffffffffffff000);;
     _96(0x04aa88ba86f7f6d4e0040000),        //make $r1 = 10759406668129980416 (0x9551175bdfdb5000);;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 169c4 <main+0xa4>;;
     _32(0x1800005c),        //call 16b30 <abort>;;
     _96(0x00000000800000f8e0000400),        //make $r0 = 253968 (0x3e010);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x07ff800080000000e8000000),        //andd $r0 = $r0, 18442240474082181120 (0xfff0000000000000);;
     _96(0x0091800080000000e0040000),        //make $r1 = 1310547491564814336 (0x1230000000000000);;
     _32(0x7001a040),        //compd.ne $r0 = $r0, $r1;;
     _32(0x08000340),        //cb.dnez $r0? 16a24 <main+0x104>;;
     _96(0x00000000800000f8e0000400),        //make $r0 = 253968 (0x3e010);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x00007fff87ffffffe800ffc0),        //andd $r0 = $r0, 4503599627370495 (0xfffffffffffff);;
     _96(0x00004aa8845d6f7fe0046d40),        //make $r1 = 2626808268586421 (0x9551175bdfdb5);;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16a28 <main+0x108>;;
     _32(0x18000043),        //call 16b30 <abort>;;
     _96(0x00000000800000f8e0000600),        //make $r0 = 253976 (0x3e018);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x1fffff9a),        //call 168a0 <sub3>;;
     _96(0x00000000800000f8e0040600),        //make $r1 = 253976 (0x3e018);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x00000000800000f8e0000800),        //make $r0 = 253984 (0x3e020);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x1fffffa1),        //call 168e0 <sub4>;;
     _96(0x00000000800000f8e0040800),        //make $r1 = 253984 (0x3e020);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x00000000800000f8e0000600),        //make $r0 = 253976 (0x3e018);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _64(0x00000001e800ffc0),        //andd $r0 = $r0, 2047 (0x7ff);;
     _32(0x600148c0),        //compd.ne $r0 = $r0, 291 (0x123);;
     _32(0x08000300),        //cb.dnez $r0? 16abc <main+0x19c>;;
     _96(0x00000000800000f8e0000600),        //make $r0 = 253976 (0x3e018);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _64(0x07fffffee8000000),        //andd $r0 = $r0, -2048 (0xfffffffffffff800);;
     _96(0x06626ac48468acf0e0040000),        //make $r1 = 14721520139467210752 (0xcc4d5891a2b3c000);;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16ac0 <main+0x1a0>;;
     _32(0x1800001d),        //call 16b30 <abort>;;
     _96(0x00000000800000f8e0000800),        //make $r0 = 253984 (0x3e020);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x07ff000080000000e8000000),        //andd $r0 = $r0, 18437736874454810624 (0xffe0000000000000);;
     _96(0x0123000080000000e0040000),        //make $r1 = 2621094983129628672 (0x2460000000000000);;
     _32(0x7001a040),        //compd.ne $r0 = $r0, $r1;;
     _32(0x08000340),        //cb.dnez $r0? 16b20 <main+0x200>;;
     _96(0x00000000800000f8e0000800),        //make $r0 = 253984 (0x3e020);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x0000ffff87ffffffe800ffc0),        //andd $r0 = $r0, 9007199254740991 (0x1fffffffffffff);;
     _96(0x0000cc4d82c48d15e0049e00),        //make $r1 = 7188242255599224 (0x1989ab12345678);;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16b24 <main+0x204>;;
     _32(0x18000004),        //call 16b30 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 16b50 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16f50 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18c28 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0xf838ffc0),        //zxwd $r14 = $r0
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x98000161),        //call 170e8 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16b8c <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18c28 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100100000; //0x16920
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(sub, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(sub2, 0b00010110100001100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(sub3, 0b00010110100010100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(sub4, 0b00010110100011100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101100110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110101101010000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016920;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
