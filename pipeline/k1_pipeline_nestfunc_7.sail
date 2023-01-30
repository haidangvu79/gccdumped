// executing pipeline nestfunc_7.c.out.dumped test 
val k1_pipeline_nestfunc_7: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_nestfunc_7() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let Foo_2132: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x3800180c),        //ld $r0 = 96 (0x60)[$r12];;
     _32(0x3804180c),        //ld $r1 = 96 (0x60)[$r12];;
     _32(0x27050a0c),        //sd 40 (0x28)[$r12] = $r1;;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _32(0x71040041),        //addw $r1 = $r1, 1 (0x1);;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0x26050c0c),        //sw 48 (0x30)[$r12] = $r1;;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _32(0x71040081),        //addw $r1 = $r1, 2 (0x2);;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0x26050d0c),        //sw 52 (0x34)[$r12] = $r1;;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _32(0x710400c1),        //addw $r1 = $r1, 3 (0x3);;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0x26050e0c),        //sw 56 (0x38)[$r12] = $r1;;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _32(0x71040101),        //addw $r1 = $r1, 4 (0x4);;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0x26050f0c),        //sw 60 (0x3c)[$r12] = $r1;;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _32(0x71040141),        //addw $r1 = $r1, 5 (0x5);;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0x2605100c),        //sw 64 (0x40)[$r12] = $r1;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000180),        //addw $r0 = $r0, 6 (0x6);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x2601110c),        //sw 68 (0x44)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x2701120c),        //sd 72 (0x48)[$r12] = $r0;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x2701140c),        //sd 80 (0x50)[$r12] = $r0;;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x2701160c),        //sd 88 (0x58)[$r12] = $r0;;
     _32(0x3800120c),        //ld $r0 = 72 (0x48)[$r12];;
     _32(0x3804140c),        //ld $r1 = 80 (0x50)[$r12];;
     _32(0x3808160c),        //ld $r2 = 88 (0x58)[$r12];;
     _32(0x6130200c),        //addd $r12 = $r12, 128 (0x80);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x6100180c),        //addd $r0 = $r12, 96 (0x60);;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x6000000a),        //make $r0 = 10 (0xa);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x2701100c),        //sd 64 (0x40)[$r12] = $r0;;
     _32(0x1fffffcf),        //call 16820 <Foo.2132>;;
     _32(0x6a0c0000),        //copyd $r3 = $r0;;
     _32(0x6a000002),        //copyd $r0 = $r2;;
     _32(0x270d0a0c),        //sd 40 (0x28)[$r12] = $r3;;
     _32(0x27050c0c),        //sd 48 (0x30)[$r12] = $r1;;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x30000a0c),        //lwz $r0 = 40 (0x28)[$r12];;
     _64(0x00000000f001b2c0),        //compw.ne $r0 = $r0, 11 (0xb);;
     _32(0x0c0005c0),        //cb.wnez $r0? 16964 <test+0xa4>;;
     _32(0x30000b0c),        //lwz $r0 = 44 (0x2c)[$r12];;
     _64(0x00000000f001b300),        //compw.ne $r0 = $r0, 12 (0xc);;
     _32(0x0c0004c0),        //cb.wnez $r0? 16964 <test+0xa4>;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _64(0x00000000f001b340),        //compw.ne $r0 = $r0, 13 (0xd);;
     _32(0x0c0003c0),        //cb.wnez $r0? 16964 <test+0xa4>;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _64(0x00000000f001b380),        //compw.ne $r0 = $r0, 14 (0xe);;
     _32(0x0c0002c0),        //cb.wnez $r0? 16964 <test+0xa4>;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _64(0x00000000f001b3c0),        //compw.ne $r0 = $r0, 15 (0xf);;
     _32(0x0c0001c0),        //cb.wnez $r0? 16964 <test+0xa4>;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _64(0x00000000f001b400),        //compw.ne $r0 = $r0, 16 (0x10);;
     _32(0x0c0000c0),        //cb.wnez $r0? 16964 <test+0xa4>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x10000002),        //goto 16968 <test+0xa8>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1fffffcd),        //call 168c0 <test>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b000),        //compw.eq $r0 = $r0, 0 (0x0);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
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
     _32(0x0880014e),        //cb.deqz $r14? 169fc <__libc_fini_array+0x44>;;
     _32(0x6138ffce),        //addd $r14 = $r14, -1 (0xffffffff);;
     _32(0x3802f392),        //ld.xs $r0 = $r14[$r18];;
     _32(0x0fdc0000),        //icall $r0;;
     _32(0x087fff4e),        //cb.dnez $r14? 169ec <__libc_fini_array+0x34>;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3848040c),        //ld $r18 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let __libc_init_array: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _96(0x800000d8a849020ce04c0000),        //make $r19 = 221184 (0x36000)
     _32(0x00000000),        //sq 8 (0x8)[$r12] = $r18r19;;
     _32(0xe0380000),        //make $r14 = 0 (0x0)
     _96(0x880000d8a739000ce5480013),        //sbfd $r18 = $r19, 221184 (0x36000)
     _32(0x08000000),        //sd 0 (0x0)[$r12] = $r14;;
     _32(0xfa4a20d2),        //srad $r18 = $r18, 3 (0x3)
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x08800192),        //cb.deqz $r18? 16a64 <__libc_init_array+0x4c>;;
     _32(0xe138004e),        //addd $r14 = $r14, 1 (0x1)
     _32(0x3802f393),        //ld.xs $r0 = $r14[$r19];;
     _32(0x0fdc0000),        //icall $r0;;
     _32(0x7001a392),        //compd.ne $r0 = $r18, $r14;;
     _32(0x087fff00),        //cb.dnez $r0? 16a50 <__libc_init_array+0x38>;;
     _32(0xe0380000),        //make $r14 = 0 (0x0)
     _96(0x08000000880000d8e04c0000),        //make $r19 = 221184 (0x36000);;
     _96(0x00000000800000d8e5480013),        //sbfd $r18 = $r19, 221184 (0x36000);;
     _32(0x7a4a20d2),        //srad $r18 = $r18, 3 (0x3);;
     _32(0x08800192),        //cb.deqz $r18? 16a9c <__libc_init_array+0x84>;;
     _32(0xe138004e),        //addd $r14 = $r14, 1 (0x1)
     _32(0x3802f393),        //ld.xs $r0 = $r14[$r19];;
     _32(0x0fdc0000),        //icall $r0;;
     _32(0x7001a392),        //compd.ne $r0 = $r18, $r14;;
     _32(0x087fff00),        //cb.dnez $r0? 16a88 <__libc_init_array+0x70>;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3c48020c),        //lq $r18r19 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100110000000; //0x16980
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(Foo_2132, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test, 0b00010110100011000000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100110000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__libc_fini_array, 0b00010110100110111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__libc_init_array, 0b00010110101000011000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016980;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
