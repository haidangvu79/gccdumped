// executing pipeline tstdi_1 test 
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

let exit_: list_I = 
 [|
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
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110110111001000, num_instr, mI);
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
