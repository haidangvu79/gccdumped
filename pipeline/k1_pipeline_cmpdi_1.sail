// executing pipeline cmpdi_1 test 
val k1_pipeline_cmpdi_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_cmpdi_1() = {
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
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x7001a001),        //compd.ne $r0 = $r1, $r0;;
     _32(0x080000c0),        //cb.dnez $r0? 16844 <feq+0x24>;;
     _32(0x6000000d),        //make $r0 = 13 (0xd);;
     _32(0x10000002),        //goto 16848 <feq+0x28>;;
     _32(0x6000008c),        //make $r0 = 140 (0x8c);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let fne: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x080000c0),        //cb.dnez $r0? 16874 <fne+0x24>;;
     _32(0x6000000d),        //make $r0 = 13 (0xd);;
     _32(0x10000002),        //goto 16878 <fne+0x28>;;
     _32(0x6000008c),        //make $r0 = 140 (0x8c);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let flt: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x7301a001),        //compd.ge $r0 = $r1, $r0;;
     _32(0x080000c0),        //cb.dnez $r0? 168a4 <flt+0x24>;;
     _32(0x6000000d),        //make $r0 = 13 (0xd);;
     _32(0x10000002),        //goto 168a8 <flt+0x28>;;
     _32(0x6000008c),        //make $r0 = 140 (0x8c);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let fge: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x7201a001),        //compd.lt $r0 = $r1, $r0;;
     _32(0x080000c0),        //cb.dnez $r0? 168d4 <fge+0x24>;;
     _32(0x6000000d),        //make $r0 = 13 (0xd);;
     _32(0x10000002),        //goto 168d8 <fge+0x28>;;
     _32(0x6000008c),        //make $r0 = 140 (0x8c);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let fgt: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x7401a001),        //compd.le $r0 = $r1, $r0;;
     _32(0x080000c0),        //cb.dnez $r0? 16904 <fgt+0x24>;;
     _32(0x6000000d),        //make $r0 = 13 (0xd);;
     _32(0x10000002),        //goto 16908 <fgt+0x28>;;
     _32(0x6000008c),        //make $r0 = 140 (0x8c);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let fle: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x7501a001),        //compd.gt $r0 = $r1, $r0;;
     _32(0x080000c0),        //cb.dnez $r0? 16934 <fle+0x24>;;
     _32(0x6000000d),        //make $r0 = 13 (0xd);;
     _32(0x10000002),        //goto 16938 <fle+0x28>;;
     _32(0x6000008c),        //make $r0 = 140 (0x8c);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let fltu: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x7701a001),        //compd.geu $r0 = $r1, $r0;;
     _32(0x080000c0),        //cb.dnez $r0? 16964 <fltu+0x24>;;
     _32(0x6000000d),        //make $r0 = 13 (0xd);;
     _32(0x10000002),        //goto 16968 <fltu+0x28>;;
     _32(0x6000008c),        //make $r0 = 140 (0x8c);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let fgeu: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x7601a001),        //compd.ltu $r0 = $r1, $r0;;
     _32(0x080000c0),        //cb.dnez $r0? 16994 <fgeu+0x24>;;
     _32(0x6000000d),        //make $r0 = 13 (0xd);;
     _32(0x10000002),        //goto 16998 <fgeu+0x28>;;
     _32(0x6000008c),        //make $r0 = 140 (0x8c);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let fgtu: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x7801a001),        //compd.leu $r0 = $r1, $r0;;
     _32(0x080000c0),        //cb.dnez $r0? 169c4 <fgtu+0x24>;;
     _32(0x6000000d),        //make $r0 = 13 (0xd);;
     _32(0x10000002),        //goto 169c8 <fgtu+0x28>;;
     _32(0x6000008c),        //make $r0 = 140 (0x8c);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let fleu: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x7901a001),        //compd.gtu $r0 = $r1, $r0;;
     _32(0x080000c0),        //cb.dnez $r0? 169f4 <fleu+0x24>;;
     _32(0x6000000d),        //make $r0 = 13 (0xd);;
     _32(0x10000002),        //goto 169f8 <fleu+0x28>;;
     _32(0x6000008c),        //make $r0 = 140 (0x8c);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000f8e0001200),        //make $r0 = 254024 (0x3e048);;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x10000088),        //goto 16c44 <main+0x244>;;
     _96(0x00000000800000f8e0040200),        //make $r1 = 253960 (0x3e008);;
     _32(0x34000f0c),        //lws $r0 = 60 (0x3c)[$r12];;
     _32(0x3802f001),        //ld.xs $r0 = $r0[$r1];;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x10000078),        //goto 16c28 <main+0x228>;;
     _96(0x00000000800000f8e0040200),        //make $r1 = 253960 (0x3e008);;
     _32(0x34000e0c),        //lws $r0 = 56 (0x38)[$r12];;
     _32(0x3802f001),        //ld.xs $r0 = $r0[$r1];;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x1fffff6d),        //call 16820 <feq>;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x61080100),        //addd $r2 = $r0, 4 (0x4);;
     _32(0x27090c0c),        //sd 48 (0x30)[$r12] = $r2;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16a90 <main+0x90>;;
     _32(0x18000075),        //call 16c60 <abort>;;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x1fffff6e),        //call 16850 <fne>;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x61080100),        //addd $r2 = $r0, 4 (0x4);;
     _32(0x27090c0c),        //sd 48 (0x30)[$r12] = $r2;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16abc <main+0xbc>;;
     _32(0x1800006a),        //call 16c60 <abort>;;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x1fffff6f),        //call 16880 <flt>;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x61080100),        //addd $r2 = $r0, 4 (0x4);;
     _32(0x27090c0c),        //sd 48 (0x30)[$r12] = $r2;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16ae8 <main+0xe8>;;
     _32(0x1800005f),        //call 16c60 <abort>;;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x1fffff70),        //call 168b0 <fge>;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x61080100),        //addd $r2 = $r0, 4 (0x4);;
     _32(0x27090c0c),        //sd 48 (0x30)[$r12] = $r2;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16b14 <main+0x114>;;
     _32(0x18000054),        //call 16c60 <abort>;;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x1fffff71),        //call 168e0 <fgt>;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x61080100),        //addd $r2 = $r0, 4 (0x4);;
     _32(0x27090c0c),        //sd 48 (0x30)[$r12] = $r2;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16b40 <main+0x140>;;
     _32(0x18000049),        //call 16c60 <abort>;;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x1fffff72),        //call 16910 <fle>;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x61080100),        //addd $r2 = $r0, 4 (0x4);;
     _32(0x27090c0c),        //sd 48 (0x30)[$r12] = $r2;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16b6c <main+0x16c>;;
     _32(0x1800003e),        //call 16c60 <abort>;;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x1fffff73),        //call 16940 <fltu>;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x61080100),        //addd $r2 = $r0, 4 (0x4);;
     _32(0x27090c0c),        //sd 48 (0x30)[$r12] = $r2;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16b98 <main+0x198>;;
     _32(0x18000033),        //call 16c60 <abort>;;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x1fffff74),        //call 16970 <fgeu>;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x61080100),        //addd $r2 = $r0, 4 (0x4);;
     _32(0x27090c0c),        //sd 48 (0x30)[$r12] = $r2;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16bc4 <main+0x1c4>;;
     _32(0x18000028),        //call 16c60 <abort>;;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x1fffff75),        //call 169a0 <fgtu>;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x61080100),        //addd $r2 = $r0, 4 (0x4);;
     _32(0x27090c0c),        //sd 48 (0x30)[$r12] = $r2;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16bf0 <main+0x1f0>;;
     _32(0x1800001d),        //call 16c60 <abort>;;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x1fffff76),        //call 169d0 <fleu>;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x61080100),        //addd $r2 = $r0, 4 (0x4);;
     _32(0x27090c0c),        //sd 48 (0x30)[$r12] = $r2;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16c1c <main+0x21c>;;
     _32(0x18000012),        //call 16c60 <abort>;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _64(0x00000000f401b1c0),        //compw.le $r0 = $r0, 7 (0x7);;
     _32(0x0c7fe180),        //cb.wnez $r0? 16a4c <main+0x4c>;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _64(0x00000000f401b1c0),        //compw.le $r0 = $r0, 7 (0x7);;
     _32(0x0c7fdd80),        //cb.wnez $r0? 16a28 <main+0x28>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 16c80 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 17080 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18d58 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
 |];

let adr_start:bits(addr_bits) = 0b00010110101000000000; //0x16a00
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(feq, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fne, 0b00010110100001010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(flt, 0b00010110100010000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fge, 0b00010110100010110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fgt, 0b00010110100011100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fle, 0b00010110100100010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fltu, 0b00010110100101000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fgeu, 0b00010110100101110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fgtu, 0b00010110100110100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fleu, 0b00010110100111010000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101000000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110110001100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110110010000000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016a00;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
