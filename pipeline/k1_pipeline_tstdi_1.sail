// executing pipeline tstdi_1.c.out.dumped test 
val k1_pipeline_tstdi_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_tstdi_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let feq: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x080000c0),        //cb.dnez $r0? 16838 <feq+0x18>;;
     _32(0x6000000d),        //make $r0 = 13 (0xd);;
     _32(0x10000002),        //goto 1683c <feq+0x1c>;;
     _32(0x6000008c),        //make $r0 = 140 (0x8c);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let fne: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x088000c0),        //cb.deqz $r0? 16860 <fne+0x18>;;
     _32(0x6000000d),        //make $r0 = 13 (0xd);;
     _32(0x10000002),        //goto 16864 <fne+0x1c>;;
     _32(0x6000008c),        //make $r0 = 140 (0x8c);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let flt: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x098000c0),        //cb.dgez $r0? 16888 <flt+0x18>;;
     _32(0x6000000d),        //make $r0 = 13 (0xd);;
     _32(0x10000002),        //goto 1688c <flt+0x1c>;;
     _32(0x6000008c),        //make $r0 = 140 (0x8c);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let fge: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x090000c0),        //cb.dltz $r0? 168b0 <fge+0x18>;;
     _32(0x6000000d),        //make $r0 = 13 (0xd);;
     _32(0x10000002),        //goto 168b4 <fge+0x1c>;;
     _32(0x6000008c),        //make $r0 = 140 (0x8c);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let fgt: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x0a0000c0),        //cb.dlez $r0? 168d8 <fgt+0x18>;;
     _32(0x6000000d),        //make $r0 = 13 (0xd);;
     _32(0x10000002),        //goto 168dc <fgt+0x1c>;;
     _32(0x6000008c),        //make $r0 = 140 (0x8c);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let fle: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x0a8000c0),        //cb.dgtz $r0? 16900 <fle+0x18>;;
     _32(0x6000000d),        //make $r0 = 13 (0xd);;
     _32(0x10000002),        //goto 16904 <fle+0x1c>;;
     _32(0x6000008c),        //make $r0 = 140 (0x8c);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffc0),        //call 16820 <feq>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b340),        //compw.eq $r0 = $r0, 13 (0xd);;
     _32(0x0c000080),        //cb.wnez $r0? 16938 <main+0x28>;;
     _32(0x1800011d),        //call 16da8 <abort>;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1fffffb9),        //call 16820 <feq>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000004f101b300),        //compw.eq $r0 = $r0, 140 (0x8c);;
     _32(0x0c000080),        //cb.wnez $r0? 16954 <main+0x44>;;
     _32(0x18000116),        //call 16da8 <abort>;;
     _96(0x0400000080000000e0000000),        //make $r0 = 9223372036854775808 (0x8000000000000000);;
     _32(0x1fffffb0),        //call 16820 <feq>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000004f101b300),        //compw.eq $r0 = $r0, 140 (0x8c);;
     _32(0x0c000080),        //cb.wnez $r0? 16978 <main+0x68>;;
     _32(0x1800010d),        //call 16da8 <abort>;;
     _96(0x0400000080000000e0000040),        //make $r0 = 9223372036854775809 (0x8000000000000001);;
     _32(0x1fffffa7),        //call 16820 <feq>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000004f101b300),        //compw.eq $r0 = $r0, 140 (0x8c);;
     _32(0x0c000080),        //cb.wnez $r0? 1699c <main+0x8c>;;
     _32(0x18000104),        //call 16da8 <abort>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffffa0),        //call 16820 <feq>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000004f101b300),        //compw.eq $r0 = $r0, 140 (0x8c);;
     _32(0x0c000080),        //cb.wnez $r0? 169b8 <main+0xa8>;;
     _32(0x180000fd),        //call 16da8 <abort>;;
     _96(0x03ffffff87ffffffe000ffc0),        //make $r0 = 9223372036854775807 (0x7fffffffffffffff);;
     _32(0x1fffff97),        //call 16820 <feq>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000004f101b300),        //compw.eq $r0 = $r0, 140 (0x8c);;
     _32(0x0c000080),        //cb.wnez $r0? 169dc <main+0xcc>;;
     _32(0x180000f4),        //call 16da8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff9a),        //call 16848 <fne>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000004f101b300),        //compw.eq $r0 = $r0, 140 (0x8c);;
     _32(0x0c000080),        //cb.wnez $r0? 169f8 <main+0xe8>;;
     _32(0x180000ed),        //call 16da8 <abort>;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1fffff93),        //call 16848 <fne>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b340),        //compw.eq $r0 = $r0, 13 (0xd);;
     _32(0x0c000080),        //cb.wnez $r0? 16a14 <main+0x104>;;
     _32(0x180000e6),        //call 16da8 <abort>;;
     _96(0x0400000080000000e0000000),        //make $r0 = 9223372036854775808 (0x8000000000000000);;
     _32(0x1fffff8a),        //call 16848 <fne>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b340),        //compw.eq $r0 = $r0, 13 (0xd);;
     _32(0x0c000080),        //cb.wnez $r0? 16a38 <main+0x128>;;
     _32(0x180000dd),        //call 16da8 <abort>;;
     _96(0x0400000080000000e0000040),        //make $r0 = 9223372036854775809 (0x8000000000000001);;
     _32(0x1fffff81),        //call 16848 <fne>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b340),        //compw.eq $r0 = $r0, 13 (0xd);;
     _32(0x0c000080),        //cb.wnez $r0? 16a5c <main+0x14c>;;
     _32(0x180000d4),        //call 16da8 <abort>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffff7a),        //call 16848 <fne>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b340),        //compw.eq $r0 = $r0, 13 (0xd);;
     _32(0x0c000080),        //cb.wnez $r0? 16a78 <main+0x168>;;
     _32(0x180000cd),        //call 16da8 <abort>;;
     _96(0x03ffffff87ffffffe000ffc0),        //make $r0 = 9223372036854775807 (0x7fffffffffffffff);;
     _32(0x1fffff71),        //call 16848 <fne>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b340),        //compw.eq $r0 = $r0, 13 (0xd);;
     _32(0x0c000080),        //cb.wnez $r0? 16a9c <main+0x18c>;;
     _32(0x180000c4),        //call 16da8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff74),        //call 16870 <flt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000004f101b300),        //compw.eq $r0 = $r0, 140 (0x8c);;
     _32(0x0c000080),        //cb.wnez $r0? 16ab8 <main+0x1a8>;;
     _32(0x180000bd),        //call 16da8 <abort>;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1fffff6d),        //call 16870 <flt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b340),        //compw.eq $r0 = $r0, 13 (0xd);;
     _32(0x0c000080),        //cb.wnez $r0? 16ad4 <main+0x1c4>;;
     _32(0x180000b6),        //call 16da8 <abort>;;
     _96(0x0400000080000000e0000000),        //make $r0 = 9223372036854775808 (0x8000000000000000);;
     _32(0x1fffff64),        //call 16870 <flt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b340),        //compw.eq $r0 = $r0, 13 (0xd);;
     _32(0x0c000080),        //cb.wnez $r0? 16af8 <main+0x1e8>;;
     _32(0x180000ad),        //call 16da8 <abort>;;
     _96(0x0400000080000000e0000040),        //make $r0 = 9223372036854775809 (0x8000000000000001);;
     _32(0x1fffff5b),        //call 16870 <flt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b340),        //compw.eq $r0 = $r0, 13 (0xd);;
     _32(0x0c000080),        //cb.wnez $r0? 16b1c <main+0x20c>;;
     _32(0x180000a4),        //call 16da8 <abort>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffff54),        //call 16870 <flt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000004f101b300),        //compw.eq $r0 = $r0, 140 (0x8c);;
     _32(0x0c000080),        //cb.wnez $r0? 16b38 <main+0x228>;;
     _32(0x1800009d),        //call 16da8 <abort>;;
     _96(0x03ffffff87ffffffe000ffc0),        //make $r0 = 9223372036854775807 (0x7fffffffffffffff);;
     _32(0x1fffff4b),        //call 16870 <flt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000004f101b300),        //compw.eq $r0 = $r0, 140 (0x8c);;
     _32(0x0c000080),        //cb.wnez $r0? 16b5c <main+0x24c>;;
     _32(0x18000094),        //call 16da8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff4e),        //call 16898 <fge>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b340),        //compw.eq $r0 = $r0, 13 (0xd);;
     _32(0x0c000080),        //cb.wnez $r0? 16b78 <main+0x268>;;
     _32(0x1800008d),        //call 16da8 <abort>;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1fffff47),        //call 16898 <fge>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000004f101b300),        //compw.eq $r0 = $r0, 140 (0x8c);;
     _32(0x0c000080),        //cb.wnez $r0? 16b94 <main+0x284>;;
     _32(0x18000086),        //call 16da8 <abort>;;
     _96(0x0400000080000000e0000000),        //make $r0 = 9223372036854775808 (0x8000000000000000);;
     _32(0x1fffff3e),        //call 16898 <fge>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000004f101b300),        //compw.eq $r0 = $r0, 140 (0x8c);;
     _32(0x0c000080),        //cb.wnez $r0? 16bb8 <main+0x2a8>;;
     _32(0x1800007d),        //call 16da8 <abort>;;
     _96(0x0400000080000000e0000040),        //make $r0 = 9223372036854775809 (0x8000000000000001);;
     _32(0x1fffff35),        //call 16898 <fge>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000004f101b300),        //compw.eq $r0 = $r0, 140 (0x8c);;
     _32(0x0c000080),        //cb.wnez $r0? 16bdc <main+0x2cc>;;
     _32(0x18000074),        //call 16da8 <abort>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffff2e),        //call 16898 <fge>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b340),        //compw.eq $r0 = $r0, 13 (0xd);;
     _32(0x0c000080),        //cb.wnez $r0? 16bf8 <main+0x2e8>;;
     _32(0x1800006d),        //call 16da8 <abort>;;
     _96(0x03ffffff87ffffffe000ffc0),        //make $r0 = 9223372036854775807 (0x7fffffffffffffff);;
     _32(0x1fffff25),        //call 16898 <fge>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b340),        //compw.eq $r0 = $r0, 13 (0xd);;
     _32(0x0c000080),        //cb.wnez $r0? 16c1c <main+0x30c>;;
     _32(0x18000064),        //call 16da8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff28),        //call 168c0 <fgt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000004f101b300),        //compw.eq $r0 = $r0, 140 (0x8c);;
     _32(0x0c000080),        //cb.wnez $r0? 16c38 <main+0x328>;;
     _32(0x1800005d),        //call 16da8 <abort>;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1fffff21),        //call 168c0 <fgt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000004f101b300),        //compw.eq $r0 = $r0, 140 (0x8c);;
     _32(0x0c000080),        //cb.wnez $r0? 16c54 <main+0x344>;;
     _32(0x18000056),        //call 16da8 <abort>;;
     _96(0x0400000080000000e0000000),        //make $r0 = 9223372036854775808 (0x8000000000000000);;
     _32(0x1fffff18),        //call 168c0 <fgt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000004f101b300),        //compw.eq $r0 = $r0, 140 (0x8c);;
     _32(0x0c000080),        //cb.wnez $r0? 16c78 <main+0x368>;;
     _32(0x1800004d),        //call 16da8 <abort>;;
     _96(0x0400000080000000e0000040),        //make $r0 = 9223372036854775809 (0x8000000000000001);;
     _32(0x1fffff0f),        //call 168c0 <fgt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000004f101b300),        //compw.eq $r0 = $r0, 140 (0x8c);;
     _32(0x0c000080),        //cb.wnez $r0? 16c9c <main+0x38c>;;
     _32(0x18000044),        //call 16da8 <abort>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffff08),        //call 168c0 <fgt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b340),        //compw.eq $r0 = $r0, 13 (0xd);;
     _32(0x0c000080),        //cb.wnez $r0? 16cb8 <main+0x3a8>;;
     _32(0x1800003d),        //call 16da8 <abort>;;
     _96(0x03ffffff87ffffffe000ffc0),        //make $r0 = 9223372036854775807 (0x7fffffffffffffff);;
     _32(0x1ffffeff),        //call 168c0 <fgt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b340),        //compw.eq $r0 = $r0, 13 (0xd);;
     _32(0x0c000080),        //cb.wnez $r0? 16cdc <main+0x3cc>;;
     _32(0x18000034),        //call 16da8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff02),        //call 168e8 <fle>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b340),        //compw.eq $r0 = $r0, 13 (0xd);;
     _32(0x0c000080),        //cb.wnez $r0? 16cf8 <main+0x3e8>;;
     _32(0x1800002d),        //call 16da8 <abort>;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1ffffefb),        //call 168e8 <fle>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b340),        //compw.eq $r0 = $r0, 13 (0xd);;
     _32(0x0c000080),        //cb.wnez $r0? 16d14 <main+0x404>;;
     _32(0x18000026),        //call 16da8 <abort>;;
     _96(0x0400000080000000e0000000),        //make $r0 = 9223372036854775808 (0x8000000000000000);;
     _32(0x1ffffef2),        //call 168e8 <fle>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b340),        //compw.eq $r0 = $r0, 13 (0xd);;
     _32(0x0c000080),        //cb.wnez $r0? 16d38 <main+0x428>;;
     _32(0x1800001d),        //call 16da8 <abort>;;
     _96(0x0400000080000000e0000040),        //make $r0 = 9223372036854775809 (0x8000000000000001);;
     _32(0x1ffffee9),        //call 168e8 <fle>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b340),        //compw.eq $r0 = $r0, 13 (0xd);;
     _32(0x0c000080),        //cb.wnez $r0? 16d5c <main+0x44c>;;
     _32(0x18000014),        //call 16da8 <abort>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1ffffee2),        //call 168e8 <fle>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000004f101b300),        //compw.eq $r0 = $r0, 140 (0x8c);;
     _32(0x0c000080),        //cb.wnez $r0? 16d78 <main+0x468>;;
     _32(0x1800000d),        //call 16da8 <abort>;;
     _96(0x03ffffff87ffffffe000ffc0),        //make $r0 = 9223372036854775807 (0x7fffffffffffffff);;
     _32(0x1ffffed9),        //call 168e8 <fle>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000004f101b300),        //compw.eq $r0 = $r0, 140 (0x8c);;
     _32(0x0c000080),        //cb.wnez $r0? 16d9c <main+0x48c>;;
     _32(0x18000004),        //call 16da8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 16dc8 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 171c8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18ea0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0xf838ffc0),        //zxwd $r14 = $r0
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x98000161),        //call 17360 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16e04 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18ea0 <_exit>
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
     _32(0x0880014e),        //cb.deqz $r14? 16e54 <__libc_fini_array+0x44>;;
     _32(0x6138ffce),        //addd $r14 = $r14, -1 (0xffffffff);;
     _32(0x3802f392),        //ld.xs $r0 = $r14[$r18];;
     _32(0x0fdc0000),        //icall $r0;;
     _32(0x087fff4e),        //cb.dnez $r14? 16e44 <__libc_fini_array+0x34>;;
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
     _32(0x08800192),        //cb.deqz $r18? 16ebc <__libc_init_array+0x4c>;;
     _32(0xe138004e),        //addd $r14 = $r14, 1 (0x1)
     _32(0x3802f393),        //ld.xs $r0 = $r14[$r19];;
     _32(0x0fdc0000),        //icall $r0;;
     _32(0x7001a392),        //compd.ne $r0 = $r18, $r14;;
     _32(0x087fff00),        //cb.dnez $r0? 16ea8 <__libc_init_array+0x38>;;
     _32(0xe0380000),        //make $r14 = 0 (0x0)
     _96(0x08000000880000d8e04c0000),        //make $r19 = 221184 (0x36000);;
     _96(0x00000000800000d8e5480013),        //sbfd $r18 = $r19, 221184 (0x36000);;
     _32(0x7a4a20d2),        //srad $r18 = $r18, 3 (0x3);;
     _32(0x08800192),        //cb.deqz $r18? 16ef4 <__libc_init_array+0x84>;;
     _32(0xe138004e),        //addd $r14 = $r14, 1 (0x1)
     _32(0x3802f393),        //ld.xs $r0 = $r14[$r19];;
     _32(0x0fdc0000),        //icall $r0;;
     _32(0x7001a392),        //compd.ne $r0 = $r18, $r14;;
     _32(0x087fff00),        //cb.dnez $r0? 16ee0 <__libc_init_array+0x70>;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3c48020c),        //lq $r18r19 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let _init_signal_r_part_0: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60040100),        //make $r1 = 256 (0x100);;
     _32(0xea380000),        //copyd $r14 = $r0
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x98000221),        //call 177a8 <_malloc_r>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x888003c0),        //cb.deqz $r0? 16f68 <_init_signal_r.part.0+0x58>
     _64(0x18000001a701460e),        //sd 1304 (0x518)[$r14] = $r0;;
     _32(0xe0080000),        //make $r2 = 0 (0x0)
     _32(0xe00c0000),        //make $r3 = 0 (0x0)
     _32(0x60040020),        //make $r1 = 32 (0x20);;
     _32(0x0f0000c1),        //loopdo $r1, 16f50 <_init_signal_r.part.0+0x40>;;
     _32(0xe1080042),        //addd $r2 = $r2, 1 (0x1)
     _32(0x270ff080),        //sd.xs $r2[$r0] = $r3;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3838040c),        //ld $r14 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0x97fffffb),        //goto 16f54 <_init_signal_r.part.0+0x44>
     _64(0x003fffffe000ffc0),        //make $r0 = 4294967295 (0xffffffff);;
     _32(0x7f03f000)        //nop ;;
 |];

let _init_signal_r: list_I = 
 [|
     _64(0x18000001b8044600),        //ld $r1 = 1304 (0x518)[$r0];;
     _32(0x088000c1),        //cb.deqz $r1? 16f8c <_init_signal_r+0x14>;;
     _32(0x8fd00000),        //ret 
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x17ffffe1)        //goto 16f10 <_init_signal_r.part.0>;;
 |];

let _signal_r: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _64(0x08000000f80db7c1),        //compw.leu $r3 = $r1, 31 (0x1f);;
     _32(0xea480002),        //copyd $r18 = $r2
     _32(0xf84cffc1),        //zxwd $r19 = $r1
     _32(0x2849020c),        //sq 8 (0x8)[$r12] = $r18r19;;
     _32(0xea380000),        //copyd $r14 = $r0
     _32(0x2739000c),        //sd 0 (0x0)[$r12] = $r14;;
     _32(0x8c800383),        //cb.weqz $r3? 16fec <_signal_r+0x5c>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _64(0x18000001b8084600),        //ld $r2 = 1304 (0x518)[$r0];;
     _32(0x088004c2),        //cb.deqz $r2? 17010 <_signal_r+0x80>;;
     _32(0x6907f013),        //sxwd $r1 = $r19;;
     _32(0x3802f042),        //ld.xs $r0 = $r1[$r2];;
     _32(0x274bf042),        //sd.xs $r1[$r2] = $r18;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3c48020c),        //lq $r18r19 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0xe0040016),        //make $r1 = 22 (0x16)
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x2605000e),        //sw 0 (0x0)[$r14] = $r1;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3c48020c),        //lq $r18r19 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0x1fffffc0),        //call 16f10 <_init_signal_r.part.0>;;
     _32(0xfa040000),        //copyw $r1 = $r0
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x0c7ffb81),        //cb.wnez $r1? 16fd4 <_signal_r+0x44>;;
     _32(0x97ffffea),        //goto 16fc8 <_signal_r+0x38>
     _64(0x18000001b808460e),        //ld $r2 = 1304 (0x518)[$r14];;
     _32(0x7f03f000)        //nop ;;
 |];

let _raise_r: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _64(0x08000000f809b7c1),        //compw.leu $r2 = $r1, 31 (0x1f);;
     _32(0xf848ffc1),        //zxwd $r18 = $r1
     _32(0xe04c0000),        //make $r19 = 0 (0x0)
     _32(0x2849020c),        //sq 8 (0x8)[$r12] = $r18r19;;
     _32(0xe907f012),        //sxwd $r1 = $r18
     _32(0xea380000),        //copyd $r14 = $r0
     _32(0x2739000c),        //sd 0 (0x0)[$r12] = $r14;;
     _32(0x8c800a82),        //cb.weqz $r2? 17100 <_raise_r+0xd0>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _64(0x18000001b8004600),        //ld $r0 = 1304 (0x518)[$r0];;
     _32(0x08800440),        //cb.deqz $r0? 170ac <_raise_r+0x7c>;;
     _32(0x380ef040),        //ld.xs $r3 = $r1[$r0];;
     _32(0xe1110043),        //compd.eq $r4 = $r3, 1 (0x1)
     _32(0x6009ffc3),        //compd.ne $r2 = $r3, -1 (0xffffffff);;
     _32(0x08800343),        //cb.deqz $r3? 170ac <_raise_r+0x7c>;;
     _32(0x08000144),        //cb.dnez $r4? 17090 <_raise_r+0x60>;;
     _32(0x08800582),        //cb.deqz $r2? 170d8 <_raise_r+0xa8>;;
     _32(0x8fdc0003),        //icall $r3
     _32(0xfa000012),        //copyw $r0 = $r18
     _32(0x274ff040),        //sd.xs $r1[$r0] = $r19;;
     _32(0xfa000013),        //copyw $r0 = $r19
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3c48020c),        //lq $r18r19 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0x980000ab),        //call 17358 <_getpid_r>
     _32(0x6a00000e),        //copyd $r0 = $r14;;
     _32(0xfa080012),        //copyw $r2 = $r18
     _32(0xfa040000),        //copyw $r1 = $r0
     _32(0xea00000e),        //copyd $r0 = $r14
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3c48020c),        //lq $r18r19 = 8 (0x8)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x1000007f),        //goto 172d0 <_kill_r>;;
     _32(0xe0000016),        //make $r0 = 22 (0x16)
     _32(0x604c0001),        //make $r19 = 1 (0x1);;
     _32(0xfa000013),        //copyw $r0 = $r19
     _32(0x2601000e),        //sw 0 (0x0)[$r14] = $r0;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3c48020c),        //lq $r18r19 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0xe0000016),        //make $r0 = 22 (0x16)
     _64(0x083fffffe04cffc0),        //make $r19 = 4294967295 (0xffffffff);;
     _32(0x97ffffe1),        //goto 17090 <_raise_r+0x60>
     _32(0x2601000e),        //sw 0 (0x0)[$r14] = $r0;;
     _32(0x7f03f000)        //nop ;;
 |];

let __sigtramp_r: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _64(0x08000000f809b7c1),        //compw.leu $r2 = $r1, 31 (0x1f);;
     _32(0xea380000),        //copyd $r14 = $r0
     _32(0x2739020c),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0xf848ffc1),        //zxwd $r18 = $r1
     _32(0x2749040c),        //sd 16 (0x10)[$r12] = $r18;;
     _32(0x8c800802),        //cb.weqz $r2? 171b8 <__sigtramp_r+0xa0>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _64(0x18000001b8084600),        //ld $r2 = 1304 (0x518)[$r0];;
     _32(0x088005c2),        //cb.deqz $r2? 171a4 <__sigtramp_r+0x8c>;;
     _32(0xe90ff012),        //sxwd $r3 = $r18
     _32(0xf4118092),        //addx8wd $r4 = $r18, $r2
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x380af0c2),        //ld.xs $r2 = $r3[$r2];;
     _32(0x6105ffc2),        //compd.eq $r1 = $r2, -1 (0xffffffff);;
     _32(0x088002c2),        //cb.deqz $r2? 1718c <__sigtramp_r+0x74>;;
     _32(0x88000281),        //cb.dnez $r1? 1718c <__sigtramp_r+0x74>
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0xe1050042),        //compd.eq $r1 = $r2, 1 (0x1)
     _32(0x60000003),        //make $r0 = 3 (0x3);;
     _32(0x08000181),        //cb.dnez $r1? 1718c <__sigtramp_r+0x74>;;
     _32(0xe0040000),        //make $r1 = 0 (0x0)
     _32(0x7a000012),        //copyw $r0 = $r18;;
     _32(0x8fdc0002),        //icall $r2
     _32(0x27050004),        //sd 0 (0x0)[$r4] = $r1;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3848040c),        //ld $r18 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0x1fffff5b),        //call 16f10 <_init_signal_r.part.0>;;
     _32(0x0c000100),        //cb.wnez $r0? 171b8 <__sigtramp_r+0xa0>;;
     _32(0x97ffffe8),        //goto 1714c <__sigtramp_r+0x34>
     _64(0x18000001b808460e),        //ld $r2 = 1304 (0x518)[$r14];;
     _32(0x97fffff5),        //goto 1718c <__sigtramp_r+0x74>
     _64(0x003fffffe000ffc0),        //make $r0 = 4294967295 (0xffffffff);;
     _32(0x7f03f000)        //nop ;;
 |];

let raise: list_I = 
 [|
     _32(0xfa040000),        //copyw $r1 = $r0
     _96(0x08000000880000f8e0081000),        //make $r2 = 254016 (0x3e040);;
     _32(0x97ffff96),        //goto 17030 <_raise_r>
     _32(0x38000002)        //ld $r0 = 0 (0x0)[$r2];;
 |];

let signal: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _96(0x08000000880000f8e00c1000),        //make $r3 = 254016 (0x3e040);;
     _32(0xea380001),        //copyd $r14 = $r1
     _64(0xa739000cf809b7c0),        //compw.leu $r2 = $r0, 31 (0x1f)
     _32(0x08000000),        //sd 0 (0x0)[$r12] = $r14;;
     _32(0xf848ffc0),        //zxwd $r18 = $r0
     _32(0x2849020c),        //sq 8 (0x8)[$r12] = $r18r19;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x8c800382),        //cb.weqz $r2? 17248 <signal+0x68>
     _32(0x384c0003),        //ld $r19 = 0 (0x0)[$r3];;
     _64(0x18000001b8084613),        //ld $r2 = 1304 (0x518)[$r19];;
     _32(0x088004c2),        //cb.deqz $r2? 1726c <signal+0x8c>;;
     _32(0x6907f012),        //sxwd $r1 = $r18;;
     _32(0x3802f042),        //ld.xs $r0 = $r1[$r2];;
     _32(0x273bf042),        //sd.xs $r1[$r2] = $r14;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3c48020c),        //lq $r18r19 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0xe0040016),        //make $r1 = 22 (0x16)
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x26050013),        //sw 0 (0x0)[$r19] = $r1;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3c48020c),        //lq $r18r19 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0x9fffff29),        //call 16f10 <_init_signal_r.part.0>
     _32(0x6a000013),        //copyd $r0 = $r19;;
     _32(0xfa040000),        //copyw $r1 = $r0
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x0c7ffb41),        //cb.wnez $r1? 17230 <signal+0x50>;;
     _32(0x97ffffe9),        //goto 17224 <signal+0x44>
     _64(0x18000001b8084613),        //ld $r2 = 1304 (0x518)[$r19];;
     _32(0x7f03f000)        //nop ;;
 |];

let _init_signal: list_I = 
 [|
     _96(0x00000000800000f8e0001000),        //make $r0 = 254016 (0x3e040);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _64(0x18000001b8044600),        //ld $r1 = 1304 (0x518)[$r0];;
     _32(0x088000c1),        //cb.deqz $r1? 172b4 <_init_signal+0x24>;;
     _32(0x8fd00000),        //ret 
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x17ffff17)        //goto 16f10 <_init_signal_r.part.0>;;
 |];

let __sigtramp: list_I = 
 [|
     _32(0xfa040000),        //copyw $r1 = $r0
     _96(0x08000000880000f8e0081000),        //make $r2 = 254016 (0x3e040);;
     _32(0x97ffff94),        //goto 17118 <__sigtramp_r>
     _32(0x38000002)        //ld $r0 = 0 (0x0)[$r2];;
 |];

let _kill_r: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x780cffc1),        //zxwd $r3 = $r1;;
     _32(0xe0100000),        //make $r4 = 0 (0x0)
     _32(0xfa040002),        //copyw $r1 = $r2
     _32(0xea380000),        //copyd $r14 = $r0
     _32(0x2739020c),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0xfa000003),        //copyw $r0 = $r3
     _96(0x88000117a749040ce0482200),        //make $r18 = 285832 (0x45c88)
     _32(0x08000000),        //sd 16 (0x10)[$r12] = $r18;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x9800075f),        //call 19080 <_kill>
     _32(0x26110012),        //sw 0 (0x0)[$r18] = $r4;;
     _64(0x07fffffff005b7c0),        //compw.ne $r1 = $r0, 4294967295 (0xffffffff);;
     _32(0x0c8001c1),        //cb.weqz $r1? 17330 <_kill_r+0x60>;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3848040c),        //ld $r18 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0x30040012),        //lwz $r1 = 0 (0x0)[$r18];;
     _32(0x08fffe41),        //cb.deqz $r1? 17318 <_kill_r+0x48>;;
     _32(0x2605000e),        //sw 0 (0x0)[$r14] = $r1;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3848040c),        //ld $r18 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let _getpid_r: list_I = 
 [|
     _32(0x10000756),        //goto 190b0 <_getpid>;;
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
     _96(0x88000067a865100ce05cb400),        //make $r23 = 106192 (0x19ed0)
     _32(0x08000000),        //so 64 (0x40)[$r12] = $r24r25r26r27;;
     _32(0xe04c0001),        //make $r19 = 1 (0x1)
     _32(0x2849040c),        //sq 16 (0x10)[$r12] = $r18r19;;
     _32(0x2739020c),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0x27411e0c),        //sd 120 (0x78)[$r12] = $r16;;
     _32(0x2871180c),        //sq 96 (0x60)[$r12] = $r28r29;;
     _32(0x98000090),        //call 175e8 <__libc_lock_acquire>
     _32(0x27791c0c),        //sd 112 (0x70)[$r12] = $r30;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38600000),        //ld $r24 = 0 (0x0)[$r0];;
     _32(0x61647e18),        //addd $r25 = $r24, 504 (0x1f8);;
     _32(0xea780019),        //copyd $r30 = $r25
     _32(0x38487e18),        //ld $r18 = 504 (0x1f8)[$r24];;
     _32(0x08800c52),        //cb.deqz $r18? 17490 <__call_exitprocs+0x130>;;
     _32(0xe16c0412),        //addd $r27 = $r18, 16 (0x10)
     _32(0xe1544412),        //addd $r21 = $r18, 272 (0x110)
     _64(0xb0000212e1748412),        //addd $r29 = $r18, 528 (0x210)
     _32(0x10000000),        //lwz $r0 = 8 (0x8)[$r18];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x693bf000),        //sxwd $r14 = $r0;;
     _32(0x0d800100),        //cb.wgez $r0? 173fc <__call_exitprocs+0x9c>;;
     _32(0x1000001e),        //goto 17468 <__call_exitprocs+0x108>;;
     _32(0x6138ffce),        //addd $r14 = $r14, -1 (0xffffffff);;
     _32(0x0d00070e),        //cb.wltz $r14? 17468 <__call_exitprocs+0x108>;;
     _32(0x8880015a),        //cb.deqz $r26? 17410 <__call_exitprocs+0xb0>
     _32(0x7808ffce),        //zxwd $r2 = $r14;;
     _32(0x3802f39d),        //ld.xs $r0 = $r14[$r29];;
     _32(0x7101a680),        //compd.eq $r0 = $r0, $r26;;
     _32(0x08fffe80),        //cb.deqz $r0? 173f4 <__call_exitprocs+0x94>;;
     _32(0x30000212),        //lwz $r0 = 8 (0x8)[$r18];;
     _32(0x380ef39b),        //ld.xs $r3 = $r14[$r27];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x7001b380),        //compw.ne $r0 = $r0, $r14;;
     _32(0x0c800c80),        //cb.weqz $r0? 174e8 <__call_exitprocs+0x188>;;
     _32(0x2753f39b),        //sd.xs $r14[$r27] = $r20;;
     _32(0x08fffcc3),        //cb.deqz $r3? 173f4 <__call_exitprocs+0x94>;;
     _32(0xf90a7093),        //sllw $r2 = $r19, $r2
     _64(0x18000000b000c412),        //lwz $r0 = 784 (0x310)[$r18];;
     _32(0x30700212),        //lwz $r28 = 8 (0x8)[$r18];;
     _32(0x78011080),        //andw $r0 = $r0, $r2;;
     _32(0x0c000840),        //cb.wnez $r0? 174c4 <__call_exitprocs+0x164>;;
     _32(0x0fdc0003),        //icall $r3;;
     _32(0xe138ffce),        //addd $r14 = $r14, -1 (0xffffffff)
     _32(0x30000212),        //lwz $r0 = 8 (0x8)[$r18];;
     _32(0x7001b700),        //compw.ne $r0 = $r0, $r28;;
     _32(0x0c7ff700),        //cb.wnez $r0? 173c4 <__call_exitprocs+0x64>;;
     _32(0x3800001e),        //ld $r0 = 0 (0x0)[$r30];;
     _32(0x7001a480),        //compd.ne $r0 = $r0, $r18;;
     _32(0x087ff640),        //cb.dnez $r0? 173c4 <__call_exitprocs+0x64>;;
     _32(0x0dfff98e),        //cb.wgez $r14? 173fc <__call_exitprocs+0x9c>;;
     _32(0x08800297),        //cb.deqz $r23? 17490 <__call_exitprocs+0x130>;;
     _32(0x30000212),        //lwz $r0 = 8 (0x8)[$r18];;
     _32(0x38040012),        //ld $r1 = 0 (0x0)[$r18];;
     _32(0x0c000840),        //cb.wnez $r0? 174f8 <__call_exitprocs+0x198>;;
     _32(0x08800801),        //cb.deqz $r1? 174f8 <__call_exitprocs+0x198>;;
     _32(0x8fdc0017),        //icall $r23
     _32(0xea000012),        //copyd $r0 = $r18
     _32(0x2705001e),        //sd 0 (0x0)[$r30] = $r1;;
     _32(0x3848001e),        //ld $r18 = 0 (0x0)[$r30];;
     _32(0x087ff452),        //cb.dnez $r18? 173d0 <__call_exitprocs+0x70>;;
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
     _32(0x1000008e),        //goto 176f8 <__libc_lock_release>;;
     _64(0x18000000b010c512),        //lwz $r4 = 788 (0x314)[$r18];;
     _32(0x3802f395),        //ld.xs $r0 = $r14[$r21];;
     _32(0x78091084),        //andw $r2 = $r4, $r2;;
     _32(0x0c0001c2),        //cb.wnez $r2? 174f0 <__call_exitprocs+0x190>;;
     _32(0x8fdc0003),        //icall $r3
     _32(0xea040000),        //copyd $r1 = $r0
     _32(0x7a000016),        //copyw $r0 = $r22;;
     _32(0x17ffffd9),        //goto 17448 <__call_exitprocs+0xe8>;;
     _32(0x97ffffd0),        //goto 17428 <__call_exitprocs+0xc8>
     _32(0x26090212),        //sw 8 (0x8)[$r18] = $r2;;
     _32(0x0fdc0003),        //icall $r3;;
     _32(0x17ffffd5),        //goto 17448 <__call_exitprocs+0xe8>;;
     _32(0xea780012),        //copyd $r30 = $r18
     _32(0x6a480001),        //copyd $r18 = $r1;;
     _32(0x087fed12),        //cb.dnez $r18? 173d0 <__call_exitprocs+0x70>;;
     _32(0x17ffffe3)        //goto 17490 <__call_exitprocs+0x130>;;
 |];

let __libc_lock_init: list_I = 
 [|
     _32(0x08800080),        //cb.deqz $r0? 17510 <__libc_lock_init+0x8>;;
     _32(0x100042bd),        //goto 28000 <__cos_recursive_initlock_base>;;
     _32(0x00000000),        //errop ;;
     _32(0x100042bb)        //goto 28000 <__cos_recursive_initlock_base>;;
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
     _32(0x980042b3),        //call 28010 <__cos_recursive_trylock_base>
     _32(0x71040041),        //addw $r1 = $r1, 1 (0x1);;
     _64(0x00000000f005b040),        //compw.ne $r1 = $r0, 1 (0x1);;
     _32(0x0c8001c1),        //cb.weqz $r1? 17570 <__libc_lock_try_acquire+0x50>;;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _64(0xb840040cf101b000),        //compw.eq $r0 = $r0, 0 (0x0)
     _32(0x08000000),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _96(0x0000000080000000e0040000),        //make $r1 = 0 (0x0);;
     _32(0x08000201),        //cb.dnez $r1? 1759c <__libc_lock_try_acquire+0x7c>;;
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
     _32(0x0c000101),        //cb.wnez $r1? 175d4 <__libc_lock_try_acquire+0xb4>;;
     _32(0x3f8d0000),        //dinval ;;
     _32(0x97ffffee),        //goto 17584 <__libc_lock_try_acquire+0x64>
     _32(0x3fcd0000),        //fence ;;
     _32(0x980040bb),        //call 278c0 <mppa_cos_l2_wb_inval>
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x97fffffb),        //goto 175cc <__libc_lock_try_acquire+0xac>
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
     _32(0x9fffffbe),        //call 17520 <__libc_lock_try_acquire>
     _32(0x6a000012),        //copyd $r0 = $r18;;
     _32(0x0c800380),        //cb.weqz $r0? 17668 <__libc_lock_acquire+0x80>;;
     _32(0x26510e0c),        //sw 56 (0x38)[$r12] = $r20;;
     _32(0x30040e0c),        //lwz $r1 = 56 (0x38)[$r12];;
     _32(0x7705b4c1),        //compw.geu $r1 = $r1, $r19;;
     _32(0x0c7ffe81),        //cb.wnez $r1? 17628 <__libc_lock_acquire+0x40>;;
     _32(0x30040e0c),        //lwz $r1 = 56 (0x38)[$r12];;
     _32(0x71040041),        //addw $r1 = $r1, 1 (0x1);;
     _32(0x26050e0c),        //sw 56 (0x38)[$r12] = $r1;;
     _32(0x30040e0c),        //lwz $r1 = 56 (0x38)[$r12];;
     _32(0x7605b381),        //compw.ltu $r1 = $r1, $r14;;
     _32(0x0c7ffec1),        //cb.wnez $r1? 17644 <__libc_lock_acquire+0x5c>;;
     _32(0x9fffffb1),        //call 17520 <__libc_lock_try_acquire>
     _32(0x6a000012),        //copyd $r0 = $r18;;
     _32(0x0c7ffd00),        //cb.wnez $r0? 17634 <__libc_lock_acquire+0x4c>;;
     _96(0x0000000080000000e0000000),        //make $r0 = 0 (0x0);;
     _32(0x08000240),        //cb.dnez $r0? 17698 <__libc_lock_acquire+0xb0>;;
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
     _32(0x0c000280),        //cb.wnez $r0? 176e8 <__libc_lock_acquire+0x100>;;
     _32(0x3f8d0000),        //dinval ;;
     _32(0x3fcd0000),        //fence ;;
     _32(0x38400c0c),        //ld $r16 = 48 (0x30)[$r12];;
     _32(0x3838040c),        //ld $r14 = 16 (0x10)[$r12];;
     _32(0x3c48060c),        //lq $r18r19 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x8fd00000),        //ret 
     _32(0xe130100c),        //addd $r12 = $r12, 64 (0x40)
     _32(0x38500a0c),        //ld $r20 = 40 (0x28)[$r12];;
     _32(0x18004076),        //call 278c0 <mppa_cos_l2_wb_inval>;;
     _32(0x97fffff7),        //goto 176c8 <__libc_lock_acquire+0xe0>
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
     _32(0x880001c2),        //cb.dnez $r2? 17748 <__libc_lock_release+0x50>
     _32(0x6907f001),        //sxwd $r1 = $r1;;
     _32(0x3fcd0000),        //fence ;;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x10004285),        //goto 28158 <__cos_recursive_unlock_base>;;
     _96(0x80000000e00c0000e0080040),        //make $r2 = 1 (0x1)
     _96(0x080000008800000080000000),        //make $r3 = 0 (0x0);;
     _32(0xe00d0003),        //compd.ne $r3 = $r3, 0 (0x0)
     _64(0x08000000f509b042),        //compw.gt $r2 = $r2, 1 (0x1);;
     _32(0x780910c2),        //andw $r2 = $r2, $r3;;
     _32(0x0c0001c2),        //cb.wnez $r2? 1778c <__libc_lock_release+0x94>;;
     _32(0x3f8d0000),        //dinval ;;
     _32(0x3fcd0000),        //fence ;;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x10004274),        //goto 28158 <__cos_recursive_unlock_base>;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x9800404c),        //call 278c0 <mppa_cos_l2_wb_inval>
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x97fffff6),        //goto 17778 <__libc_lock_release+0x80>
     _32(0x3f8d0000)        //dinval ;;
 |];

let _malloc_r: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0xe14805c1),        //addd $r18 = $r1, 23 (0x17)
     _32(0xea4c0000),        //copyd $r19 = $r0
     _32(0x2849020c),        //sq 8 (0x8)[$r12] = $r18r19;;
     _32(0xe9090b92),        //compd.gtu $r2 = $r18, 46 (0x2e)
     _32(0x2739000c),        //sd 0 (0x0)[$r12] = $r14;;
     _32(0x2855060c),        //so 24 (0x18)[$r12] = $r20r21r22r23;;
     _32(0x28650e0c),        //so 56 (0x38)[$r12] = $r24r25r26r27;;
     _32(0x88000982),        //cb.dnez $r2? 17864 <_malloc_r+0xbc>
     _32(0x2741160c),        //sd 88 (0x58)[$r12] = $r16;;
     _32(0xe9050801),        //compd.gtu $r1 = $r1, 32 (0x20)
     _32(0x60480020),        //make $r18 = 32 (0x20);;
     _32(0x08002ac1),        //cb.dnez $r1? 17a88 <_malloc_r+0x2e0>;;
     _32(0x18000258),        //call 18140 <__malloc_lock>;;
     _32(0xe0000050),        //make $r0 = 80 (0x50)
     _32(0x60140004),        //make $r5 = 4 (0x4);;
     _96(0x800000fab8386600e1086400),        //addd $r2 = $r0, 256400 (0x3e990)
     _96(0x18000000980000fa80000000),        //ld $r14 = 256408 (0x3e998)[$r0];;
     _32(0x6104fc02),        //addd $r1 = $r2, -16 (0xfffffff0);;
     _32(0x7005a04e),        //compd.ne $r1 = $r14, $r1;;
     _32(0x08802a81),        //cb.deqz $r1? 17ab4 <_malloc_r+0x30c>;;
     _32(0xea000013),        //copyd $r0 = $r19
     _32(0x3804020e),        //ld $r1 = 8 (0x8)[$r14];;
     _32(0x3808060e),        //ld $r2 = 24 (0x18)[$r14];;
     _32(0x380c040e),        //ld $r3 = 16 (0x10)[$r14];;
     _32(0x6804ff01),        //andd $r1 = $r1, -4 (0xfffffffc);;
     _32(0xf105004e),        //addd $r1 = $r14, $r1
     _32(0x27090603),        //sd 24 (0x18)[$r3] = $r2;;
     _32(0x270d0402),        //sd 16 (0x10)[$r2] = $r3;;
     _32(0x38080201),        //ld $r2 = 8 (0x8)[$r1];;
     _32(0x6a080042),        //ord $r2 = $r2, 1 (0x1);;
     _32(0x98000246),        //call 18150 <__malloc_unlock>
     _32(0x27090201),        //sd 8 (0x8)[$r1] = $r2;;
     _32(0xe100040e),        //addd $r0 = $r14, 16 (0x10)
     _32(0x3840160c),        //ld $r16 = 88 (0x58)[$r12];;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0x3c48020c),        //lq $r18r19 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3c54060c),        //lo $r20r21r22r23 = 24 (0x18)[$r12];;
     _32(0x8fd00000),        //ret 
     _32(0xe130180c),        //addd $r12 = $r12, 96 (0x60)
     _32(0x3c640e0c),        //lo $r24r25r26r27 = 56 (0x38)[$r12];;
     _32(0x6848fc12),        //andd $r18 = $r18, -16 (0xfffffff0);;
     _32(0xf905a481),        //compd.gtu $r1 = $r1, $r18
     _64(0x081fffffe909ffd2),        //compd.gtu $r2 = $r18, 2147483647 (0x7fffffff);;
     _32(0x7a051042),        //orw $r1 = $r2, $r1;;
     _32(0x0c002101),        //cb.wnez $r1? 17a88 <_malloc_r+0x2e0>;;
     _32(0x18000231),        //call 18140 <__malloc_lock>;;
     _32(0xe9017dd2),        //compd.gtu $r0 = $r18, 503 (0x1f7)
     _32(0xe0100400),        //make $r4 = 1024 (0x400)
     _32(0xe0140040),        //make $r5 = 64 (0x40)
     _32(0x6018003f),        //make $r6 = 63 (0x3f);;
     _32(0x088065c0),        //cb.deqz $r0? 17eec <_malloc_r+0x744>;;
     _32(0x7b022252),        //srld $r0 = $r18, 9 (0x9);;
     _32(0x08004700),        //cb.dnez $r0? 17d08 <_malloc_r+0x560>;;
     _96(0x800000fab8386604e1106004),        //addd $r4 = $r4, 256384 (0x3e980)
     _96(0x18000000980000fa80000000),        //ld $r14 = 256408 (0x3e998)[$r4];;
     _32(0x7101a384),        //compd.eq $r0 = $r4, $r14;;
     _32(0x08800180),        //cb.deqz $r0? 178d0 <_malloc_r+0x128>;;
     _32(0x1000000b),        //goto 178e8 <_malloc_r+0x140>;;
     _32(0x09804e02),        //cb.dgez $r2? 17da0 <_malloc_r+0x5f8>;;
     _32(0x3838060e),        //ld $r14 = 24 (0x18)[$r14];;
     _32(0x7005a384),        //compd.ne $r1 = $r4, $r14;;
     _32(0x088001c1),        //cb.deqz $r1? 178e8 <_malloc_r+0x140>;;
     _32(0x3804020e),        //ld $r1 = 8 (0x8)[$r14];;
     _32(0x6804ff01),        //andd $r1 = $r1, -4 (0xfffffffc);;
     _32(0x75090052),        //sbfd $r2 = $r18, $r1;;
     _32(0x650d07c2),        //compd.gt $r3 = $r2, 31 (0x1f);;
     _32(0x08fffe03),        //cb.deqz $r3? 178c0 <_malloc_r+0x118>;;
     _32(0x6a140006),        //copyd $r5 = $r6;;
     _96(0x00000000800000fae0506400),        //make $r20 = 256400 (0x3e990);;
     _32(0xe1040414),        //addd $r1 = $r20, 16 (0x10)
     _32(0x38380814),        //ld $r14 = 32 (0x20)[$r20];;
     _32(0x7001a04e),        //compd.ne $r0 = $r14, $r1;;
     _32(0x08801e80),        //cb.deqz $r0? 17ae8 <_malloc_r+0x340>;;
     _32(0x3808020e),        //ld $r2 = 8 (0x8)[$r14];;
     _32(0x6808ff02),        //andd $r2 = $r2, -4 (0xfffffffc);;
     _32(0x750d0092),        //sbfd $r3 = $r18, $r2;;
     _32(0x640107c3),        //compd.le $r0 = $r3, 31 (0x1f);;
     _32(0x08805f40),        //cb.deqz $r0? 17f08 <_malloc_r+0x760>;;
     _32(0xe9017fc2),        //compd.gtu $r0 = $r2, 511 (0x1ff)
     _32(0x27050a14),        //sd 40 (0x28)[$r20] = $r1;;
     _32(0x89804103),        //cb.dgez $r3? 17d30 <_malloc_r+0x588>
     _32(0x27050814),        //sd 32 (0x20)[$r20] = $r1;;
     _32(0x08004c40),        //cb.dnez $r0? 17dec <_malloc_r+0x644>;;
     _32(0xe60b20c2),        //extfz $r2 = $r2, 34 (0x22), 3 (0x3)
     _32(0xe0000001),        //make $r0 = 1 (0x1)
     _32(0x380c0214),        //ld $r3 = 8 (0x8)[$r20];;
     _32(0xf1040042),        //addw $r1 = $r2, 1 (0x1)
     _32(0x7a0a3082),        //sraw $r2 = $r2, 2 (0x2);;
     _32(0xf9063041),        //sllw $r1 = $r1, 1 (0x1)
     _32(0x790a6080),        //slld $r2 = $r0, $r2;;
     _32(0xe903f001),        //sxwd $r0 = $r1
     _32(0x7a0900c2),        //ord $r2 = $r2, $r3;;
     _32(0xf90220c0),        //slld $r0 = $r0, 3 (0x3)
     _32(0x27090214),        //sd 8 (0x8)[$r20] = $r2;;
     _96(0x800000fab8046400e10c6000),        //addd $r3 = $r0, 256384 (0x3e980)
     _96(0x18000000980000fa80000000),        //ld $r1 = 256400 (0x3e990)[$r0];;
     _32(0x270d060e),        //sd 24 (0x18)[$r14] = $r3;;
     _32(0x2705040e),        //sd 16 (0x10)[$r14] = $r1;;
     _96(0x18000000980000faa7396400),        //sd 256400 (0x3e990)[$r0] = $r14;;
     _32(0x27390601),        //sd 24 (0x18)[$r1] = $r14;;
     _32(0xfa023085),        //sraw $r0 = $r5, 2 (0x2)
     _32(0x601c0001),        //make $r7 = 1 (0x1);;
     _32(0x791e6007),        //slld $r7 = $r7, $r0;;
     _32(0x7901a087),        //compd.gtu $r0 = $r7, $r2;;
     _32(0x08001680),        //cb.dnez $r0? 17b00 <_malloc_r+0x358>;;
     _32(0x78010087),        //andd $r0 = $r7, $r2;;
     _32(0x080002c0),        //cb.dnez $r0? 179cc <_malloc_r+0x224>;;
     _32(0xf91e2047),        //slld $r7 = $r7, 1 (0x1)
     _32(0x7814ff05),        //andw $r5 = $r5, -4 (0xfffffffc);;
     _32(0xf8010087),        //andd $r0 = $r7, $r2
     _32(0x71140105),        //addw $r5 = $r5, 4 (0x4);;
     _32(0x7814ffc5),        //zxwd $r5 = $r5;;
     _32(0x08000140),        //cb.dnez $r0? 179cc <_malloc_r+0x224>;;
     _32(0xf91e2047),        //slld $r7 = $r7, 1 (0x1)
     _32(0x71140105),        //addw $r5 = $r5, 4 (0x4);;
     _32(0x78010087),        //andd $r0 = $r7, $r2;;
     _32(0x08ffff40),        //cb.deqz $r0? 179bc <_malloc_r+0x214>;;
     _96(0x00000000800000fae0286400),        //make $r10 = 256400 (0x3e990);;
     _32(0xf1000045),        //addw $r0 = $r5, 1 (0x1)
     _32(0x6a240005),        //copyd $r9 = $r5;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _64(0x07fffffff4018400),        //addx8wd $r0 = $r0, 4294967280 (0xfffffff0);;
     _96(0x00000000800000fae1006400),        //addd $r0 = $r0, 256400 (0x3e990);;
     _32(0x6a200000),        //copyd $r8 = $r0;;
     _32(0x38040608),        //ld $r1 = 24 (0x18)[$r8];;
     _32(0x7109a048),        //compd.eq $r2 = $r8, $r1;;
     _32(0x08800102),        //cb.deqz $r2? 17a14 <_malloc_r+0x26c>;;
     _32(0x10000128),        //goto 17ea8 <_malloc_r+0x700>;;
     _32(0x09804b43),        //cb.dgez $r3? 17ec0 <_malloc_r+0x718>;;
     _32(0x08804986),        //cb.deqz $r6? 17ea8 <_malloc_r+0x700>;;
     _32(0xea380001),        //copyd $r14 = $r1
     _32(0x38080201),        //ld $r2 = 8 (0x8)[$r1];;
     _32(0x38040601),        //ld $r1 = 24 (0x18)[$r1];;
     _32(0x6808ff02),        //andd $r2 = $r2, -4 (0xfffffffc);;
     _32(0xf50d0092),        //sbfd $r3 = $r18, $r2
     _32(0x7019a048),        //compd.ne $r6 = $r8, $r1;;
     _32(0x641107c3),        //compd.le $r4 = $r3, 31 (0x1f);;
     _32(0x087ffdc4),        //cb.dnez $r4? 17a0c <_malloc_r+0x264>;;
     _32(0xea000052),        //ord $r0 = $r18, 1 (0x1)
     _32(0xf149048e),        //addd $r18 = $r14, $r18
     _96(0x900000fab818040ee0106400),        //make $r4 = 256400 (0x3e990)
     _32(0x10000000),        //ld $r6 = 16 (0x10)[$r14];;
     _32(0xe1140404),        //addd $r5 = $r4, 16 (0x10)
     _32(0xea1c0043),        //ord $r7 = $r3, 1 (0x1)
     _32(0xea000013),        //copyd $r0 = $r19
     _32(0x2701020e),        //sd 8 (0x8)[$r14] = $r0;;
     _32(0x27050606),        //sd 24 (0x18)[$r6] = $r1;;
     _32(0x27190401),        //sd 16 (0x10)[$r1] = $r6;;
     _32(0x27490a04),        //sd 40 (0x28)[$r4] = $r18;;
     _32(0x27490804),        //sd 32 (0x20)[$r4] = $r18;;
     _32(0x27150612),        //sd 24 (0x18)[$r18] = $r5;;
     _32(0x27150412),        //sd 16 (0x10)[$r18] = $r5;;
     _32(0x271d0212),        //sd 8 (0x8)[$r18] = $r7;;
     _32(0x980001b6),        //call 18150 <__malloc_unlock>
     _32(0x270fe08e),        //sd $r2[$r14] = $r3;;
     _32(0x90000005),        //goto 17a94 <_malloc_r+0x2ec>
     _32(0x6100040e),        //addd $r0 = $r14, 16 (0x10);;
     _32(0xe004000c),        //make $r1 = 12 (0xc)
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26050013),        //sw 0 (0x0)[$r19] = $r1;;
     _32(0x3840160c),        //ld $r16 = 88 (0x58)[$r12];;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0x3c48020c),        //lq $r18r19 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3c54060c),        //lo $r20r21r22r23 = 24 (0x18)[$r12];;
     _32(0x8fd00000),        //ret 
     _32(0xe130180c),        //addd $r12 = $r12, 96 (0x60)
     _32(0x3c640e0c),        //lo $r24r25r26r27 = 56 (0x38)[$r12];;
     _32(0xf1140085),        //addw $r5 = $r5, 2 (0x2)
     _96(0x880000fab8386a00e0506400),        //make $r20 = 256400 (0x3e990)
     _96(0x18000000980000fa88000000),        //ld $r14 = 256424 (0x3e9a8)[$r0];;
     _32(0x61040414),        //addd $r1 = $r20, 16 (0x10);;
     _32(0x7109a382),        //compd.eq $r2 = $r2, $r14;;
     _32(0x08ffd382),        //cb.deqz $r2? 17810 <_malloc_r+0x68>;;
     _32(0x38380814),        //ld $r14 = 32 (0x20)[$r20];;
     _32(0x7001a04e),        //compd.ne $r0 = $r14, $r1;;
     _32(0x087fe200),        //cb.dnez $r0? 17904 <_malloc_r+0x15c>;;
     _32(0xfa023085),        //sraw $r0 = $r5, 2 (0x2)
     _32(0xe01c0001),        //make $r7 = 1 (0x1)
     _32(0x38080214),        //ld $r2 = 8 (0x8)[$r20];;
     _32(0x791e6007),        //slld $r7 = $r7, $r0;;
     _32(0x7901a087),        //compd.gtu $r0 = $r7, $r2;;
     _32(0x08ffea00),        //cb.deqz $r0? 1799c <_malloc_r+0x1f4>;;
     _96(0x800000fae06c6000e0646400),        //make $r25 = 256400 (0x3e990)
     _96(0x08000000880000fa80000000),        //make $r27 = 256384 (0x3e980);;
     _96(0x80000106b8380419e0688000),        //make $r26 = 268800 (0x41a00)
     _32(0x00000000),        //ld $r14 = 16 (0x10)[$r25];;
     _32(0x3858020e),        //ld $r22 = 8 (0x8)[$r14];;
     _32(0x6858ff16),        //andd $r22 = $r22, -4 (0xfffffffc);;
     _32(0xf5010592),        //sbfd $r0 = $r18, $r22
     _32(0xf909a592),        //compd.gtu $r2 = $r18, $r22
     _32(0x7161058e),        //addd $r24 = $r14, $r22;;
     _32(0x640507c0),        //compd.le $r1 = $r0, 31 (0x1f);;
     _32(0x7a051081),        //orw $r1 = $r1, $r2;;
     _32(0x0c8020c1),        //cb.weqz $r1? 17d50 <_malloc_r+0x5a8>;;
     _32(0xea000013),        //copyd $r0 = $r19
     _96(0x88000106b808001be0048e00),        //make $r1 = 268856 (0x41a38)
     _32(0x08000000),        //ld $r2 = 0 (0x0)[$r27];;
     _32(0x38540001),        //ld $r21 = 0 (0x0)[$r1];;
     _32(0x6009ffc2),        //compd.ne $r2 = $r2, -1 (0xffffffff);;
     _32(0x71550552),        //addd $r21 = $r18, $r21;;
     _32(0xe1540815),        //addd $r21 = $r21, 32 (0x20)
     _64(0x08000004e10407d5),        //addd $r1 = $r21, 4127 (0x101f);;
     _64(0x07fffffce8040001),        //andd $r1 = $r1, -4096 (0xfffffffffffff000);;
     _32(0x70560042),        //cmoved.dnez $r2? $r21 = $r1;;
     _32(0x980001d0),        //call 182c0 <_sbrk_r>
     _32(0x6a040015),        //copyd $r1 = $r21;;
     _32(0xea5c0000),        //copyd $r23 = $r0
     _32(0x6001ffc0),        //compd.ne $r0 = $r0, -1 (0xffffffff);;
     _32(0x7905a5d8),        //compd.gtu $r1 = $r24, $r23;;
     _32(0x08804640),        //cb.deqz $r0? 17ff8 <_malloc_r+0x850>;;
     _96(0x00000000800000fae0006400),        //make $r0 = 256400 (0x3e990);;
     _32(0x7001a00e),        //compd.ne $r0 = $r14, $r0;;
     _32(0xf8011040),        //andw $r0 = $r0, $r1
     _32(0x7005a5d8),        //compd.ne $r1 = $r24, $r23;;
     _32(0x0c004480),        //cb.wnez $r0? 17ff8 <_malloc_r+0x850>;;
     _32(0x3000001a),        //lwz $r0 = 0 (0x0)[$r26];;
     _32(0xf1091540),        //addw $r2 = $r0, $r21
     _32(0x71011540),        //addw $r0 = $r0, $r21;;
     _32(0x88804101),        //cb.deqz $r1? 17fd0 <_malloc_r+0x828>
     _32(0x2609001a),        //sw 0 (0x0)[$r26] = $r2;;
     _32(0x3800001b),        //ld $r0 = 0 (0x0)[$r27];;
     _32(0x6001ffc0),        //compd.ne $r0 = $r0, -1 (0xffffffff);;
     _32(0x08804200),        //cb.deqz $r0? 17ff0 <_malloc_r+0x848>;;
     _32(0x750105d8),        //sbfd $r0 = $r24, $r23;;
     _32(0x71011080),        //addw $r0 = $r0, $r2;;
     _32(0x2601001a),        //sw 0 (0x0)[$r26] = $r0;;
     _32(0xe80003d7),        //andd $r0 = $r23, 15 (0xf)
     _32(0x60601000),        //make $r24 = 4096 (0x1000);;
     _32(0x08800140),        //cb.deqz $r0? 17bfc <_malloc_r+0x454>;;
     _32(0xe5040400),        //sbfd $r1 = $r0, 16 (0x10)
     _64(0x08000004e5600400),        //sbfd $r24 = $r0, 4112 (0x1010);;
     _32(0x715d0057),        //addd $r23 = $r23, $r1;;
     _32(0xf1050557),        //addd $r1 = $r23, $r21
     _32(0xea000013),        //copyd $r0 = $r19
     _32(0x60540001),        //make $r21 = 1 (0x1);;
     _64(0x00000003e804ffc1),        //andd $r1 = $r1, 4095 (0xfff);;
     _32(0x75610601),        //sbfd $r24 = $r1, $r24;;
     _32(0x980001ab),        //call 182c0 <_sbrk_r>
     _32(0x6a040018),        //copyd $r1 = $r24;;
     _32(0xe109ffc0),        //compd.eq $r2 = $r0, -1 (0xffffffff)
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x08000142),        //cb.dnez $r2? 17c38 <_malloc_r+0x490>;;
     _32(0xf5090017),        //sbfd $r2 = $r23, $r0
     _32(0x7804ffd8),        //zxwd $r1 = $r24;;
     _32(0x71550602),        //addd $r21 = $r2, $r24;;
     _32(0x6a540055),        //ord $r21 = $r21, 1 (0x1);;
     _32(0xf151a50e),        //compd.eq $r20 = $r14, $r20
     _32(0xe0100009),        //make $r4 = 9 (0x9)
     _96(0x900000fab000001ae0606400),        //make $r24 = 256400 (0x3e990)
     _32(0x10000000),        //lwz $r0 = 0 (0x0)[$r26];;
     _32(0x275d0418),        //sd 16 (0x10)[$r24] = $r23;;
     _32(0x27550217),        //sd 8 (0x8)[$r23] = $r21;;
     _32(0xf1091040),        //addw $r2 = $r0, $r1
     _32(0xf1011040),        //addw $r0 = $r0, $r1
     _32(0x690507d6),        //compd.gtu $r1 = $r22, 31 (0x1f);;
     _32(0x88004154),        //cb.dnez $r20? 18078 <_malloc_r+0x8d0>
     _32(0x2609001a),        //sw 0 (0x0)[$r26] = $r2;;
     _32(0x08804141),        //cb.deqz $r1? 18080 <_malloc_r+0x8d8>;;
     _32(0xe104fa16),        //addd $r1 = $r22, -24 (0xffffffe8)
     _32(0x3808020e),        //ld $r2 = 8 (0x8)[$r14];;
     _32(0x6804fc01),        //andd $r1 = $r1, -16 (0xfffffff0);;
     _32(0xf10d004e),        //addd $r3 = $r14, $r1
     _32(0x691507c1),        //compd.gtu $r5 = $r1, 31 (0x1f);;
     _32(0x68080042),        //andd $r2 = $r2, 1 (0x1);;
     _32(0x7a050042),        //ord $r1 = $r2, $r1;;
     _32(0x2705020e),        //sd 8 (0x8)[$r14] = $r1;;
     _32(0x27110203),        //sd 8 (0x8)[$r3] = $r4;;
     _32(0x88004545),        //cb.dnez $r5? 180e8 <_malloc_r+0x940>
     _32(0x27110403),        //sd 16 (0x10)[$r3] = $r4;;
     _32(0xea380017),        //copyd $r14 = $r23
     _32(0x38540217),        //ld $r21 = 8 (0x8)[$r23];;
     _32(0xe903f000),        //sxwd $r0 = $r0
     _96(0x0800000088000106e0088c00),        //make $r2 = 268848 (0x41a30);;
     _32(0x38040002),        //ld $r1 = 0 (0x0)[$r2];;
     _32(0x7805a040),        //compd.leu $r1 = $r0, $r1;;
     _32(0x08000081),        //cb.dnez $r1? 17cc4 <_malloc_r+0x51c>;;
     _32(0x27010002),        //sd 0 (0x0)[$r2] = $r0;;
     _96(0x0000000080000106e0088a00),        //make $r2 = 268840 (0x41a28);;
     _32(0x38040002),        //ld $r1 = 0 (0x0)[$r2];;
     _32(0x7805a040),        //compd.leu $r1 = $r0, $r1;;
     _32(0x08000081),        //cb.dnez $r1? 17ce0 <_malloc_r+0x538>;;
     _32(0x27010002),        //sd 0 (0x0)[$r2] = $r0;;
     _32(0x6854ff15),        //andd $r21 = $r21, -4 (0xfffffffc);;
     _32(0xf5010552),        //sbfd $r0 = $r18, $r21
     _32(0x7955a552),        //compd.gtu $r21 = $r18, $r21;;
     _32(0x640507c0),        //compd.le $r1 = $r0, 31 (0x1f);;
     _32(0x7a551055),        //orw $r21 = $r21, $r1;;
     _32(0x0c8005d5),        //cb.weqz $r21? 17d50 <_malloc_r+0x5a8>;;
     _32(0x98000116),        //call 18150 <__malloc_unlock>
     _32(0x6a000013),        //copyd $r0 = $r19;;
     _32(0x97ffff65),        //goto 17a94 <_malloc_r+0x2ec>
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x69050100),        //compd.gtu $r1 = $r0, 4 (0x4);;
     _32(0x080016c1),        //cb.dnez $r1? 17e78 <_malloc_r+0x6d0>;;
     _32(0x66175192),        //extfz $r5 = $r18, 37 (0x25), 6 (0x6);;
     _32(0xf1100e45),        //addw $r4 = $r5, 57 (0x39)
     _32(0xf1180e05),        //addw $r6 = $r5, 56 (0x38)
     _32(0x71140e45),        //addw $r5 = $r5, 57 (0x39);;
     _32(0x79123044),        //sllw $r4 = $r4, 1 (0x1);;
     _32(0x6913f004),        //sxwd $r4 = $r4;;
     _32(0x97fffedd),        //goto 1789c <_malloc_r+0xf4>
     _32(0x791220c4),        //slld $r4 = $r4, 3 (0x3);;
     _32(0xf109008e),        //addd $r2 = $r14, $r2
     _32(0x6a000013),        //copyd $r0 = $r19;;
     _32(0x38040202),        //ld $r1 = 8 (0x8)[$r2];;
     _32(0x6a040041),        //ord $r1 = $r1, 1 (0x1);;
     _32(0x98000104),        //call 18150 <__malloc_unlock>
     _32(0x27050202),        //sd 8 (0x8)[$r2] = $r1;;
     _32(0x97ffff53),        //goto 17a94 <_malloc_r+0x2ec>
     _32(0x6100040e),        //addd $r0 = $r14, 16 (0x10);;
     _32(0xea0c0052),        //ord $r3 = $r18, 1 (0x1)
     _32(0xf149048e),        //addd $r18 = $r14, $r18
     _32(0xea040040),        //ord $r1 = $r0, 1 (0x1)
     _96(0x18000000980000fae0086400),        //make $r2 = 256400 (0x3e990);;
     _32(0xea000013),        //copyd $r0 = $r19
     _32(0x270d020e),        //sd 8 (0x8)[$r14] = $r3;;
     _32(0x27490402),        //sd 16 (0x10)[$r2] = $r18;;
     _32(0x980000f7),        //call 18150 <__malloc_unlock>
     _32(0x27050212),        //sd 8 (0x8)[$r18] = $r1;;
     _32(0xe100040e),        //addd $r0 = $r14, 16 (0x10)
     _32(0x3840160c),        //ld $r16 = 88 (0x58)[$r12];;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0x3c48020c),        //lq $r18r19 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3c54060c),        //lo $r20r21r22r23 = 24 (0x18)[$r12];;
     _32(0x8fd00000),        //ret 
     _32(0xe130180c),        //addd $r12 = $r12, 96 (0x60)
     _32(0x3c640e0c),        //lo $r24r25r26r27 = 56 (0x38)[$r12];;
     _32(0xf105004e),        //addd $r1 = $r14, $r1
     _32(0xea000013),        //copyd $r0 = $r19
     _32(0x380c060e),        //ld $r3 = 24 (0x18)[$r14];;
     _32(0x3810040e),        //ld $r4 = 16 (0x10)[$r14];;
     _32(0x38080201),        //ld $r2 = 8 (0x8)[$r1];;
     _32(0x270d0604),        //sd 24 (0x18)[$r4] = $r3;;
     _32(0x27110403),        //sd 16 (0x10)[$r3] = $r4;;
     _32(0x6a080042),        //ord $r2 = $r2, 1 (0x1);;
     _32(0x980000e4),        //call 18150 <__malloc_unlock>
     _32(0x27090201),        //sd 8 (0x8)[$r1] = $r2;;
     _32(0xe100040e),        //addd $r0 = $r14, 16 (0x10)
     _32(0x3840160c),        //ld $r16 = 88 (0x58)[$r12];;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0x3c48020c),        //lq $r18r19 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3c54060c),        //lo $r20r21r22r23 = 24 (0x18)[$r12];;
     _32(0x8fd00000),        //ret 
     _32(0xe130180c),        //addd $r12 = $r12, 96 (0x60)
     _32(0x3c640e0c),        //lo $r24r25r26r27 = 56 (0x38)[$r12];;
     _32(0x7b062242),        //srld $r1 = $r2, 9 (0x9);;
     _32(0x69010101),        //compd.gtu $r0 = $r1, 4 (0x4);;
     _32(0x088014c0),        //cb.deqz $r0? 17f40 <_malloc_r+0x798>;;
     _32(0x69010501),        //compd.gtu $r0 = $r1, 20 (0x14);;
     _32(0x08002300),        //cb.dnez $r0? 1802c <_malloc_r+0x884>;;
     _32(0xf1001701),        //addw $r0 = $r1, 92 (0x5c)
     _32(0x710416c1),        //addw $r1 = $r1, 91 (0x5b);;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _96(0x800000fab80c6400e1006000),        //addd $r0 = $r0, 256384 (0x3e980)
     _96(0x18000000980000fa80000000),        //ld $r3 = 256400 (0x3e990)[$r0];;
     _32(0x7011a0c0),        //compd.ne $r4 = $r0, $r3;;
     _32(0x08801d44),        //cb.deqz $r4? 18004 <_malloc_r+0x85c>;;
     _32(0x38040203),        //ld $r1 = 8 (0x8)[$r3];;
     _32(0x6804ff01),        //andd $r1 = $r1, -4 (0xfffffffc);;
     _32(0x7905a081),        //compd.gtu $r1 = $r1, $r2;;
     _32(0x08800101),        //cb.deqz $r1? 17e50 <_malloc_r+0x6a8>;;
     _32(0x380c0403),        //ld $r3 = 16 (0x10)[$r3];;
     _32(0x7105a0c0),        //compd.eq $r1 = $r0, $r3;;
     _32(0x08fffe81),        //cb.deqz $r1? 17e34 <_malloc_r+0x68c>;;
     _96(0x800000fab8000603e0046400),        //make $r1 = 256400 (0x3e990)
     _32(0x00000000),        //ld $r0 = 24 (0x18)[$r3];;
     _32(0x38080201),        //ld $r2 = 8 (0x8)[$r1];;
     _32(0x2701060e),        //sd 24 (0x18)[$r14] = $r0;;
     _32(0x270d040e),        //sd 16 (0x10)[$r14] = $r3;;
     _32(0x27390400),        //sd 16 (0x10)[$r0] = $r14;;
     _32(0x97fffec6),        //goto 17988 <_malloc_r+0x1e0>
     _32(0x27390603),        //sd 24 (0x18)[$r3] = $r14;;
     _32(0x69050500),        //compd.gtu $r1 = $r0, 20 (0x14);;
     _32(0x08800e01),        //cb.deqz $r1? 17f5c <_malloc_r+0x7b4>;;
     _32(0x69051500),        //compd.gtu $r1 = $r0, 84 (0x54);;
     _32(0x08001cc1),        //cb.dnez $r1? 18050 <_malloc_r+0x8a8>;;
     _32(0x6617b312),        //extfz $r5 = $r18, 43 (0x2b), 12 (0xc);;
     _32(0xf1101bc5),        //addw $r4 = $r5, 111 (0x6f)
     _32(0xf1181b85),        //addw $r6 = $r5, 110 (0x6e)
     _32(0x71141bc5),        //addw $r5 = $r5, 111 (0x6f);;
     _32(0x79123044),        //sllw $r4 = $r4, 1 (0x1);;
     _32(0x6913f004),        //sxwd $r4 = $r4;;
     _32(0x97fffe7f),        //goto 1789c <_malloc_r+0xf4>
     _32(0x791220c4),        //slld $r4 = $r4, 3 (0x3);;
     _32(0xf1240049),        //addw $r9 = $r9, 1 (0x1)
     _32(0x61200408),        //addd $r8 = $r8, 16 (0x10);;
     _32(0xf80400c9),        //andw $r1 = $r9, 3 (0x3)
     _32(0x7824ffc9),        //zxwd $r9 = $r9;;
     _32(0x0c7fb441),        //cb.wnez $r1? 179fc <_malloc_r+0x254>;;
     _32(0x10000032),        //goto 17f84 <_malloc_r+0x7dc>;;
     _32(0xf109008e),        //addd $r2 = $r14, $r2
     _32(0xea000013),        //copyd $r0 = $r19
     _32(0x3810040e),        //ld $r4 = 16 (0x10)[$r14];;
     _32(0x380c0202),        //ld $r3 = 8 (0x8)[$r2];;
     _32(0x6a0c0043),        //ord $r3 = $r3, 1 (0x1);;
     _32(0x270d0202),        //sd 8 (0x8)[$r2] = $r3;;
     _32(0x27050604),        //sd 24 (0x18)[$r4] = $r1;;
     _32(0x9800009d),        //call 18150 <__malloc_unlock>
     _32(0x27110401),        //sd 16 (0x10)[$r1] = $r4;;
     _32(0x97fffeec),        //goto 17a94 <_malloc_r+0x2ec>
     _32(0x6100040e),        //addd $r0 = $r14, 16 (0x10);;
     _32(0x7b1620d2),        //srld $r5 = $r18, 3 (0x3);;
     _32(0xf1000045),        //addw $r0 = $r5, 1 (0x1)
     _32(0x7814ffc5),        //zxwd $r5 = $r5;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x97fffe3b),        //goto 177ec <_malloc_r+0x44>
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0xea140052),        //ord $r5 = $r18, 1 (0x1)
     _32(0xf149048e),        //addd $r18 = $r14, $r18
     _32(0xea100043),        //ord $r4 = $r3, 1 (0x1)
     _32(0x6a000013),        //copyd $r0 = $r19;;
     _32(0x2715020e),        //sd 8 (0x8)[$r14] = $r5;;
     _32(0x27490a14),        //sd 40 (0x28)[$r20] = $r18;;
     _32(0x27490814),        //sd 32 (0x20)[$r20] = $r18;;
     _32(0x27050612),        //sd 24 (0x18)[$r18] = $r1;;
     _32(0x27050412),        //sd 16 (0x10)[$r18] = $r1;;
     _32(0x27110212),        //sd 8 (0x8)[$r18] = $r4;;
     _32(0x98000088),        //call 18150 <__malloc_unlock>
     _32(0x270fe08e),        //sd $r2[$r14] = $r3;;
     _32(0x97fffed7),        //goto 17a94 <_malloc_r+0x2ec>
     _32(0x6100040e),        //addd $r0 = $r14, 16 (0x10);;
     _32(0x66075182),        //extfz $r1 = $r2, 37 (0x25), 6 (0x6);;
     _32(0xf1000e41),        //addw $r0 = $r1, 57 (0x39)
     _32(0x71040e01),        //addw $r1 = $r1, 56 (0x38);;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x97ffffb0),        //goto 17e14 <_malloc_r+0x66c>
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0xf1101700),        //addw $r4 = $r0, 92 (0x5c)
     _32(0xf11816c0),        //addw $r6 = $r0, 91 (0x5b)
     _32(0x71141700),        //addw $r5 = $r0, 92 (0x5c);;
     _32(0x79123044),        //sllw $r4 = $r4, 1 (0x1);;
     _32(0x6913f004),        //sxwd $r4 = $r4;;
     _32(0x97fffe4b),        //goto 1789c <_malloc_r+0xf4>
     _32(0x791220c4),        //slld $r4 = $r4, 3 (0x3);;
     _32(0x38040400),        //ld $r1 = 16 (0x10)[$r0];;
     _32(0x7105a001),        //compd.eq $r1 = $r1, $r0;;
     _32(0x08801b41),        //cb.deqz $r1? 18134 <_malloc_r+0x98c>;;
     _32(0xf80400c5),        //andw $r1 = $r5, 3 (0x3)
     _32(0xe100fc00),        //addd $r0 = $r0, -16 (0xfffffff0)
     _32(0x7114ffc5),        //addw $r5 = $r5, -1 (0xffffffff);;
     _32(0x0c7ffe81),        //cb.wnez $r1? 17f78 <_malloc_r+0x7d0>;;
     _32(0x3800020a),        //ld $r0 = 8 (0x8)[$r10];;
     _32(0x7e010007),        //andnd $r0 = $r7, $r0;;
     _32(0x2701020a),        //sd 8 (0x8)[$r10] = $r0;;
     _32(0x791e2047),        //slld $r7 = $r7, 1 (0x1);;
     _32(0xe0050007),        //compd.ne $r1 = $r7, 0 (0x0)
     _32(0x7809a007),        //compd.leu $r2 = $r7, $r0;;
     _32(0x78051081),        //andw $r1 = $r1, $r2;;
     _32(0x0c000101),        //cb.wnez $r1? 17fc0 <_malloc_r+0x818>;;
     _32(0x17fffed3),        //goto 17b00 <_malloc_r+0x358>;;
     _32(0xf91e2047),        //slld $r7 = $r7, 1 (0x1)
     _32(0x71240109),        //addw $r9 = $r9, 4 (0x4);;
     _32(0x78050007),        //andd $r1 = $r7, $r0;;
     _32(0x08ffff41),        //cb.deqz $r1? 17fb8 <_malloc_r+0x810>;;
     _32(0x97fffe84),        //goto 179d8 <_malloc_r+0x230>
     _32(0x6a140009),        //copyd $r5 = $r9;;
     _64(0x00000003e804ffd8),        //andd $r1 = $r24, 4095 (0xfff);;
     _32(0x087fbf01),        //cb.dnez $r1? 17bc8 <_malloc_r+0x420>;;
     _32(0xf1550556),        //addd $r21 = $r22, $r21
     _32(0x38380419),        //ld $r14 = 16 (0x10)[$r25];;
     _32(0x6a540055),        //ord $r21 = $r21, 1 (0x1);;
     _32(0x97ffff2f),        //goto 17ca4 <_malloc_r+0x4fc>
     _32(0x2755020e),        //sd 8 (0x8)[$r14] = $r21;;
     _32(0x97fffefc),        //goto 17be0 <_malloc_r+0x438>
     _32(0x275d001b),        //sd 0 (0x0)[$r27] = $r23;;
     _32(0x38380419),        //ld $r14 = 16 (0x10)[$r25];;
     _32(0x97ffff39),        //goto 17ce0 <_malloc_r+0x538>
     _32(0x3854020e),        //ld $r21 = 8 (0x8)[$r14];;
     _32(0xfa063081),        //sraw $r1 = $r1, 2 (0x2)
     _32(0xe0080001),        //make $r2 = 1 (0x1)
     _96(0x10000000900000fae0106400),        //make $r4 = 256400 (0x3e990);;
     _32(0xf90a6042),        //slld $r2 = $r2, $r1
     _32(0x38180204),        //ld $r6 = 8 (0x8)[$r4];;
     _32(0x7a090182),        //ord $r2 = $r2, $r6;;
     _32(0x97ffff90),        //goto 17e64 <_malloc_r+0x6bc>
     _32(0x27090204),        //sd 8 (0x8)[$r4] = $r2;;
     _32(0x69011501),        //compd.gtu $r0 = $r1, 84 (0x54);;
     _32(0x080005c0),        //cb.dnez $r0? 1808c <_malloc_r+0x8e4>;;
     _32(0x6607b302),        //extfz $r1 = $r2, 43 (0x2b), 12 (0xc);;
     _32(0xf1001bc1),        //addw $r0 = $r1, 111 (0x6f)
     _32(0x71041b81),        //addw $r1 = $r1, 110 (0x6e);;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x97ffff73),        //goto 17e14 <_malloc_r+0x66c>
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x69055500),        //compd.gtu $r1 = $r0, 340 (0x154);;
     _32(0x080005c1),        //cb.dnez $r1? 180b0 <_malloc_r+0x908>;;
     _32(0x6617e3d2),        //extfz $r5 = $r18, 46 (0x2e), 15 (0xf);;
     _32(0xf1101e05),        //addw $r4 = $r5, 120 (0x78)
     _32(0xf1181dc5),        //addw $r6 = $r5, 119 (0x77)
     _32(0x71141e05),        //addw $r5 = $r5, 120 (0x78);;
     _32(0x79123044),        //sllw $r4 = $r4, 1 (0x1);;
     _32(0x6913f004),        //sxwd $r4 = $r4;;
     _32(0x97fffe0b),        //goto 1789c <_malloc_r+0xf4>
     _32(0x791220c4),        //slld $r4 = $r4, 3 (0x3);;
     _32(0x97ffff0b),        //goto 17ca4 <_malloc_r+0x4fc>
     _32(0x6a380017),        //copyd $r14 = $r23;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x97ffff1d),        //goto 17cf8 <_malloc_r+0x550>
     _32(0x27010217),        //sd 8 (0x8)[$r23] = $r0;;
     _32(0x69015501),        //compd.gtu $r0 = $r1, 340 (0x154);;
     _32(0x08000740),        //cb.dnez $r0? 18104 <_malloc_r+0x95c>;;
     _32(0x6607e3c2),        //extfz $r1 = $r2, 46 (0x2e), 15 (0xf);;
     _32(0xf1001e01),        //addw $r0 = $r1, 120 (0x78)
     _32(0x71041dc1),        //addw $r1 = $r1, 119 (0x77);;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x97ffff5b),        //goto 17e14 <_malloc_r+0x66c>
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0xe01007f0),        //make $r4 = 2032 (0x7f0)
     _32(0xe014007f),        //make $r5 = 127 (0x7f)
     _32(0xe018007e),        //make $r6 = 126 (0x7e)
     _64(0x18000001e9015500),        //compd.gtu $r0 = $r0, 1364 (0x554);;
     _32(0x087f7d80),        //cb.dnez $r0? 1789c <_malloc_r+0xf4>;;
     _32(0x67171492),        //extfz $r5 = $r18, 49 (0x31), 18 (0x12);;
     _32(0xf1101f45),        //addw $r4 = $r5, 125 (0x7d)
     _32(0xf1181f05),        //addw $r6 = $r5, 124 (0x7c)
     _32(0x71141f45),        //addw $r5 = $r5, 125 (0x7d);;
     _32(0x79123044),        //sllw $r4 = $r4, 1 (0x1);;
     _32(0x6913f004),        //sxwd $r4 = $r4;;
     _32(0x97fffdef),        //goto 1789c <_malloc_r+0xf4>
     _32(0x791220c4),        //slld $r4 = $r4, 3 (0x3);;
     _32(0x980000ea),        //call 18490 <_free_r>
     _32(0xe104040e),        //addd $r1 = $r14, 16 (0x10)
     _32(0x6a000013),        //copyd $r0 = $r19;;
     _32(0x38380418),        //ld $r14 = 16 (0x10)[$r24];;
     _32(0x3000001a),        //lwz $r0 = 0 (0x0)[$r26];;
     _32(0x97fffeea),        //goto 17ca4 <_malloc_r+0x4fc>
     _32(0x3854020e),        //ld $r21 = 8 (0x8)[$r14];;
     _32(0xe00007f0),        //make $r0 = 2032 (0x7f0)
     _32(0xe004007e),        //make $r1 = 126 (0x7e)
     _64(0x10000001e90d5501),        //compd.gtu $r3 = $r1, 1364 (0x554);;
     _32(0x087fd003),        //cb.dnez $r3? 17e14 <_malloc_r+0x66c>;;
     _32(0x67071482),        //extfz $r1 = $r2, 49 (0x31), 18 (0x12);;
     _32(0xf1001f41),        //addw $r0 = $r1, 125 (0x7d)
     _32(0x71041f01),        //addw $r1 = $r1, 124 (0x7c);;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x97ffff3a),        //goto 17e14 <_malloc_r+0x66c>
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x97ffff9b),        //goto 17fa0 <_malloc_r+0x7f8>
     _32(0x3800020a),        //ld $r0 = 8 (0x8)[$r10];;
     _32(0x00000000)        //errop ;;
 |];

let __malloc_lock: list_I = 
 [|
     _32(0x97fffd2a),        //goto 175e8 <__libc_lock_acquire>
     _96(0x0000000080000106e0009000)        //make $r0 = 268864 (0x41a40);;
 |];

let __malloc_unlock: list_I = 
 [|
     _32(0x97fffd6a),        //goto 176f8 <__libc_lock_release>
     _96(0x0000000080000106e0009000)        //make $r0 = 268864 (0x41a40);;
 |];

let cleanup_glue: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0xea380001),        //copyd $r14 = $r1
     _32(0x2739020c),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0xea480000),        //copyd $r18 = $r0
     _32(0x2749040c),        //sd 16 (0x10)[$r12] = $r18;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x38040001),        //ld $r1 = 0 (0x0)[$r1];;
     _32(0x08800081),        //cb.deqz $r1? 18188 <cleanup_glue+0x28>;;
     _32(0x1ffffff7),        //call 18160 <cleanup_glue>;;
     _32(0xea04000e),        //copyd $r1 = $r14
     _32(0xea000012),        //copyd $r0 = $r18
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3848040c),        //ld $r18 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x100000bb)        //goto 18490 <_free_r>;;
 |];

let _reclaim_reent: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _96(0x08000000880000f8e0041000),        //make $r1 = 254016 (0x3e040);;
     _32(0xea480000),        //copyd $r18 = $r0
     _32(0xe04c0000),        //make $r19 = 0 (0x0)
     _32(0x2849020c),        //sq 8 (0x8)[$r12] = $r18r19;;
     _32(0x2739000c),        //sd 0 (0x0)[$r12] = $r14;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x38040001),        //ld $r1 = 0 (0x0)[$r1];;
     _32(0x7005a001),        //compd.ne $r1 = $r1, $r0;;
     _32(0x08800d01),        //cb.deqz $r1? 182a8 <_reclaim_reent+0x100>;;
     _32(0x38041e00),        //ld $r1 = 120 (0x78)[$r0];;
     _32(0x088003c1),        //cb.deqz $r1? 1821c <_reclaim_reent+0x74>;;
     _32(0x383ae4c1),        //ld $r14 = $r19[$r1];;
     _32(0x088001ce),        //cb.deqz $r14? 18204 <_reclaim_reent+0x5c>;;
     _32(0x980000a9),        //call 18490 <_free_r>
     _32(0xea04000e),        //copyd $r1 = $r14
     _32(0xea000012),        //copyd $r0 = $r18
     _32(0x3838000e),        //ld $r14 = 0 (0x0)[$r14];;
     _32(0x087fff0e),        //cb.dnez $r14? 181ec <_reclaim_reent+0x44>;;
     _32(0x38041e12),        //ld $r1 = 120 (0x78)[$r18];;
     _32(0x614c0213),        //addd $r19 = $r19, 8 (0x8);;
     _64(0x00000000e0018013),        //compd.ne $r0 = $r19, 512 (0x200);;
     _32(0x087ffd40),        //cb.dnez $r0? 181e4 <_reclaim_reent+0x3c>;;
     _32(0x9800009f),        //call 18490 <_free_r>
     _32(0x6a000012),        //copyd $r0 = $r18;;
     _32(0xea000012),        //copyd $r0 = $r18
     _32(0x38041812),        //ld $r1 = 96 (0x60)[$r18];;
     _32(0x08800081),        //cb.deqz $r1? 1822c <_reclaim_reent+0x84>;;
     _32(0x1800009a),        //call 18490 <_free_r>;;
     _64(0xb8387e12e14c8012),        //addd $r19 = $r18, 512 (0x200)
     _32(0x00000000),        //ld $r14 = 504 (0x1f8)[$r18];;
     _32(0x7101a4ce),        //compd.eq $r0 = $r14, $r19;;
     _32(0x0880020e),        //cb.deqz $r14? 1825c <_reclaim_reent+0xb4>;;
     _32(0x080001c0),        //cb.dnez $r0? 1825c <_reclaim_reent+0xb4>;;
     _32(0x98000093),        //call 18490 <_free_r>
     _32(0xea04000e),        //copyd $r1 = $r14
     _32(0xea000012),        //copyd $r0 = $r18
     _32(0x3838000e),        //ld $r14 = 0 (0x0)[$r14];;
     _32(0x7001a393),        //compd.ne $r0 = $r19, $r14;;
     _32(0x087ffec0),        //cb.dnez $r0? 18244 <_reclaim_reent+0x9c>;;
     _32(0xea000012),        //copyd $r0 = $r18
     _32(0x38042212),        //ld $r1 = 136 (0x88)[$r18];;
     _32(0x08800081),        //cb.deqz $r1? 1826c <_reclaim_reent+0xc4>;;
     _32(0x1800008a),        //call 18490 <_free_r>;;
     _32(0x30001412),        //lwz $r0 = 80 (0x50)[$r18];;
     _32(0x0c800380),        //cb.weqz $r0? 182a8 <_reclaim_reent+0x100>;;
     _32(0xea000012),        //copyd $r0 = $r18
     _32(0x38041612),        //ld $r1 = 88 (0x58)[$r18];;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0xea000012),        //copyd $r0 = $r18
     _64(0x18000001b8044812),        //ld $r1 = 1312 (0x520)[$r18];;
     _32(0x088001c1),        //cb.deqz $r1? 182a8 <_reclaim_reent+0x100>;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3c48020c),        //lq $r18r19 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x17ffffaf),        //goto 18160 <cleanup_glue>;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3c48020c),        //lq $r18r19 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000)        //ret ;;
 |];

let _sbrk_r: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0xea380000),        //copyd $r14 = $r0
     _32(0xea000001),        //copyd $r0 = $r1
     _32(0x2739020c),        //sd 8 (0x8)[$r12] = $r14;;
     _96(0x80000117a749040ce0482200),        //make $r18 = 285832 (0x45c88)
     _32(0x00000000),        //sd 16 (0x10)[$r12] = $r18;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980002f1),        //call 18eb0 <_sbrk>
     _32(0x26090012),        //sw 0 (0x0)[$r18] = $r2;;
     _32(0x6005ffc0),        //compd.ne $r1 = $r0, -1 (0xffffffff);;
     _32(0x088001c1),        //cb.deqz $r1? 18314 <_sbrk_r+0x54>;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3848040c),        //ld $r18 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0x30040012),        //lwz $r1 = 0 (0x0)[$r18];;
     _32(0x08fffe41),        //cb.deqz $r1? 182fc <_sbrk_r+0x3c>;;
     _32(0x2605000e),        //sw 0 (0x0)[$r14] = $r1;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3848040c),        //ld $r18 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000)        //ret ;;
 |];

let _malloc_trim_r: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0xea4c0000),        //copyd $r19 = $r0
     _32(0x2849080c),        //sq 32 (0x20)[$r12] = $r18r19;;
     _32(0xea380001),        //copyd $r14 = $r1
     _32(0x2739060c),        //sd 24 (0x18)[$r12] = $r14;;
     _64(0xa7410e0ce538f7ce),        //sbfd $r14 = $r14, 4063 (0xfdf)
     _32(0x00000003),        //sd 56 (0x38)[$r12] = $r16;;
     _32(0x9fffff79),        //call 18140 <__malloc_lock>
     _96(0x800000faa7510c0ce0506400),        //make $r20 = 256400 (0x3e990)
     _32(0x00000000),        //sd 48 (0x30)[$r12] = $r20;;
     _32(0xe0040000),        //make $r1 = 0 (0x0)
     _32(0x38000414),        //ld $r0 = 16 (0x10)[$r20];;
     _32(0x38480200),        //ld $r18 = 8 (0x8)[$r0];;
     _32(0x6848ff12),        //andd $r18 = $r18, -4 (0xfffffffc);;
     _32(0x7139048e),        //addd $r14 = $r14, $r18;;
     _32(0x7b3a230e),        //srld $r14 = $r14, 12 (0xc);;
     _32(0x6138ffce),        //addd $r14 = $r14, -1 (0xffffffff);;
     _32(0x793a230e),        //slld $r14 = $r14, 12 (0xc);;
     _64(0x00000003e501ffce),        //compd.gt $r0 = $r14, 4095 (0xfff);;
     _32(0x088001c0),        //cb.deqz $r0? 183b4 <_malloc_trim_r+0x7c>;;
     _32(0x9fffffc9),        //call 182c0 <_sbrk_r>
     _32(0x6a000013),        //copyd $r0 = $r19;;
     _32(0x38040414),        //ld $r1 = 16 (0x10)[$r20];;
     _32(0x71050481),        //addd $r1 = $r1, $r18;;
     _32(0x7001a040),        //compd.ne $r0 = $r0, $r1;;
     _32(0x088002c0),        //cb.deqz $r0? 183dc <_malloc_trim_r+0xa4>;;
     _32(0x9fffff67),        //call 18150 <__malloc_unlock>
     _32(0x6a000013),        //copyd $r0 = $r19;;
     _32(0xe0000000),        //make $r0 = 0 (0x0)
     _32(0x38400e0c),        //ld $r16 = 56 (0x38)[$r12];;
     _32(0x3838060c),        //ld $r14 = 24 (0x18)[$r12];;
     _32(0x3c48080c),        //lq $r18r19 = 32 (0x20)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x8fd00000),        //ret 
     _32(0xe130100c),        //addd $r12 = $r12, 64 (0x40)
     _32(0x38500c0c),        //ld $r20 = 48 (0x30)[$r12];;
     _32(0x9fffffb9),        //call 182c0 <_sbrk_r>
     _32(0xe504000e),        //negd $r1 = $r14
     _32(0x6a000013),        //copyd $r0 = $r19;;
     _32(0xe001ffc0),        //compd.ne $r0 = $r0, -1 (0xffffffff)
     _32(0xf549048e),        //sbfd $r18 = $r14, $r18
     _96(0x1000000090000106e0088000),        //make $r2 = 268800 (0x41a00);;
     _32(0x6a480052),        //ord $r18 = $r18, 1 (0x1);;
     _32(0x08800400),        //cb.deqz $r0? 18440 <_malloc_trim_r+0x108>;;
     _32(0xea000013),        //copyd $r0 = $r19
     _32(0x30040002),        //lwz $r1 = 0 (0x0)[$r2];;
     _32(0x380c0414),        //ld $r3 = 16 (0x10)[$r20];;
     _32(0xf539104e),        //sbfw $r14 = $r14, $r1
     _32(0x27490203),        //sd 8 (0x8)[$r3] = $r18;;
     _32(0x9fffff4e),        //call 18150 <__malloc_unlock>
     _32(0x26390002),        //sw 0 (0x0)[$r2] = $r14;;
     _32(0xe0000001),        //make $r0 = 1 (0x1)
     _32(0x38400e0c),        //ld $r16 = 56 (0x38)[$r12];;
     _32(0x3838060c),        //ld $r14 = 24 (0x18)[$r12];;
     _32(0x3c48080c),        //lq $r18r19 = 32 (0x20)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x8fd00000),        //ret 
     _32(0xe130100c),        //addd $r12 = $r12, 64 (0x40)
     _32(0x38500c0c),        //ld $r20 = 48 (0x30)[$r12];;
     _32(0x9fffffa0),        //call 182c0 <_sbrk_r>
     _32(0xe0040000),        //make $r1 = 0 (0x0)
     _32(0x6a000013),        //copyd $r0 = $r19;;
     _32(0x38080414),        //ld $r2 = 16 (0x10)[$r20];;
     _32(0x75050002),        //sbfd $r1 = $r2, $r0;;
     _32(0x640d07c1),        //compd.le $r3 = $r1, 31 (0x1f);;
     _32(0x087ff5c3),        //cb.dnez $r3? 183b4 <_malloc_trim_r+0x7c>;;
     _32(0xea040041),        //ord $r1 = $r1, 1 (0x1)
     _96(0x880000fae00c8000e0106000),        //make $r4 = 256384 (0x3e980)
     _96(0x100000009000010688000000),        //make $r3 = 268800 (0x41a00);;
     _32(0x38100004),        //ld $r4 = 0 (0x0)[$r4];;
     _32(0x27050202),        //sd 8 (0x8)[$r2] = $r1;;
     _32(0x75010004),        //sbfd $r0 = $r4, $r0;;
     _32(0x97ffffcc),        //goto 183b4 <_malloc_trim_r+0x7c>
     _32(0x26010003),        //sw 0 (0x0)[$r3] = $r0;;
     _32(0x7f03f000)        //nop ;;
 |];

let _free_r: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0xea380001),        //copyd $r14 = $r1
     _32(0x2739020c),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0xea480000),        //copyd $r18 = $r0
     _32(0x2749040c),        //sd 16 (0x10)[$r12] = $r18;;
     _32(0x888014c1),        //cb.deqz $r1? 185f4 <_free_r+0x164>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1fffff24),        //call 18140 <__malloc_lock>;;
     _32(0xe11cfc0e),        //addd $r7 = $r14, -16 (0xfffffff0)
     _96(0x880000fab818fe0ee0146400),        //make $r5 = 256400 (0x3e990)
     _32(0x08000000),        //ld $r6 = -8 (0xfffffff8)[$r14];;
     _32(0x38100405),        //ld $r4 = 16 (0x10)[$r5];;
     _32(0x6804ff86),        //andd $r1 = $r6, -2 (0xfffffffe);;
     _32(0x710d0047),        //addd $r3 = $r7, $r1;;
     _32(0xf011a0c4),        //compd.ne $r4 = $r4, $r3
     _32(0x38080203),        //ld $r2 = 8 (0x8)[$r3];;
     _32(0x88802144),        //cb.deqz $r4? 186f0 <_free_r+0x260>
     _32(0x6808ff02),        //andd $r2 = $r2, -4 (0xfffffffc);;
     _32(0x8b000d86),        //cb.odd $r6? 185bc <_free_r+0x12c>
     _32(0xf1010083),        //addd $r0 = $r3, $r2
     _32(0x27090203),        //sd 8 (0x8)[$r3] = $r2;;
     _32(0xe1140405),        //addd $r5 = $r5, 16 (0x10)
     _32(0x3810fc0e),        //ld $r4 = -16 (0xfffffff0)[$r14];;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _32(0xf51d01c4),        //sbfd $r7 = $r4, $r7
     _32(0x71050101),        //addd $r1 = $r1, $r4;;
     _32(0xe8000040),        //andd $r0 = $r0, 1 (0x1)
     _32(0x38100407),        //ld $r4 = 16 (0x10)[$r7];;
     _32(0x7119a144),        //compd.eq $r6 = $r4, $r5;;
     _32(0x08001a06),        //cb.dnez $r6? 186b0 <_free_r+0x220>;;
     _32(0x38180607),        //ld $r6 = 24 (0x18)[$r7];;
     _32(0x27190604),        //sd 24 (0x18)[$r4] = $r6;;
     _32(0x88802700),        //cb.deqz $r0? 1878c <_free_r+0x2fc>
     _32(0x27110406),        //sd 16 (0x10)[$r6] = $r4;;
     _32(0x6a000041),        //ord $r0 = $r1, 1 (0x1);;
     _32(0x27010207),        //sd 8 (0x8)[$r7] = $r0;;
     _32(0x27050003),        //sd 0 (0x0)[$r3] = $r1;;
     _32(0x69017fc1),        //compd.gtu $r0 = $r1, 511 (0x1ff);;
     _32(0x08000ec0),        //cb.dnez $r0? 18620 <_free_r+0x190>;;
     _32(0xe60720c1),        //extfz $r1 = $r1, 34 (0x22), 3 (0x3)
     _32(0xe0080001),        //make $r2 = 1 (0x1)
     _96(0x10000000900000fae00c6400),        //make $r3 = 256400 (0x3e990);;
     _32(0xf1000041),        //addw $r0 = $r1, 1 (0x1)
     _32(0xfa063081),        //sraw $r1 = $r1, 2 (0x2)
     _32(0x38100203),        //ld $r4 = 8 (0x8)[$r3];;
     _32(0xf9023040),        //sllw $r0 = $r0, 1 (0x1)
     _32(0x79066042),        //slld $r1 = $r2, $r1;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0xf90220c0),        //slld $r0 = $r0, 3 (0x3)
     _32(0x7a050101),        //ord $r1 = $r1, $r4;;
     _96(0x800000fab8086400e1106000),        //addd $r4 = $r0, 256384 (0x3e980)
     _96(0x18000000980000fa80000000),        //ld $r2 = 256400 (0x3e990)[$r0];;
     _32(0x27110607),        //sd 24 (0x18)[$r7] = $r4;;
     _32(0x27050203),        //sd 8 (0x8)[$r3] = $r1;;
     _32(0x27090407),        //sd 16 (0x10)[$r7] = $r2;;
     _96(0x18000000980000faa71d6400),        //sd 256400 (0x3e990)[$r0] = $r7;;
     _32(0x271d0602),        //sd 24 (0x18)[$r2] = $r7;;
     _32(0xea000012),        //copyd $r0 = $r18
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3848040c),        //ld $r18 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x17fffee6),        //goto 18150 <__malloc_unlock>;;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _32(0x0b0004c0),        //cb.odd $r0? 1860c <_free_r+0x17c>;;
     _32(0xf1050081),        //addd $r1 = $r1, $r2
     _32(0x61140405),        //addd $r5 = $r5, 16 (0x10);;
     _32(0xea100041),        //ord $r4 = $r1, 1 (0x1)
     _32(0x38000403),        //ld $r0 = 16 (0x10)[$r3];;
     _32(0x7009a140),        //compd.ne $r2 = $r0, $r5;;
     _32(0x08801d42),        //cb.deqz $r2? 187ac <_free_r+0x31c>;;
     _32(0x38080603),        //ld $r2 = 24 (0x18)[$r3];;
     _32(0x27090600),        //sd 24 (0x18)[$r0] = $r2;;
     _32(0x27010402),        //sd 16 (0x10)[$r2] = $r0;;
     _32(0x27110207),        //sd 8 (0x8)[$r7] = $r4;;
     _32(0x97ffffd1),        //goto 18530 <_free_r+0xa0>
     _32(0x2707e047),        //sd $r1[$r7] = $r1;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3848040c),        //ld $r18 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0x6a000041),        //ord $r0 = $r1, 1 (0x1);;
     _32(0xe9017fc1),        //compd.gtu $r0 = $r1, 511 (0x1ff)
     _32(0x2701fe0e),        //sd -8 (0xfffffff8)[$r14] = $r0;;
     _32(0x27050003),        //sd 0 (0x0)[$r3] = $r1;;
     _32(0x08fff1c0),        //cb.deqz $r0? 18538 <_free_r+0xa8>;;
     _32(0x7b022241),        //srld $r0 = $r1, 9 (0x9);;
     _32(0x69090100),        //compd.gtu $r2 = $r0, 4 (0x4);;
     _32(0x08001382),        //cb.dnez $r2? 18760 <_free_r+0x2d0>;;
     _32(0x66035181),        //extfz $r0 = $r1, 37 (0x25), 6 (0x6);;
     _32(0xf1100e40),        //addw $r4 = $r0, 57 (0x39)
     _32(0x71000e00),        //addw $r0 = $r0, 56 (0x38);;
     _32(0x79123044),        //sllw $r4 = $r4, 1 (0x1);;
     _32(0x6913f004),        //sxwd $r4 = $r4;;
     _32(0x791220c4),        //slld $r4 = $r4, 3 (0x3);;
     _96(0x800000fab80c6404e1106004),        //addd $r4 = $r4, 256384 (0x3e980)
     _96(0x18000000980000fa80000000),        //ld $r3 = 256400 (0x3e990)[$r4];;
     _32(0x7009a0c4),        //compd.ne $r2 = $r4, $r3;;
     _32(0x08801702),        //cb.deqz $r2? 187d0 <_free_r+0x340>;;
     _32(0x38080203),        //ld $r2 = 8 (0x8)[$r3];;
     _32(0x6808ff02),        //andd $r2 = $r2, -4 (0xfffffffc);;
     _32(0x7909a042),        //compd.gtu $r2 = $r2, $r1;;
     _32(0x08800102),        //cb.deqz $r2? 18680 <_free_r+0x1f0>;;
     _32(0x380c0403),        //ld $r3 = 16 (0x10)[$r3];;
     _32(0x7101a0c4),        //compd.eq $r0 = $r4, $r3;;
     _32(0x08fffe80),        //cb.deqz $r0? 18664 <_free_r+0x1d4>;;
     _32(0x38100603),        //ld $r4 = 24 (0x18)[$r3];;
     _32(0xea000012),        //copyd $r0 = $r18
     _32(0x27110607),        //sd 24 (0x18)[$r7] = $r4;;
     _32(0x270d0407),        //sd 16 (0x10)[$r7] = $r3;;
     _32(0x271d0404),        //sd 16 (0x10)[$r4] = $r7;;
     _32(0x271d0603),        //sd 24 (0x18)[$r3] = $r7;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3848040c),        //ld $r18 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x17fffea9),        //goto 18150 <__malloc_unlock>;;
     _32(0x080019c0),        //cb.dnez $r0? 1884c <_free_r+0x3bc>;;
     _32(0xf1050042),        //addd $r1 = $r2, $r1
     _32(0x38000603),        //ld $r0 = 24 (0x18)[$r3];;
     _32(0xea080041),        //ord $r2 = $r1, 1 (0x1)
     _32(0x380c0403),        //ld $r3 = 16 (0x10)[$r3];;
     _32(0x27010603),        //sd 24 (0x18)[$r3] = $r0;;
     _32(0xea000012),        //copyd $r0 = $r18
     _32(0x270d0400),        //sd 16 (0x10)[$r0] = $r3;;
     _32(0x27090207),        //sd 8 (0x8)[$r7] = $r2;;
     _32(0x2707e047),        //sd $r1[$r7] = $r1;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3848040c),        //ld $r18 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x17fffe99),        //goto 18150 <__malloc_unlock>;;
     _32(0x8b000246),        //cb.odd $r6? 18714 <_free_r+0x284>
     _32(0x71050081),        //addd $r1 = $r1, $r2;;
     _32(0x3800fc0e),        //ld $r0 = -16 (0xfffffff0)[$r14];;
     _32(0xf51d01c0),        //sbfd $r7 = $r0, $r7
     _32(0x71050001),        //addd $r1 = $r1, $r0;;
     _32(0x38080407),        //ld $r2 = 16 (0x10)[$r7];;
     _32(0x38000607),        //ld $r0 = 24 (0x18)[$r7];;
     _32(0x27010602),        //sd 24 (0x18)[$r2] = $r0;;
     _32(0x27090400),        //sd 16 (0x10)[$r0] = $r2;;
     _32(0xea0c0041),        //ord $r3 = $r1, 1 (0x1)
     _96(0x880000fae0006400e0086200),        //make $r2 = 256392 (0x3e988)
     _96(0x10000000900000fa88000000),        //make $r0 = 256400 (0x3e990);;
     _32(0x38080002),        //ld $r2 = 0 (0x0)[$r2];;
     _32(0x270d0207),        //sd 8 (0x8)[$r7] = $r3;;
     _32(0x271d0400),        //sd 16 (0x10)[$r0] = $r7;;
     _32(0x7905a042),        //compd.gtu $r1 = $r2, $r1;;
     _32(0x087fe601),        //cb.dnez $r1? 185a0 <_free_r+0x110>;;
     _32(0xea000012),        //copyd $r0 = $r18
     _96(0x0800000088000106e0048e00),        //make $r1 = 268856 (0x41a38);;
     _32(0x9ffffef9),        //call 18338 <_malloc_trim_r>
     _32(0x38040001),        //ld $r1 = 0 (0x0)[$r1];;
     _32(0x17ffff91),        //goto 185a0 <_free_r+0x110>;;
     _32(0x69090500),        //compd.gtu $r2 = $r0, 20 (0x14);;
     _32(0x08800302),        //cb.deqz $r2? 18794 <_free_r+0x304>;;
     _32(0x69091500),        //compd.gtu $r2 = $r0, 84 (0x54);;
     _32(0x080008c2),        //cb.dnez $r2? 187f8 <_free_r+0x368>;;
     _32(0x6603b301),        //extfz $r0 = $r1, 43 (0x2b), 12 (0xc);;
     _32(0xf1101bc0),        //addw $r4 = $r0, 111 (0x6f)
     _32(0x71001b80),        //addw $r0 = $r0, 110 (0x6e);;
     _32(0x79123044),        //sllw $r4 = $r4, 1 (0x1);;
     _32(0x6913f004),        //sxwd $r4 = $r4;;
     _32(0x97ffffb0),        //goto 18644 <_free_r+0x1b4>
     _32(0x791220c4),        //slld $r4 = $r4, 3 (0x3);;
     _32(0x97ffff90),        //goto 185cc <_free_r+0x13c>
     _32(0x71050081),        //addd $r1 = $r1, $r2;;
     _32(0xf1101700),        //addw $r4 = $r0, 92 (0x5c)
     _32(0x710016c0),        //addw $r0 = $r0, 91 (0x5b);;
     _32(0x79123044),        //sllw $r4 = $r4, 1 (0x1);;
     _32(0x6913f004),        //sxwd $r4 = $r4;;
     _32(0x97ffffa8),        //goto 18644 <_free_r+0x1b4>
     _32(0x791220c4),        //slld $r4 = $r4, 3 (0x3);;
     _96(0x00000000800000fae0006400),        //make $r0 = 256400 (0x3e990);;
     _32(0x271d0a00),        //sd 40 (0x28)[$r0] = $r7;;
     _32(0x271d0800),        //sd 32 (0x20)[$r0] = $r7;;
     _32(0x27150607),        //sd 24 (0x18)[$r7] = $r5;;
     _32(0x28110207),        //sq 8 (0x8)[$r7] = $r4r5;;
     _32(0x97ffff76),        //goto 185a0 <_free_r+0x110>
     _32(0x2707e047),        //sd $r1[$r7] = $r1;;
     _32(0xe0040001),        //make $r1 = 1 (0x1)
     _32(0xfa023080),        //sraw $r0 = $r0, 2 (0x2)
     _96(0x10000000900000fae0086400),        //make $r2 = 256400 (0x3e990);;
     _32(0xf9026001),        //slld $r0 = $r1, $r0
     _32(0x38140202),        //ld $r5 = 8 (0x8)[$r2];;
     _32(0x7a010140),        //ord $r0 = $r0, $r5;;
     _32(0x97ffffa5),        //goto 18684 <_free_r+0x1f4>
     _32(0x27010202),        //sd 8 (0x8)[$r2] = $r0;;
     _32(0x69095500),        //compd.gtu $r2 = $r0, 340 (0x154);;
     _32(0x08000202),        //cb.dnez $r2? 1881c <_free_r+0x38c>;;
     _32(0x6603e3c1),        //extfz $r0 = $r1, 46 (0x2e), 15 (0xf);;
     _32(0xf1101e00),        //addw $r4 = $r0, 120 (0x78)
     _32(0x71001dc0),        //addw $r0 = $r0, 119 (0x77);;
     _32(0x79123044),        //sllw $r4 = $r4, 1 (0x1);;
     _32(0x6913f004),        //sxwd $r4 = $r4;;
     _32(0x97ffff8c),        //goto 18644 <_free_r+0x1b4>
     _32(0x791220c4),        //slld $r4 = $r4, 3 (0x3);;
     _32(0xe01007f0),        //make $r4 = 2032 (0x7f0)
     _32(0xe000007e),        //make $r0 = 126 (0x7e)
     _64(0x10000001e9095500),        //compd.gtu $r2 = $r0, 1364 (0x554);;
     _32(0x087fe182),        //cb.dnez $r2? 18644 <_free_r+0x1b4>;;
     _32(0x67031481),        //extfz $r0 = $r1, 49 (0x31), 18 (0x12);;
     _32(0xf1101f40),        //addw $r4 = $r0, 125 (0x7d)
     _32(0x71001f00),        //addw $r0 = $r0, 124 (0x7c);;
     _32(0x79123044),        //sllw $r4 = $r4, 1 (0x1);;
     _32(0x6913f004),        //sxwd $r4 = $r4;;
     _32(0x97ffff80),        //goto 18644 <_free_r+0x1b4>
     _32(0x791220c4),        //slld $r4 = $r4, 3 (0x3);;
     _32(0x6a000041),        //ord $r0 = $r1, 1 (0x1);;
     _32(0x27010207),        //sd 8 (0x8)[$r7] = $r0;;
     _32(0x97ffff53),        //goto 185a0 <_free_r+0x110>
     _32(0x27050003),        //sd 0 (0x0)[$r3] = $r1;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100010000; //0x16910
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(feq, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fne, 0b00010110100001001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(flt, 0b00010110100001110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fge, 0b00010110100010011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fgt, 0b00010110100011000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fle, 0b00010110100011101000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110110110101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit, 0b00010110110111001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__libc_fini_array, 0b00010110111000010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__libc_init_array, 0b00010110111001110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(_init_signal_r_part_0, 0b00010110111100010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(_init_signal_r, 0b00010110111101111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(_signal_r, 0b00010110111110010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(_raise_r, 0b00010111000000110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__sigtramp_r, 0b00010111000100011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(raise, 0b00010111000111001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(signal, 0b00010111000111100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(_init_signal, 0b00010111001010010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__sigtramp, 0b00010111001010111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(_kill_r, 0b00010111001011010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(_getpid_r, 0b00010111001101011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__call_exitprocs, 0b00010111001101100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__libc_lock_init, 0b00010111010100001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__libc_lock_close, 0b00010111010100011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__libc_lock_try_acquire, 0b00010111010100100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__libc_lock_acquire, 0b00010111010111101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__libc_lock_release, 0b00010111011011111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(_malloc_r, 0b00010111011110101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__malloc_lock, 0b00011000000101000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__malloc_unlock, 0b00011000000101010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(cleanup_glue, 0b00011000000101100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(_reclaim_reent, 0b00011000000110101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(_sbrk_r, 0b00011000001011000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(_malloc_trim_r, 0b00011000001100111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(_free_r, 0b00011000010010010000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016910;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
