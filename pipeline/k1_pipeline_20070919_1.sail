// executing pipeline 20070919_1.c.out.dumped test 
val k1_pipeline_20070919_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20070919_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let bar: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x2705080c),        //sd 32 (0x20)[$r12] = $r1;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x60080008),        //make $r2 = 8 (0x8);;
     _96(0x00000000800000fce004f000),        //make $r1 = 259008 (0x3f3c0);;
     _32(0x18000114),        //call 16ca8 <memcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16868 <bar+0x48>;;
     _32(0x180000c9),        //call 16b88 <abort>;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x60080008),        //make $r2 = 8 (0x8);;
     _96(0x00000000800000fce004f200),        //make $r1 = 259016 (0x3f3c8);;
     _32(0x1800010b),        //call 16ca8 <memcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 1688c <bar+0x6c>;;
     _32(0x180000c0),        //call 16b88 <abort>;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _32(0x60080008),        //make $r2 = 8 (0x8);;
     _96(0x00000000800000fce004f400),        //make $r1 = 259024 (0x3f3d0);;
     _32(0x18000101),        //call 16ca8 <memcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 168b4 <bar+0x94>;;
     _32(0x180000b6),        //call 16b88 <abort>;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x61000400),        //addd $r0 = $r0, 16 (0x10);;
     _32(0x60080008),        //make $r2 = 8 (0x8);;
     _96(0x00000000800000fce004f000),        //make $r1 = 259008 (0x3f3c0);;
     _32(0x180000f7),        //call 16ca8 <memcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 168dc <bar+0xbc>;;
     _32(0x180000ac),        //call 16b88 <abort>;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x61000600),        //addd $r0 = $r0, 24 (0x18);;
     _32(0x60080008),        //make $r2 = 8 (0x8);;
     _96(0x00000000800000fce004f000),        //make $r1 = 259008 (0x3f3c0);;
     _32(0x180000ed),        //call 16ca8 <memcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16904 <bar+0xe4>;;
     _32(0x180000a2),        //call 16b88 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let foo: list_I = 
 [|
     _32(0x6130d00c),        //addd $r12 = $r12, -192 (0xffffff40);;
     _32(0x2739020c),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0x2849060c),        //sq 24 (0x18)[$r12] = $r18r19;;
     _32(0x28550a0c),        //so 40 (0x28)[$r12] = $r20r21r22r23;;
     _32(0x2865120c),        //so 72 (0x48)[$r12] = $r24r25r26r27;;
     _32(0x28751a0c),        //so 104 (0x68)[$r12] = $r28r29r30r31;;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x6138020c),        //addd $r14 = $r12, 8 (0x8);;
     _32(0x2701220e),        //sd 136 (0x88)[$r14] = $r0;;
     _32(0x2605200e),        //sw 128 (0x80)[$r14] = $r1;;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x6a7c0000),        //copyd $r31 = $r0;;
     _32(0x3078200e),        //lwz $r30 = 128 (0x80)[$r14];;
     _32(0x6903f01e),        //sxwd $r0 = $r30;;
     _32(0x6a400000),        //copyd $r16 = $r0;;
     _32(0x60440000),        //make $r17 = 0 (0x0);;
     _32(0x7b022f50),        //srld $r0 = $r16, 61 (0x3d);;
     _32(0x797620d1),        //slld $r29 = $r17, 3 (0x3);;
     _32(0x7a750740),        //ord $r29 = $r0, $r29;;
     _32(0x797220d0),        //slld $r28 = $r16, 3 (0x3);;
     _32(0x6903f01e),        //sxwd $r0 = $r30;;
     _32(0x6100ffc0),        //addd $r0 = $r0, -1 (0xffffffff);;
     _32(0x27012c0e),        //sd 176 (0xb0)[$r14] = $r0;;
     _32(0x6903f01e),        //sxwd $r0 = $r30;;
     _32(0x6a280000),        //copyd $r10 = $r0;;
     _32(0x602c0000),        //make $r11 = 0 (0x0);;
     _32(0x7b022f4a),        //srld $r0 = $r10, 61 (0x3d);;
     _32(0x796e20cb),        //slld $r27 = $r11, 3 (0x3);;
     _32(0x7a6d06c0),        //ord $r27 = $r0, $r27;;
     _32(0x796a20ca),        //slld $r26 = $r10, 3 (0x3);;
     _32(0x6903f01e),        //sxwd $r0 = $r30;;
     _32(0x6a200000),        //copyd $r8 = $r0;;
     _32(0x60240000),        //make $r9 = 0 (0x0);;
     _32(0x7b022f48),        //srld $r0 = $r8, 61 (0x3d);;
     _32(0x796620c9),        //slld $r25 = $r9, 3 (0x3);;
     _32(0x7a650640),        //ord $r25 = $r0, $r25;;
     _32(0x796220c8),        //slld $r24 = $r8, 3 (0x3);;
     _32(0x6963f01e),        //sxwd $r24 = $r30;;
     _32(0x3800220e),        //ld $r0 = 136 (0x88)[$r14];;
     _32(0x27012a0e),        //sd 168 (0xa8)[$r14] = $r0;;
     _32(0x6903f01e),        //sxwd $r0 = $r30;;
     _32(0x6a180000),        //copyd $r6 = $r0;;
     _32(0x601c0000),        //make $r7 = 0 (0x0);;
     _32(0x7b022f46),        //srld $r0 = $r6, 61 (0x3d);;
     _32(0x795e20c7),        //slld $r23 = $r7, 3 (0x3);;
     _32(0x7a5d05c0),        //ord $r23 = $r0, $r23;;
     _32(0x795a20c6),        //slld $r22 = $r6, 3 (0x3);;
     _32(0x6903f01e),        //sxwd $r0 = $r30;;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x7b022140),        //srld $r0 = $r0, 5 (0x5);;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x75310300),        //sbfd $r12 = $r0, $r12;;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x61000000),        //addd $r0 = $r0, 0 (0x0);;
     _32(0x2701280e),        //sd 160 (0xa0)[$r14] = $r0;;
     _32(0x6903f01e),        //sxwd $r0 = $r30;;
     _32(0x6a100000),        //copyd $r4 = $r0;;
     _32(0x60140000),        //make $r5 = 0 (0x0);;
     _32(0x7b022f44),        //srld $r0 = $r4, 61 (0x3d);;
     _32(0x795620c5),        //slld $r21 = $r5, 3 (0x3);;
     _32(0x7a550540),        //ord $r21 = $r0, $r21;;
     _32(0x795220c4),        //slld $r20 = $r4, 3 (0x3);;
     _32(0x6903f01e),        //sxwd $r0 = $r30;;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x7b022140),        //srld $r0 = $r0, 5 (0x5);;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x75310300),        //sbfd $r12 = $r0, $r12;;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x61000000),        //addd $r0 = $r0, 0 (0x0);;
     _32(0x2701260e),        //sd 152 (0x98)[$r14] = $r0;;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x6a500000),        //copyd $r20 = $r0;;
     _32(0x6903f01e),        //sxwd $r0 = $r30;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0x7b022f42),        //srld $r0 = $r2, 61 (0x3d);;
     _32(0x794e20c3),        //slld $r19 = $r3, 3 (0x3);;
     _32(0x7a4d04c0),        //ord $r19 = $r0, $r19;;
     _32(0x794a20c2),        //slld $r18 = $r2, 3 (0x3);;
     _32(0x6903f01e),        //sxwd $r0 = $r30;;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x7b022140),        //srld $r0 = $r0, 5 (0x5);;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x75310300),        //sbfd $r12 = $r0, $r12;;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x61000000),        //addd $r0 = $r0, 0 (0x0);;
     _32(0x2701240e),        //sd 144 (0x90)[$r14] = $r0;;
     _32(0x6903f01e),        //sxwd $r0 = $r30;;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x38042a0e),        //ld $r1 = 168 (0xa8)[$r14];;
     _32(0x71050001),        //addd $r1 = $r1, $r0;;
     _32(0x3800240e),        //ld $r0 = 144 (0x90)[$r14];;
     _32(0x6a080018),        //copyd $r2 = $r24;;
     _32(0x180000a8),        //call 16d30 <memcpy>;;
     _32(0x6907f01e),        //sxwd $r1 = $r30;;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x38042a0e),        //ld $r1 = 168 (0xa8)[$r14];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3804240e),        //ld $r1 = 144 (0x90)[$r14];;
     _32(0x6a080018),        //copyd $r2 = $r24;;
     _32(0x1800009f),        //call 16d30 <memcpy>;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x3800260e),        //ld $r0 = 152 (0x98)[$r14];;
     _32(0x6a080018),        //copyd $r2 = $r24;;
     _32(0x1800009b),        //call 16d30 <memcpy>;;
     _32(0x6a300014),        //copyd $r12 = $r20;;
     _32(0x3800280e),        //ld $r0 = 160 (0xa0)[$r14];;
     _32(0x3804260e),        //ld $r1 = 152 (0x98)[$r14];;
     _32(0x6a080018),        //copyd $r2 = $r24;;
     _32(0x18000096),        //call 16d30 <memcpy>;;
     _32(0x3804220e),        //ld $r1 = 136 (0x88)[$r14];;
     _32(0x3800280e),        //ld $r0 = 160 (0xa0)[$r14];;
     _32(0x1fffff4f),        //call 16820 <bar>;;
     _32(0x6a30001f),        //copyd $r12 = $r31;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130fe0e),        //addd $r12 = $r14, -8 (0xfffffff8);;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0x3c48060c),        //lq $r18r19 = 24 (0x18)[$r12];;
     _32(0x3c540a0c),        //lo $r20r21r22r23 = 40 (0x28)[$r12];;
     _32(0x3c64120c),        //lo $r24r25r26r27 = 72 (0x48)[$r12];;
     _32(0x3c741a0c),        //lo $r28r29r30r31 = 104 (0x68)[$r12];;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130300c),        //addd $r12 = $r12, 192 (0xc0);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00033b33815918d8e0009840),        //make $r0 = 29104508263162465 (0x67666564636261);;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _96(0x00023a32815110d0e0009040),        //make $r0 = 20061986658402881 (0x47464544434241);;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _96(0x0003a3ab859dde1ee0005e80),        //make $r0 = 32780248969410938 (0x7475767778797a);;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _96(0x0002a2aa8595d616e0005680),        //make $r0 = 23737727364651354 (0x5455565758595a);;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x60040008),        //make $r1 = 8 (0x8);;
     _32(0x1fffff6b),        //call 16918 <foo>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000189),        //call 171b8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000853),        //call 18ce8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101100011000; //0x16b18
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100100011000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101100011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101110001000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016b18;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
