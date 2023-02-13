// executing pipeline fprintf_1.c.out.dumped test 
val k1_pipeline_fprintf_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_fprintf_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x6a0c0000),        //copyd $r3 = $r0;;
     _32(0x60080005),        //make $r2 = 5 (0x5);;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _96(0x0000000080000100e000f000),        //make $r0 = 263104 (0x403c0);;
     _32(0x18000202),        //call 17060 <fwrite>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _96(0x0000000080000100e004f000),        //make $r1 = 263104 (0x403c0);;
     _32(0x18000127),        //call 16d18 <fprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b140),        //compw.eq $r0 = $r0, 5 (0x5);;
     _32(0x0c000080),        //cb.wnez $r0? 16894 <main+0x74>;;
     _32(0x180000f2),        //call 16c58 <abort>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x6a0c0000),        //copyd $r3 = $r0;;
     _32(0x60080006),        //make $r2 = 6 (0x6);;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _96(0x0000000080000100e000f200),        //make $r0 = 263112 (0x403c8);;
     _32(0x180001e8),        //call 17060 <fwrite>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _96(0x0000000080000100e004f200),        //make $r1 = 263112 (0x403c8);;
     _32(0x1800010d),        //call 16d18 <fprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b180),        //compw.eq $r0 = $r0, 6 (0x6);;
     _32(0x0c000080),        //cb.wnez $r0? 168fc <main+0xdc>;;
     _32(0x180000d8),        //call 16c58 <abort>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x60000061),        //make $r0 = 97 (0x61);;
     _32(0x1800014a),        //call 16e40 <fputc>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _96(0x0000000080000100e004f400),        //make $r1 = 263120 (0x403d0);;
     _32(0x180000f7),        //call 16d18 <fprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16954 <main+0x134>;;
     _32(0x180000c2),        //call 16c58 <abort>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _96(0x0000000080000100e004f600),        //make $r1 = 263128 (0x403d8);;
     _32(0x180000e9),        //call 16d18 <fprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16984 <main+0x164>;;
     _32(0x180000b6),        //call 16c58 <abort>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x6a0c0000),        //copyd $r3 = $r0;;
     _32(0x60080005),        //make $r2 = 5 (0x5);;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _96(0x0000000080000100e000f000),        //make $r0 = 263104 (0x403c0);;
     _32(0x180001ac),        //call 17060 <fwrite>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _96(0x0000000080000100e008f000),        //make $r2 = 263104 (0x403c0);;
     _96(0x0000000080000100e004f800),        //make $r1 = 263136 (0x403e0);;
     _32(0x180000ce),        //call 16d18 <fprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b140),        //compw.eq $r0 = $r0, 5 (0x5);;
     _32(0x0c000080),        //cb.wnez $r0? 169f8 <main+0x1d8>;;
     _32(0x18000099),        //call 16c58 <abort>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x6a0c0000),        //copyd $r3 = $r0;;
     _32(0x60080006),        //make $r2 = 6 (0x6);;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _96(0x0000000080000100e000f200),        //make $r0 = 263112 (0x403c8);;
     _32(0x1800018f),        //call 17060 <fwrite>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _96(0x0000000080000100e008f200),        //make $r2 = 263112 (0x403c8);;
     _96(0x0000000080000100e004f800),        //make $r1 = 263136 (0x403e0);;
     _32(0x180000b1),        //call 16d18 <fprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b180),        //compw.eq $r0 = $r0, 6 (0x6);;
     _32(0x0c000080),        //cb.wnez $r0? 16a6c <main+0x24c>;;
     _32(0x1800007c),        //call 16c58 <abort>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x60000061),        //make $r0 = 97 (0x61);;
     _32(0x180000ee),        //call 16e40 <fputc>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _96(0x0000000080000100e008f400),        //make $r2 = 263120 (0x403d0);;
     _96(0x0000000080000100e004f800),        //make $r1 = 263136 (0x403e0);;
     _32(0x18000098),        //call 16d18 <fprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16ad0 <main+0x2b0>;;
     _32(0x18000063),        //call 16c58 <abort>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _96(0x0000000080000100e008f600),        //make $r2 = 263128 (0x403d8);;
     _96(0x0000000080000100e004f800),        //make $r1 = 263136 (0x403e0);;
     _32(0x18000087),        //call 16d18 <fprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16b0c <main+0x2ec>;;
     _32(0x18000054),        //call 16c58 <abort>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x60000078),        //make $r0 = 120 (0x78);;
     _32(0x180000c6),        //call 16e40 <fputc>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x60080078),        //make $r2 = 120 (0x78);;
     _96(0x0000000080000100e004fa00),        //make $r1 = 263144 (0x403e8);;
     _32(0x18000072),        //call 16d18 <fprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16b68 <main+0x348>;;
     _32(0x1800003d),        //call 16c58 <abort>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _96(0x0000000080000100e008f200),        //make $r2 = 263112 (0x403c8);;
     _96(0x0000000080000100e004fc00),        //make $r1 = 263152 (0x403f0);;
     _32(0x18000061),        //call 16d18 <fprintf>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _96(0x0000000080000100e008f200),        //make $r2 = 263112 (0x403c8);;
     _96(0x0000000080000100e004fc00),        //make $r1 = 263152 (0x403f0);;
     _32(0x18000055),        //call 16d18 <fprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b1c0),        //compw.eq $r0 = $r0, 7 (0x7);;
     _32(0x0c000080),        //cb.wnez $r0? 16bdc <main+0x3bc>;;
     _32(0x18000020),        //call 16c58 <abort>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _96(0x0000000080000100e004fe00),        //make $r1 = 263160 (0x403f8);;
     _32(0x18000046),        //call 16d18 <fprintf>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _96(0x0000000080000100e004fe00),        //make $r1 = 263160 (0x403f8);;
     _32(0x1800003c),        //call 16d18 <fprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b080),        //compw.eq $r0 = $r0, 2 (0x2);;
     _32(0x0c000080),        //cb.wnez $r0? 16c40 <main+0x420>;;
     _32(0x18000007),        //call 16c58 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x9800030f),        //call 178a0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98002d17),        //call 220c8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let __libc_fini_array: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _96(0x800000dca749040ce0480000),        //make $r18 = 225280 (0x37000)
     _32(0x00000000),        //sd 16 (0x10)[$r12] = $r18;;
     _96(0x800000dca739020ce5380012),        //sbfd $r14 = $r18, 225280 (0x37000)
     _32(0x00000000),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0xfa3a20ce),        //srad $r14 = $r14, 3 (0x3)
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x0880014e),        //cb.deqz $r14? 16cbc <__libc_fini_array+0x44>;;
     _32(0x6138ffce),        //addd $r14 = $r14, -1 (0xffffffff);;
     _32(0x3802f392),        //ld.xs $r0 = $r14[$r18];;
     _32(0x0fdc0000),        //icall $r0;;
     _32(0x087fff4e),        //cb.dnez $r14? 16cac <__libc_fini_array+0x34>;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3848040c),        //ld $r18 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let _fprintf_r: list_I = 
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
     _32(0x9800034e),        //call 17a38 <_vfprintf_r>
     _32(0x273d060c),        //sd 24 (0x18)[$r12] = $r15;;
     _32(0xe130200c),        //addd $r12 = $r12, 128 (0x80)
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000)        //ret ;;
 |];

let fprintf: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0xe13c0c0c),        //addd $r15 = $r12, 48 (0x30)
     _32(0xea400000),        //copyd $r16 = $r0
     _96(0x900000fca741040ce0001000),        //make $r0 = 258112 (0x3f040)
     _32(0x10000000),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0xea080001),        //copyd $r2 = $r1
     _32(0xea0c000f),        //copyd $r3 = $r15
     _32(0xea040010),        //copyd $r1 = $r16
     _32(0x28090c0c),        //sq 48 (0x30)[$r12] = $r2r3;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x273d060c),        //sd 24 (0x18)[$r12] = $r15;;
     _32(0x2811100c),        //sq 64 (0x40)[$r12] = $r4r5;;
     _32(0x2819140c),        //sq 80 (0x50)[$r12] = $r6r7;;
     _32(0x2821180c),        //sq 96 (0x60)[$r12] = $r8r9;;
     _32(0x98000337),        //call 17a38 <_vfprintf_r>
     _32(0x28291c0c),        //sq 112 (0x70)[$r12] = $r10r11;;
     _32(0xe130200c),        //addd $r12 = $r12, 128 (0x80)
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let _fputc_r: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0xf84cffc1),        //zxwd $r19 = $r1
     _32(0xea480000),        //copyd $r18 = $r0
     _32(0x2849020c),        //sq 8 (0x8)[$r12] = $r18r19;;
     _32(0xea380002),        //copyd $r14 = $r2
     _32(0x2739000c),        //sd 0 (0x0)[$r12] = $r14;;
     _32(0x88800100),        //cb.deqz $r0? 16da4 <_fputc_r+0x2c>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x30041400),        //lwz $r1 = 80 (0x50)[$r0];;
     _32(0x0c800641),        //cb.weqz $r1? 16e04 <_fputc_r+0x8c>;;
     _32(0x3000420e),        //lwz $r0 = 264 (0x108)[$r14];;
     _32(0x0b000140),        //cb.odd $r0? 16dbc <_fputc_r+0x44>;;
     _32(0x2800040e),        //lhz $r0 = 16 (0x10)[$r14];;
     _64(0x00000000f8008000),        //andw $r0 = $r0, 512 (0x200);;
     _32(0x0c800780),        //cb.weqz $r0? 16e30 <_fputc_r+0xb8>;;
     _32(0x98000183),        //call 173c8 <_putc_r>
     _32(0xfa040013),        //copyw $r1 = $r19
     _32(0xea000012),        //copyd $r0 = $r18
     _32(0x6a08000e),        //copyd $r2 = $r14;;
     _32(0xfa480000),        //copyw $r18 = $r0
     _32(0x3004420e),        //lwz $r1 = 264 (0x108)[$r14];;
     _32(0x0b000141),        //cb.odd $r1? 16de8 <_fputc_r+0x70>;;
     _32(0x2800040e),        //lhz $r0 = 16 (0x10)[$r14];;
     _64(0x00000000f8008000),        //andw $r0 = $r0, 512 (0x200);;
     _32(0x0c800280),        //cb.weqz $r0? 16e0c <_fputc_r+0x94>;;
     _32(0xfa000012),        //copyw $r0 = $r18
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3c48020c),        //lq $r18r19 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0x180013dd),        //call 1bd78 <__sinit>;;
     _32(0x17ffffe7),        //goto 16da4 <_fputc_r+0x2c>;;
     _32(0x98000143),        //call 17318 <__libc_lock_release>
     _32(0x6100300e),        //addd $r0 = $r14, 192 (0xc0);;
     _32(0xfa000012),        //copyw $r0 = $r18
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3c48020c),        //lq $r18r19 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0x980000f6),        //call 17208 <__libc_lock_acquire>
     _32(0x6100300e),        //addd $r0 = $r14, 192 (0xc0);;
     _32(0x17ffffe1),        //goto 16dbc <_fputc_r+0x44>;;
     _32(0x7f03f000)        //nop ;;
 |];

let fputc: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _96(0x08000000880000fce0081000),        //make $r2 = 258112 (0x3f040);;
     _32(0xea380001),        //copyd $r14 = $r1
     _32(0x2739000c),        //sd 0 (0x0)[$r12] = $r14;;
     _32(0xf84cffc0),        //zxwd $r19 = $r0
     _32(0x2849020c),        //sq 8 (0x8)[$r12] = $r18r19;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x38480002),        //ld $r18 = 0 (0x0)[$r2];;
     _32(0x088000d2),        //cb.deqz $r18? 16e78 <fputc+0x38>;;
     _32(0x30001412),        //lwz $r0 = 80 (0x50)[$r18];;
     _32(0x0c800640),        //cb.weqz $r0? 16ed8 <fputc+0x98>;;
     _32(0x3000420e),        //lwz $r0 = 264 (0x108)[$r14];;
     _32(0x0b000140),        //cb.odd $r0? 16e90 <fputc+0x50>;;
     _32(0x2800040e),        //lhz $r0 = 16 (0x10)[$r14];;
     _64(0x00000000f8008000),        //andw $r0 = $r0, 512 (0x200);;
     _32(0x0c8007c0),        //cb.weqz $r0? 16f08 <fputc+0xc8>;;
     _32(0x9800014e),        //call 173c8 <_putc_r>
     _32(0xfa040013),        //copyw $r1 = $r19
     _32(0xea000012),        //copyd $r0 = $r18
     _32(0x6a08000e),        //copyd $r2 = $r14;;
     _32(0xfa480000),        //copyw $r18 = $r0
     _32(0x3004420e),        //lwz $r1 = 264 (0x108)[$r14];;
     _32(0x0b000141),        //cb.odd $r1? 16ebc <fputc+0x7c>;;
     _32(0x2800040e),        //lhz $r0 = 16 (0x10)[$r14];;
     _64(0x00000000f8008000),        //andw $r0 = $r0, 512 (0x200);;
     _32(0x0c8002c0),        //cb.weqz $r0? 16ee4 <fputc+0xa4>;;
     _32(0xfa000012),        //copyw $r0 = $r18
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3c48020c),        //lq $r18r19 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0x980013a8),        //call 1bd78 <__sinit>
     _32(0x6a000012),        //copyd $r0 = $r18;;
     _32(0x17ffffe6),        //goto 16e78 <fputc+0x38>;;
     _32(0x9800010d),        //call 17318 <__libc_lock_release>
     _32(0x6100300e),        //addd $r0 = $r14, 192 (0xc0);;
     _32(0xfa000012),        //copyw $r0 = $r18
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3c48020c),        //lq $r18r19 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0x980000c0),        //call 17208 <__libc_lock_acquire>
     _32(0x6100300e),        //addd $r0 = $r14, 192 (0xc0);;
     _32(0x17ffffe0),        //goto 16e90 <fputc+0x50>;;
     _32(0x00000000)        //errop ;;
 |];

let _fwrite_r: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0xea480003),        //copyd $r18 = $r3
     _32(0xe10c0e0c),        //addd $r3 = $r12, 56 (0x38)
     _32(0xea4c0000),        //copyd $r19 = $r0
     _32(0x2849040c),        //sq 16 (0x10)[$r12] = $r18r19;;
     _32(0xea500002),        //copyd $r20 = $r2
     _32(0xe0080001),        //make $r2 = 1 (0x1)
     _32(0x2851080c),        //sq 32 (0x20)[$r12] = $r20r21;;
     _32(0xea380004),        //copyd $r14 = $r4
     _32(0xd4541512),        //muld $r21 = $r18, $r20
     _32(0x2739020c),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0x27410c0c),        //sd 48 (0x30)[$r12] = $r16;;
     _32(0x27050e0c),        //sd 56 (0x38)[$r12] = $r1;;
     _32(0x270d120c),        //sd 72 (0x48)[$r12] = $r3;;
     _32(0x2609140c),        //sw 80 (0x50)[$r12] = $r2;;
     _32(0x2755100c),        //sd 64 (0x40)[$r12] = $r21;;
     _32(0x88800100),        //cb.deqz $r0? 16f6c <_fwrite_r+0x54>
     _32(0x2755160c),        //sd 88 (0x58)[$r12] = $r21;;
     _32(0x30041400),        //lwz $r1 = 80 (0x50)[$r0];;
     _32(0x0c800b41),        //cb.weqz $r1? 1701c <_fwrite_r+0x104>;;
     _32(0x3008420e),        //lwz $r2 = 264 (0x108)[$r14];;
     _32(0x2804040e),        //lhz $r1 = 16 (0x10)[$r14];;
     _32(0x8b000142),        //cb.odd $r2? 16f88 <_fwrite_r+0x70>
     _32(0x6403f001),        //zxhd $r0 = $r1;;
     _64(0x00000000f8088000),        //andw $r2 = $r0, 512 (0x200);;
     _32(0x0c800c42),        //cb.weqz $r2? 17048 <_fwrite_r+0x130>;;
     _64(0x00000008f8000000),        //andw $r0 = $r0, 8192 (0x2000);;
     _32(0x0c000200),        //cb.wnez $r0? 16fb0 <_fwrite_r+0x98>;;
     _64(0xb000420efa040001),        //orw $r1 = $r1, 8192 (0x2000)
     _32(0x00000008),        //lwz $r0 = 264 (0x108)[$r14];;
     _32(0x2505040e),        //sh 16 (0x10)[$r14] = $r1;;
     _64(0x07fffff7f800ffc0),        //andw $r0 = $r0, -8193 (0xffffffffffffdfff);;
     _32(0x2601420e),        //sw 264 (0x108)[$r14] = $r0;;
     _32(0x9800157c),        //call 1c5a0 <__sfvwrite_r>
     _32(0xe108120c),        //addd $r2 = $r12, 72 (0x48)
     _32(0xea04000e),        //copyd $r1 = $r14
     _32(0x6a000013),        //copyd $r0 = $r19;;
     _32(0x0c800640),        //cb.weqz $r0? 17024 <_fwrite_r+0x10c>;;
     _32(0x3000420e),        //lwz $r0 = 264 (0x108)[$r14];;
     _32(0x0b800380),        //cb.even $r0? 17000 <_fwrite_r+0xe8>;;
     _32(0xea040014),        //copyd $r1 = $r20
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x98003db5),        //call 266a8 <__udivdi3>
     _32(0x75010540),        //sbfd $r0 = $r0, $r21;;
     _32(0x6a480000),        //copyd $r18 = $r0;;
     _32(0xea000012),        //copyd $r0 = $r18
     _32(0x38400c0c),        //ld $r16 = 48 (0x30)[$r12];;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0x3c48040c),        //lq $r18r19 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x8fd00000),        //ret 
     _32(0xe130180c),        //addd $r12 = $r12, 96 (0x60)
     _32(0x3c50080c),        //lq $r20r21 = 32 (0x20)[$r12];;
     _32(0x2800040e),        //lhz $r0 = 16 (0x10)[$r14];;
     _64(0x00000000f8008000),        //andw $r0 = $r0, 512 (0x200);;
     _32(0x0c7ffc00),        //cb.wnez $r0? 16fcc <_fwrite_r+0xb4>;;
     _32(0x980000c2),        //call 17318 <__libc_lock_release>
     _32(0x6100300e),        //addd $r0 = $r14, 192 (0xc0);;
     _32(0x17ffffed),        //goto 16fcc <_fwrite_r+0xb4>;;
     _32(0x18001357),        //call 1bd78 <__sinit>;;
     _32(0x17ffffd3),        //goto 16f6c <_fwrite_r+0x54>;;
     _32(0x3000420e),        //lwz $r0 = 264 (0x108)[$r14];;
     _32(0x0b7ffb80),        //cb.odd $r0? 16fe0 <_fwrite_r+0xc8>;;
     _32(0x2800040e),        //lhz $r0 = 16 (0x10)[$r14];;
     _64(0x00000000f8008000),        //andw $r0 = $r0, 512 (0x200);;
     _32(0x0c7ffa80),        //cb.wnez $r0? 16fe0 <_fwrite_r+0xc8>;;
     _32(0x980000b7),        //call 17318 <__libc_lock_release>
     _32(0x6100300e),        //addd $r0 = $r14, 192 (0xc0);;
     _32(0x17ffffe7),        //goto 16fe0 <_fwrite_r+0xc8>;;
     _32(0x98000070),        //call 17208 <__libc_lock_acquire>
     _32(0x6100300e),        //addd $r0 = $r14, 192 (0xc0);;
     _32(0x2804040e),        //lhz $r1 = 16 (0x10)[$r14];;
     _32(0x97ffffcd),        //goto 16f88 <_fwrite_r+0x70>
     _32(0x6403f001),        //zxhd $r0 = $r1;;
     _32(0x7f03f000)        //nop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110110001011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__libc_fini_array, 0b00010110110001111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(_fprintf_r, 0b00010110110011011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fprintf, 0b00010110110100011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(_fputc_r, 0b00010110110101111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fputc, 0b00010110111001000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(_fwrite_r, 0b00010110111100011000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016820;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
