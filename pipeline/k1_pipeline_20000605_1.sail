// executing pipeline 20000605_1.c.out.dumped test 
val k1_pipeline_20000605_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20000605_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let bar: list_I = 
 [|
     _32(0x7f03f000),        //nop ;;
     _32(0x0fd00000)        //ret ;;
 |];

let render_image_rgb_a: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x2701020c),        //sd 8 (0x8)[$r12] = $r0;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x60000100),        //make $r0 = 256 (0x100);;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _64(0x000fe000e0000000),        //make $r0 = 1065353216 (0x3f800000);;
     _32(0x1800004c),        //call 16990 <__divsf3>;;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x48030000),        //floatw.rn $r0 = $r0, 0 (0x0);;
     _32(0x3004040c),        //lwz $r1 = 16 (0x10)[$r12];;
     _32(0x5e027001),        //fmulw $r0 = $r1, $r0;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x4a033000),        //fixedw.rz $r0 = $r0, 0 (0x0);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x48070000),        //floatw.rn $r1 = $r0, 0 (0x0);;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x5d027040),        //fsbfw $r0 = $r0, $r1;;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x5d027040),        //fsbfw $r0 = $r0, $r1;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x1000001e),        //goto 16918 <render_image_rgb_a+0xf0>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x000fe000e0040000),        //make $r1 = 1065353216 (0x3f800000);;
     _32(0x76030040),        //fcompw.oge $r0 = $r0, $r1;;
     _32(0x08800480),        //cb.deqz $r0? 168fc <render_image_rgb_a+0xd4>;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x30040200),        //lwz $r1 = 8 (0x8)[$r0];;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x4a033000),        //fixedw.rz $r0 = $r0, 0 (0x0);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x26050200),        //sw 8 (0x8)[$r0] = $r1;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x4a033000),        //fixedw.rz $r0 = $r0, 0 (0x0);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x48030000),        //floatw.rn $r0 = $r0, 0 (0x0);;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x5d027040),        //fsbfw $r0 = $r0, $r1;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x1fffffca),        //call 16820 <bar>;;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x5c027001),        //faddw $r0 = $r1, $r0;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x3000050c),        //lwz $r0 = 20 (0x14)[$r12];;
     _32(0x7201b001),        //compw.lt $r0 = $r1, $r0;;
     _32(0x0c7ff800),        //cb.wnez $r0? 168a4 <render_image_rgb_a+0x7c>;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x30000200),        //lwz $r0 = 8 (0x8)[$r0];;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _64(0x000fe000e0000000),        //make $r0 = 1065353216 (0x3f800000);;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _32(0x1fffffaf),        //call 16828 <render_image_rgb_a>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000008f101b000),        //compw.eq $r0 = $r0, 256 (0x100);;
     _32(0x0c000080),        //cb.wnez $r0? 16984 <main+0x44>;;
     _32(0x180001a6),        //call 17018 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x180001ac),        //call 17038 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let __divsf3: list_I = 
 [|
     _32(0x0fc40111),        //get $r17 = $cs;;
     _32(0xe50fe5c0),        //extfz $r3 = $r0, 30 (0x1e), 23 (0x17)
     _32(0x6513f7c0),        //extfz $r4 = $r0, 31 (0x1f), 31 (0x1f);;
     _32(0xf80c3fc3),        //zxbd $r3 = $r3
     _32(0xf8143fc4),        //zxbd $r5 = $r4
     _32(0x68240044),        //andd $r9 = $r4, 1 (0x1);;
     _32(0xe50b6000),        //extfz $r2 = $r0, 22 (0x16), 0 (0x0)
     _64(0xe800ffc0f111b7c3),        //compw.eq $r4 = $r3, 255 (0xff)
     _64(0x10001fff88000007),        //andd $r0 = $r0, 8388607 (0x7fffff);;
     _32(0x08801c83),        //cb.deqz $r3? 16b84 <__divsf3+0x1f4>;;
     _32(0x0c002744),        //cb.wnez $r4? 16c34 <__divsf3+0x2a4>;;
     _32(0xf90230c2),        //sllw $r0 = $r2, 3 (0x3)
     _32(0xf10ce043),        //addw $r3 = $r3, -127 (0xffffff81)
     _32(0xe0100000),        //make $r4 = 0 (0x0)
     _32(0x60400000),        //make $r16 = 0 (0x0);;
     _32(0xe0180000),        //make $r6 = 0 (0x0)
     _64(0x08010000fa000000),        //orw $r0 = $r0, 67108864 (0x4000000);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0xe50be5c1),        //extfz $r2 = $r1, 30 (0x1e), 23 (0x17)
     _32(0x651ff7c1),        //extfz $r7 = $r1, 31 (0x1f), 31 (0x1f);;
     _32(0xe5236001),        //extfz $r8 = $r1, 22 (0x16), 0 (0x0)
     _32(0xf8083fc2),        //zxbd $r2 = $r2
     _64(0x10001fffe804ffc1),        //andd $r1 = $r1, 8388607 (0x7fffff);;
     _32(0x781c3fc7),        //zxbd $r7 = $r7;;
     _32(0x08801b82),        //cb.deqz $r2? 16bb8 <__divsf3+0x228>;;
     _64(0x00000007f129b7c2),        //compw.eq $r10 = $r2, 255 (0xff);;
     _32(0x0c00098a),        //cb.wnez $r10? 16aa4 <__divsf3+0x114>;;
     _32(0xf90630c8),        //sllw $r1 = $r8, 3 (0x3)
     _32(0xf108e042),        //addw $r2 = $r2, -127 (0xffffff81)
     _32(0x60800000),        //make $r32 = 0 (0x0);;
     _32(0xf50d10c2),        //sbfw $r3 = $r2, $r3
     _64(0x08010000fa040001),        //orw $r1 = $r1, 67108864 (0x4000000);;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _96(0xfc0911c5fa111120f03c0e00),        //pcrel $r15 = 56 (0x38)
     _32(0x80000000),        //orw $r4 = $r32, $r4
     _32(0x00000000),        //xorw $r2 = $r5, $r7;;
     _32(0xf810ffc4),        //zxwd $r4 = $r4
     _32(0x78283fc2),        //zxbd $r10 = $r2;;
     _96(0xb40af10fea20000af02c0700),        //pcrel $r11 = 28 (0x1c)
     _32(0x80000000),        //copyd $r8 = $r10
     _32(0x00000000),        //lws.xs $r2 = $r4[$r15];;
     _32(0x710902c2),        //addd $r2 = $r2, $r11;;
     _32(0x0fd80002),        //igoto $r2;;
     _32(0x000003d8),        //    invalid opcode    
     _32(0x000003bc),        //    invalid opcode    
     _32(0x00000264),        //    invalid opcode    
     _32(0x00000054),        //    invalid opcode    
     _32(0x00000264),        //    invalid opcode    
     _32(0x00000368),        //    invalid opcode    
     _32(0x00000264),        //    invalid opcode    
     _32(0x00000054),        //    invalid opcode    
     _32(0x00000384),        //    invalid opcode    
     _32(0x00000384),        //    invalid opcode    
     _32(0x00000368),        //    invalid opcode    
     _32(0x00000054),        //    invalid opcode    
     _32(0x00000064),        //    invalid opcode    
     _32(0x00000064),        //    invalid opcode    
     _32(0x00000064),        //    invalid opcode    
     _32(0x0000028c),        //    invalid opcode    
     _32(0x880020c1),        //cb.dnez $r1? 16cb0 <__divsf3+0x320>
     _32(0x710cc043),        //addw $r3 = $r3, -255 (0xffffff01);;
     _32(0x90000045),        //goto 16bc0 <__divsf3+0x230>
     _32(0x60800002),        //make $r32 = 2 (0x2);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0xf824ffc7),        //zxwd $r9 = $r7
     _32(0xea140007),        //copyd $r5 = $r7
     _32(0xea000001),        //copyd $r0 = $r1
     _32(0x6a400020),        //copyd $r16 = $r32;;
     _64(0x00000000f105b050),        //compw.eq $r1 = $r16, 1 (0x1);;
     _32(0x0c003401),        //cb.wnez $r1? 16e10 <__divsf3+0x480>;;
     _32(0x088001d0),        //cb.deqz $r16? 16af0 <__divsf3+0x160>;;
     _64(0xf141b0d0f105b090),        //compw.eq $r1 = $r16, 2 (0x2)
     _64(0x0800000080000000),        //compw.eq $r16 = $r16, 3 (0x3);;
     _32(0x0c0046c1),        //cb.wnez $r1? 16f54 <__divsf3+0x5c4>;;
     _32(0x0c002050),        //cb.wnez $r16? 16cf0 <__divsf3+0x360>;;
     _32(0xf1041fc3),        //addw $r1 = $r3, 127 (0x7f)
     _32(0x71081fc3),        //addw $r2 = $r3, 127 (0x7f);;
     _32(0x0e002281),        //cb.wlez $r1? 16d20 <__divsf3+0x390>;;
     _32(0x780401c0),        //andw $r1 = $r0, 7 (0x7);;
     _32(0x0c800501),        //cb.weqz $r1? 16b50 <__divsf3+0x1c0>;;
     _32(0xea200000),        //copyd $r8 = $r0
     _64(0xfa180806f8040011),        //andw $r1 = $r17, 3342336 (0x330000)
     _64(0x88000cc0e81c0011),        //orw $r6 = $r6, 8224 (0x2020)
     _64(0x18000cc090000008),        //andd $r7 = $r17, 3342336 (0x330000);;
     _64(0xf105b001f111b001),        //compw.eq $r4 = $r1, 1114112 (0x110000)
     _64(0x0801100080008800),        //compw.eq $r1 = $r1, 2228224 (0x220000);;
     _32(0x0c004a04),        //cb.wnez $r4? 16fd0 <__divsf3+0x640>;;
     _32(0x0c004741),        //cb.wnez $r1? 16fa8 <__divsf3+0x618>;;
     _32(0xf81003c0),        //andw $r4 = $r0, 15 (0xf)
     _32(0x71040100),        //addw $r1 = $r0, 4 (0x4);;
     _64(0x00000000f111b104),        //compw.eq $r4 = $r4, 4 (0x4);;
     _32(0x79220044),        //cmoved.weqz $r4? $r8 = $r1;;
     _32(0x71020207),        //cmoved.deqz $r7? $r0 = $r8;;
     _64(0x00020000f8040000),        //andw $r1 = $r0, 134217728 (0x8000000);;
     _32(0x0c800101),        //cb.weqz $r1? 16b68 <__divsf3+0x1d8>;;
     _32(0xf1082003),        //addw $r2 = $r3, 128 (0x80)
     _64(0x083dffffe800ffc0),        //andd $r0 = $r0, 4160749567 (0xf7ffffff);;
     _64(0x00000007f505b782),        //compw.gt $r1 = $r2, 254 (0xfe);;
     _32(0x0c0033c1),        //cb.wnez $r1? 16eac <__divsf3+0x51c>;;
     _32(0x90000059),        //goto 16cd8 <__divsf3+0x348>
     _32(0xe50f90c0),        //extfz $r3 = $r0, 25 (0x19), 3 (0x3)
     _32(0xf8043fc2),        //zxbd $r1 = $r2
     _32(0x791a2806),        //slld $r6 = $r6, 32 (0x20);;
     _32(0x08001080),        //cb.dnez $r0? 16c8c <__divsf3+0x2fc>;;
     _32(0xe50be5c1),        //extfz $r2 = $r1, 30 (0x1e), 23 (0x17)
     _32(0xe51ff7c1),        //extfz $r7 = $r1, 31 (0x1f), 31 (0x1f)
     _32(0xe0100004),        //make $r4 = 4 (0x4)
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0xe5236001),        //extfz $r8 = $r1, 22 (0x16), 0 (0x0)
     _32(0xf8083fc2),        //zxbd $r2 = $r2
     _32(0xe0400001),        //make $r16 = 1 (0x1)
     _32(0x60180000),        //make $r6 = 0 (0x0);;
     _32(0xf81c3fc7),        //zxbd $r7 = $r7
     _64(0x08001fffe804ffc1),        //andd $r1 = $r1, 8388607 (0x7fffff);;
     _32(0x087fe502),        //cb.dnez $r2? 16a04 <__divsf3+0x74>;;
     _32(0x08000941),        //cb.dnez $r1? 16c4c <__divsf3+0x2bc>;;
     _32(0x60800001),        //make $r32 = 1 (0x1);;
     _96(0xfc2911c5fa111120f0040d00),        //pcrel $r1 = 52 (0x34)
     _32(0x80000000),        //orw $r4 = $r32, $r4
     _32(0x00000000),        //xorw $r10 = $r5, $r7;;
     _96(0x80000000f810ffc4f0080800),        //pcrel $r2 = 32 (0x20)
     _32(0x00000000),        //zxwd $r4 = $r4;;
     _32(0xf8283fca),        //zxbd $r10 = $r10
     _32(0x3406f101),        //lws.xs $r1 = $r4[$r1];;
     _32(0x71050081),        //addd $r1 = $r1, $r2;;
     _32(0x0fd80001),        //igoto $r1;;
     _32(0x0000022c),        //    invalid opcode    
     _32(0x0000022c),        //    invalid opcode    
     _32(0x000000d4),        //    invalid opcode    
     _32(0xfffffec0),        //    invalid opcode    
     _32(0x000000d4),        //    invalid opcode    
     _32(0x000001d8),        //    invalid opcode    
     _32(0x000000d4),        //    invalid opcode    
     _32(0xfffffec0),        //    invalid opcode    
     _32(0x000001f4),        //    invalid opcode    
     _32(0x000001f4),        //    invalid opcode    
     _32(0x000001d8),        //    invalid opcode    
     _32(0xfffffec0),        //    invalid opcode    
     _32(0xfffffed4),        //    invalid opcode    
     _32(0xfffffed4),        //    invalid opcode    
     _32(0xfffffed4),        //    invalid opcode    
     _32(0x000000fc),        //    invalid opcode    
     _32(0x08000380),        //cb.dnez $r0? 16c6c <__divsf3+0x2dc>;;
     _32(0x97ffff6b),        //goto 169e4 <__divsf3+0x54>
     _32(0xe0100008),        //make $r4 = 8 (0x8)
     _32(0xe00c00ff),        //make $r3 = 255 (0xff)
     _32(0xe0400002),        //make $r16 = 2 (0x2)
     _32(0x60180000),        //make $r6 = 0 (0x0);;
     _32(0xf00a3008),        //clzw $r2 = $r8
     _32(0x60800000),        //make $r32 = 0 (0x0);;
     _32(0xf104fec2),        //addw $r1 = $r2, -5 (0xfffffffb)
     _32(0x7508e282),        //sbfw $r2 = $r2, -118 (0xffffff8a);;
     _32(0xf9067048),        //sllw $r1 = $r8, $r1
     _32(0x750d10c2),        //sbfw $r3 = $r2, $r3;;
     _32(0x97ffff72),        //goto 16a2c <__divsf3+0x9c>
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0xe0180202),        //make $r6 = 514 (0x202)
     _32(0xe010000c),        //make $r4 = 12 (0xc)
     _32(0xe00c00ff),        //make $r3 = 255 (0xff)
     _64(0x18001000f8080002),        //andw $r2 = $r2, 4194304 (0x400000);;
     _32(0x97ffff59),        //goto 169e4 <__divsf3+0x54>
     _32(0xe81a0002),        //cmoved.wnez $r2? $r6 = 0 (0x0)
     _32(0x60400003),        //make $r16 = 3 (0x3);;
     _32(0xf00e3002),        //clzw $r3 = $r2
     _32(0xe0100000),        //make $r4 = 0 (0x0)
     _32(0xe0400000),        //make $r16 = 0 (0x0)
     _32(0x60180000),        //make $r6 = 0 (0x0);;
     _32(0xf100fec3),        //addw $r0 = $r3, -5 (0xfffffffb)
     _32(0x750ce283),        //sbfw $r3 = $r3, -118 (0xffffff8a);;
     _32(0x79027002),        //sllw $r0 = $r2, $r0;;
     _32(0x97ffff4f),        //goto 169e4 <__divsf3+0x54>
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0xe0080202),        //make $r2 = 514 (0x202)
     _32(0xe0800003),        //make $r32 = 3 (0x3)
     _64(0x10001000f8200008),        //andw $r8 = $r8, 4194304 (0x400000);;
     _32(0x97ffff5b),        //goto 16a2c <__divsf3+0x9c>
     _32(0x791a0088),        //cmoved.weqz $r8? $r6 = $r2;;
     _32(0xf91a2806),        //slld $r6 = $r6, 32 (0x20)
     _32(0xea14000a),        //copyd $r5 = $r10
     _32(0xe0040000),        //make $r1 = 0 (0x0)
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0xf90235c1),        //sllw $r0 = $r1, 23 (0x17)
     _32(0x791637c5),        //sllw $r5 = $r5, 31 (0x1f);;
     _32(0x7a0110c0),        //orw $r0 = $r0, $r3;;
     _32(0x7a011140),        //orw $r0 = $r0, $r5;;
     _32(0x0fb80106),        //wfxl $cs, $r6;;
     _32(0x0fd00000),        //ret ;;
     _32(0xf91a2806),        //slld $r6 = $r6, 32 (0x20)
     _32(0xe00400ff),        //make $r1 = 255 (0xff)
     _64(0x10001000fa000000),        //orw $r0 = $r0, 4194304 (0x400000);;
     _64(0x00001fffe80cffc0),        //andd $r3 = $r0, 8388607 (0x7fffff);;
     _32(0xf90235c1),        //sllw $r0 = $r1, 23 (0x17)
     _32(0x791637c5),        //sllw $r5 = $r5, 31 (0x1f);;
     _32(0x7a0110c0),        //orw $r0 = $r0, $r3;;
     _32(0x7a011140),        //orw $r0 = $r0, $r5;;
     _32(0x0fb80106),        //wfxl $cs, $r6;;
     _32(0x0fd00000),        //ret ;;
     _32(0x75040041),        //sbfw $r1 = $r1, 1 (0x1);;
     _64(0x00000000f509b6c1),        //compw.gt $r2 = $r1, 27 (0x1b);;
     _32(0x0c001e42),        //cb.wnez $r2? 16f10 <__divsf3+0x580>;;
     _32(0xf10c2783),        //addw $r3 = $r3, 158 (0x9e)
     _32(0x7b0a7040),        //srlw $r2 = $r0, $r1;;
     _32(0x790270c0),        //sllw $r0 = $r0, $r3;;
     _64(0x00000000f001b000),        //compw.ne $r0 = $r0, 0 (0x0);;
     _32(0xfa051002),        //orw $r1 = $r2, $r0
     _32(0x7a011002),        //orw $r0 = $r2, $r0;;
     _32(0x780801c1),        //andw $r2 = $r1, 7 (0x7);;
     _32(0x0c802142),        //cb.weqz $r2? 16f64 <__divsf3+0x5d4>;;
     _64(0xfa180806f8080011),        //andw $r2 = $r17, 3342336 (0x330000)
     _64(0x80000cc0e8440011),        //orw $r6 = $r6, 8224 (0x2020)
     _64(0x10000cc088000008),        //andd $r17 = $r17, 3342336 (0x330000);;
     _64(0xf109b002f10db002),        //compw.eq $r3 = $r2, 1114112 (0x110000)
     _64(0x0801100080008800),        //compw.eq $r2 = $r2, 2228224 (0x220000);;
     _32(0x0c0027c3),        //cb.wnez $r3? 16ff8 <__divsf3+0x668>;;
     _32(0x0c0026c2),        //cb.wnez $r2? 16fec <__divsf3+0x65c>;;
     _32(0xf80803c1),        //andw $r2 = $r1, 15 (0xf)
     _32(0xea0c0000),        //copyd $r3 = $r0
     _32(0x71040101),        //addw $r1 = $r1, 4 (0x4);;
     _64(0x00000000f109b102),        //compw.eq $r2 = $r2, 4 (0x4);;
     _32(0x790e0042),        //cmoved.weqz $r2? $r3 = $r1;;
     _32(0x710200d1),        //cmoved.deqz $r17? $r0 = $r3;;
     _64(0x00010000f8040000),        //andw $r1 = $r0, 67108864 (0x4000000);;
     _32(0x0c8025c1),        //cb.weqz $r1? 17004 <__divsf3+0x674>;;
     _32(0xe0040001),        //make $r1 = 1 (0x1)
     _32(0xe00c0000),        //make $r3 = 0 (0x0)
     _64(0x10000008fa180806),        //orw $r6 = $r6, 8224 (0x2020);;
     _64(0x00000004fa180406),        //orw $r6 = $r6, 4112 (0x1010);;
     _32(0x97ffffc5),        //goto 16cd8 <__divsf3+0x348>
     _32(0x791a2806),        //slld $r6 = $r6, 32 (0x20);;
     _32(0x97ffffcf),        //goto 16d08 <__divsf3+0x378>
     _32(0xe0140001),        //make $r5 = 1 (0x1)
     _32(0xe00400ff),        //make $r1 = 255 (0xff)
     _64(0xe00c0000e0180010),        //make $r6 = 2207613190144 (0x20200000000)
     _64(0x1800100090800000),        //make $r3 = 4194304 (0x400000);;
     _32(0xe00400ff),        //make $r1 = 255 (0xff)
     _32(0xea14000a),        //copyd $r5 = $r10
     _32(0xe00c0000),        //make $r3 = 0 (0x0)
     _32(0x791a2806),        //slld $r6 = $r6, 32 (0x20);;
     _32(0xf90235c1),        //sllw $r0 = $r1, 23 (0x17)
     _32(0x791637c5),        //sllw $r5 = $r5, 31 (0x1f);;
     _32(0x7a0110c0),        //orw $r0 = $r0, $r3;;
     _32(0x7a011140),        //orw $r0 = $r0, $r5;;
     _32(0x0fb80106),        //wfxl $cs, $r6;;
     _32(0x0fd00000),        //ret ;;
     _32(0x97ffffb2),        //goto 16cd8 <__divsf3+0x348>
     _32(0xf91a2806),        //slld $r6 = $r6, 32 (0x20)
     _32(0xe0040000),        //make $r1 = 0 (0x0)
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0xea14000a),        //copyd $r5 = $r10
     _32(0xe00400ff),        //make $r1 = 255 (0xff)
     _32(0xe00c0000),        //make $r3 = 0 (0x0)
     _64(0x18000001fa180106),        //orw $r6 = $r6, 1028 (0x404);;
     _32(0x97ffffa9),        //goto 16cd8 <__divsf3+0x348>
     _32(0x791a2806),        //slld $r6 = $r6, 32 (0x20);;
     _32(0xf90a3140),        //sllw $r2 = $r0, 5 (0x5)
     _32(0xf9063141),        //sllw $r1 = $r1, 5 (0x5)
     _32(0x6014001b),        //make $r5 = 27 (0x1b);;
     _32(0xf611b042),        //compw.ltu $r4 = $r2, $r1
     _32(0xf81cffc1),        //zxwd $r7 = $r1
     _32(0x7800ffc2),        //zxwd $r0 = $r2;;
     _32(0x0c800a84),        //cb.weqz $r4? 16efc <__divsf3+0x56c>;;
     _32(0xf10cffc3),        //addw $r3 = $r3, -1 (0xffffffff)
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x0f000285),        //loopdo $r5, 16e88 <__divsf3+0x4f8>;;
     _32(0xf9063040),        //sllw $r1 = $r0, 1 (0x1)
     _32(0xf9123042),        //sllw $r4 = $r2, 1 (0x1)
     _32(0x7b0237c0),        //srlw $r0 = $r0, 31 (0x1f);;
     _32(0xf809b047),        //compw.leu $r2 = $r7, $r1
     _32(0x75251047),        //sbfw $r9 = $r7, $r1;;
     _32(0x7a011002),        //orw $r0 = $r2, $r0;;
     _32(0xf8060240),        //cmoved.wnez $r0? $r1 = $r9
     _32(0x7a091004),        //orw $r2 = $r4, $r0;;
     _32(0x7800ffc1),        //zxwd $r0 = $r1;;
     _32(0xea14000a),        //copyd $r5 = $r10
     _32(0xea240008),        //copyd $r9 = $r8
     _64(0x10000000f005b000),        //compw.ne $r1 = $r0, 0 (0x0);;
     _32(0xfa011081),        //orw $r0 = $r1, $r2
     _32(0xf1041fc3),        //addw $r1 = $r3, 127 (0x7f)
     _32(0x71081fc3),        //addw $r2 = $r3, 127 (0x7f);;
     _32(0x0effc581),        //cb.wgtz $r1? 16afc <__divsf3+0x16c>;;
     _32(0x17ffff9e),        //goto 16d20 <__divsf3+0x390>;;
     _32(0xe00c0000),        //make $r3 = 0 (0x0)
     _64(0xe8440011f8000011),        //andw $r0 = $r17, 3342336 (0x330000)
     _64(0x10000cc088000cc0),        //andd $r17 = $r17, 3342336 (0x330000);;
     _64(0xf101b000f105b000),        //compw.eq $r1 = $r0, 1114112 (0x110000)
     _64(0x0801100080008800),        //compw.eq $r0 = $r0, 2228224 (0x220000);;
     _32(0x0c000e41),        //cb.wnez $r1? 16fb4 <__divsf3+0x624>;;
     _32(0x8c000bc0),        //cb.wnez $r0? 16f90 <__divsf3+0x600>
     _32(0x600400ff),        //make $r1 = 255 (0xff);;
     _32(0xe0063f91),        //cmoved.dnez $r17? $r1 = 254 (0xfe)
     _64(0x08001fffe000ffc0),        //make $r0 = 8388607 (0x7fffff);;
     _32(0x700e0011),        //cmoved.dnez $r17? $r3 = $r0;;
     _64(0x0000000afa180a06),        //orw $r6 = $r6, 10280 (0x2828);;
     _32(0x97ffff79),        //goto 16cd8 <__divsf3+0x348>
     _32(0x791a2806),        //slld $r6 = $r6, 32 (0x20);;
     _32(0xf5051081),        //sbfw $r1 = $r1, $r2
     _32(0xe014001a),        //make $r5 = 26 (0x1a)
     _32(0x60080001),        //make $r2 = 1 (0x1);;
     _32(0x97ffffd6),        //goto 16e60 <__divsf3+0x4d0>
     _32(0x7800ffc1),        //zxwd $r0 = $r1;;
     _32(0x88800300),        //cb.deqz $r0? 16f40 <__divsf3+0x5b0>
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _64(0xfa180806f8440011),        //andw $r17 = $r17, 3342336 (0x330000)
     _64(0x0800000880000cc0),        //orw $r6 = $r6, 8224 (0x2020);;
     _64(0xf145b011f101b011),        //compw.eq $r0 = $r17, 1114112 (0x110000)
     _64(0x0801100080008800),        //compw.eq $r17 = $r17, 2228224 (0x220000);;
     _32(0x780e0251),        //cmoved.wnez $r17? $r3 = $r9;;
     _32(0x0c000a00),        //cb.wnez $r0? 16fdc <__divsf3+0x64c>;;
     _32(0xe0040000),        //make $r1 = 0 (0x0)
     _64(0x08000004fa180406),        //orw $r6 = $r6, 4112 (0x1010);;
     _32(0x97ffff63),        //goto 16cd8 <__divsf3+0x348>
     _32(0x791a2806),        //slld $r6 = $r6, 32 (0x20);;
     _32(0x97ffff61),        //goto 16cd8 <__divsf3+0x348>
     _32(0xf91a2806),        //slld $r6 = $r6, 32 (0x20)
     _32(0xe00400ff),        //make $r1 = 255 (0xff)
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _64(0xf8080806f8000001),        //andw $r0 = $r1, 67108864 (0x4000000)
     _64(0x0800000880010000),        //andw $r2 = $r6, 8224 (0x2020);;
     _32(0x0c7fe380),        //cb.wnez $r0? 16dac <__divsf3+0x41c>;;
     _32(0xe50390c1),        //extfz $r0 = $r1, 25 (0x19), 3 (0x3)
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x8c000902),        //cb.wnez $r2? 17010 <__divsf3+0x680>
     _32(0x780cffc0),        //zxwd $r3 = $r0;;
     _32(0x97ffff54),        //goto 16cd8 <__divsf3+0x348>
     _32(0x791a2806),        //slld $r6 = $r6, 32 (0x20);;
     _32(0xe1063f89),        //cmoved.deqz $r9? $r1 = 254 (0xfe)
     _32(0xe00c0000),        //make $r3 = 0 (0x0)
     _64(0x10001fffe000ffc0),        //make $r0 = 8388607 (0x7fffff);;
     _32(0x97ffffd3),        //goto 16eec <__divsf3+0x55c>
     _32(0x710e0009),        //cmoved.deqz $r9? $r3 = $r0;;
     _32(0x71040200),        //addw $r1 = $r0, 8 (0x8);;
     _32(0x97fffee9),        //goto 16b50 <__divsf3+0x1c0>
     _32(0x70020049),        //cmoved.dnez $r9? $r0 = $r1;;
     _32(0xe00400ff),        //make $r1 = 255 (0xff)
     _32(0xe00c0000),        //make $r3 = 0 (0x0)
     _64(0x10001fffe000ffc0),        //make $r0 = 8388607 (0x7fffff);;
     _32(0x97ffffca),        //goto 16eec <__divsf3+0x55c>
     _32(0xe0063f89),        //cmoved.dnez $r9? $r1 = 254 (0xfe)
     _32(0x700e0009),        //cmoved.dnez $r9? $r3 = $r0;;
     _32(0x71040200),        //addw $r1 = $r0, 8 (0x8);;
     _32(0x97fffedf),        //goto 16b50 <__divsf3+0x1c0>
     _32(0x71020049),        //cmoved.deqz $r9? $r0 = $r1;;
     _32(0x75000049),        //sbfw $r0 = $r9, 1 (0x1);;
     _32(0x97ffffd8),        //goto 16f40 <__divsf3+0x5b0>
     _64(0x00001fffe80cffc0),        //andd $r3 = $r0, 8388607 (0x7fffff);;
     _32(0x71040201),        //addw $r1 = $r1, 8 (0x8);;
     _32(0x97ffff6c),        //goto 16da0 <__divsf3+0x410>
     _32(0x70020049),        //cmoved.dnez $r9? $r0 = $r1;;
     _32(0x71040201),        //addw $r1 = $r1, 8 (0x8);;
     _32(0x97ffff69),        //goto 16da0 <__divsf3+0x410>
     _32(0x71020049),        //cmoved.deqz $r9? $r0 = $r1;;
     _32(0x97ffff6e),        //goto 16dbc <__divsf3+0x42c>
     _32(0xe50f90c0),        //extfz $r3 = $r0, 25 (0x19), 3 (0x3)
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x97ffff6b),        //goto 16dbc <__divsf3+0x42c>
     _32(0x60040000)        //make $r1 = 0 (0x0);;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 17438 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 19110 <_exit>
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
     _32(0x98000161),        //call 175d0 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x0000000080000100e000f000),        //make $r0 = 263104 (0x403c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 17074 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 19110 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100101000000; //0x16940
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(render_image_rgb_a, 0b00010110100000101000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100101000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__divsf3, 0b00010110100110010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010111000000011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010111000000111000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016940;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
