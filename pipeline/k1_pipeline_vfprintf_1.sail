// executing pipeline vfprintf_1.c.out.dumped test 
val k1_pipeline_vfprintf_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_vfprintf_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let inner: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x27050a0c),        //sd 40 (0x28)[$r12] = $r1;;
     _32(0x28090c0c),        //sq 48 (0x30)[$r12] = $r2r3;;
     _32(0x2811100c),        //sq 64 (0x40)[$r12] = $r4r5;;
     _32(0x2819140c),        //sq 80 (0x50)[$r12] = $r6r7;;
     _32(0x2821180c),        //sq 96 (0x60)[$r12] = $r8r9;;
     _32(0x28291c0c),        //sq 112 (0x70)[$r12] = $r10r11;;
     _32(0x2601020c),        //sw 8 (0x8)[$r12] = $r0;;
     _32(0x61000a0c),        //addd $r0 = $r12, 40 (0x28);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x61000a0c),        //addd $r0 = $r12, 40 (0x28);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _64(0x00000000f901b280),        //compw.gtu $r0 = $r0, 10 (0xa);;
     _32(0x0c004840),        //cb.wnez $r0? 16ce8 <inner+0x4c8>;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _96(0x0000000080000101e1000000),        //addd $r0 = $r0, 263168 (0x40400);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x0fd80000),        //igoto $r0;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x6a0c0000),        //copyd $r3 = $r0;;
     _32(0x60080005),        //make $r2 = 5 (0x5);;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _96(0x0000000080000100e000f000),        //make $r0 = 263104 (0x403c0);;
     _32(0x18000234),        //call 17180 <fwrite>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _96(0x0000000080000100e004f000),        //make $r1 = 263104 (0x403c0);;
     _32(0x18000dd3),        //call 1a028 <vfprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b140),        //compw.eq $r0 = $r0, 5 (0x5);;
     _32(0x0c004000),        //cb.wnez $r0? 16cec <inner+0x4cc>;;
     _32(0x1800014a),        //call 16e18 <abort>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x6a0c0000),        //copyd $r3 = $r0;;
     _32(0x60080006),        //make $r2 = 6 (0x6);;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _96(0x0000000080000100e000f200),        //make $r0 = 263112 (0x403c8);;
     _32(0x18000218),        //call 17180 <fwrite>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _96(0x0000000080000100e004f200),        //make $r1 = 263112 (0x403c8);;
     _32(0x18000db7),        //call 1a028 <vfprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b180),        //compw.eq $r0 = $r0, 6 (0x6);;
     _32(0x0c003980),        //cb.wnez $r0? 16cf4 <inner+0x4d4>;;
     _32(0x1800012e),        //call 16e18 <abort>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x60000061),        //make $r0 = 97 (0x61);;
     _32(0x18000178),        //call 16f60 <fputc>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _96(0x0000000080000100e004f400),        //make $r1 = 263120 (0x403d0);;
     _32(0x18000d9f),        //call 1a028 <vfprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c003400),        //cb.wnez $r0? 16cfc <inner+0x4dc>;;
     _32(0x18000116),        //call 16e18 <abort>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _96(0x0000000080000100e004f600),        //make $r1 = 263128 (0x403d8);;
     _32(0x18000d8f),        //call 1a028 <vfprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08803100),        //cb.deqz $r0? 16d04 <inner+0x4e4>;;
     _32(0x18000108),        //call 16e18 <abort>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _96(0x0000000080000100e004f800),        //make $r1 = 263136 (0x403e0);;
     _32(0x18000d81),        //call 1a028 <vfprintf>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _96(0x0000000080000100e004f800),        //make $r1 = 263136 (0x403e0);;
     _32(0x18000d76),        //call 1a028 <vfprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b140),        //compw.eq $r0 = $r0, 5 (0x5);;
     _32(0x0c002ac0),        //cb.wnez $r0? 16d0c <inner+0x4ec>;;
     _32(0x180000ed),        //call 16e18 <abort>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _96(0x0000000080000100e004f800),        //make $r1 = 263136 (0x403e0);;
     _32(0x18000d66),        //call 1a028 <vfprintf>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _96(0x0000000080000100e004f800),        //make $r1 = 263136 (0x403e0);;
     _32(0x18000d5b),        //call 1a028 <vfprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b180),        //compw.eq $r0 = $r0, 6 (0x6);;
     _32(0x0c002480),        //cb.wnez $r0? 16d14 <inner+0x4f4>;;
     _32(0x180000d2),        //call 16e18 <abort>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _96(0x0000000080000100e004f800),        //make $r1 = 263136 (0x403e0);;
     _32(0x18000d4b),        //call 1a028 <vfprintf>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _96(0x0000000080000100e004f800),        //make $r1 = 263136 (0x403e0);;
     _32(0x18000d40),        //call 1a028 <vfprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c001e40),        //cb.wnez $r0? 16d1c <inner+0x4fc>;;
     _32(0x180000b7),        //call 16e18 <abort>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _96(0x0000000080000100e004f800),        //make $r1 = 263136 (0x403e0);;
     _32(0x18000d30),        //call 1a028 <vfprintf>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _96(0x0000000080000100e004f800),        //make $r1 = 263136 (0x403e0);;
     _32(0x18000d25),        //call 1a028 <vfprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08801880),        //cb.deqz $r0? 16d24 <inner+0x504>;;
     _32(0x1800009e),        //call 16e18 <abort>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _96(0x0000000080000100e004fa00),        //make $r1 = 263144 (0x403e8);;
     _32(0x18000d17),        //call 1a028 <vfprintf>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _96(0x0000000080000100e004fa00),        //make $r1 = 263144 (0x403e8);;
     _32(0x18000d0c),        //call 1a028 <vfprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c001240),        //cb.wnez $r0? 16d2c <inner+0x50c>;;
     _32(0x18000083),        //call 16e18 <abort>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _96(0x0000000080000100e004fc00),        //make $r1 = 263152 (0x403f0);;
     _32(0x18000cfc),        //call 1a028 <vfprintf>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _96(0x0000000080000100e004fc00),        //make $r1 = 263152 (0x403f0);;
     _32(0x18000cf1),        //call 1a028 <vfprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b1c0),        //compw.eq $r0 = $r0, 7 (0x7);;
     _32(0x0c000c00),        //cb.wnez $r0? 16d34 <inner+0x514>;;
     _32(0x18000068),        //call 16e18 <abort>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _96(0x0000000080000100e004fe00),        //make $r1 = 263160 (0x403f8);;
     _32(0x18000ce1),        //call 1a028 <vfprintf>;;
     _96(0x00000000800000fce0001000),        //make $r0 = 258112 (0x3f040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _96(0x0000000080000100e004fe00),        //make $r1 = 263160 (0x403f8);;
     _32(0x18000cd6),        //call 1a028 <vfprintf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b080),        //compw.eq $r0 = $r0, 2 (0x2);;
     _32(0x0c0005c0),        //cb.wnez $r0? 16d3c <inner+0x51c>;;
     _32(0x1800004d),        //call 16e18 <abort>;;
     _32(0x1800004c),        //call 16e18 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x10000014),        //goto 16d40 <inner+0x520>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x10000012),        //goto 16d40 <inner+0x520>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x10000010),        //goto 16d40 <inner+0x520>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x1000000e),        //goto 16d40 <inner+0x520>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x1000000c),        //goto 16d40 <inner+0x520>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x1000000a),        //goto 16d40 <inner+0x520>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x10000008),        //goto 16d40 <inner+0x520>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x10000006),        //goto 16d40 <inner+0x520>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x10000004),        //goto 16d40 <inner+0x520>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x10000002),        //goto 16d40 <inner+0x520>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130200c),        //addd $r12 = $r12, 128 (0x80);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1ffffeae),        //call 16820 <inner>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1ffffeac),        //call 16820 <inner>;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x1ffffeaa),        //call 16820 <inner>;;
     _32(0x60000003),        //make $r0 = 3 (0x3);;
     _32(0x1ffffea8),        //call 16820 <inner>;;
     _96(0x0000000080000100e004f000),        //make $r1 = 263104 (0x403c0);;
     _32(0x60000004),        //make $r0 = 4 (0x4);;
     _32(0x1ffffea3),        //call 16820 <inner>;;
     _96(0x0000000080000100e004f200),        //make $r1 = 263112 (0x403c8);;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1ffffe9e),        //call 16820 <inner>;;
     _96(0x0000000080000100e004f400),        //make $r1 = 263120 (0x403d0);;
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x1ffffe99),        //call 16820 <inner>;;
     _96(0x0000000080000100e004f600),        //make $r1 = 263128 (0x403d8);;
     _32(0x60000007),        //make $r0 = 7 (0x7);;
     _32(0x1ffffe94),        //call 16820 <inner>;;
     _32(0x60040078),        //make $r1 = 120 (0x78);;
     _32(0x60000008),        //make $r0 = 8 (0x8);;
     _32(0x1ffffe91),        //call 16820 <inner>;;
     _96(0x0000000080000100e004f200),        //make $r1 = 263112 (0x403c8);;
     _32(0x60000009),        //make $r0 = 9 (0x9);;
     _32(0x1ffffe8c),        //call 16820 <inner>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x6000000a),        //make $r0 = 10 (0xa);;
     _32(0x1ffffe89),        //call 16820 <inner>;;
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
     _32(0x980002e7),        //call 179c0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98002cef),        //call 221e8 <_exit>
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
     _32(0x0880014e),        //cb.deqz $r14? 16e7c <__libc_fini_array+0x44>;;
     _32(0x6138ffce),        //addd $r14 = $r14, -1 (0xffffffff);;
     _32(0x3802f392),        //ld.xs $r0 = $r14[$r18];;
     _32(0x0fdc0000),        //icall $r0;;
     _32(0x087fff4e),        //cb.dnez $r14? 16e6c <__libc_fini_array+0x34>;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3848040c),        //ld $r18 = 16 (0x10)[$r12];;
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
     _32(0x88800100),        //cb.deqz $r0? 16ec4 <_fputc_r+0x2c>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x30041400),        //lwz $r1 = 80 (0x50)[$r0];;
     _32(0x0c800641),        //cb.weqz $r1? 16f24 <_fputc_r+0x8c>;;
     _32(0x3000420e),        //lwz $r0 = 264 (0x108)[$r14];;
     _32(0x0b000140),        //cb.odd $r0? 16edc <_fputc_r+0x44>;;
     _32(0x2800040e),        //lhz $r0 = 16 (0x10)[$r14];;
     _64(0x00000000f8008000),        //andw $r0 = $r0, 512 (0x200);;
     _32(0x0c800780),        //cb.weqz $r0? 16f50 <_fputc_r+0xb8>;;
     _32(0x98000183),        //call 174e8 <_putc_r>
     _32(0xfa040013),        //copyw $r1 = $r19
     _32(0xea000012),        //copyd $r0 = $r18
     _32(0x6a08000e),        //copyd $r2 = $r14;;
     _32(0xfa480000),        //copyw $r18 = $r0
     _32(0x3004420e),        //lwz $r1 = 264 (0x108)[$r14];;
     _32(0x0b000141),        //cb.odd $r1? 16f08 <_fputc_r+0x70>;;
     _32(0x2800040e),        //lhz $r0 = 16 (0x10)[$r14];;
     _64(0x00000000f8008000),        //andw $r0 = $r0, 512 (0x200);;
     _32(0x0c800280),        //cb.weqz $r0? 16f2c <_fputc_r+0x94>;;
     _32(0xfa000012),        //copyw $r0 = $r18
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3c48020c),        //lq $r18r19 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0x180013dd),        //call 1be98 <__sinit>;;
     _32(0x17ffffe7),        //goto 16ec4 <_fputc_r+0x2c>;;
     _32(0x98000143),        //call 17438 <__libc_lock_release>
     _32(0x6100300e),        //addd $r0 = $r14, 192 (0xc0);;
     _32(0xfa000012),        //copyw $r0 = $r18
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3c48020c),        //lq $r18r19 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0x980000f6),        //call 17328 <__libc_lock_acquire>
     _32(0x6100300e),        //addd $r0 = $r14, 192 (0xc0);;
     _32(0x17ffffe1),        //goto 16edc <_fputc_r+0x44>;;
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
     _32(0x088000d2),        //cb.deqz $r18? 16f98 <fputc+0x38>;;
     _32(0x30001412),        //lwz $r0 = 80 (0x50)[$r18];;
     _32(0x0c800640),        //cb.weqz $r0? 16ff8 <fputc+0x98>;;
     _32(0x3000420e),        //lwz $r0 = 264 (0x108)[$r14];;
     _32(0x0b000140),        //cb.odd $r0? 16fb0 <fputc+0x50>;;
     _32(0x2800040e),        //lhz $r0 = 16 (0x10)[$r14];;
     _64(0x00000000f8008000),        //andw $r0 = $r0, 512 (0x200);;
     _32(0x0c8007c0),        //cb.weqz $r0? 17028 <fputc+0xc8>;;
     _32(0x9800014e),        //call 174e8 <_putc_r>
     _32(0xfa040013),        //copyw $r1 = $r19
     _32(0xea000012),        //copyd $r0 = $r18
     _32(0x6a08000e),        //copyd $r2 = $r14;;
     _32(0xfa480000),        //copyw $r18 = $r0
     _32(0x3004420e),        //lwz $r1 = 264 (0x108)[$r14];;
     _32(0x0b000141),        //cb.odd $r1? 16fdc <fputc+0x7c>;;
     _32(0x2800040e),        //lhz $r0 = 16 (0x10)[$r14];;
     _64(0x00000000f8008000),        //andw $r0 = $r0, 512 (0x200);;
     _32(0x0c8002c0),        //cb.weqz $r0? 17004 <fputc+0xa4>;;
     _32(0xfa000012),        //copyw $r0 = $r18
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3c48020c),        //lq $r18r19 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0x980013a8),        //call 1be98 <__sinit>
     _32(0x6a000012),        //copyd $r0 = $r18;;
     _32(0x17ffffe6),        //goto 16f98 <fputc+0x38>;;
     _32(0x9800010d),        //call 17438 <__libc_lock_release>
     _32(0x6100300e),        //addd $r0 = $r14, 192 (0xc0);;
     _32(0xfa000012),        //copyw $r0 = $r18
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3c48020c),        //lq $r18r19 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0x980000c0),        //call 17328 <__libc_lock_acquire>
     _32(0x6100300e),        //addd $r0 = $r14, 192 (0xc0);;
     _32(0x17ffffe0),        //goto 16fb0 <fputc+0x50>;;
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
     _32(0x88800100),        //cb.deqz $r0? 1708c <_fwrite_r+0x54>
     _32(0x2755160c),        //sd 88 (0x58)[$r12] = $r21;;
     _32(0x30041400),        //lwz $r1 = 80 (0x50)[$r0];;
     _32(0x0c800b41),        //cb.weqz $r1? 1713c <_fwrite_r+0x104>;;
     _32(0x3008420e),        //lwz $r2 = 264 (0x108)[$r14];;
     _32(0x2804040e),        //lhz $r1 = 16 (0x10)[$r14];;
     _32(0x8b000142),        //cb.odd $r2? 170a8 <_fwrite_r+0x70>
     _32(0x6403f001),        //zxhd $r0 = $r1;;
     _64(0x00000000f8088000),        //andw $r2 = $r0, 512 (0x200);;
     _32(0x0c800c42),        //cb.weqz $r2? 17168 <_fwrite_r+0x130>;;
     _64(0x00000008f8000000),        //andw $r0 = $r0, 8192 (0x2000);;
     _32(0x0c000200),        //cb.wnez $r0? 170d0 <_fwrite_r+0x98>;;
     _64(0xb000420efa040001),        //orw $r1 = $r1, 8192 (0x2000)
     _32(0x00000008),        //lwz $r0 = 264 (0x108)[$r14];;
     _32(0x2505040e),        //sh 16 (0x10)[$r14] = $r1;;
     _64(0x07fffff7f800ffc0),        //andw $r0 = $r0, -8193 (0xffffffffffffdfff);;
     _32(0x2601420e),        //sw 264 (0x108)[$r14] = $r0;;
     _32(0x9800157c),        //call 1c6c0 <__sfvwrite_r>
     _32(0xe108120c),        //addd $r2 = $r12, 72 (0x48)
     _32(0xea04000e),        //copyd $r1 = $r14
     _32(0x6a000013),        //copyd $r0 = $r19;;
     _32(0x0c800640),        //cb.weqz $r0? 17144 <_fwrite_r+0x10c>;;
     _32(0x3000420e),        //lwz $r0 = 264 (0x108)[$r14];;
     _32(0x0b800380),        //cb.even $r0? 17120 <_fwrite_r+0xe8>;;
     _32(0xea040014),        //copyd $r1 = $r20
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x98003ddd),        //call 26868 <__udivdi3>
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
     _32(0x0c7ffc00),        //cb.wnez $r0? 170ec <_fwrite_r+0xb4>;;
     _32(0x980000c2),        //call 17438 <__libc_lock_release>
     _32(0x6100300e),        //addd $r0 = $r14, 192 (0xc0);;
     _32(0x17ffffed),        //goto 170ec <_fwrite_r+0xb4>;;
     _32(0x18001357),        //call 1be98 <__sinit>;;
     _32(0x17ffffd3),        //goto 1708c <_fwrite_r+0x54>;;
     _32(0x3000420e),        //lwz $r0 = 264 (0x108)[$r14];;
     _32(0x0b7ffb80),        //cb.odd $r0? 17100 <_fwrite_r+0xc8>;;
     _32(0x2800040e),        //lhz $r0 = 16 (0x10)[$r14];;
     _64(0x00000000f8008000),        //andw $r0 = $r0, 512 (0x200);;
     _32(0x0c7ffa80),        //cb.wnez $r0? 17100 <_fwrite_r+0xc8>;;
     _32(0x980000b7),        //call 17438 <__libc_lock_release>
     _32(0x6100300e),        //addd $r0 = $r14, 192 (0xc0);;
     _32(0x17ffffe7),        //goto 17100 <_fwrite_r+0xc8>;;
     _32(0x98000070),        //call 17328 <__libc_lock_acquire>
     _32(0x6100300e),        //addd $r0 = $r14, 192 (0xc0);;
     _32(0x2804040e),        //lhz $r1 = 16 (0x10)[$r14];;
     _32(0x97ffffcd),        //goto 170a8 <_fwrite_r+0x70>
     _32(0x6403f001),        //zxhd $r0 = $r1;;
     _32(0x7f03f000)        //nop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110110101011000; //0x16d58
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(inner, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110110101011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110111000011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__libc_fini_array, 0b00010110111000111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(_fputc_r, 0b00010110111010011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fputc, 0b00010110111101100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(_fwrite_r, 0b00010111000000111000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016d58;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
