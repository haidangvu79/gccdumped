// executing pipeline 20050826_2.c.out.dumped test 
val k1_pipeline_20050826_2: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20050826_2() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let inet_check_attr: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701020c),        //sd 8 (0x8)[$r12] = $r0;;
     _32(0x2705000c),        //sd 0 (0x0)[$r12] = $r1;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000025),        //goto 168c8 <inet_check_attr+0xa8>;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6100fe00),        //addd $r0 = $r0, -8 (0xfffffff8);;
     _32(0x3804000c),        //ld $r1 = 0 (0x0)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x08800640),        //cb.deqz $r0? 168bc <inet_check_attr+0x9c>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x6100ff00),        //addd $r0 = $r0, -4 (0xfffffffc);;
     _32(0x690100c0),        //compd.gtu $r0 = $r0, 3 (0x3);;
     _32(0x08000100),        //cb.dnez $r0? 1687c <inet_check_attr+0x5c>;;
     _64(0x003fffffe000fa80),        //make $r0 = 4294967274 (0xffffffea);;
     _32(0x10000019),        //goto 168dc <inet_check_attr+0xbc>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f101b240),        //compw.eq $r0 = $r0, 9 (0x9);;
     _32(0x0c000340),        //cb.wnez $r0? 168bc <inet_check_attr+0x9c>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f101b200),        //compw.eq $r0 = $r0, 8 (0x8);;
     _32(0x0c000240),        //cb.wnez $r0? 168bc <inet_check_attr+0x9c>;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6100fe00),        //addd $r0 = $r0, -8 (0xfffffff8);;
     _32(0x3804000c),        //ld $r1 = 0 (0x0)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x61040101),        //addd $r1 = $r1, 4 (0x4);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f401b380),        //compw.le $r0 = $r0, 14 (0xe);;
     _32(0x0c7ff640),        //cb.wnez $r0? 16838 <inet_check_attr+0x18>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130d80c),        //addd $r12 = $r12, -160 (0xffffff60);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x6000000c),        //make $r0 = 12 (0xc);;
     _32(0x2501240c),        //sh 144 (0x90)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2501248c),        //sh 146 (0x92)[$r12] = $r0;;
     _32(0x3000240c),        //lwz $r0 = 144 (0x90)[$r12];;
     _32(0x2601250c),        //sw 148 (0x94)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601270c),        //sw 156 (0x9c)[$r12] = $r0;;
     _32(0x1000000a),        //goto 1693c <main+0x54>;;
     _32(0x3400270c),        //lws $r0 = 156 (0x9c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104280c),        //addd $r1 = $r12, 160 (0xa0);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x6104240c),        //addd $r1 = $r12, 144 (0x90);;
     _32(0x2705e000),        //sd -128 (0xffffff80)[$r0] = $r1;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601270c),        //sw 156 (0x9c)[$r12] = $r0;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _64(0x00000000f401b340),        //compw.le $r0 = $r0, 13 (0xd);;
     _32(0x0c7ffd00),        //cb.wnez $r0? 16918 <main+0x30>;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffb2),        //call 16820 <inet_check_attr>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16968 <main+0x80>;;
     _32(0x1800007d),        //call 16b58 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601270c),        //sw 156 (0x9c)[$r12] = $r0;;
     _32(0x1000001b),        //goto 169dc <main+0xf4>;;
     _32(0x3400270c),        //lws $r0 = 156 (0x9c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104280c),        //addd $r1 = $r12, 160 (0xa0);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3804e000),        //ld $r1 = -128 (0xffffff80)[$r0];;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _64(0x00000000f101b1c0),        //compw.eq $r0 = $r0, 7 (0x7);;
     _32(0x0c0001c0),        //cb.wnez $r0? 169b0 <main+0xc8>;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _64(0x00000000f101b200),        //compw.eq $r0 = $r0, 8 (0x8);;
     _32(0x0c0000c0),        //cb.wnez $r0? 169b0 <main+0xc8>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x10000002),        //goto 169b4 <main+0xcc>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x6108240c),        //addd $r2 = $r12, 144 (0x90);;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 169d0 <main+0xe8>;;
     _32(0x18000063),        //call 16b58 <abort>;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601270c),        //sw 156 (0x9c)[$r12] = $r0;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _64(0x00000000f401b340),        //compw.le $r0 = $r0, 13 (0xd);;
     _32(0x0c7ff8c0),        //cb.wnez $r0? 16974 <main+0x8c>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601270c),        //sw 156 (0x9c)[$r12] = $r0;;
     _32(0x1000000a),        //goto 16a1c <main+0x134>;;
     _32(0x3400270c),        //lws $r0 = 156 (0x9c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104280c),        //addd $r1 = $r12, 160 (0xa0);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x6104240c),        //addd $r1 = $r12, 144 (0x90);;
     _32(0x2705e000),        //sd -128 (0xffffff80)[$r0] = $r1;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601270c),        //sw 156 (0x9c)[$r12] = $r0;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _64(0x00000000f401b340),        //compw.le $r0 = $r0, 13 (0xd);;
     _32(0x0c7ffd00),        //cb.wnez $r0? 169f8 <main+0x110>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x2800250c),        //lhz $r0 = 148 (0x94)[$r12];;
     _32(0x7100fe00),        //addw $r0 = $r0, -8 (0xfffffff8);;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x2501250c),        //sh 148 (0x94)[$r12] = $r0;;
     _32(0x6100240c),        //addd $r0 = $r12, 144 (0x90);;
     _32(0x61000100),        //addd $r0 = $r0, 4 (0x4);;
     _32(0x2701120c),        //sd 72 (0x48)[$r12] = $r0;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff71),        //call 16820 <inet_check_attr>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x07fffffff101b280),        //compw.eq $r0 = $r0, 4294967274 (0xffffffea);;
     _32(0x0c000080),        //cb.wnez $r0? 16a74 <main+0x18c>;;
     _32(0x1800003a),        //call 16b58 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601270c),        //sw 156 (0x9c)[$r12] = $r0;;
     _32(0x1000002e),        //goto 16b34 <main+0x24c>;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c000200),        //cb.wnez $r0? 16aac <main+0x1c4>;;
     _32(0x3400270c),        //lws $r0 = 156 (0x9c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104280c),        //addd $r1 = $r12, 160 (0xa0);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3800e000),        //ld $r0 = -128 (0xffffff80)[$r0];;
     _32(0x08800080),        //cb.deqz $r0? 16aac <main+0x1c4>;;
     _32(0x1800002c),        //call 16b58 <abort>;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c0003c0),        //cb.wnez $r0? 16af4 <main+0x20c>;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _64(0x00000000f501b140),        //compw.gt $r0 = $r0, 5 (0x5);;
     _32(0x0c0002c0),        //cb.wnez $r0? 16af4 <main+0x20c>;;
     _32(0x3400270c),        //lws $r0 = 156 (0x9c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104280c),        //addd $r1 = $r12, 160 (0xa0);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3804e000),        //ld $r1 = -128 (0xffffff80)[$r0];;
     _32(0x6100240c),        //addd $r0 = $r12, 144 (0x90);;
     _32(0x61000100),        //addd $r0 = $r0, 4 (0x4);;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16af4 <main+0x20c>;;
     _32(0x1800001a),        //call 16b58 <abort>;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _64(0x00000000f401b140),        //compw.le $r0 = $r0, 5 (0x5);;
     _32(0x0c000280),        //cb.wnez $r0? 16b28 <main+0x240>;;
     _32(0x3400270c),        //lws $r0 = 156 (0x9c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104280c),        //addd $r1 = $r12, 160 (0xa0);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3804e000),        //ld $r1 = -128 (0xffffff80)[$r0];;
     _32(0x6100240c),        //addd $r0 = $r12, 144 (0x90);;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16b28 <main+0x240>;;
     _32(0x1800000d),        //call 16b58 <abort>;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601270c),        //sw 156 (0x9c)[$r12] = $r0;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _64(0x00000000f401b340),        //compw.le $r0 = $r0, 13 (0xd);;
     _32(0x0c7ff400),        //cb.wnez $r0? 16a80 <main+0x198>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130280c),        //addd $r12 = $r12, 160 (0xa0);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16f30 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18a60 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100011101000; //0x168e8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(inet_check_attr, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100011101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101101011000, num_instr, mI);
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
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
