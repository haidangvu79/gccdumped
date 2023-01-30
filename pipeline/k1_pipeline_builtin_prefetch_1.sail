// executing pipeline builtin_prefetch_1.c.out.dumped test 
val k1_pipeline_builtin_prefetch_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_builtin_prefetch_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let good_const: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let good_enum: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let good_expr: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let good_vararg: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _32(0x1fffffb6),        //call 16820 <good_const>;;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _32(0x1fffffc8),        //call 16878 <good_enum>;;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _32(0x1fffffda),        //call 168d0 <good_expr>;;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _32(0x1fffffe0),        //call 168f8 <good_vararg>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000002),        //call 16988 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let exit: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0xf838ffc0),        //zxwd $r14 = $r0
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x9800004d),        //call 16ad0 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 169c4 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x980002e5),        //call 17558 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
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
     _32(0x0880014e),        //cb.deqz $r14? 16a14 <__libc_fini_array+0x44>;;
     _32(0x6138ffce),        //addd $r14 = $r14, -1 (0xffffffff);;
     _32(0x3802f392),        //ld.xs $r0 = $r14[$r18];;
     _32(0x0fdc0000),        //icall $r0;;
     _32(0x087fff4e),        //cb.dnez $r14? 16a04 <__libc_fini_array+0x34>;;
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
     _32(0x08800192),        //cb.deqz $r18? 16a7c <__libc_init_array+0x4c>;;
     _32(0xe138004e),        //addd $r14 = $r14, 1 (0x1)
     _32(0x3802f393),        //ld.xs $r0 = $r14[$r19];;
     _32(0x0fdc0000),        //icall $r0;;
     _32(0x7001a392),        //compd.ne $r0 = $r18, $r14;;
     _32(0x087fff00),        //cb.dnez $r0? 16a68 <__libc_init_array+0x38>;;
     _32(0xe0380000),        //make $r14 = 0 (0x0)
     _96(0x08000000880000d8e04c0000),        //make $r19 = 221184 (0x36000);;
     _96(0x00000000800000d8e5480013),        //sbfd $r18 = $r19, 221184 (0x36000);;
     _32(0x7a4a20d2),        //srad $r18 = $r18, 3 (0x3);;
     _32(0x08800192),        //cb.deqz $r18? 16ab4 <__libc_init_array+0x84>;;
     _32(0xe138004e),        //addd $r14 = $r14, 1 (0x1)
     _32(0x3802f393),        //ld.xs $r0 = $r14[$r19];;
     _32(0x0fdc0000),        //icall $r0;;
     _32(0x7001a392),        //compd.ne $r0 = $r18, $r14;;
     _32(0x087fff00),        //cb.dnez $r0? 16aa0 <__libc_init_array+0x70>;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3c48020c),        //lq $r18r19 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let __call_exitprocs: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0xf858ffc0),        //zxwd $r22 = $r0
     _32(0xe0500000),        //make $r20 = 0 (0x0)
     _96(0x90000106a855080ce0007000),        //make $r0 = 268736 (0x419c0)
     _32(0x10000000),        //so 32 (0x20)[$r12] = $r20r21r22r23;;
     _32(0xea680001),        //copyd $r26 = $r1
     _96(0x88000062a865100ce05c5a00),        //make $r23 = 100712 (0x18968)
     _32(0x08000000),        //so 64 (0x40)[$r12] = $r24r25r26r27;;
     _32(0xe04c0001),        //make $r19 = 1 (0x1)
     _32(0x2849040c),        //sq 16 (0x10)[$r12] = $r18r19;;
     _32(0x2739020c),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0x27411e0c),        //sd 120 (0x78)[$r12] = $r16;;
     _32(0x2871180c),        //sq 96 (0x60)[$r12] = $r28r29;;
     _32(0x98000090),        //call 16d58 <__libc_lock_acquire>
     _32(0x27791c0c),        //sd 112 (0x70)[$r12] = $r30;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38600000),        //ld $r24 = 0 (0x0)[$r0];;
     _32(0x61647e18),        //addd $r25 = $r24, 504 (0x1f8);;
     _32(0xea780019),        //copyd $r30 = $r25
     _32(0x38487e18),        //ld $r18 = 504 (0x1f8)[$r24];;
     _32(0x08800c52),        //cb.deqz $r18? 16c00 <__call_exitprocs+0x130>;;
     _32(0xe16c0412),        //addd $r27 = $r18, 16 (0x10)
     _32(0xe1544412),        //addd $r21 = $r18, 272 (0x110)
     _64(0xb0000212e1748412),        //addd $r29 = $r18, 528 (0x210)
     _32(0x10000000),        //lwz $r0 = 8 (0x8)[$r18];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x693bf000),        //sxwd $r14 = $r0;;
     _32(0x0d800100),        //cb.wgez $r0? 16b6c <__call_exitprocs+0x9c>;;
     _32(0x1000001e),        //goto 16bd8 <__call_exitprocs+0x108>;;
     _32(0x6138ffce),        //addd $r14 = $r14, -1 (0xffffffff);;
     _32(0x0d00070e),        //cb.wltz $r14? 16bd8 <__call_exitprocs+0x108>;;
     _32(0x8880015a),        //cb.deqz $r26? 16b80 <__call_exitprocs+0xb0>
     _32(0x7808ffce),        //zxwd $r2 = $r14;;
     _32(0x3802f39d),        //ld.xs $r0 = $r14[$r29];;
     _32(0x7101a680),        //compd.eq $r0 = $r0, $r26;;
     _32(0x08fffe80),        //cb.deqz $r0? 16b64 <__call_exitprocs+0x94>;;
     _32(0x30000212),        //lwz $r0 = 8 (0x8)[$r18];;
     _32(0x380ef39b),        //ld.xs $r3 = $r14[$r27];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x7001b380),        //compw.ne $r0 = $r0, $r14;;
     _32(0x0c800c80),        //cb.weqz $r0? 16c58 <__call_exitprocs+0x188>;;
     _32(0x2753f39b),        //sd.xs $r14[$r27] = $r20;;
     _32(0x08fffcc3),        //cb.deqz $r3? 16b64 <__call_exitprocs+0x94>;;
     _32(0xf90a7093),        //sllw $r2 = $r19, $r2
     _64(0x18000000b000c412),        //lwz $r0 = 784 (0x310)[$r18];;
     _32(0x30700212),        //lwz $r28 = 8 (0x8)[$r18];;
     _32(0x78011080),        //andw $r0 = $r0, $r2;;
     _32(0x0c000840),        //cb.wnez $r0? 16c34 <__call_exitprocs+0x164>;;
     _32(0x0fdc0003),        //icall $r3;;
     _32(0xe138ffce),        //addd $r14 = $r14, -1 (0xffffffff)
     _32(0x30000212),        //lwz $r0 = 8 (0x8)[$r18];;
     _32(0x7001b700),        //compw.ne $r0 = $r0, $r28;;
     _32(0x0c7ff700),        //cb.wnez $r0? 16b34 <__call_exitprocs+0x64>;;
     _32(0x3800001e),        //ld $r0 = 0 (0x0)[$r30];;
     _32(0x7001a480),        //compd.ne $r0 = $r0, $r18;;
     _32(0x087ff640),        //cb.dnez $r0? 16b34 <__call_exitprocs+0x64>;;
     _32(0x0dfff98e),        //cb.wgez $r14? 16b6c <__call_exitprocs+0x9c>;;
     _32(0x08800297),        //cb.deqz $r23? 16c00 <__call_exitprocs+0x130>;;
     _32(0x30000212),        //lwz $r0 = 8 (0x8)[$r18];;
     _32(0x38040012),        //ld $r1 = 0 (0x0)[$r18];;
     _32(0x0c000840),        //cb.wnez $r0? 16c68 <__call_exitprocs+0x198>;;
     _32(0x08800801),        //cb.deqz $r1? 16c68 <__call_exitprocs+0x198>;;
     _32(0x8fdc0017),        //icall $r23
     _32(0xea000012),        //copyd $r0 = $r18
     _32(0x2705001e),        //sd 0 (0x0)[$r30] = $r1;;
     _32(0x3848001e),        //ld $r18 = 0 (0x0)[$r30];;
     _32(0x087ff452),        //cb.dnez $r18? 16b40 <__call_exitprocs+0x70>;;
     _96(0x80000106b8401e0ce0007000),        //make $r0 = 268736 (0x419c0)
     _32(0x00000000),        //ld $r16 = 120 (0x78)[$r12];;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0x3c48040c),        //lq $r18r19 = 16 (0x10)[$r12];;
     _32(0x3c54080c),        //lo $r20r21r22r23 = 32 (0x20)[$r12];;
     _32(0x3c64100c),        //lo $r24r25r26r27 = 64 (0x40)[$r12];;
     _32(0x3c70180c),        //lq $r28r29 = 96 (0x60)[$r12];;
     _32(0xe130200c),        //addd $r12 = $r12, 128 (0x80)
     _32(0x38781c0c),        //ld $r30 = 112 (0x70)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x1000008e),        //goto 16e68 <__libc_lock_release>;;
     _64(0x18000000b010c512),        //lwz $r4 = 788 (0x314)[$r18];;
     _32(0x3802f395),        //ld.xs $r0 = $r14[$r21];;
     _32(0x78091084),        //andw $r2 = $r4, $r2;;
     _32(0x0c0001c2),        //cb.wnez $r2? 16c60 <__call_exitprocs+0x190>;;
     _32(0x8fdc0003),        //icall $r3
     _32(0xea040000),        //copyd $r1 = $r0
     _32(0x7a000016),        //copyw $r0 = $r22;;
     _32(0x17ffffd9),        //goto 16bb8 <__call_exitprocs+0xe8>;;
     _32(0x97ffffd0),        //goto 16b98 <__call_exitprocs+0xc8>
     _32(0x26090212),        //sw 8 (0x8)[$r18] = $r2;;
     _32(0x0fdc0003),        //icall $r3;;
     _32(0x17ffffd5),        //goto 16bb8 <__call_exitprocs+0xe8>;;
     _32(0xea780012),        //copyd $r30 = $r18
     _32(0x6a480001),        //copyd $r18 = $r1;;
     _32(0x087fed12),        //cb.dnez $r18? 16b40 <__call_exitprocs+0x70>;;
     _32(0x17ffffe3)        //goto 16c00 <__call_exitprocs+0x130>;;
 |];

let __libc_lock_init: list_I = 
 [|
     _32(0x08800080),        //cb.deqz $r0? 16c80 <__libc_lock_init+0x8>;;
     _32(0x100043d9),        //goto 27be0 <__cos_recursive_initlock_base>;;
     _32(0x00000000),        //errop ;;
     _32(0x100043d7)        //goto 27be0 <__cos_recursive_initlock_base>;;
 |];

let __libc_lock_close: list_I = 
 [|
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let __libc_lock_try_acquire: list_I = 
 [|
     _32(0x8fc40081),        //get $r1 = $pcr
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x8fc40082),        //get $r2 = $pcr
     _32(0x6407f201),        //extfz $r1 = $r1, 15 (0xf), 8 (0x8);;
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xf4055041),        //addx8w $r1 = $r1, $r1
     _32(0x78083fc2),        //zxbd $r2 = $r2;;
     _32(0xf0055081),        //addx2w $r1 = $r1, $r2
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x980043cf),        //call 27bf0 <__cos_recursive_trylock_base>
     _32(0x71040041),        //addw $r1 = $r1, 1 (0x1);;
     _64(0x00000000f005b040),        //compw.ne $r1 = $r0, 1 (0x1);;
     _32(0x0c8001c1),        //cb.weqz $r1? 16ce0 <__libc_lock_try_acquire+0x50>;;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _64(0xb840040cf101b000),        //compw.eq $r0 = $r0, 0 (0x0)
     _32(0x08000000),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _96(0x0000000080000000e0040000),        //make $r1 = 0 (0x0);;
     _32(0x08000201),        //cb.dnez $r1? 16d0c <__libc_lock_try_acquire+0x7c>;;
     _32(0x3fcd0000),        //fence ;;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _64(0xb840040cf101b000),        //compw.eq $r0 = $r0, 0 (0x0)
     _32(0x08000000),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _96(0x80000000e0080000e0040040),        //make $r1 = 1 (0x1)
     _96(0x080000008800000080000000),        //make $r2 = 0 (0x0);;
     _32(0xe0090002),        //compd.ne $r2 = $r2, 0 (0x0)
     _64(0x08000000f505b041),        //compw.gt $r1 = $r1, 1 (0x1);;
     _32(0x78051081),        //andw $r1 = $r1, $r2;;
     _32(0x0c000101),        //cb.wnez $r1? 16d44 <__libc_lock_try_acquire+0xb4>;;
     _32(0x3f8d0000),        //dinval ;;
     _32(0x97ffffee),        //goto 16cf4 <__libc_lock_try_acquire+0x64>
     _32(0x3fcd0000),        //fence ;;
     _32(0x980041d7),        //call 274a0 <mppa_cos_l2_wb_inval>
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x97fffffb),        //goto 16d3c <__libc_lock_try_acquire+0xac>
     _32(0x3f8d0000)        //dinval ;;
 |];

let __libc_lock_acquire: list_I = 
 [|
     _32(0x8fc40081),        //get $r1 = $pcr
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x8fc40082),        //get $r2 = $pcr
     _32(0xe407f201),        //extfz $r1 = $r1, 15 (0xf), 8 (0x8)
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xf4055041),        //addx8w $r1 = $r1, $r1
     _32(0x78383fc2),        //zxbd $r14 = $r2;;
     _32(0xf0395381),        //addx2w $r14 = $r1, $r14
     _32(0xea480000),        //copyd $r18 = $r0
     _32(0x2849060c),        //sq 24 (0x18)[$r12] = $r18r19;;
     _32(0xf14c004e),        //addw $r19 = $r14, 1 (0x1)
     _32(0xe0500000),        //make $r20 = 0 (0x0)
     _32(0xf138004e),        //addw $r14 = $r14, 1 (0x1)
     _32(0x27510a0c),        //sd 40 (0x28)[$r12] = $r20;;
     _32(0x27410c0c),        //sd 48 (0x30)[$r12] = $r16;;
     _32(0x9fffffbe),        //call 16c90 <__libc_lock_try_acquire>
     _32(0x6a000012),        //copyd $r0 = $r18;;
     _32(0x0c800380),        //cb.weqz $r0? 16dd8 <__libc_lock_acquire+0x80>;;
     _32(0x26510e0c),        //sw 56 (0x38)[$r12] = $r20;;
     _32(0x30040e0c),        //lwz $r1 = 56 (0x38)[$r12];;
     _32(0x7705b4c1),        //compw.geu $r1 = $r1, $r19;;
     _32(0x0c7ffe81),        //cb.wnez $r1? 16d98 <__libc_lock_acquire+0x40>;;
     _32(0x30040e0c),        //lwz $r1 = 56 (0x38)[$r12];;
     _32(0x71040041),        //addw $r1 = $r1, 1 (0x1);;
     _32(0x26050e0c),        //sw 56 (0x38)[$r12] = $r1;;
     _32(0x30040e0c),        //lwz $r1 = 56 (0x38)[$r12];;
     _32(0x7605b381),        //compw.ltu $r1 = $r1, $r14;;
     _32(0x0c7ffec1),        //cb.wnez $r1? 16db4 <__libc_lock_acquire+0x5c>;;
     _32(0x9fffffb1),        //call 16c90 <__libc_lock_try_acquire>
     _32(0x6a000012),        //copyd $r0 = $r18;;
     _32(0x0c7ffd00),        //cb.wnez $r0? 16da4 <__libc_lock_acquire+0x4c>;;
     _96(0x0000000080000000e0000000),        //make $r0 = 0 (0x0);;
     _32(0x08000240),        //cb.dnez $r0? 16e08 <__libc_lock_acquire+0xb0>;;
     _32(0x3fcd0000),        //fence ;;
     _32(0x38400c0c),        //ld $r16 = 48 (0x30)[$r12];;
     _32(0x3838040c),        //ld $r14 = 16 (0x10)[$r12];;
     _32(0x3c48060c),        //lq $r18r19 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x8fd00000),        //ret 
     _32(0xe130100c),        //addd $r12 = $r12, 64 (0x40)
     _32(0x38500a0c),        //ld $r20 = 40 (0x28)[$r12];;
     _96(0x80000000e0040000e0000040),        //make $r0 = 1 (0x1)
     _96(0x080000008800000080000000),        //make $r1 = 0 (0x0);;
     _32(0xe0050001),        //compd.ne $r1 = $r1, 0 (0x0)
     _64(0x08000000f501b040),        //compw.gt $r0 = $r0, 1 (0x1);;
     _32(0x78011040),        //andw $r0 = $r0, $r1;;
     _32(0x0c000280),        //cb.wnez $r0? 16e58 <__libc_lock_acquire+0x100>;;
     _32(0x3f8d0000),        //dinval ;;
     _32(0x3fcd0000),        //fence ;;
     _32(0x38400c0c),        //ld $r16 = 48 (0x30)[$r12];;
     _32(0x3838040c),        //ld $r14 = 16 (0x10)[$r12];;
     _32(0x3c48060c),        //lq $r18r19 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x8fd00000),        //ret 
     _32(0xe130100c),        //addd $r12 = $r12, 64 (0x40)
     _32(0x38500a0c),        //ld $r20 = 40 (0x28)[$r12];;
     _32(0x18004192),        //call 274a0 <mppa_cos_l2_wb_inval>;;
     _32(0x97fffff7),        //goto 16e38 <__libc_lock_acquire+0xe0>
     _32(0x3f8d0000),        //dinval ;;
     _32(0x7f03f000)        //nop ;;
 |];

let __libc_lock_release: list_I = 
 [|
     _32(0x8fc40081),        //get $r1 = $pcr
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x8fc40082),        //get $r2 = $pcr
     _32(0x6407f201),        //extfz $r1 = $r1, 15 (0xf), 8 (0x8);;
     _32(0xf4055041),        //addx8w $r1 = $r1, $r1
     _32(0xf80c3fc2),        //zxbd $r3 = $r2
     _96(0x1000000090000000e0080000),        //make $r2 = 0 (0x0);;
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0x700550c1),        //addx2w $r1 = $r1, $r3;;
     _32(0xf1040041),        //addw $r1 = $r1, 1 (0x1)
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x880001c2),        //cb.dnez $r2? 16eb8 <__libc_lock_release+0x50>
     _32(0x6907f001),        //sxwd $r1 = $r1;;
     _32(0x3fcd0000),        //fence ;;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x100043a1),        //goto 27d38 <__cos_recursive_unlock_base>;;
     _96(0x80000000e00c0000e0080040),        //make $r2 = 1 (0x1)
     _96(0x080000008800000080000000),        //make $r3 = 0 (0x0);;
     _32(0xe00d0003),        //compd.ne $r3 = $r3, 0 (0x0)
     _64(0x08000000f509b042),        //compw.gt $r2 = $r2, 1 (0x1);;
     _32(0x780910c2),        //andw $r2 = $r2, $r3;;
     _32(0x0c0001c2),        //cb.wnez $r2? 16efc <__libc_lock_release+0x94>;;
     _32(0x3f8d0000),        //dinval ;;
     _32(0x3fcd0000),        //fence ;;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x10004390),        //goto 27d38 <__cos_recursive_unlock_base>;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x98004168),        //call 274a0 <mppa_cos_l2_wb_inval>
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x97fffff6),        //goto 16ee8 <__libc_lock_release+0x80>
     _32(0x3f8d0000)        //dinval ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100110000; //0x16930
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(good_const, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(good_enum, 0b00010110100001111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(good_expr, 0b00010110100011010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(good_vararg, 0b00010110100011111000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit, 0b00010110100110001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__libc_fini_array, 0b00010110100111010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__libc_init_array, 0b00010110101000110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__call_exitprocs, 0b00010110101011010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__libc_lock_init, 0b00010110110001111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__libc_lock_close, 0b00010110110010001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__libc_lock_try_acquire, 0b00010110110010010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__libc_lock_acquire, 0b00010110110101011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__libc_lock_release, 0b00010110111001101000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016930;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
