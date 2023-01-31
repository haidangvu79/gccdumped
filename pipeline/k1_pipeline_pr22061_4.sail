// executing pipeline pr22061_4.c.out.dumped test 
val k1_pipeline_pr22061_4: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr22061_4() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo_2124: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x2701020c),        //sd 8 (0x8)[$r12] = $r0;;
     _32(0x30000001),        //lwz $r0 = 0 (0x0)[$r1];;
     _32(0x71180040),        //addw $r6 = $r0, 1 (0x1);;
     _32(0x7818ffc6),        //zxwd $r6 = $r6;;
     _32(0x26190001),        //sw 0 (0x0)[$r1] = $r6;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6907f000),        //sxwd $r1 = $r0;;
     _32(0x6104ffc1),        //addd $r1 = $r1, -1 (0xffffffff);;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0x7b022ec2),        //srld $r0 = $r2, 59 (0x3b);;
     _32(0x79162143),        //slld $r5 = $r3, 5 (0x5);;
     _32(0x7a150140),        //ord $r5 = $r0, $r5;;
     _32(0x79122142),        //slld $r4 = $r2, 5 (0x5);;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let bar: list_I = 
 [|
     _32(0x6130c80c),        //addd $r12 = $r12, -224 (0xffffff20);;
     _32(0x2739000c),        //sd 0 (0x0)[$r12] = $r14;;
     _32(0x2849040c),        //sq 16 (0x10)[$r12] = $r18r19;;
     _32(0x2855080c),        //so 32 (0x20)[$r12] = $r20r21r22r23;;
     _32(0x2865100c),        //so 64 (0x40)[$r12] = $r24r25r26r27;;
     _32(0x2875180c),        //so 96 (0x60)[$r12] = $r28r29r30r31;;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x6138000c),        //addd $r14 = $r12, 0 (0x0);;
     _32(0x2601220e),        //sw 136 (0x88)[$r14] = $r0;;
     _32(0x6100380e),        //addd $r0 = $r14, 224 (0xe0);;
     _32(0x2701260e),        //sd 152 (0x98)[$r14] = $r0;;
     _32(0x3000220e),        //lwz $r0 = 136 (0x88)[$r14];;
     _32(0x2601240e),        //sw 144 (0x90)[$r14] = $r0;;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x2701200e),        //sd 128 (0x80)[$r14] = $r0;;
     _32(0x307c240e),        //lwz $r31 = 144 (0x90)[$r14];;
     _32(0x6903f01f),        //sxwd $r0 = $r31;;
     _32(0x6100ffc0),        //addd $r0 = $r0, -1 (0xffffffff);;
     _32(0x27012e0e),        //sd 184 (0xb8)[$r14] = $r0;;
     _32(0x6903f01f),        //sxwd $r0 = $r31;;
     _32(0x6a180000),        //copyd $r6 = $r0;;
     _32(0x601c0000),        //make $r7 = 0 (0x0);;
     _32(0x7b022ec6),        //srld $r0 = $r6, 59 (0x3b);;
     _32(0x79462147),        //slld $r17 = $r7, 5 (0x5);;
     _32(0x7a450440),        //ord $r17 = $r0, $r17;;
     _32(0x79422146),        //slld $r16 = $r6, 5 (0x5);;
     _32(0x6903f01f),        //sxwd $r0 = $r31;;
     _32(0x6a100000),        //copyd $r4 = $r0;;
     _32(0x60140000),        //make $r5 = 0 (0x0);;
     _32(0x7b022e84),        //srld $r0 = $r4, 58 (0x3a);;
     _32(0x792e2185),        //slld $r11 = $r5, 6 (0x6);;
     _32(0x7a2d02c0),        //ord $r11 = $r0, $r11;;
     _32(0x792a2184),        //slld $r10 = $r4, 6 (0x6);;
     _32(0x6903f01f),        //sxwd $r0 = $r31;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0x7b022e82),        //srld $r0 = $r2, 58 (0x3a);;
     _32(0x79262183),        //slld $r9 = $r3, 6 (0x6);;
     _32(0x7a250240),        //ord $r9 = $r0, $r9;;
     _32(0x79222182),        //slld $r8 = $r2, 6 (0x6);;
     _32(0x6903f01f),        //sxwd $r0 = $r31;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x610000c0),        //addd $r0 = $r0, 3 (0x3);;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x7b022140),        //srld $r0 = $r0, 5 (0x5);;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x75310300),        //sbfd $r12 = $r0, $r12;;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x610000c0),        //addd $r0 = $r0, 3 (0x3);;
     _32(0x7b022080),        //srld $r0 = $r0, 2 (0x2);;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x27012c0e),        //sd 176 (0xb0)[$r14] = $r0;;
     _32(0x6100240e),        //addd $r0 = $r14, 144 (0x90);;
     _32(0x2701300e),        //sd 192 (0xc0)[$r14] = $r0;;
     _32(0x38002c0e),        //ld $r0 = 176 (0xb0)[$r14];;
     _32(0x1fffffb0),        //call 16820 <foo.2124>;;
     _32(0x3078240e),        //lwz $r30 = 144 (0x90)[$r14];;
     _32(0x6903f01e),        //sxwd $r0 = $r30;;
     _32(0x6100ffc0),        //addd $r0 = $r0, -1 (0xffffffff);;
     _32(0x27012a0e),        //sd 168 (0xa8)[$r14] = $r0;;
     _32(0x6903f01e),        //sxwd $r0 = $r30;;
     _32(0x6a580000),        //copyd $r22 = $r0;;
     _32(0x605c0000),        //make $r23 = 0 (0x0);;
     _32(0x7b022ed6),        //srld $r0 = $r22, 59 (0x3b);;
     _32(0x79762157),        //slld $r29 = $r23, 5 (0x5);;
     _32(0x7a750740),        //ord $r29 = $r0, $r29;;
     _32(0x79722156),        //slld $r28 = $r22, 5 (0x5);;
     _32(0x6903f01e),        //sxwd $r0 = $r30;;
     _32(0x6a500000),        //copyd $r20 = $r0;;
     _32(0x60540000),        //make $r21 = 0 (0x0);;
     _32(0x7b022e94),        //srld $r0 = $r20, 58 (0x3a);;
     _32(0x796e2195),        //slld $r27 = $r21, 6 (0x6);;
     _32(0x7a6d06c0),        //ord $r27 = $r0, $r27;;
     _32(0x796a2194),        //slld $r26 = $r20, 6 (0x6);;
     _32(0x6903f01e),        //sxwd $r0 = $r30;;
     _32(0x6a480000),        //copyd $r18 = $r0;;
     _32(0x604c0000),        //make $r19 = 0 (0x0);;
     _32(0x7b022e92),        //srld $r0 = $r18, 58 (0x3a);;
     _32(0x79662193),        //slld $r25 = $r19, 6 (0x6);;
     _32(0x7a650640),        //ord $r25 = $r0, $r25;;
     _32(0x79622192),        //slld $r24 = $r18, 6 (0x6);;
     _32(0x6903f01e),        //sxwd $r0 = $r30;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x610000c0),        //addd $r0 = $r0, 3 (0x3);;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x7b022140),        //srld $r0 = $r0, 5 (0x5);;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x75310300),        //sbfd $r12 = $r0, $r12;;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x610000c0),        //addd $r0 = $r0, 3 (0x3);;
     _32(0x7b022080),        //srld $r0 = $r0, 2 (0x2);;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x2701280e),        //sd 160 (0xa0)[$r14] = $r0;;
     _32(0x6100240e),        //addd $r0 = $r14, 144 (0x90);;
     _32(0x2701300e),        //sd 192 (0xc0)[$r14] = $r0;;
     _32(0x3800280e),        //ld $r0 = 160 (0xa0)[$r14];;
     _32(0x1fffff87),        //call 16820 <foo.2124>;;
     _32(0x6903f01f),        //sxwd $r0 = $r31;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x61010200),        //compd.eq $r0 = $r0, 8 (0x8);;
     _32(0x08000080),        //cb.dnez $r0? 16a1c <bar+0x19c>;;
     _32(0x18000020),        //call 16a98 <abort>;;
     _32(0x6903f01e),        //sxwd $r0 = $r30;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x61010400),        //compd.eq $r0 = $r0, 16 (0x10);;
     _32(0x08000080),        //cb.dnez $r0? 16a30 <bar+0x1b0>;;
     _32(0x1800001b),        //call 16a98 <abort>;;
     _32(0x3000240e),        //lwz $r0 = 144 (0x90)[$r14];;
     _64(0x00000000f101b0c0),        //compw.eq $r0 = $r0, 3 (0x3);;
     _32(0x0c000080),        //cb.wnez $r0? 16a44 <bar+0x1c4>;;
     _32(0x18000016),        //call 16a98 <abort>;;
     _32(0x3830200e),        //ld $r12 = 128 (0x80)[$r14];;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130000e),        //addd $r12 = $r14, 0 (0x0);;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0x3c48040c),        //lq $r18r19 = 16 (0x10)[$r12];;
     _32(0x3c54080c),        //lo $r20r21r22r23 = 32 (0x20)[$r12];;
     _32(0x3c64100c),        //lo $r24r25r26r27 = 64 (0x40)[$r12];;
     _32(0x3c74180c),        //lo $r28r29r30r31 = 96 (0x60)[$r12];;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130380c),        //addd $r12 = $r12, 224 (0xe0);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffff7e),        //call 16880 <bar>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 16ab8 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16eb8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18b90 <_exit>
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
     _32(0x98000161),        //call 17050 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16af4 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18b90 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101001111000; //0x16a78
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo_2124, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100010000000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101001111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101010011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110101010111000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016a78;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
