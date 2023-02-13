// executing pipeline divcmp_2.c.out.dumped test 
val k1_pipeline_divcmp_2: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_divcmp_2() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let test1: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7100fb00),        //addw $r0 = $r0, -20 (0xffffffec);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f801b240),        //compw.leu $r0 = $r0, 9 (0x9);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71000240),        //addw $r0 = $r0, 9 (0x9);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f801b480),        //compw.leu $r0 = $r0, 18 (0x12);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test3: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71000740),        //addw $r0 = $r0, 29 (0x1d);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f801b240),        //compw.leu $r0 = $r0, 9 (0x9);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test4: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71000740),        //addw $r0 = $r0, 29 (0x1d);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f801b240),        //compw.leu $r0 = $r0, 9 (0x9);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test5: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71000240),        //addw $r0 = $r0, 9 (0x9);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f801b480),        //compw.leu $r0 = $r0, 18 (0x12);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test6: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7100fb00),        //addw $r0 = $r0, -20 (0xffffffec);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f801b240),        //compw.leu $r0 = $r0, 9 (0x9);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000013),        //make $r0 = 19 (0x13);;
     _32(0x1fffffb4),        //call 16820 <test1>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16960 <main+0x20>;;
     _32(0x18000091),        //call 16ba0 <abort>;;
     _32(0x60000014),        //make $r0 = 20 (0x14);;
     _32(0x1fffffaf),        //call 16820 <test1>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 1697c <main+0x3c>;;
     _32(0x1800008a),        //call 16ba0 <abort>;;
     _32(0x6000001d),        //make $r0 = 29 (0x1d);;
     _32(0x1fffffa8),        //call 16820 <test1>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16998 <main+0x58>;;
     _32(0x18000083),        //call 16ba0 <abort>;;
     _32(0x6000001e),        //make $r0 = 30 (0x1e);;
     _32(0x1fffffa1),        //call 16820 <test1>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 169ac <main+0x6c>;;
     _32(0x1800007e),        //call 16ba0 <abort>;;
     _32(0x6000fff6),        //make $r0 = -10 (0xfffffff6);;
     _32(0x1fffffa8),        //call 16850 <test2>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 169c0 <main+0x80>;;
     _32(0x18000079),        //call 16ba0 <abort>;;
     _32(0x6000fff7),        //make $r0 = -9 (0xfffffff7);;
     _32(0x1fffffa3),        //call 16850 <test2>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 169dc <main+0x9c>;;
     _32(0x18000072),        //call 16ba0 <abort>;;
     _32(0x60000009),        //make $r0 = 9 (0x9);;
     _32(0x1fffff9c),        //call 16850 <test2>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 169f8 <main+0xb8>;;
     _32(0x1800006b),        //call 16ba0 <abort>;;
     _32(0x6000000a),        //make $r0 = 10 (0xa);;
     _32(0x1fffff95),        //call 16850 <test2>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16a0c <main+0xcc>;;
     _32(0x18000066),        //call 16ba0 <abort>;;
     _32(0x6000ffe2),        //make $r0 = -30 (0xffffffe2);;
     _32(0x1fffff9c),        //call 16880 <test3>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16a20 <main+0xe0>;;
     _32(0x18000061),        //call 16ba0 <abort>;;
     _32(0x6000ffe3),        //make $r0 = -29 (0xffffffe3);;
     _32(0x1fffff97),        //call 16880 <test3>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16a3c <main+0xfc>;;
     _32(0x1800005a),        //call 16ba0 <abort>;;
     _32(0x6000ffec),        //make $r0 = -20 (0xffffffec);;
     _32(0x1fffff90),        //call 16880 <test3>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16a58 <main+0x118>;;
     _32(0x18000053),        //call 16ba0 <abort>;;
     _32(0x6000ffed),        //make $r0 = -19 (0xffffffed);;
     _32(0x1fffff89),        //call 16880 <test3>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16a6c <main+0x12c>;;
     _32(0x1800004e),        //call 16ba0 <abort>;;
     _32(0x6000ffe2),        //make $r0 = -30 (0xffffffe2);;
     _32(0x1fffff90),        //call 168b0 <test4>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16a80 <main+0x140>;;
     _32(0x18000049),        //call 16ba0 <abort>;;
     _32(0x6000ffe3),        //make $r0 = -29 (0xffffffe3);;
     _32(0x1fffff8b),        //call 168b0 <test4>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16a9c <main+0x15c>;;
     _32(0x18000042),        //call 16ba0 <abort>;;
     _32(0x6000ffec),        //make $r0 = -20 (0xffffffec);;
     _32(0x1fffff84),        //call 168b0 <test4>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16ab8 <main+0x178>;;
     _32(0x1800003b),        //call 16ba0 <abort>;;
     _32(0x6000ffed),        //make $r0 = -19 (0xffffffed);;
     _32(0x1fffff7d),        //call 168b0 <test4>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16acc <main+0x18c>;;
     _32(0x18000036),        //call 16ba0 <abort>;;
     _32(0x6000fff6),        //make $r0 = -10 (0xfffffff6);;
     _32(0x1fffff84),        //call 168e0 <test5>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16ae0 <main+0x1a0>;;
     _32(0x18000031),        //call 16ba0 <abort>;;
     _32(0x6000fff7),        //make $r0 = -9 (0xfffffff7);;
     _32(0x1fffff7f),        //call 168e0 <test5>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16afc <main+0x1bc>;;
     _32(0x1800002a),        //call 16ba0 <abort>;;
     _32(0x60000009),        //make $r0 = 9 (0x9);;
     _32(0x1fffff78),        //call 168e0 <test5>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16b18 <main+0x1d8>;;
     _32(0x18000023),        //call 16ba0 <abort>;;
     _32(0x6000000a),        //make $r0 = 10 (0xa);;
     _32(0x1fffff71),        //call 168e0 <test5>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16b2c <main+0x1ec>;;
     _32(0x1800001e),        //call 16ba0 <abort>;;
     _32(0x60000013),        //make $r0 = 19 (0x13);;
     _32(0x1fffff78),        //call 16910 <test6>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16b40 <main+0x200>;;
     _32(0x18000019),        //call 16ba0 <abort>;;
     _32(0x60000014),        //make $r0 = 20 (0x14);;
     _32(0x1fffff73),        //call 16910 <test6>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16b5c <main+0x21c>;;
     _32(0x18000012),        //call 16ba0 <abort>;;
     _32(0x6000001d),        //make $r0 = 29 (0x1d);;
     _32(0x1fffff6c),        //call 16910 <test6>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16b78 <main+0x238>;;
     _32(0x1800000b),        //call 16ba0 <abort>;;
     _32(0x6000001e),        //make $r0 = 30 (0x1e);;
     _32(0x1fffff65),        //call 16910 <test6>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16b8c <main+0x24c>;;
     _32(0x18000006),        //call 16ba0 <abort>;;
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
     _32(0x980000f3),        //call 16f78 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18aa8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100101000000; //0x16940
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test1, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test2, 0b00010110100001010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test3, 0b00010110100010000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test4, 0b00010110100010110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test5, 0b00010110100011100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test6, 0b00010110100100010000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100101000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101110100000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016940;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
