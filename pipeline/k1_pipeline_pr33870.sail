// executing pipeline pr33870.c.out.dumped test 
val k1_pipeline_pr33870: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr33870() = {
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
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x61000a0c),        //addd $r0 = $r12, 40 (0x28);;
     _32(0x27011e0c),        //sd 120 (0x78)[$r12] = $r0;;
     _32(0x10000018),        //goto 16894 <merge_pagelist+0x74>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7701b001),        //compw.geu $r0 = $r1, $r0;;
     _32(0x0c000280),        //cb.wnez $r0? 16874 <merge_pagelist+0x54>;;
     _32(0x38001e0c),        //ld $r0 = 120 (0x78)[$r12];;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x27050e00),        //sd 56 (0x38)[$r0] = $r1;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x27011e0c),        //sd 120 (0x78)[$r12] = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x38000e00),        //ld $r0 = 56 (0x38)[$r0];;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x10000009),        //goto 16894 <merge_pagelist+0x74>;;
     _32(0x38001e0c),        //ld $r0 = 120 (0x78)[$r12];;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x27050e00),        //sd 56 (0x38)[$r0] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x27011e0c),        //sd 120 (0x78)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x38000e00),        //ld $r0 = 56 (0x38)[$r0];;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x088000c0),        //cb.deqz $r0? 168a4 <merge_pagelist+0x84>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x087ff980),        //cb.dnez $r0? 16838 <merge_pagelist+0x18>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x08800140),        //cb.deqz $r0? 168bc <merge_pagelist+0x9c>;;
     _32(0x38001e0c),        //ld $r0 = 120 (0x78)[$r12];;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x27050e00),        //sd 56 (0x38)[$r0] = $r1;;
     _32(0x1000000a),        //goto 168e0 <merge_pagelist+0xc0>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x08800140),        //cb.deqz $r0? 168d4 <merge_pagelist+0xb4>;;
     _32(0x38001e0c),        //ld $r0 = 120 (0x78)[$r12];;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x27050e00),        //sd 56 (0x38)[$r0] = $r1;;
     _32(0x10000004),        //goto 168e0 <merge_pagelist+0xc0>;;
     _32(0x38001e0c),        //ld $r0 = 120 (0x78)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x27050e00),        //sd 56 (0x38)[$r0] = $r1;;
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
     _32(0x180000ca),        //call 16c40 <memset>;;
     _32(0x1000003f),        //goto 16a18 <sort_pagelist+0x128>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x27013e0c),        //sd 248 (0xf8)[$r12] = $r0;;
     _32(0x38003e0c),        //ld $r0 = 248 (0xf8)[$r12];;
     _32(0x38000e00),        //ld $r0 = 56 (0x38)[$r0];;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x38003e0c),        //ld $r0 = 248 (0xf8)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x27050e00),        //sd 56 (0x38)[$r0] = $r1;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26013d0c),        //sw 244 (0xf4)[$r12] = $r0;;
     _32(0x1000001f),        //goto 169c4 <sort_pagelist+0xd4>;;
     _32(0x34003d0c),        //lws $r0 = 244 (0xf4)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104400c),        //addd $r1 = $r12, 256 (0x100);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3800ca00),        //ld $r0 = -216 (0xffffff28)[$r0];;
     _32(0x08000200),        //cb.dnez $r0? 16980 <sort_pagelist+0x90>;;
     _32(0x34003d0c),        //lws $r0 = 244 (0xf4)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104400c),        //addd $r1 = $r12, 256 (0x100);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x38043e0c),        //ld $r1 = 248 (0xf8)[$r12];;
     _32(0x2705ca00),        //sd -216 (0xffffff28)[$r0] = $r1;;
     _32(0x10000016),        //goto 169d4 <sort_pagelist+0xe4>;;
     _32(0x34003d0c),        //lws $r0 = 244 (0xf4)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104400c),        //addd $r1 = $r12, 256 (0x100);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3800ca00),        //ld $r0 = -216 (0xffffff28)[$r0];;
     _32(0x38043e0c),        //ld $r1 = 248 (0xf8)[$r12];;
     _32(0x1fffffa2),        //call 16820 <merge_pagelist>;;
     _32(0x27013e0c),        //sd 248 (0xf8)[$r12] = $r0;;
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
     _32(0x0c7ff7c0),        //cb.wnez $r0? 1694c <sort_pagelist+0x5c>;;
     _32(0x30003d0c),        //lwz $r0 = 244 (0xf4)[$r12];;
     _64(0x00000000f001b600),        //compw.ne $r0 = $r0, 24 (0x18);;
     _32(0x0c000380),        //cb.wnez $r0? 16a18 <sort_pagelist+0x128>;;
     _32(0x34003d0c),        //lws $r0 = 244 (0xf4)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104400c),        //addd $r1 = $r12, 256 (0x100);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3800ca00),        //ld $r0 = -216 (0xffffff28)[$r0];;
     _32(0x38043e0c),        //ld $r1 = 248 (0xf8)[$r12];;
     _32(0x1fffff89),        //call 16820 <merge_pagelist>;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x34003d0c),        //lws $r0 = 244 (0xf4)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6108400c),        //addd $r2 = $r12, 256 (0x100);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x2705ca00),        //sd -216 (0xffffff28)[$r0] = $r1;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x087ff040),        //cb.dnez $r0? 16920 <sort_pagelist+0x30>;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x27013e0c),        //sd 248 (0xf8)[$r12] = $r0;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x26013d0c),        //sw 244 (0xf4)[$r12] = $r0;;
     _32(0x1000000d),        //goto 16a64 <sort_pagelist+0x174>;;
     _32(0x34003d0c),        //lws $r0 = 244 (0xf4)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104400c),        //addd $r1 = $r12, 256 (0x100);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3800ca00),        //ld $r0 = -216 (0xffffff28)[$r0];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x38003e0c),        //ld $r0 = 248 (0xf8)[$r12];;
     _32(0x1fffff74),        //call 16820 <merge_pagelist>;;
     _32(0x27013e0c),        //sd 248 (0xf8)[$r12] = $r0;;
     _32(0x30003d0c),        //lwz $r0 = 244 (0xf4)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26013d0c),        //sw 244 (0xf4)[$r12] = $r0;;
     _32(0x30003d0c),        //lwz $r0 = 244 (0xf4)[$r12];;
     _64(0x00000000f401b600),        //compw.le $r0 = $r0, 24 (0x18);;
     _32(0x0c7ffc40),        //cb.wnez $r0? 16a34 <sort_pagelist+0x144>;;
     _32(0x38003e0c),        //ld $r0 = 248 (0xf8)[$r12];;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130400c),        //addd $r12 = $r12, 256 (0x100);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130980c),        //addd $r12 = $r12, -416 (0xfffffe60);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x2601020c),        //sw 8 (0x8)[$r12] = $r0;;
     _32(0x6100020c),        //addd $r0 = $r12, 8 (0x8);;
     _32(0x61001400),        //addd $r0 = $r0, 80 (0x50);;
     _32(0x2701100c),        //sd 64 (0x40)[$r12] = $r0;;
     _32(0x60000004),        //make $r0 = 4 (0x4);;
     _32(0x2601160c),        //sw 88 (0x58)[$r12] = $r0;;
     _32(0x6100020c),        //addd $r0 = $r12, 8 (0x8);;
     _32(0x61002800),        //addd $r0 = $r0, 160 (0xa0);;
     _32(0x2701240c),        //sd 144 (0x90)[$r12] = $r0;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x26012a0c),        //sw 168 (0xa8)[$r12] = $r0;;
     _32(0x6100020c),        //addd $r0 = $r12, 8 (0x8);;
     _32(0x61003c00),        //addd $r0 = $r0, 240 (0xf0);;
     _32(0x2701380c),        //sd 224 (0xe0)[$r12] = $r0;;
     _32(0x60000003),        //make $r0 = 3 (0x3);;
     _32(0x26013e0c),        //sw 248 (0xf8)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x27014c0c),        //sd 304 (0x130)[$r12] = $r0;;
     _32(0x6100020c),        //addd $r0 = $r12, 8 (0x8);;
     _32(0x1fffff83),        //call 168f0 <sort_pagelist>;;
     _32(0x2701660c),        //sd 408 (0x198)[$r12] = $r0;;
     _32(0x3800660c),        //ld $r0 = 408 (0x198)[$r12];;
     _32(0x38000e00),        //ld $r0 = 56 (0x38)[$r0];;
     _32(0x3804660c),        //ld $r1 = 408 (0x198)[$r12];;
     _32(0x7001a001),        //compd.ne $r0 = $r1, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16b04 <main+0x7c>;;
     _32(0x18000006),        //call 16b18 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130680c),        //addd $r12 = $r12, 416 (0x1a0);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000169),        //call 170c8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000833),        //call 18bf8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101010001000; //0x16a88
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(merge_pagelist, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(sort_pagelist, 0b00010110100011110000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101010001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101100011000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016a88;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
