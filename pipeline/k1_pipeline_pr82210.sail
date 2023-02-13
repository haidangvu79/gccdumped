// executing pipeline pr82210.c.out.dumped test 
val k1_pipeline_pr82210: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr82210() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo: list_I = 
 [|
     _32(0x6130d00c),        //addd $r12 = $r12, -192 (0xffffff40);;
     _32(0x2739060c),        //sd 24 (0x18)[$r12] = $r14;;
     _32(0x28490a0c),        //sq 40 (0x28)[$r12] = $r18r19;;
     _32(0x28550e0c),        //so 56 (0x38)[$r12] = $r20r21r22r23;;
     _32(0x2865160c),        //so 88 (0x58)[$r12] = $r24r25r26r27;;
     _32(0x28751e0c),        //so 120 (0x78)[$r12] = $r28r29r30r31;;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741080c),        //sd 32 (0x20)[$r12] = $r16;;
     _32(0x6138060c),        //addd $r14 = $r12, 24 (0x18);;
     _32(0x2601200e),        //sw 128 (0x80)[$r14] = $r0;;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x6a9c0000),        //copyd $r39 = $r0;;
     _32(0x3098200e),        //lwz $r38 = 128 (0x80)[$r14];;
     _32(0x6903f026),        //sxwd $r0 = $r38;;
     _32(0x6a600000),        //copyd $r24 = $r0;;
     _32(0x60640000),        //make $r25 = 0 (0x0);;
     _32(0x7b022f18),        //srld $r0 = $r24, 60 (0x3c);;
     _32(0x79862119),        //slld $r33 = $r25, 4 (0x4);;
     _32(0x7a850840),        //ord $r33 = $r0, $r33;;
     _32(0x79822118),        //slld $r32 = $r24, 4 (0x4);;
     _32(0x6903f026),        //sxwd $r0 = $r38;;
     _32(0x6100ffc0),        //addd $r0 = $r0, -1 (0xffffffff);;
     _32(0x2701280e),        //sd 160 (0xa0)[$r14] = $r0;;
     _32(0x6903f026),        //sxwd $r0 = $r38;;
     _32(0x6a580000),        //copyd $r22 = $r0;;
     _32(0x605c0000),        //make $r23 = 0 (0x0);;
     _32(0x7b022f16),        //srld $r0 = $r22, 60 (0x3c);;
     _32(0x797e2117),        //slld $r31 = $r23, 4 (0x4);;
     _32(0x7a7d07c0),        //ord $r31 = $r0, $r31;;
     _32(0x797a2116),        //slld $r30 = $r22, 4 (0x4);;
     _32(0x6903f026),        //sxwd $r0 = $r38;;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x610000c0),        //addd $r0 = $r0, 3 (0x3);;
     _32(0x683cff00),        //andd $r15 = $r0, -4 (0xfffffffc);;
     _32(0x3058200e),        //lwz $r22 = 128 (0x80)[$r14];;
     _32(0x6903f016),        //sxwd $r0 = $r22;;
     _32(0x6a500000),        //copyd $r20 = $r0;;
     _32(0x60540000),        //make $r21 = 0 (0x0);;
     _32(0x7b022ed4),        //srld $r0 = $r20, 59 (0x3b);;
     _32(0x79762155),        //slld $r29 = $r21, 5 (0x5);;
     _32(0x7a750740),        //ord $r29 = $r0, $r29;;
     _32(0x79722154),        //slld $r28 = $r20, 5 (0x5);;
     _32(0x6903f016),        //sxwd $r0 = $r22;;
     _32(0x6100ffc0),        //addd $r0 = $r0, -1 (0xffffffff);;
     _32(0x2701240e),        //sd 144 (0x90)[$r14] = $r0;;
     _32(0x6903f016),        //sxwd $r0 = $r22;;
     _32(0x6a480000),        //copyd $r18 = $r0;;
     _32(0x604c0000),        //make $r19 = 0 (0x0);;
     _32(0x7b022ed2),        //srld $r0 = $r18, 59 (0x3b);;
     _32(0x796e2153),        //slld $r27 = $r19, 5 (0x5);;
     _32(0x7a6d06c0),        //ord $r27 = $r0, $r27;;
     _32(0x796a2152),        //slld $r26 = $r18, 5 (0x5);;
     _32(0x6903f026),        //sxwd $r0 = $r38;;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x610000c0),        //addd $r0 = $r0, 3 (0x3);;
     _32(0x6804ff00),        //andd $r1 = $r0, -4 (0xfffffffc);;
     _32(0x6903f016),        //sxwd $r0 = $r22;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x6a400000),        //copyd $r16 = $r0;;
     _32(0x60440000),        //make $r17 = 0 (0x0);;
     _32(0x7b022f50),        //srld $r0 = $r16, 61 (0x3d);;
     _32(0x791620d1),        //slld $r5 = $r17, 3 (0x3);;
     _32(0x7a150140),        //ord $r5 = $r0, $r5;;
     _32(0x791220d0),        //slld $r4 = $r16, 3 (0x3);;
     _32(0x6000007f),        //make $r0 = 127 (0x7f);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x7e21d004),        //addcd.i $r8 = $r4, $r0;;
     _32(0x7e25c045),        //addcd $r9 = $r5, $r1;;
     _32(0x6890e008),        //andd $r36 = $r8, -128 (0xffffff80);;
     _32(0x6894ffc9),        //andd $r37 = $r9, -1 (0xffffffff);;
     _32(0x6903f026),        //sxwd $r0 = $r38;;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x610000c0),        //addd $r0 = $r0, 3 (0x3);;
     _32(0x6804ff00),        //andd $r1 = $r0, -4 (0xfffffffc);;
     _32(0x6903f016),        //sxwd $r0 = $r22;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x6a280000),        //copyd $r10 = $r0;;
     _32(0x602c0000),        //make $r11 = 0 (0x0);;
     _32(0x7b022f4a),        //srld $r0 = $r10, 61 (0x3d);;
     _32(0x790e20cb),        //slld $r3 = $r11, 3 (0x3);;
     _32(0x7a0d00c0),        //ord $r3 = $r0, $r3;;
     _32(0x790a20ca),        //slld $r2 = $r10, 3 (0x3);;
     _32(0x6000007f),        //make $r0 = 127 (0x7f);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x7e19d002),        //addcd.i $r6 = $r2, $r0;;
     _32(0x7e1dc043),        //addcd $r7 = $r3, $r1;;
     _32(0x6888e006),        //andd $r34 = $r6, -128 (0xffffff80);;
     _32(0x688cffc7),        //andd $r35 = $r7, -1 (0xffffffff);;
     _32(0x6903f026),        //sxwd $r0 = $r38;;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x610000c0),        //addd $r0 = $r0, 3 (0x3);;
     _32(0x6804ff00),        //andd $r1 = $r0, -4 (0xfffffffc);;
     _32(0x6903f016),        //sxwd $r0 = $r22;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x610003c0),        //addd $r0 = $r0, 15 (0xf);;
     _32(0x6800fc00),        //andd $r0 = $r0, -16 (0xfffffff0);;
     _32(0x610003c0),        //addd $r0 = $r0, 15 (0xf);;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x7b022140),        //srld $r0 = $r0, 5 (0x5);;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x75310300),        //sbfd $r12 = $r0, $r12;;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x610003c0),        //addd $r0 = $r0, 15 (0xf);;
     _32(0x7b022100),        //srld $r0 = $r0, 4 (0x4);;
     _32(0x79022100),        //slld $r0 = $r0, 4 (0x4);;
     _32(0x2701220e),        //sd 136 (0x88)[$r14] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601270e),        //sw 156 (0x9c)[$r14] = $r0;;
     _32(0x10000008),        //goto 169fc <foo+0x1dc>;;
     _32(0x3800220e),        //ld $r0 = 136 (0x88)[$r14];;
     _32(0x3404270e),        //lws $r1 = 156 (0x9c)[$r14];;
     _32(0x60081234),        //make $r2 = 4660 (0x1234);;
     _32(0x250bf040),        //sh.xs $r1[$r0] = $r2;;
     _32(0x3000270e),        //lwz $r0 = 156 (0x9c)[$r14];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601270e),        //sw 156 (0x9c)[$r14] = $r0;;
     _32(0x3004270e),        //lwz $r1 = 156 (0x9c)[$r14];;
     _32(0x3000200e),        //lwz $r0 = 128 (0x80)[$r14];;
     _32(0x7201b001),        //compw.lt $r0 = $r1, $r0;;
     _32(0x0c7ffd80),        //cb.wnez $r0? 169e0 <foo+0x1c0>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601270e),        //sw 156 (0x9c)[$r14] = $r0;;
     _32(0x1000000a),        //goto 16a3c <foo+0x21c>;;
     _32(0x7b06208f),        //srld $r1 = $r15, 2 (0x2);;
     _32(0x3800220e),        //ld $r0 = 136 (0x88)[$r14];;
     _32(0x3408270e),        //lws $r2 = 156 (0x9c)[$r14];;
     _32(0x71050042),        //addd $r1 = $r2, $r1;;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x260bf040),        //sw.xs $r1[$r0] = $r2;;
     _32(0x3000270e),        //lwz $r0 = 156 (0x9c)[$r14];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601270e),        //sw 156 (0x9c)[$r14] = $r0;;
     _32(0x3004270e),        //lwz $r1 = 156 (0x9c)[$r14];;
     _32(0x3000200e),        //lwz $r0 = 128 (0x80)[$r14];;
     _32(0x7201b001),        //compw.lt $r0 = $r1, $r0;;
     _32(0x0c7ffd00),        //cb.wnez $r0? 16a18 <foo+0x1f8>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601270e),        //sw 156 (0x9c)[$r14] = $r0;;
     _32(0x10000012),        //goto 16a9c <foo+0x27c>;;
     _32(0x3800220e),        //ld $r0 = 136 (0x88)[$r14];;
     _32(0x3404270e),        //lws $r1 = 156 (0x9c)[$r14];;
     _32(0x2802f040),        //lhz.xs $r0 = $r1[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _64(0x00000091f001b500),        //compw.ne $r0 = $r0, 4660 (0x1234);;
     _32(0x0c0001c0),        //cb.wnez $r0? 16a8c <foo+0x26c>;;
     _32(0x7b06208f),        //srld $r1 = $r15, 2 (0x2);;
     _32(0x3800220e),        //ld $r0 = 136 (0x88)[$r14];;
     _32(0x3408270e),        //lws $r2 = 156 (0x9c)[$r14];;
     _32(0x71050042),        //addd $r1 = $r2, $r1;;
     _32(0x3002f040),        //lwz.xs $r0 = $r1[$r0];;
     _32(0x08800080),        //cb.deqz $r0? 16a90 <foo+0x270>;;
     _32(0x1800001f),        //call 16b08 <abort>;;
     _32(0x3000270e),        //lwz $r0 = 156 (0x9c)[$r14];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601270e),        //sw 156 (0x9c)[$r14] = $r0;;
     _32(0x3004270e),        //lwz $r1 = 156 (0x9c)[$r14];;
     _32(0x3000200e),        //lwz $r0 = 128 (0x80)[$r14];;
     _32(0x7201b001),        //compw.lt $r0 = $r1, $r0;;
     _32(0x0c7ffb00),        //cb.wnez $r0? 16a58 <foo+0x238>;;
     _32(0x6a300027),        //copyd $r12 = $r39;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130fa0e),        //addd $r12 = $r14, -24 (0xffffffe8);;
     _32(0x3838060c),        //ld $r14 = 24 (0x18)[$r12];;
     _32(0x3c480a0c),        //lq $r18r19 = 40 (0x28)[$r12];;
     _32(0x3c540e0c),        //lo $r20r21r22r23 = 56 (0x38)[$r12];;
     _32(0x3c64160c),        //lo $r24r25r26r27 = 88 (0x58)[$r12];;
     _32(0x3c741e0c),        //lo $r28r29r30r31 = 120 (0x78)[$r12];;
     _32(0x3840080c),        //ld $r16 = 32 (0x20)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130300c),        //addd $r12 = $r12, 192 (0xc0);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x6000000f),        //make $r0 = 15 (0xf);;
     _32(0x1fffff4c),        //call 16820 <foo>;;
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
     _32(0x980000f3),        //call 16ee0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18a10 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101011100000; //0x16ae0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101011100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101100001000, num_instr, mI);
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
