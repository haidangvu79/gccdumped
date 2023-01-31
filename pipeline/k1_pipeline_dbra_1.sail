// executing pipeline dbra_1.c.out.dumped test 
val k1_pipeline_dbra_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_dbra_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let f1: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000000c),        //goto 16860 <f1+0x40>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x6100ffc0),        //addd $r0 = $r0, -1 (0xffffffff);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x6001ffc0),        //compd.ne $r0 = $r0, -1 (0xffffffff);;
     _32(0x080000c0),        //cb.dnez $r0? 16854 <f1+0x34>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x1000000a),        //goto 16878 <f1+0x58>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f401b240),        //compw.le $r0 = $r0, 9 (0x9);;
     _32(0x0c7ffc80),        //cb.wnez $r0? 16834 <f1+0x14>;;
     _64(0x003fffffe000ffc0),        //make $r0 = 4294967295 (0xffffffff);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000000c),        //goto 168c0 <f2+0x40>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x6100ffc0),        //addd $r0 = $r0, -1 (0xffffffff);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x6101ffc0),        //compd.eq $r0 = $r0, -1 (0xffffffff);;
     _32(0x080000c0),        //cb.dnez $r0? 168b4 <f2+0x34>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x1000000a),        //goto 168d8 <f2+0x58>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f401b240),        //compw.le $r0 = $r0, 9 (0x9);;
     _32(0x0c7ffc80),        //cb.wnez $r0? 16894 <f2+0x14>;;
     _64(0x003fffffe000ffc0),        //make $r0 = 4294967295 (0xffffffff);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f3: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000000b),        //goto 1691c <f3+0x3c>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x6100ffc0),        //addd $r0 = $r0, -1 (0xffffffff);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x080000c0),        //cb.dnez $r0? 16910 <f3+0x30>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x1000000a),        //goto 16934 <f3+0x54>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f401b240),        //compw.le $r0 = $r0, 9 (0x9);;
     _32(0x0c7ffcc0),        //cb.wnez $r0? 168f4 <f3+0x14>;;
     _64(0x003fffffe000ffc0),        //make $r0 = 4294967295 (0xffffffff);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let f4: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000000b),        //goto 1697c <f4+0x3c>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x6100ffc0),        //addd $r0 = $r0, -1 (0xffffffff);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x088000c0),        //cb.deqz $r0? 16970 <f4+0x30>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x1000000a),        //goto 16994 <f4+0x54>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f401b240),        //compw.le $r0 = $r0, 9 (0x9);;
     _32(0x0c7ffcc0),        //cb.wnez $r0? 16954 <f4+0x14>;;
     _64(0x003fffffe000ffc0),        //make $r0 = 4294967295 (0xffffffff);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let f5: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000000b),        //goto 169dc <f5+0x3c>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x080000c0),        //cb.dnez $r0? 169d0 <f5+0x30>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x1000000a),        //goto 169f4 <f5+0x54>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f401b240),        //compw.le $r0 = $r0, 9 (0x9);;
     _32(0x0c7ffcc0),        //cb.wnez $r0? 169b4 <f5+0x14>;;
     _64(0x003fffffe000ffc0),        //make $r0 = 4294967295 (0xffffffff);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let f6: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000000b),        //goto 16a3c <f6+0x3c>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x088000c0),        //cb.deqz $r0? 16a30 <f6+0x30>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x1000000a),        //goto 16a54 <f6+0x54>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f401b240),        //compw.le $r0 = $r0, 9 (0x9);;
     _32(0x0c7ffcc0),        //cb.wnez $r0? 16a14 <f6+0x14>;;
     _64(0x003fffffe000ffc0),        //make $r0 = 4294967295 (0xffffffff);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1fffff6c),        //call 16820 <f1>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b140),        //compw.eq $r0 = $r0, 5 (0x5);;
     _32(0x0c000080),        //cb.wnez $r0? 16a88 <main+0x28>;;
     _32(0x18000035),        //call 16b58 <abort>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffff7d),        //call 16880 <f2>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16a9c <main+0x3c>;;
     _32(0x18000030),        //call 16b58 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff78),        //call 16880 <f2>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16ab8 <main+0x58>;;
     _32(0x18000029),        //call 16b58 <abort>;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1fffff89),        //call 168e0 <f3>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b100),        //compw.eq $r0 = $r0, 4 (0x4);;
     _32(0x0c000080),        //cb.wnez $r0? 16ad4 <main+0x74>;;
     _32(0x18000022),        //call 16b58 <abort>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffff9a),        //call 16940 <f4>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16af0 <main+0x90>;;
     _32(0x1800001b),        //call 16b58 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff93),        //call 16940 <f4>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16b04 <main+0xa4>;;
     _32(0x18000016),        //call 16b58 <abort>;;
     _32(0x6000fffb),        //make $r0 = -5 (0xfffffffb);;
     _32(0x1fffffa6),        //call 169a0 <f5>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b100),        //compw.eq $r0 = $r0, 4 (0x4);;
     _32(0x0c000080),        //cb.wnez $r0? 16b20 <main+0xc0>;;
     _32(0x1800000f),        //call 16b58 <abort>;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1fffffb7),        //call 16a00 <f6>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16b3c <main+0xdc>;;
     _32(0x18000008),        //call 16b58 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffb0),        //call 16a00 <f6>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16b50 <main+0xf0>;;
     _32(0x18000003),        //call 16b58 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16b78 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16f78 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18c50 <_exit>
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
     _32(0x98000161),        //call 17110 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16bb4 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18c50 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101001100000; //0x16a60
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f1, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f2, 0b00010110100010000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f3, 0b00010110100011100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f4, 0b00010110100101000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f5, 0b00010110100110100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f6, 0b00010110101000000000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101001100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101101011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110101101111000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016a60;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
