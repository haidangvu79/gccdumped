// executing pipeline pr33870_1.c.out.dumped test 
val k1_pipeline_pr33870_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr33870_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let merge_pagelist: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _96(0x0000000080000117e0042400),        //make $r1 = 285840 (0x45c90);;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x61001000),        //addd $r0 = $r0, 64 (0x40);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x27011e0c),        //sd 120 (0x78)[$r12] = $r0;;
     _32(0x10000022),        //goto 168d4 <merge_pagelist+0xb4>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x30040200),        //lwz $r1 = 8 (0x8)[$r0];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x30000200),        //lwz $r0 = 8 (0x8)[$r0];;
     _32(0x7701b001),        //compw.geu $r0 = $r1, $r0;;
     _32(0x0c000280),        //cb.wnez $r0? 1688c <merge_pagelist+0x6c>;;
     _32(0x38001e0c),        //ld $r0 = 120 (0x78)[$r12];;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x27051000),        //sd 64 (0x40)[$r0] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x27011e0c),        //sd 120 (0x78)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x38001000),        //ld $r0 = 64 (0x40)[$r0];;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x10000009),        //goto 168ac <merge_pagelist+0x8c>;;
     _32(0x38001e0c),        //ld $r0 = 120 (0x78)[$r12];;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x27051000),        //sd 64 (0x40)[$r0] = $r1;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x27011e0c),        //sd 120 (0x78)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38001000),        //ld $r0 = 64 (0x40)[$r0];;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x088000c0),        //cb.deqz $r0? 168e4 <merge_pagelist+0xc4>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x087ff700),        //cb.dnez $r0? 16850 <merge_pagelist+0x30>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x08800140),        //cb.deqz $r0? 168fc <merge_pagelist+0xdc>;;
     _32(0x38001e0c),        //ld $r0 = 120 (0x78)[$r12];;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x27051000),        //sd 64 (0x40)[$r0] = $r1;;
     _32(0x1000000a),        //goto 16920 <merge_pagelist+0x100>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x08800140),        //cb.deqz $r0? 16914 <merge_pagelist+0xf4>;;
     _32(0x38001e0c),        //ld $r0 = 120 (0x78)[$r12];;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x27051000),        //sd 64 (0x40)[$r0] = $r1;;
     _32(0x10000004),        //goto 16920 <merge_pagelist+0x100>;;
     _32(0x38001e0c),        //ld $r0 = 120 (0x78)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x27051000),        //sd 64 (0x40)[$r0] = $r1;;
     _32(0x3800180c),        //ld $r0 = 96 (0x60)[$r12];;
     _32(0x6130200c),        //addd $r12 = $r12, 128 (0x80);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let sort_pagelist: list_I = 
 [|
     _32(0x6130c00c),        //addd $r12 = $r12, -256 (0xffffff00);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x61000a0c),        //addd $r0 = $r12, 40 (0x28);;
     _32(0x6a0c0000),        //copyd $r3 = $r0;;
     _32(0x600000c8),        //make $r0 = 200 (0xc8);;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x6a000003),        //copyd $r0 = $r3;;
     _32(0x180000ce),        //call 16c90 <memset>;;
     _32(0x10000045),        //goto 16a70 <sort_pagelist+0x140>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x27013e0c),        //sd 248 (0xf8)[$r12] = $r0;;
     _32(0x38003e0c),        //ld $r0 = 248 (0xf8)[$r12];;
     _32(0x38001000),        //ld $r0 = 64 (0x40)[$r0];;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x38003e0c),        //ld $r0 = 248 (0xf8)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x27051000),        //sd 64 (0x40)[$r0] = $r1;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26013d0c),        //sw 244 (0xf4)[$r12] = $r0;;
     _32(0x10000025),        //goto 16a1c <sort_pagelist+0xec>;;
     _32(0x34003d0c),        //lws $r0 = 244 (0xf4)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104400c),        //addd $r1 = $r12, 256 (0x100);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3800ca00),        //ld $r0 = -216 (0xffffff28)[$r0];;
     _32(0x08000200),        //cb.dnez $r0? 169c0 <sort_pagelist+0x90>;;
     _32(0x34003d0c),        //lws $r0 = 244 (0xf4)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104400c),        //addd $r1 = $r12, 256 (0x100);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x38043e0c),        //ld $r1 = 248 (0xf8)[$r12];;
     _32(0x2705ca00),        //sd -216 (0xffffff28)[$r0] = $r1;;
     _32(0x1000001c),        //goto 16a2c <sort_pagelist+0xfc>;;
     _32(0x34003d0c),        //lws $r0 = 244 (0xf4)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104400c),        //addd $r1 = $r12, 256 (0x100);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3800ca00),        //ld $r0 = -216 (0xffffff28)[$r0];;
     _32(0x38043e0c),        //ld $r1 = 248 (0xf8)[$r12];;
     _32(0x1fffff92),        //call 16820 <merge_pagelist>;;
     _32(0x27013e0c),        //sd 248 (0xf8)[$r12] = $r0;;
     _32(0x34003d0c),        //lws $r0 = 244 (0xf4)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104400c),        //addd $r1 = $r12, 256 (0x100);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x2705ca00),        //sd -216 (0xffffff28)[$r0] = $r1;;
     _32(0x34003d0c),        //lws $r0 = 244 (0xf4)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104400c),        //addd $r1 = $r12, 256 (0x100);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x2705ca00),        //sd -216 (0xffffff28)[$r0] = $r1;;
     _32(0x30003d0c),        //lwz $r0 = 244 (0xf4)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26013d0c),        //sw 244 (0xf4)[$r12] = $r0;;
     _32(0x30003d0c),        //lwz $r0 = 244 (0xf4)[$r12];;
     _64(0x00000000f401b5c0),        //compw.le $r0 = $r0, 23 (0x17);;
     _32(0x0c7ff640),        //cb.wnez $r0? 1698c <sort_pagelist+0x5c>;;
     _32(0x30003d0c),        //lwz $r0 = 244 (0xf4)[$r12];;
     _64(0x00000000f001b600),        //compw.ne $r0 = $r0, 24 (0x18);;
     _32(0x0c000380),        //cb.wnez $r0? 16a70 <sort_pagelist+0x140>;;
     _32(0x34003d0c),        //lws $r0 = 244 (0xf4)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104400c),        //addd $r1 = $r12, 256 (0x100);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3800ca00),        //ld $r0 = -216 (0xffffff28)[$r0];;
     _32(0x38043e0c),        //ld $r1 = 248 (0xf8)[$r12];;
     _32(0x1fffff73),        //call 16820 <merge_pagelist>;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x34003d0c),        //lws $r0 = 244 (0xf4)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6108400c),        //addd $r2 = $r12, 256 (0x100);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x2705ca00),        //sd -216 (0xffffff28)[$r0] = $r1;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x087feec0),        //cb.dnez $r0? 16960 <sort_pagelist+0x30>;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x27013e0c),        //sd 248 (0xf8)[$r12] = $r0;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x26013d0c),        //sw 244 (0xf4)[$r12] = $r0;;
     _32(0x1000000d),        //goto 16abc <sort_pagelist+0x18c>;;
     _32(0x34003d0c),        //lws $r0 = 244 (0xf4)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104400c),        //addd $r1 = $r12, 256 (0x100);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3800ca00),        //ld $r0 = -216 (0xffffff28)[$r0];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x38003e0c),        //ld $r0 = 248 (0xf8)[$r12];;
     _32(0x1fffff5e),        //call 16820 <merge_pagelist>;;
     _32(0x27013e0c),        //sd 248 (0xf8)[$r12] = $r0;;
     _32(0x30003d0c),        //lwz $r0 = 244 (0xf4)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26013d0c),        //sw 244 (0xf4)[$r12] = $r0;;
     _32(0x30003d0c),        //lwz $r0 = 244 (0xf4)[$r12];;
     _64(0x00000000f401b600),        //compw.le $r0 = $r0, 24 (0x18);;
     _32(0x0c7ffc40),        //cb.wnez $r0? 16a8c <sort_pagelist+0x15c>;;
     _32(0x38003e0c),        //ld $r0 = 248 (0xf8)[$r12];;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130400c),        //addd $r12 = $r12, 256 (0x100);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130880c),        //addd $r12 = $r12, -480 (0xfffffe20);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x26010a0c),        //sw 40 (0x28)[$r12] = $r0;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x61001600),        //addd $r0 = $r0, 88 (0x58);;
     _32(0x2701180c),        //sd 96 (0x60)[$r12] = $r0;;
     _32(0x60000004),        //make $r0 = 4 (0x4);;
     _32(0x2601200c),        //sw 128 (0x80)[$r12] = $r0;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x61002c00),        //addd $r0 = $r0, 176 (0xb0);;
     _32(0x27012e0c),        //sd 184 (0xb8)[$r12] = $r0;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2601360c),        //sw 216 (0xd8)[$r12] = $r0;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x61004200),        //addd $r0 = $r0, 264 (0x108);;
     _32(0x2701440c),        //sd 272 (0x110)[$r12] = $r0;;
     _32(0x60000003),        //make $r0 = 3 (0x3);;
     _32(0x26014c0c),        //sw 304 (0x130)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x27015a0c),        //sd 360 (0x168)[$r12] = $r0;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x1fffff7d),        //call 16930 <sort_pagelist>;;
     _32(0x2701760c),        //sd 472 (0x1d8)[$r12] = $r0;;
     _32(0x3800760c),        //ld $r0 = 472 (0x1d8)[$r12];;
     _32(0x38001000),        //ld $r0 = 64 (0x40)[$r0];;
     _32(0x3804760c),        //ld $r1 = 472 (0x1d8)[$r12];;
     _32(0x7001a001),        //compd.ne $r0 = $r1, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16b5c <main+0x7c>;;
     _32(0x18000006),        //call 16b70 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130780c),        //addd $r12 = $r12, 480 (0x1e0);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000167),        //call 17118 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000831),        //call 18c48 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101011100000; //0x16ae0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(merge_pagelist, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(sort_pagelist, 0b00010110100100110000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101011100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101101110000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016ae0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
