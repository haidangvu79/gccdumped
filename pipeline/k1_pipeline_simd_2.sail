// executing pipeline simd_2.c.out.dumped test 
val k1_pipeline_simd_2: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_simd_2() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let verify: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x2601160c),        //sw 88 (0x58)[$r12] = $r0;;
     _32(0x2605140c),        //sw 80 (0x50)[$r12] = $r1;;
     _32(0x2609120c),        //sw 72 (0x48)[$r12] = $r2;;
     _32(0x260d100c),        //sw 64 (0x40)[$r12] = $r3;;
     _32(0x26110e0c),        //sw 56 (0x38)[$r12] = $r4;;
     _32(0x26150c0c),        //sw 48 (0x30)[$r12] = $r5;;
     _32(0x26190a0c),        //sw 40 (0x28)[$r12] = $r6;;
     _32(0x261d080c),        //sw 32 (0x20)[$r12] = $r7;;
     _32(0x3004160c),        //lwz $r1 = 88 (0x58)[$r12];;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _32(0x7001b001),        //compw.ne $r0 = $r1, $r0;;
     _32(0x0c000340),        //cb.wnez $r0? 1688c <verify+0x6c>;;
     _32(0x3004140c),        //lwz $r1 = 80 (0x50)[$r12];;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _32(0x7001b001),        //compw.ne $r0 = $r1, $r0;;
     _32(0x0c000240),        //cb.wnez $r0? 1688c <verify+0x6c>;;
     _32(0x3004120c),        //lwz $r1 = 72 (0x48)[$r12];;
     _32(0x30000a0c),        //lwz $r0 = 40 (0x28)[$r12];;
     _32(0x7001b001),        //compw.ne $r0 = $r1, $r0;;
     _32(0x0c000140),        //cb.wnez $r0? 1688c <verify+0x6c>;;
     _32(0x3004100c),        //lwz $r1 = 64 (0x40)[$r12];;
     _32(0x3000080c),        //lwz $r0 = 32 (0x20)[$r12];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16890 <verify+0x70>;;
     _32(0x180002e1),        //call 17410 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x2739000c),        //sd 0 (0x0)[$r12] = $r14;;
     _32(0x2849020c),        //sq 8 (0x8)[$r12] = $r18r19;;
     _32(0x2855060c),        //so 24 (0x18)[$r12] = $r20r21r22r23;;
     _32(0x28650e0c),        //so 56 (0x38)[$r12] = $r24r25r26r27;;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741160c),        //sd 88 (0x58)[$r12] = $r16;;
     _96(0x00000000800000fce0000400),        //make $r0 = 258064 (0x3f010);;
     _32(0x3c080000),        //lq $r2r3 = 0 (0x0)[$r0];;
     _96(0x00000000800000fce0000800),        //make $r0 = 258080 (0x3f020);;
     _32(0x3c000000),        //lq $r0r1 = 0 (0x0)[$r0];;
     _32(0xf1013002),        //addhq $r0 = $r2, $r0
     _32(0x71053043),        //addhq $r1 = $r3, $r1;;
     _96(0x000000008000011be0082400),        //make $r2 = 289936 (0x46c90);;
     _32(0x28010002),        //sq 0 (0x0)[$r2] = $r0r1;;
     _96(0x000000008000011be0002400),        //make $r0 = 289936 (0x46c90);;
     _32(0x3c000000),        //lq $r0r1 = 0 (0x0)[$r0];;
     _96(0x000000008000011be0082800),        //make $r2 = 289952 (0x46ca0);;
     _32(0x28010002),        //sq 0 (0x0)[$r2] = $r0r1;;
     _96(0x000000008000011be0002800),        //make $r0 = 289952 (0x46ca0);;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7820ffc0),        //zxwd $r8 = $r0;;
     _96(0x000000008000011be0002800),        //make $r0 = 289952 (0x46ca0);;
     _32(0x28000080),        //lhz $r0 = 2 (0x2)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x000000008000011be0002800),        //make $r0 = 289952 (0x46ca0);;
     _32(0x28000100),        //lhz $r0 = 4 (0x4)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _96(0x000000008000011be0002800),        //make $r0 = 289952 (0x46ca0);;
     _32(0x28000180),        //lhz $r0 = 6 (0x6)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x601c00e6),        //make $r7 = 230 (0xe6);;
     _32(0x601800aa),        //make $r6 = 170 (0xaa);;
     _32(0x60140071),        //make $r5 = 113 (0x71);;
     _32(0x601000a0),        //make $r4 = 160 (0xa0);;
     _32(0x7a0c0000),        //copyw $r3 = $r0;;
     _32(0x7a000008),        //copyw $r0 = $r8;;
     _32(0x1fffffa3),        //call 16820 <verify>;;
     _96(0x00000000800000fce0000400),        //make $r0 = 258064 (0x3f010);;
     _32(0x3c080000),        //lq $r2r3 = 0 (0x0)[$r0];;
     _96(0x00000000800000fce0000800),        //make $r0 = 258080 (0x3f020);;
     _32(0x3c000000),        //lq $r0r1 = 0 (0x0)[$r0];;
     _32(0x56001002),        //mulhq $r0 = $r2, $r0;;
     _32(0x56041043),        //mulhq $r1 = $r3, $r1;;
     _96(0x000000008000011be0082400),        //make $r2 = 289936 (0x46c90);;
     _32(0x28010002),        //sq 0 (0x0)[$r2] = $r0r1;;
     _96(0x000000008000011be0002400),        //make $r0 = 289936 (0x46c90);;
     _32(0x3c000000),        //lq $r0r1 = 0 (0x0)[$r0];;
     _96(0x000000008000011be0082800),        //make $r2 = 289952 (0x46ca0);;
     _32(0x28010002),        //sq 0 (0x0)[$r2] = $r0r1;;
     _96(0x000000008000011be0002800),        //make $r0 = 289952 (0x46ca0);;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7820ffc0),        //zxwd $r8 = $r0;;
     _96(0x000000008000011be0002800),        //make $r0 = 289952 (0x46ca0);;
     _32(0x28000080),        //lhz $r0 = 2 (0x2)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x000000008000011be0002800),        //make $r0 = 289952 (0x46ca0);;
     _32(0x28000100),        //lhz $r0 = 4 (0x4)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _96(0x000000008000011be0002800),        //make $r0 = 289952 (0x46ca0);;
     _32(0x28000180),        //lhz $r0 = 6 (0x6)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x601c1770),        //make $r7 = 6000 (0x1770);;
     _32(0x60180bb8),        //make $r6 = 3000 (0xbb8);;
     _32(0x60140514),        //make $r5 = 1300 (0x514);;
     _32(0x601005dc),        //make $r4 = 1500 (0x5dc);;
     _32(0x7a0c0000),        //copyw $r3 = $r0;;
     _32(0x7a000008),        //copyw $r0 = $r8;;
     _32(0x1fffff6e),        //call 16820 <verify>;;
     _96(0x00000000800000fce0000400),        //make $r0 = 258064 (0x3f010);;
     _32(0x3c500000),        //lq $r20r21 = 0 (0x0)[$r0];;
     _96(0x00000000800000fce0000800),        //make $r0 = 258080 (0x3f020);;
     _32(0x3c480000),        //lq $r18r19 = 0 (0x0)[$r0];;
     _32(0x6a000014),        //copyd $r0 = $r20;;
     _32(0x6a040015),        //copyd $r1 = $r21;;
     _32(0x6407f000),        //zxhd $r1 = $r0;;
     _32(0x6a080012),        //copyd $r2 = $r18;;
     _32(0x6a0c0013),        //copyd $r3 = $r19;;
     _32(0x6403f002),        //zxhd $r0 = $r2;;
     _32(0x6807f001),        //sxhd $r1 = $r1;;
     _32(0x7a080001),        //copyw $r2 = $r1;;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _32(0x6903f002),        //sxwd $r0 = $r2;;
     _32(0x6907f001),        //sxwd $r1 = $r1;;
     _32(0x18000211),        //call 17300 <__divdi3>;;
     _32(0x646ff000),        //zxhd $r27 = $r0;;
     _32(0x6a000014),        //copyd $r0 = $r20;;
     _32(0x6a040015),        //copyd $r1 = $r21;;
     _32(0x6903f400),        //extfs $r0 = $r0, 31 (0x1f), 16 (0x10);;
     _32(0x640bf000),        //zxhd $r2 = $r0;;
     _32(0x6a000012),        //copyd $r0 = $r18;;
     _32(0x6a040013),        //copyd $r1 = $r19;;
     _32(0x6903f400),        //extfs $r0 = $r0, 31 (0x1f), 16 (0x10);;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x6807f002),        //sxhd $r1 = $r2;;
     _32(0x7a080001),        //copyw $r2 = $r1;;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _32(0x6903f002),        //sxwd $r0 = $r2;;
     _32(0x6907f001),        //sxwd $r1 = $r1;;
     _32(0x18000201),        //call 17300 <__divdi3>;;
     _32(0x646bf000),        //zxhd $r26 = $r0;;
     _32(0x6a000014),        //copyd $r0 = $r20;;
     _32(0x6a040015),        //copyd $r1 = $r21;;
     _32(0x6a03f800),        //extfs $r0 = $r0, 47 (0x2f), 32 (0x20);;
     _32(0x640bf000),        //zxhd $r2 = $r0;;
     _32(0x6a000012),        //copyd $r0 = $r18;;
     _32(0x6a040013),        //copyd $r1 = $r19;;
     _32(0x6a03f800),        //extfs $r0 = $r0, 47 (0x2f), 32 (0x20);;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x6807f002),        //sxhd $r1 = $r2;;
     _32(0x7a080001),        //copyw $r2 = $r1;;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _32(0x6903f002),        //sxwd $r0 = $r2;;
     _32(0x6907f001),        //sxwd $r1 = $r1;;
     _32(0x180001f1),        //call 17300 <__divdi3>;;
     _32(0x6467f000),        //zxhd $r25 = $r0;;
     _32(0x6a000014),        //copyd $r0 = $r20;;
     _32(0x6a040015),        //copyd $r1 = $r21;;
     _32(0x6b03fc00),        //extfs $r0 = $r0, 63 (0x3f), 48 (0x30);;
     _32(0x640bf000),        //zxhd $r2 = $r0;;
     _32(0x6a000012),        //copyd $r0 = $r18;;
     _32(0x6a040013),        //copyd $r1 = $r19;;
     _32(0x6b03fc00),        //extfs $r0 = $r0, 63 (0x3f), 48 (0x30);;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x6807f002),        //sxhd $r1 = $r2;;
     _32(0x7a080001),        //copyw $r2 = $r1;;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _32(0x6903f002),        //sxwd $r0 = $r2;;
     _32(0x6907f001),        //sxwd $r1 = $r1;;
     _32(0x180001e1),        //call 17300 <__divdi3>;;
     _32(0x6463f000),        //zxhd $r24 = $r0;;
     _32(0x6a000014),        //copyd $r0 = $r20;;
     _32(0x6a040015),        //copyd $r1 = $r21;;
     _32(0x6407f001),        //zxhd $r1 = $r1;;
     _32(0x6a080012),        //copyd $r2 = $r18;;
     _32(0x6a0c0013),        //copyd $r3 = $r19;;
     _32(0x6403f003),        //zxhd $r0 = $r3;;
     _32(0x6807f001),        //sxhd $r1 = $r1;;
     _32(0x7a080001),        //copyw $r2 = $r1;;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _32(0x6903f002),        //sxwd $r0 = $r2;;
     _32(0x6907f001),        //sxwd $r1 = $r1;;
     _32(0x180001d3),        //call 17300 <__divdi3>;;
     _32(0x645ff000),        //zxhd $r23 = $r0;;
     _32(0x6a000014),        //copyd $r0 = $r20;;
     _32(0x6a040015),        //copyd $r1 = $r21;;
     _32(0x6903f401),        //extfs $r0 = $r1, 31 (0x1f), 16 (0x10);;
     _32(0x640bf000),        //zxhd $r2 = $r0;;
     _32(0x6a000012),        //copyd $r0 = $r18;;
     _32(0x6a040013),        //copyd $r1 = $r19;;
     _32(0x6903f401),        //extfs $r0 = $r1, 31 (0x1f), 16 (0x10);;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x6807f002),        //sxhd $r1 = $r2;;
     _32(0x7a080001),        //copyw $r2 = $r1;;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _32(0x6903f002),        //sxwd $r0 = $r2;;
     _32(0x6907f001),        //sxwd $r1 = $r1;;
     _32(0x180001c3),        //call 17300 <__divdi3>;;
     _32(0x645bf000),        //zxhd $r22 = $r0;;
     _32(0x6a000014),        //copyd $r0 = $r20;;
     _32(0x6a040015),        //copyd $r1 = $r21;;
     _32(0x6a03f801),        //extfs $r0 = $r1, 47 (0x2f), 32 (0x20);;
     _32(0x640bf000),        //zxhd $r2 = $r0;;
     _32(0x6a000012),        //copyd $r0 = $r18;;
     _32(0x6a040013),        //copyd $r1 = $r19;;
     _32(0x6a03f801),        //extfs $r0 = $r1, 47 (0x2f), 32 (0x20);;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x6807f002),        //sxhd $r1 = $r2;;
     _32(0x7a080001),        //copyw $r2 = $r1;;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _32(0x6903f002),        //sxwd $r0 = $r2;;
     _32(0x6907f001),        //sxwd $r1 = $r1;;
     _32(0x180001b3),        //call 17300 <__divdi3>;;
     _32(0x643bf000),        //zxhd $r14 = $r0;;
     _32(0x6a000014),        //copyd $r0 = $r20;;
     _32(0x6a040015),        //copyd $r1 = $r21;;
     _32(0x6b03fc01),        //extfs $r0 = $r1, 63 (0x3f), 48 (0x30);;
     _32(0x640bf000),        //zxhd $r2 = $r0;;
     _32(0x6a000012),        //copyd $r0 = $r18;;
     _32(0x6a040013),        //copyd $r1 = $r19;;
     _32(0x6b03fc01),        //extfs $r0 = $r1, 63 (0x3f), 48 (0x30);;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x6807f002),        //sxhd $r1 = $r2;;
     _32(0x7a080001),        //copyw $r2 = $r1;;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _32(0x6903f002),        //sxwd $r0 = $r2;;
     _32(0x6907f001),        //sxwd $r1 = $r1;;
     _32(0x180001a3),        //call 17300 <__divdi3>;;
     _32(0x640bf000),        //zxhd $r2 = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x6003f01b),        //insf $r0 = $r27, 15 (0xf), 0 (0x0);;
     _32(0x6103f41a),        //insf $r0 = $r26, 31 (0x1f), 16 (0x10);;
     _32(0x6203f819),        //insf $r0 = $r25, 47 (0x2f), 32 (0x20);;
     _32(0x6303fc18),        //insf $r0 = $r24, 63 (0x3f), 48 (0x30);;
     _32(0x6007f017),        //insf $r1 = $r23, 15 (0xf), 0 (0x0);;
     _32(0x6107f416),        //insf $r1 = $r22, 31 (0x1f), 16 (0x10);;
     _32(0x6207f80e),        //insf $r1 = $r14, 47 (0x2f), 32 (0x20);;
     _32(0x6307fc02),        //insf $r1 = $r2, 63 (0x3f), 48 (0x30);;
     _96(0x000000008000011be0082400),        //make $r2 = 289936 (0x46c90);;
     _32(0x28010002),        //sq 0 (0x0)[$r2] = $r0r1;;
     _96(0x000000008000011be0002400),        //make $r0 = 289936 (0x46c90);;
     _32(0x3c000000),        //lq $r0r1 = 0 (0x0)[$r0];;
     _96(0x000000008000011be0082800),        //make $r2 = 289952 (0x46ca0);;
     _32(0x28010002),        //sq 0 (0x0)[$r2] = $r0r1;;
     _96(0x000000008000011be0002800),        //make $r0 = 289952 (0x46ca0);;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7820ffc0),        //zxwd $r8 = $r0;;
     _96(0x000000008000011be0002800),        //make $r0 = 289952 (0x46ca0);;
     _32(0x28000080),        //lhz $r0 = 2 (0x2)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x000000008000011be0002800),        //make $r0 = 289952 (0x46ca0);;
     _32(0x28000100),        //lhz $r0 = 4 (0x4)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _96(0x000000008000011be0002800),        //make $r0 = 289952 (0x46ca0);;
     _32(0x28000180),        //lhz $r0 = 6 (0x6)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x601c0006),        //make $r7 = 6 (0x6);;
     _32(0x60180007),        //make $r6 = 7 (0x7);;
     _32(0x60140007),        //make $r5 = 7 (0x7);;
     _32(0x6010000f),        //make $r4 = 15 (0xf);;
     _32(0x7a0c0000),        //copyw $r3 = $r0;;
     _32(0x7a000008),        //copyw $r0 = $r8;;
     _32(0x1ffffeb5),        //call 16820 <verify>;;
     _96(0x00000000800000fce0000400),        //make $r0 = 258064 (0x3f010);;
     _32(0x3c080000),        //lq $r2r3 = 0 (0x0)[$r0];;
     _96(0x00000000800000fce0000800),        //make $r0 = 258080 (0x3f020);;
     _32(0x3c000000),        //lq $r0r1 = 0 (0x0)[$r0];;
     _32(0xf8010002),        //andd $r0 = $r2, $r0
     _32(0x78050043),        //andd $r1 = $r3, $r1;;
     _96(0x000000008000011be0082400),        //make $r2 = 289936 (0x46c90);;
     _32(0x28010002),        //sq 0 (0x0)[$r2] = $r0r1;;
     _96(0x000000008000011be0002400),        //make $r0 = 289936 (0x46c90);;
     _32(0x3c000000),        //lq $r0r1 = 0 (0x0)[$r0];;
     _96(0x000000008000011be0082800),        //make $r2 = 289952 (0x46ca0);;
     _32(0x28010002),        //sq 0 (0x0)[$r2] = $r0r1;;
     _96(0x000000008000011be0002800),        //make $r0 = 289952 (0x46ca0);;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7820ffc0),        //zxwd $r8 = $r0;;
     _96(0x000000008000011be0002800),        //make $r0 = 289952 (0x46ca0);;
     _32(0x28000080),        //lhz $r0 = 2 (0x2)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x000000008000011be0002800),        //make $r0 = 289952 (0x46ca0);;
     _32(0x28000100),        //lhz $r0 = 4 (0x4)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _96(0x000000008000011be0002800),        //make $r0 = 289952 (0x46ca0);;
     _32(0x28000180),        //lhz $r0 = 6 (0x6)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x601c0008),        //make $r7 = 8 (0x8);;
     _32(0x60180014),        //make $r6 = 20 (0x14);;
     _32(0x60140004),        //make $r5 = 4 (0x4);;
     _32(0x60100002),        //make $r4 = 2 (0x2);;
     _32(0x7a0c0000),        //copyw $r3 = $r0;;
     _32(0x7a000008),        //copyw $r0 = $r8;;
     _32(0x1ffffe80),        //call 16820 <verify>;;
     _96(0x00000000800000fce0000400),        //make $r0 = 258064 (0x3f010);;
     _32(0x3c080000),        //lq $r2r3 = 0 (0x0)[$r0];;
     _96(0x00000000800000fce0000800),        //make $r0 = 258080 (0x3f020);;
     _32(0x3c000000),        //lq $r0r1 = 0 (0x0)[$r0];;
     _32(0xfa010002),        //ord $r0 = $r2, $r0
     _32(0x7a050043),        //ord $r1 = $r3, $r1;;
     _96(0x000000008000011be0082400),        //make $r2 = 289936 (0x46c90);;
     _32(0x28010002),        //sq 0 (0x0)[$r2] = $r0r1;;
     _96(0x000000008000011be0002400),        //make $r0 = 289936 (0x46c90);;
     _32(0x3c000000),        //lq $r0r1 = 0 (0x0)[$r0];;
     _96(0x000000008000011be0082800),        //make $r2 = 289952 (0x46ca0);;
     _32(0x28010002),        //sq 0 (0x0)[$r2] = $r0r1;;
     _96(0x000000008000011be0002800),        //make $r0 = 289952 (0x46ca0);;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7820ffc0),        //zxwd $r8 = $r0;;
     _96(0x000000008000011be0002800),        //make $r0 = 289952 (0x46ca0);;
     _32(0x28000080),        //lhz $r0 = 2 (0x2)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x000000008000011be0002800),        //make $r0 = 289952 (0x46ca0);;
     _32(0x28000100),        //lhz $r0 = 4 (0x4)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _96(0x000000008000011be0002800),        //make $r0 = 289952 (0x46ca0);;
     _32(0x28000180),        //lhz $r0 = 6 (0x6)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x601c00de),        //make $r7 = 222 (0xde);;
     _32(0x60180096),        //make $r6 = 150 (0x96);;
     _32(0x6014006d),        //make $r5 = 109 (0x6d);;
     _32(0x6010009e),        //make $r4 = 158 (0x9e);;
     _32(0x7a0c0000),        //copyw $r3 = $r0;;
     _32(0x7a000008),        //copyw $r0 = $r8;;
     _32(0x1ffffe4b),        //call 16820 <verify>;;
     _96(0x00000000800000fce0000400),        //make $r0 = 258064 (0x3f010);;
     _32(0x3c080000),        //lq $r2r3 = 0 (0x0)[$r0];;
     _96(0x00000000800000fce0000800),        //make $r0 = 258080 (0x3f020);;
     _32(0x3c000000),        //lq $r0r1 = 0 (0x0)[$r0];;
     _32(0xfc010002),        //xord $r0 = $r2, $r0
     _32(0x7c050043),        //xord $r1 = $r3, $r1;;
     _96(0x000000008000011be0082400),        //make $r2 = 289936 (0x46c90);;
     _32(0x28010002),        //sq 0 (0x0)[$r2] = $r0r1;;
     _96(0x000000008000011be0002400),        //make $r0 = 289936 (0x46c90);;
     _32(0x3c000000),        //lq $r0r1 = 0 (0x0)[$r0];;
     _96(0x000000008000011be0082800),        //make $r2 = 289952 (0x46ca0);;
     _32(0x28010002),        //sq 0 (0x0)[$r2] = $r0r1;;
     _96(0x000000008000011be0002800),        //make $r0 = 289952 (0x46ca0);;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7820ffc0),        //zxwd $r8 = $r0;;
     _96(0x000000008000011be0002800),        //make $r0 = 289952 (0x46ca0);;
     _32(0x28000080),        //lhz $r0 = 2 (0x2)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x000000008000011be0002800),        //make $r0 = 289952 (0x46ca0);;
     _32(0x28000100),        //lhz $r0 = 4 (0x4)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _96(0x000000008000011be0002800),        //make $r0 = 289952 (0x46ca0);;
     _32(0x28000180),        //lhz $r0 = 6 (0x6)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x601c00d6),        //make $r7 = 214 (0xd6);;
     _32(0x60180082),        //make $r6 = 130 (0x82);;
     _32(0x60140069),        //make $r5 = 105 (0x69);;
     _32(0x6010009c),        //make $r4 = 156 (0x9c);;
     _32(0x7a0c0000),        //copyw $r3 = $r0;;
     _32(0x7a000008),        //copyw $r0 = $r8;;
     _32(0x1ffffe16),        //call 16820 <verify>;;
     _96(0x00000000800000fce0000400),        //make $r0 = 258064 (0x3f010);;
     _32(0x3c000000),        //lq $r0r1 = 0 (0x0)[$r0];;
     _64(0xf5053001f5013000),        //neghq $r0 = $r0
     _64(0x0800000080000000),        //neghq $r1 = $r1;;
     _96(0x000000008000011be0082400),        //make $r2 = 289936 (0x46c90);;
     _32(0x28010002),        //sq 0 (0x0)[$r2] = $r0r1;;
     _96(0x000000008000011be0002400),        //make $r0 = 289936 (0x46c90);;
     _32(0x3c000000),        //lq $r0r1 = 0 (0x0)[$r0];;
     _96(0x000000008000011be0082800),        //make $r2 = 289952 (0x46ca0);;
     _32(0x28010002),        //sq 0 (0x0)[$r2] = $r0r1;;
     _96(0x000000008000011be0002800),        //make $r0 = 289952 (0x46ca0);;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7820ffc0),        //zxwd $r8 = $r0;;
     _96(0x000000008000011be0002800),        //make $r0 = 289952 (0x46ca0);;
     _32(0x28000080),        //lhz $r0 = 2 (0x2)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x000000008000011be0002800),        //make $r0 = 289952 (0x46ca0);;
     _32(0x28000100),        //lhz $r0 = 4 (0x4)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _96(0x000000008000011be0002800),        //make $r0 = 289952 (0x46ca0);;
     _32(0x28000180),        //lhz $r0 = 6 (0x6)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x601cff38),        //make $r7 = -200 (0xffffff38);;
     _32(0x6018ff6a),        //make $r6 = -150 (0xffffff6a);;
     _32(0x6014ff9c),        //make $r5 = -100 (0xffffff9c);;
     _32(0x6010ff6a),        //make $r4 = -150 (0xffffff6a);;
     _32(0x7a0c0000),        //copyw $r3 = $r0;;
     _32(0x7a000008),        //copyw $r0 = $r8;;
     _32(0x1ffffde3),        //call 16820 <verify>;;
     _96(0x00000000800000fce0000400),        //make $r0 = 258064 (0x3f010);;
     _32(0x3c000000),        //lq $r0r1 = 0 (0x0)[$r0];;
     _32(0xec00ffc0),        //notd $r0 = $r0
     _32(0x6c04ffc1),        //notd $r1 = $r1;;
     _96(0x000000008000011be0082400),        //make $r2 = 289936 (0x46c90);;
     _32(0x28010002),        //sq 0 (0x0)[$r2] = $r0r1;;
     _96(0x000000008000011be0002400),        //make $r0 = 289936 (0x46c90);;
     _32(0x3c000000),        //lq $r0r1 = 0 (0x0)[$r0];;
     _96(0x000000008000011be0082800),        //make $r2 = 289952 (0x46ca0);;
     _32(0x28010002),        //sq 0 (0x0)[$r2] = $r0r1;;
     _96(0x000000008000011be0002800),        //make $r0 = 289952 (0x46ca0);;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7820ffc0),        //zxwd $r8 = $r0;;
     _96(0x000000008000011be0002800),        //make $r0 = 289952 (0x46ca0);;
     _32(0x28000080),        //lhz $r0 = 2 (0x2)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x000000008000011be0002800),        //make $r0 = 289952 (0x46ca0);;
     _32(0x28000100),        //lhz $r0 = 4 (0x4)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _96(0x000000008000011be0002800),        //make $r0 = 289952 (0x46ca0);;
     _32(0x28000180),        //lhz $r0 = 6 (0x6)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x601cff37),        //make $r7 = -201 (0xffffff37);;
     _32(0x6018ff69),        //make $r6 = -151 (0xffffff69);;
     _32(0x6014ff9b),        //make $r5 = -101 (0xffffff9b);;
     _32(0x6010ff69),        //make $r4 = -151 (0xffffff69);;
     _32(0x7a0c0000),        //copyw $r3 = $r0;;
     _32(0x7a000008),        //copyw $r0 = $r8;;
     _32(0x1ffffdb2),        //call 16820 <verify>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x180000b4),        //call 17430 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let __udivdi3: list_I = 
 [|
     _32(0x88800641),        //cb.deqz $r1? 171cc <__udivdi3+0x64>
     _32(0x760da040),        //compd.ltu $r3 = $r0, $r1;;
     _32(0xea080000),        //copyd $r2 = $r0
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x08000503),        //cb.dnez $r3? 171c8 <__udivdi3+0x60>;;
     _32(0xf00e2001),        //clzd $r3 = $r1
     _32(0x70122002),        //clzd $r4 = $r2;;
     _32(0x751110c4),        //sbfw $r4 = $r4, $r3;;
     _32(0x79066101),        //slld $r1 = $r1, $r4;;
     _32(0x760da042),        //compd.ltu $r3 = $r2, $r1;;
     _32(0x08000103),        //cb.dnez $r3? 171a0 <__udivdi3+0x38>;;
     _32(0xe0000001),        //make $r0 = 1 (0x1)
     _32(0x75090081),        //sbfd $r2 = $r1, $r2;;
     _32(0x79026100),        //slld $r0 = $r0, $r4;;
     _32(0x0e000284),        //cb.wlez $r4? 171c8 <__udivdi3+0x60>;;
     _32(0xe0140001),        //make $r5 = 1 (0x1)
     _32(0xfa0c0004),        //copyw $r3 = $r4
     _32(0x7b062041),        //srld $r1 = $r1, 1 (0x1);;
     _32(0x79126105),        //slld $r4 = $r5, $r4;;
     _32(0x6110ffc4),        //addd $r4 = $r4, -1 (0xffffffff);;
     _32(0x0f000083),        //loopdo $r3, 171c0 <__udivdi3+0x58>;;
     _32(0x70090081),        //stsud $r2 = $r1, $r2;;
     _32(0x78090084),        //andd $r2 = $r4, $r2;;
     _32(0x71010080),        //addd $r0 = $r0, $r2;;
     _32(0x0fd00000),        //ret ;;
     _96(0x800000a4e0000000f0047100),        //pcrel $r1 = 168388 (0x291c4)
     _32(0x00000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000b8040201),        //ld $r1 = 8 (0x8)[$r1];;
     _32(0x087ffe41),        //cb.dnez $r1? 171c8 <__udivdi3+0x60>;;
     _32(0x00000000),        //errop ;;
     _32(0x7f03f000)        //nop ;;
 |];

let __umoddi3: list_I = 
 [|
     _32(0x888004c1),        //cb.deqz $r1? 1723c <__umoddi3+0x4c>
     _32(0x760da040),        //compd.ltu $r3 = $r0, $r1;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x080003c3),        //cb.dnez $r3? 17238 <__umoddi3+0x48>;;
     _32(0xf0022000),        //clzd $r0 = $r0
     _32(0x700e2001),        //clzd $r3 = $r1;;
     _32(0x750d10c0),        //sbfw $r3 = $r0, $r3;;
     _32(0x790660c1),        //slld $r1 = $r1, $r3;;
     _32(0xf611a042),        //compd.ltu $r4 = $r2, $r1
     _32(0xf5010081),        //sbfd $r0 = $r1, $r2
     _32(0x7b062041),        //srld $r1 = $r1, 1 (0x1);;
     _32(0x710a0004),        //cmoved.deqz $r4? $r2 = $r0;;
     _32(0x8e000183),        //cb.wlez $r3? 17238 <__umoddi3+0x48>
     _32(0x6a000002),        //copyd $r0 = $r2;;
     _32(0x7a000003),        //copyw $r0 = $r3;;
     _32(0x0f000080),        //loopdo $r0, 17234 <__umoddi3+0x44>;;
     _32(0x70090081),        //stsud $r2 = $r1, $r2;;
     _32(0x7b0260c2),        //srld $r0 = $r2, $r3;;
     _32(0x0fd00000),        //ret ;;
     _96(0x800000a4e0000000f0045500),        //pcrel $r1 = 168276 (0x29154)
     _32(0x00000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000b8040201),        //ld $r1 = 8 (0x8)[$r1];;
     _32(0x087ffe41),        //cb.dnez $r1? 17238 <__umoddi3+0x48>;;
     _32(0x00000000),        //errop ;;
     _32(0x7f03f000)        //nop ;;
 |];

let __udivmoddi4: list_I = 
 [|
     _32(0x88800801),        //cb.deqz $r1? 172e0 <__udivmoddi4+0x80>
     _32(0xf0162001),        //clzd $r5 = $r1
     _32(0x6a0c0000),        //copyd $r3 = $r0;;
     _32(0xf0122003),        //clzd $r4 = $r3
     _32(0x7601a040),        //compd.ltu $r0 = $r0, $r1;;
     _32(0x75111144),        //sbfw $r4 = $r4, $r5;;
     _32(0x88000580),        //cb.dnez $r0? 172d0 <__udivmoddi4+0x70>
     _32(0x79166101),        //slld $r5 = $r1, $r4;;
     _32(0xf605a143),        //compd.ltu $r1 = $r3, $r5
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x08000101),        //cb.dnez $r1? 17298 <__udivmoddi4+0x38>;;
     _32(0xe0000001),        //make $r0 = 1 (0x1)
     _32(0x750d00c5),        //sbfd $r3 = $r5, $r3;;
     _32(0x79026100),        //slld $r0 = $r0, $r4;;
     _32(0x8e000304),        //cb.wlez $r4? 172c8 <__udivmoddi4+0x68>
     _32(0xe0180001),        //make $r6 = 1 (0x1)
     _32(0x6a040003),        //copyd $r1 = $r3;;
     _32(0xf91a6106),        //slld $r6 = $r6, $r4
     _32(0xfb162045),        //srld $r5 = $r5, 1 (0x1)
     _32(0x7a040004),        //copyw $r1 = $r4;;
     _32(0x6118ffc6),        //addd $r6 = $r6, -1 (0xffffffff);;
     _32(0x0f000081),        //loopdo $r1, 172bc <__udivmoddi4+0x5c>;;
     _32(0x700d00c5),        //stsud $r3 = $r5, $r3;;
     _32(0xf81500c6),        //andd $r5 = $r6, $r3
     _32(0x7b066103),        //srld $r1 = $r3, $r4;;
     _32(0x71010140),        //addd $r0 = $r0, $r5;;
     _32(0x8fd00000),        //ret 
     _32(0x27050002),        //sd 0 (0x0)[$r2] = $r1;;
     _32(0xea040003),        //copyd $r1 = $r3
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x8fd00000),        //ret 
     _32(0x27050002),        //sd 0 (0x0)[$r2] = $r1;;
     _96(0x800000a4e0000000f00c2c00),        //pcrel $r3 = 168112 (0x290b0)
     _32(0x00000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000b80c0203),        //ld $r3 = 8 (0x8)[$r3];;
     _32(0x087ffd03),        //cb.dnez $r3? 172c8 <__udivmoddi4+0x68>;;
     _32(0x00000000)        //errop ;;
 |];

let __divdi3: list_I = 
 [|
     _32(0x88800781),        //cb.deqz $r1? 17378 <__divdi3+0x78>
     _32(0xe40c0000),        //absd $r3 = $r0
     _32(0xe4100001),        //absd $r4 = $r1
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0xf01a2003),        //clzd $r6 = $r3
     _32(0xf615a103),        //compd.ltu $r5 = $r3, $r4
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x080004c5),        //cb.dnez $r5? 17368 <__divdi3+0x68>;;
     _32(0x70162004),        //clzd $r5 = $r4;;
     _32(0x75191146),        //sbfw $r6 = $r6, $r5;;
     _32(0x79126184),        //slld $r4 = $r4, $r6;;
     _32(0x7615a103),        //compd.ltu $r5 = $r3, $r4;;
     _32(0x08000105),        //cb.dnez $r5? 17340 <__divdi3+0x40>;;
     _32(0xe0000001),        //make $r0 = 1 (0x1)
     _32(0x750d00c4),        //sbfd $r3 = $r4, $r3;;
     _32(0x79026180),        //slld $r0 = $r0, $r6;;
     _32(0x0e000286),        //cb.wlez $r6? 17368 <__divdi3+0x68>;;
     _32(0xe01c0001),        //make $r7 = 1 (0x1)
     _32(0xfa140006),        //copyw $r5 = $r6
     _32(0x7b122044),        //srld $r4 = $r4, 1 (0x1);;
     _32(0x791a6187),        //slld $r6 = $r7, $r6;;
     _32(0x6118ffc6),        //addd $r6 = $r6, -1 (0xffffffff);;
     _32(0x0f000085),        //loopdo $r5, 17360 <__divdi3+0x60>;;
     _32(0x700d00c4),        //stsud $r3 = $r4, $r3;;
     _32(0x780d00c6),        //andd $r3 = $r6, $r3;;
     _32(0x710100c0),        //addd $r0 = $r0, $r3;;
     _32(0xfc090042),        //xord $r2 = $r2, $r1
     _32(0x65040000),        //negd $r1 = $r0;;
     _32(0x8fd00000),        //ret 
     _32(0x72020042),        //cmoved.dltz $r2? $r0 = $r1;;
     _96(0x800000a4e0000000f00c0600),        //pcrel $r3 = 167960 (0x29018)
     _32(0x00000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000b80c0203),        //ld $r3 = 8 (0x8)[$r3];;
     _32(0x087ffd83),        //cb.dnez $r3? 17368 <__divdi3+0x68>;;
     _32(0x00000000)        //errop ;;
 |];

let __moddi3: list_I = 
 [|
     _32(0x88800581),        //cb.deqz $r1? 173f0 <__moddi3+0x58>
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0xe4000000),        //absd $r0 = $r0
     _32(0x64040001),        //absd $r1 = $r1;;
     _32(0xf0122001),        //clzd $r4 = $r1
     _32(0x760da040),        //compd.ltu $r3 = $r0, $r1;;
     _32(0x08000343),        //cb.dnez $r3? 173e4 <__moddi3+0x4c>;;
     _32(0x700e2000),        //clzd $r3 = $r0;;
     _32(0x75111103),        //sbfw $r4 = $r3, $r4;;
     _32(0x79066101),        //slld $r1 = $r1, $r4;;
     _32(0xf615a040),        //compd.ltu $r5 = $r0, $r1
     _32(0xf50d0001),        //sbfd $r3 = $r1, $r0
     _32(0x7b062041),        //srld $r1 = $r1, 1 (0x1);;
     _32(0x8e000184),        //cb.wlez $r4? 173e4 <__moddi3+0x4c>
     _32(0x710200c5),        //cmoved.deqz $r5? $r0 = $r3;;
     _32(0x7a0c0004),        //copyw $r3 = $r4;;
     _32(0x0f000083),        //loopdo $r3, 173e0 <__moddi3+0x48>;;
     _32(0x70010001),        //stsud $r0 = $r1, $r0;;
     _32(0x7b026100),        //srld $r0 = $r0, $r4;;
     _32(0x65040000),        //negd $r1 = $r0;;
     _32(0x8fd00000),        //ret 
     _32(0x72020042),        //cmoved.dltz $r2? $r0 = $r1;;
     _96(0x800000a3e0000000f004e800),        //pcrel $r1 = 167840 (0x28fa0)
     _32(0x00000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000b8040201),        //ld $r1 = 8 (0x8)[$r1];;
     _32(0x087ffdc1),        //cb.dnez $r1? 173e4 <__moddi3+0x4c>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 17830 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 19508 <_exit>
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
     _32(0x98000161),        //call 179c8 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x0000000080000100e000f000),        //make $r0 = 263104 (0x403c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 1746c <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 19508 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100010101000; //0x168a8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(verify, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__udivdi3, 0b00010111000101101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__umoddi3, 0b00010111000111110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__udivmoddi4, 0b00010111001001100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__divdi3, 0b00010111001100000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__moddi3, 0b00010111001110011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010111010000010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010111010000110000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000168a8;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
