// executing pipeline pr58831.c.out.dumped test 
val k1_pipeline_pr58831: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr58831() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let fn1: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2705020c),        //sd 8 (0x8)[$r12] = $r1;;
     _96(0x0000000080000117e0003000),        //make $r0 = 285888 (0x45cc0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x1000000e),        //goto 1687c <fn1+0x5c>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x087ffbc0),        //cb.dnez $r0? 16848 <fn1+0x28>;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _96(0x0000000080000117e0044000),        //make $r1 = 285952 (0x45d00);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0003a00),        //make $r0 = 285928 (0x45ce8);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x08000300),        //cb.dnez $r0? 168f4 <fn1+0xd4>;;
     _96(0x00000000800000fce00cf000),        //make $r3 = 259008 (0x3f3c0);;
     _96(0x00000000800000fce008f600),        //make $r2 = 259032 (0x3f3d8);;
     _32(0x6004000e),        //make $r1 = 14 (0xe);;
     _96(0x00000000800000fce000f200),        //make $r0 = 259016 (0x3f3c8);;
     _32(0x18000066),        //call 16a88 <__assert_func>;;
     _96(0x0000000080000117e0003e00),        //make $r0 = 285944 (0x45cf8);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let fn2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _96(0x0000000080000117e0003600),        //make $r0 = 285912 (0x45cd8);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x10000033),        //goto 169fc <fn2+0xe4>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701020c),        //sd 8 (0x8)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x0000000080000117e0003800),        //make $r0 = 285920 (0x45ce0);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x25050000),        //sh 0 (0x0)[$r0] = $r1;;
     _32(0x10000018),        //goto 169c0 <fn2+0xa8>;;
     _32(0x6100020c),        //addd $r0 = $r12, 8 (0x8);;
     _32(0x61000400),        //addd $r0 = $r0, 16 (0x10);;
     _32(0x2701000c),        //sd 0 (0x0)[$r12] = $r0;;
     _96(0x0000000080000117e0004200),        //make $r0 = 285960 (0x45d08);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000000f501b040),        //compw.gt $r0 = $r0, 1 (0x1);;
     _32(0x0c7ffdc0),        //cb.wnez $r0? 16964 <fn2+0x4c>;;
     _96(0x0000000080000117e0003800),        //make $r0 = 285920 (0x45ce0);;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x6407f000),        //zxhd $r1 = $r0;;
     _96(0x0000000080000117e0003800),        //make $r0 = 285920 (0x45ce0);;
     _32(0x25050000),        //sh 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0003800),        //make $r0 = 285920 (0x45ce0);;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x087ffa00),        //cb.dnez $r0? 16970 <fn2+0x58>;;
     _96(0x0000000080000117e0003600),        //make $r0 = 285912 (0x45cd8);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000117e0003600),        //make $r0 = 285912 (0x45cd8);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0003600),        //make $r0 = 285912 (0x45cd8);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000001f001b280),        //compw.ne $r0 = $r0, 42 (0x2a);;
     _32(0x0c7ff200),        //cb.wnez $r0? 16934 <fn2+0x1c>;;
     _96(0x0000000080000117e0003a00),        //make $r0 = 285928 (0x45ce8);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1fffffb7),        //call 16918 <fn2>;;
     _96(0x0000000080000117e0043c00),        //make $r1 = 285936 (0x45cf0);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x0000000080000117e0003000),        //make $r0 = 285888 (0x45cc0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x0000000080000117e0043c00),        //make $r1 = 285936 (0x45cf0);;
     _32(0x38040001),        //ld $r1 = 0 (0x0)[$r1];;
     _32(0x1fffff6c),        //call 16820 <fn1>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let __assert_func: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _96(0x08000000880000f8e0181000),        //make $r6 = 254016 (0x3e040);;
     _32(0xf810ffc1),        //zxwd $r4 = $r1
     _32(0xea140003),        //copyd $r5 = $r3
     _32(0xea0c0000),        //copyd $r3 = $r0
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0xea180002),        //copyd $r6 = $r2
     _32(0xea080005),        //copyd $r2 = $r5
     _96(0x90000100b8040006e014f000),        //make $r5 = 263104 (0x403c0)
     _32(0x10000000),        //ld $r1 = 0 (0x0)[$r6];;
     _32(0x888001c6),        //cb.deqz $r6? 16ae0 <__assert_func+0x58>
     _32(0x38000601),        //ld $r0 = 24 (0x18)[$r1];;
     _32(0x98000039),        //call 16bb0 <fiprintf>
     _96(0x0000000080000100e004f400),        //make $r1 = 263120 (0x403d0);;
     _32(0x180005c5),        //call 181f0 <abort>;;
     _96(0x0000000080000106e0141800),        //make $r5 = 268384 (0x41860);;
     _32(0x97fffff8),        //goto 16acc <__assert_func+0x44>
     _32(0x6a180005),        //copyd $r6 = $r5;;
     _32(0x7f03f000)        //nop ;;
 |];

let __assert: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x6a0c0002),        //copyd $r3 = $r2;;
     _32(0x9fffffe1),        //call 16a88 <__assert_func>
     _32(0xe0080000),        //make $r2 = 0 (0x0)
     _32(0x2741060c)        //sd 24 (0x18)[$r12] = $r16;;
 |];

let __libc_fini_array: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _96(0x800000d8a749040ce0480000),        //make $r18 = 221184 (0x36000)
     _32(0x00000000),        //sd 16 (0x10)[$r12] = $r18;;
     _96(0x800000d8a739020ce5380012),        //sbfd $r14 = $r18, 221184 (0x36000)
     _32(0x00000000),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0xfa3a20ce),        //srad $r14 = $r14, 3 (0x3)
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x0880014e),        //cb.deqz $r14? 16b54 <__libc_fini_array+0x44>;;
     _32(0x6138ffce),        //addd $r14 = $r14, -1 (0xffffffff);;
     _32(0x3802f392),        //ld.xs $r0 = $r14[$r18];;
     _32(0x0fdc0000),        //icall $r0;;
     _32(0x087fff4e),        //cb.dnez $r14? 16b44 <__libc_fini_array+0x34>;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3848040c),        //ld $r18 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let _fiprintf_r: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0xe13c0e0c),        //addd $r15 = $r12, 56 (0x38)
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0xea0c000f),        //copyd $r3 = $r15
     _32(0x270d0e0c),        //sd 56 (0x38)[$r12] = $r3;;
     _32(0x2811100c),        //sq 64 (0x40)[$r12] = $r4r5;;
     _32(0x2819140c),        //sq 80 (0x50)[$r12] = $r6r7;;
     _32(0x2821180c),        //sq 96 (0x60)[$r12] = $r8r9;;
     _32(0x28291c0c),        //sq 112 (0x70)[$r12] = $r10r11;;
     _32(0x98000082),        //call 16da0 <_vfiprintf_r>
     _32(0x273d060c),        //sd 24 (0x18)[$r12] = $r15;;
     _32(0xe130200c),        //addd $r12 = $r12, 128 (0x80)
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000)        //ret ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101000110000; //0x16a30
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fn1, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fn2, 0b00010110100100011000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101000110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__assert_func, 0b00010110101010001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__assert, 0b00010110101011111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__libc_fini_array, 0b00010110101100010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(_fiprintf_r, 0b00010110101101110000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016a30;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
