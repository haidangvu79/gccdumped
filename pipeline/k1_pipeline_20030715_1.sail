// executing pipeline 20030715_1.c.out.dumped test 
val k1_pipeline_20030715_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20030715_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let ap_check_cmd_context: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let server_type: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x27050a0c),        //sd 40 (0x28)[$r12] = $r1;;
     _32(0x2709080c),        //sd 32 (0x20)[$r12] = $r2;;
     _32(0x6004001f),        //make $r1 = 31 (0x1f);;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x1ffffff2),        //call 16820 <ap_check_cmd_context>;;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x088000c0),        //cb.deqz $r0? 16870 <server_type+0x38>;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x10000020),        //goto 168ec <server_type+0xb4>;;
     _96(0x00000000800000fce004f000),        //make $r1 = 259008 (0x3f3c0);;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x1800006e),        //call 16a38 <strcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x080001c0),        //cb.dnez $r0? 168a4 <server_type+0x6c>;;
     _96(0x0000000080000117e0003600),        //make $r0 = 285912 (0x45cd8);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x10000012),        //goto 168e8 <server_type+0xb0>;;
     _96(0x00000000800000fce004f200),        //make $r1 = 259016 (0x3f3c8);;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x18000061),        //call 16a38 <strcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x080001c0),        //cb.dnez $r0? 168d8 <server_type+0xa0>;;
     _96(0x0000000080000117e0003600),        //make $r0 = 285912 (0x45cd8);;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x10000005),        //goto 168e8 <server_type+0xb0>;;
     _96(0x00000000800000fce000f600),        //make $r0 = 259032 (0x3f3d8);;
     _32(0x10000002),        //goto 168ec <server_type+0xb4>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce008f200),        //make $r2 = 259016 (0x3f3c8);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffc6),        //call 16838 <server_type>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
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
     _32(0x0880014e),        //cb.deqz $r14? 1697c <__libc_fini_array+0x44>;;
     _32(0x6138ffce),        //addd $r14 = $r14, -1 (0xffffffff);;
     _32(0x3802f392),        //ld.xs $r0 = $r14[$r18];;
     _32(0x0fdc0000),        //icall $r0;;
     _32(0x087fff4e),        //cb.dnez $r14? 1696c <__libc_fini_array+0x34>;;
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
     _32(0x08800192),        //cb.deqz $r18? 169e4 <__libc_init_array+0x4c>;;
     _32(0xe138004e),        //addd $r14 = $r14, 1 (0x1)
     _32(0x3802f393),        //ld.xs $r0 = $r14[$r19];;
     _32(0x0fdc0000),        //icall $r0;;
     _32(0x7001a392),        //compd.ne $r0 = $r18, $r14;;
     _32(0x087fff00),        //cb.dnez $r0? 169d0 <__libc_init_array+0x38>;;
     _32(0xe0380000),        //make $r14 = 0 (0x0)
     _96(0x08000000880000d8e04c0000),        //make $r19 = 221184 (0x36000);;
     _96(0x00000000800000d8e5480013),        //sbfd $r18 = $r19, 221184 (0x36000);;
     _32(0x7a4a20d2),        //srad $r18 = $r18, 3 (0x3);;
     _32(0x08800192),        //cb.deqz $r18? 16a1c <__libc_init_array+0x84>;;
     _32(0xe138004e),        //addd $r14 = $r14, 1 (0x1)
     _32(0x3802f393),        //ld.xs $r0 = $r14[$r19];;
     _32(0x0fdc0000),        //icall $r0;;
     _32(0x7001a392),        //compd.ne $r0 = $r18, $r14;;
     _32(0x087fff00),        //cb.dnez $r0? 16a08 <__libc_init_array+0x70>;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3c48020c),        //lq $r18r19 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let strcmp: list_I = 
 [|
     _32(0x7a090040),        //ord $r2 = $r0, $r1;;
     _32(0x680801c2),        //andd $r2 = $r2, 7 (0x7);;
     _32(0x080001c2),        //cb.dnez $r2? 16a5c <strcmp+0x24>;;
     _32(0xe00c0008),        //make $r3 = 8 (0x8)
     _32(0xe114fe01),        //addd $r5 = $r1, -8 (0xfffffff8)
     _32(0x38080000),        //ld $r2 = 0 (0x0)[$r0];;
     _32(0x38100001),        //ld $r4 = 0 (0x0)[$r1];;
     _32(0x7111a102),        //compd.eq $r4 = $r2, $r4;;
     _32(0x08000504),        //cb.dnez $r4? 16aa8 <strcmp+0x70>;;
     _32(0x200c0000),        //lbz $r3 = 0 (0x0)[$r0];;
     _32(0x08000143),        //cb.dnez $r3? 16a74 <strcmp+0x3c>;;
     _32(0x10000009),        //goto 16a88 <strcmp+0x50>;;
     _32(0xe1040041),        //addd $r1 = $r1, 1 (0x1)
     _32(0x200c0000),        //lbz $r3 = 0 (0x0)[$r0];;
     _32(0x08800683),        //cb.deqz $r3? 16ad8 <strcmp+0xa0>;;
     _32(0xe8137003),        //sxbd $r4 = $r3
     _32(0xe1000040),        //addd $r0 = $r0, 1 (0x1)
     _32(0x24080001),        //lbs $r2 = 0 (0x0)[$r1];;
     _32(0x7109b102),        //compw.eq $r2 = $r2, $r4;;
     _32(0x0c7ffe42),        //cb.wnez $r2? 16a68 <strcmp+0x30>;;
     _32(0x20000001),        //lbz $r0 = 0 (0x0)[$r1];;
     _32(0x750110c0),        //sbfw $r0 = $r0, $r3;;
     _32(0x0fd00000),        //ret ;;
     _32(0xe10c0203),        //addd $r3 = $r3, 8 (0x8)
     _32(0x380ae0c0),        //ld $r2 = $r3[$r0];;
     _32(0x3812e0c5),        //ld $r4 = $r3[$r5];;
     _32(0x7111a102),        //compd.eq $r4 = $r2, $r4;;
     _32(0x08800444),        //cb.deqz $r4? 16ae8 <strcmp+0xb0>;;
     _32(0xf11900c0),        //addd $r6 = $r0, $r3
     _32(0xf11d00c1),        //addd $r7 = $r1, $r3
     _96(0x17f7f7f797bfbfbfe110bfc2),        //addd $r4 = $r2, 18374403900871474943 (0xfefefefefefefeff);;
     _32(0x7e090102),        //andnd $r2 = $r2, $r4;;
     _96(0x0404040480202020e8082002),        //andd $r2 = $r2, 9259542123273814144 (0x8080808080808080);;
     _32(0x08fffc82),        //cb.deqz $r2? 16a94 <strcmp+0x5c>;;
     _32(0x8fd00000),        //ret 
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0xe00c0000),        //make $r3 = 0 (0x0)
     _32(0x20000001),        //lbz $r0 = 0 (0x0)[$r1];;
     _32(0x97ffffec),        //goto 16a90 <strcmp+0x58>
     _32(0x750110c0),        //sbfw $r0 = $r0, $r3;;
     _32(0x97ffffdd),        //goto 16a5c <strcmp+0x24>
     _32(0xea040007),        //copyd $r1 = $r7
     _32(0x6a000006),        //copyd $r0 = $r6;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100000000; //0x16900
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(ap_check_cmd_context, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(server_type, 0b00010110100000111000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__libc_fini_array, 0b00010110100100111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__libc_init_array, 0b00010110100110011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(strcmp, 0b00010110101000111000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016900;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
