// executing pipeline pr20466_1.c.out.dumped test 
val k1_pipeline_pr20466_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr20466_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let f: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x27050c0c),        //sd 48 (0x30)[$r12] = $r1;;
     _32(0x27090a0c),        //sd 40 (0x28)[$r12] = $r2;;
     _32(0x270d080c),        //sd 32 (0x20)[$r12] = $r3;;
     _32(0x2711060c),        //sd 24 (0x18)[$r12] = $r4;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38040c0c),        //ld $r1 = 48 (0x30)[$r12];;
     _32(0x30040001),        //lwz $r1 = 0 (0x0)[$r1];;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x38040a0c),        //ld $r1 = 40 (0x28)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x60040063),        //make $r1 = 99 (0x63);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x60000003),        //make $r0 = 3 (0x3);;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x6000002a),        //make $r0 = 42 (0x2a);;
     _32(0x2601160c),        //sw 88 (0x58)[$r12] = $r0;;
     _32(0x60000042),        //make $r0 = 66 (0x42);;
     _32(0x2601140c),        //sw 80 (0x50)[$r12] = $r0;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2601120c),        //sw 72 (0x48)[$r12] = $r0;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x2601100c),        //sw 64 (0x40)[$r12] = $r0;;
     _32(0x60000037),        //make $r0 = 55 (0x37);;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x6100160c),        //addd $r0 = $r12, 88 (0x58);;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x61000e0c),        //addd $r0 = $r12, 56 (0x38);;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x6110080c),        //addd $r4 = $r12, 32 (0x20);;
     _32(0x610c0a0c),        //addd $r3 = $r12, 40 (0x28);;
     _32(0x6108120c),        //addd $r2 = $r12, 72 (0x48);;
     _32(0x6104140c),        //addd $r1 = $r12, 80 (0x50);;
     _32(0x61000c0c),        //addd $r0 = $r12, 48 (0x30);;
     _32(0x1fffffce),        //call 16820 <f>;;
     _32(0x3000160c),        //lwz $r0 = 88 (0x58)[$r12];;
     _64(0x00000002f001b080),        //compw.ne $r0 = $r0, 66 (0x42);;
     _32(0x0c000540),        //cb.wnez $r0? 1694c <main+0xc4>;;
     _32(0x38040c0c),        //ld $r1 = 48 (0x30)[$r12];;
     _32(0x6100120c),        //addd $r0 = $r12, 72 (0x48);;
     _32(0x7001a001),        //compd.ne $r0 = $r1, $r0;;
     _32(0x08000440),        //cb.dnez $r0? 1694c <main+0xc4>;;
     _32(0x3000120c),        //lwz $r0 = 72 (0x48)[$r12];;
     _64(0x00000003f001b0c0),        //compw.ne $r0 = $r0, 99 (0x63);;
     _32(0x0c000340),        //cb.wnez $r0? 1694c <main+0xc4>;;
     _32(0x3000100c),        //lwz $r0 = 64 (0x40)[$r12];;
     _64(0x07fffffff001b7c0),        //compw.ne $r0 = $r0, 4294967295 (0xffffffff);;
     _32(0x0c000240),        //cb.wnez $r0? 1694c <main+0xc4>;;
     _32(0x38040a0c),        //ld $r1 = 40 (0x28)[$r12];;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x7001a001),        //compd.ne $r0 = $r1, $r0;;
     _32(0x08000140),        //cb.dnez $r0? 1694c <main+0xc4>;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _64(0x00000001f101b5c0),        //compw.eq $r0 = $r0, 55 (0x37);;
     _32(0x0c000080),        //cb.wnez $r0? 16950 <main+0xc8>;;
     _32(0x18000003),        //call 16958 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16978 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16d78 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18a50 <_exit>
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
     _32(0x98000161),        //call 16f10 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 169b4 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18a50 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100010001000; //0x16888
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100101011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100101111000, num_instr, mI);
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
