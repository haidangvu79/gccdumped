// executing 20020307_1 test 
val k1_20020307_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20020307_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let f3: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x680001c0),        //andd $r0 = $r0, 7 (0x7);;
     _32(0x68010140),        //compd.leu $r0 = $r0, 5 (0x5);;
     _32(0x08000080),        //cb.dnez $r0? 16844 <f3+0x24>;;
     _32(0x180001fa),        //call 17028 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f4: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x680003c0),        //andd $r0 = $r0, 15 (0xf);;
     _32(0x68010240),        //compd.leu $r0 = $r0, 9 (0x9);;
     _32(0x08000080),        //cb.dnez $r0? 1687c <f4+0x24>;;
     _32(0x180001ec),        //call 17028 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f5: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x680007c0),        //andd $r0 = $r0, 31 (0x1f);;
     _32(0x68010440),        //compd.leu $r0 = $r0, 17 (0x11);;
     _32(0x08000080),        //cb.dnez $r0? 168b4 <f5+0x24>;;
     _32(0x180001de),        //call 17028 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f6: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x68000fc0),        //andd $r0 = $r0, 63 (0x3f);;
     _32(0x68010840),        //compd.leu $r0 = $r0, 33 (0x21);;
     _32(0x08000080),        //cb.dnez $r0? 168ec <f6+0x24>;;
     _32(0x180001d0),        //call 17028 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f7: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x68001fc0),        //andd $r0 = $r0, 127 (0x7f);;
     _32(0x68011040),        //compd.leu $r0 = $r0, 65 (0x41);;
     _32(0x08000080),        //cb.dnez $r0? 16924 <f7+0x24>;;
     _32(0x180001c2),        //call 17028 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f8: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x68003fc0),        //andd $r0 = $r0, 255 (0xff);;
     _32(0x68012040),        //compd.leu $r0 = $r0, 129 (0x81);;
     _32(0x08000080),        //cb.dnez $r0? 1695c <f8+0x24>;;
     _32(0x180001b4),        //call 17028 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f9: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x68007fc0),        //andd $r0 = $r0, 511 (0x1ff);;
     _32(0x68014040),        //compd.leu $r0 = $r0, 257 (0x101);;
     _32(0x08000080),        //cb.dnez $r0? 16994 <f9+0x24>;;
     _32(0x180001a6),        //call 17028 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f10: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x00000000e800ffc0),        //andd $r0 = $r0, 1023 (0x3ff);;
     _64(0x00000000e8018040),        //compd.leu $r0 = $r0, 513 (0x201);;
     _32(0x08000080),        //cb.dnez $r0? 169d4 <f10+0x2c>;;
     _32(0x18000196),        //call 17028 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f11: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x00000001e800ffc0),        //andd $r0 = $r0, 2047 (0x7ff);;
     _64(0x00000001e8010040),        //compd.leu $r0 = $r0, 1025 (0x401);;
     _32(0x08000080),        //cb.dnez $r0? 16a14 <f11+0x2c>;;
     _32(0x18000186),        //call 17028 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f12: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x00000003e800ffc0),        //andd $r0 = $r0, 4095 (0xfff);;
     _64(0x00000002e8010040),        //compd.leu $r0 = $r0, 2049 (0x801);;
     _32(0x08000080),        //cb.dnez $r0? 16a54 <f12+0x2c>;;
     _32(0x18000176),        //call 17028 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f13: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x00000007e800ffc0),        //andd $r0 = $r0, 8191 (0x1fff);;
     _64(0x00000004e8010040),        //compd.leu $r0 = $r0, 4097 (0x1001);;
     _32(0x08000080),        //cb.dnez $r0? 16a94 <f13+0x2c>;;
     _32(0x18000166),        //call 17028 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f14: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x0000000fe800ffc0),        //andd $r0 = $r0, 16383 (0x3fff);;
     _64(0x00000008e8010040),        //compd.leu $r0 = $r0, 8193 (0x2001);;
     _32(0x08000080),        //cb.dnez $r0? 16ad4 <f14+0x2c>;;
     _32(0x18000156),        //call 17028 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f15: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x0000001fe800ffc0),        //andd $r0 = $r0, 32767 (0x7fff);;
     _64(0x00000010e8010040),        //compd.leu $r0 = $r0, 16385 (0x4001);;
     _32(0x08000080),        //cb.dnez $r0? 16b14 <f15+0x2c>;;
     _32(0x18000146),        //call 17028 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f16: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x0000003fe800ffc0),        //andd $r0 = $r0, 65535 (0xffff);;
     _64(0x00000020e8010040),        //compd.leu $r0 = $r0, 32769 (0x8001);;
     _32(0x08000080),        //cb.dnez $r0? 16b54 <f16+0x2c>;;
     _32(0x18000136),        //call 17028 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f17: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x0000007fe800ffc0),        //andd $r0 = $r0, 131071 (0x1ffff);;
     _64(0x00000040e8010040),        //compd.leu $r0 = $r0, 65537 (0x10001);;
     _32(0x08000080),        //cb.dnez $r0? 16b94 <f17+0x2c>;;
     _32(0x18000126),        //call 17028 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f18: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x000000ffe800ffc0),        //andd $r0 = $r0, 262143 (0x3ffff);;
     _64(0x00000080e8010040),        //compd.leu $r0 = $r0, 131073 (0x20001);;
     _32(0x08000080),        //cb.dnez $r0? 16bd4 <f18+0x2c>;;
     _32(0x18000116),        //call 17028 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f19: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x000001ffe800ffc0),        //andd $r0 = $r0, 524287 (0x7ffff);;
     _64(0x00000100e8010040),        //compd.leu $r0 = $r0, 262145 (0x40001);;
     _32(0x08000080),        //cb.dnez $r0? 16c14 <f19+0x2c>;;
     _32(0x18000106),        //call 17028 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f20: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x000003ffe800ffc0),        //andd $r0 = $r0, 1048575 (0xfffff);;
     _64(0x00000200e8010040),        //compd.leu $r0 = $r0, 524289 (0x80001);;
     _32(0x08000080),        //cb.dnez $r0? 16c54 <f20+0x2c>;;
     _32(0x180000f6),        //call 17028 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f21: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x000007ffe800ffc0),        //andd $r0 = $r0, 2097151 (0x1fffff);;
     _64(0x00000400e8010040),        //compd.leu $r0 = $r0, 1048577 (0x100001);;
     _32(0x08000080),        //cb.dnez $r0? 16c94 <f21+0x2c>;;
     _32(0x180000e6),        //call 17028 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f22: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x00000fffe800ffc0),        //andd $r0 = $r0, 4194303 (0x3fffff);;
     _64(0x00000800e8010040),        //compd.leu $r0 = $r0, 2097153 (0x200001);;
     _32(0x08000080),        //cb.dnez $r0? 16cd4 <f22+0x2c>;;
     _32(0x180000d6),        //call 17028 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f23: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x00001fffe800ffc0),        //andd $r0 = $r0, 8388607 (0x7fffff);;
     _64(0x00001000e8010040),        //compd.leu $r0 = $r0, 4194305 (0x400001);;
     _32(0x08000080),        //cb.dnez $r0? 16d14 <f23+0x2c>;;
     _32(0x180000c6),        //call 17028 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f24: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x00003fffe800ffc0),        //andd $r0 = $r0, 16777215 (0xffffff);;
     _64(0x00002000e8010040),        //compd.leu $r0 = $r0, 8388609 (0x800001);;
     _32(0x08000080),        //cb.dnez $r0? 16d54 <f24+0x2c>;;
     _32(0x180000b6),        //call 17028 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f25: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x00007fffe800ffc0),        //andd $r0 = $r0, 33554431 (0x1ffffff);;
     _64(0x00004000e8010040),        //compd.leu $r0 = $r0, 16777217 (0x1000001);;
     _32(0x08000080),        //cb.dnez $r0? 16d94 <f25+0x2c>;;
     _32(0x180000a6),        //call 17028 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f26: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x0000ffffe800ffc0),        //andd $r0 = $r0, 67108863 (0x3ffffff);;
     _64(0x00008000e8010040),        //compd.leu $r0 = $r0, 33554433 (0x2000001);;
     _32(0x08000080),        //cb.dnez $r0? 16dd4 <f26+0x2c>;;
     _32(0x18000096),        //call 17028 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f27: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x0001ffffe800ffc0),        //andd $r0 = $r0, 134217727 (0x7ffffff);;
     _64(0x00010000e8010040),        //compd.leu $r0 = $r0, 67108865 (0x4000001);;
     _32(0x08000080),        //cb.dnez $r0? 16e14 <f27+0x2c>;;
     _32(0x18000086),        //call 17028 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f28: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x0003ffffe800ffc0),        //andd $r0 = $r0, 268435455 (0xfffffff);;
     _64(0x00020000e8010040),        //compd.leu $r0 = $r0, 134217729 (0x8000001);;
     _32(0x08000080),        //cb.dnez $r0? 16e54 <f28+0x2c>;;
     _32(0x18000076),        //call 17028 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f29: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x0007ffffe800ffc0),        //andd $r0 = $r0, 536870911 (0x1fffffff);;
     _64(0x00040000e8010040),        //compd.leu $r0 = $r0, 268435457 (0x10000001);;
     _32(0x08000080),        //cb.dnez $r0? 16e94 <f29+0x2c>;;
     _32(0x18000066),        //call 17028 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f30: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x000fffffe800ffc0),        //andd $r0 = $r0, 1073741823 (0x3fffffff);;
     _64(0x00080000e8010040),        //compd.leu $r0 = $r0, 536870913 (0x20000001);;
     _32(0x08000080),        //cb.dnez $r0? 16ed4 <f30+0x2c>;;
     _32(0x18000056),        //call 17028 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f31: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x001fffffe800ffc0),        //andd $r0 = $r0, 2147483647 (0x7fffffff);;
     _64(0x00100000e8010040),        //compd.leu $r0 = $r0, 1073741825 (0x40000001);;
     _32(0x08000080),        //cb.dnez $r0? 16f14 <f31+0x2c>;;
     _32(0x18000046),        //call 17028 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1ffffe3a),        //call 16820 <f3>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1ffffe46),        //call 16858 <f4>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1ffffe52),        //call 16890 <f5>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1ffffe5e),        //call 168c8 <f6>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1ffffe6a),        //call 16900 <f7>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1ffffe76),        //call 16938 <f8>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1ffffe82),        //call 16970 <f9>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1ffffe8e),        //call 169a8 <f10>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1ffffe9c),        //call 169e8 <f11>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1ffffeaa),        //call 16a28 <f12>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1ffffeb8),        //call 16a68 <f13>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1ffffec6),        //call 16aa8 <f14>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1ffffed4),        //call 16ae8 <f15>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1ffffee2),        //call 16b28 <f16>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1ffffef0),        //call 16b68 <f17>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1ffffefe),        //call 16ba8 <f18>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff0c),        //call 16be8 <f19>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff1a),        //call 16c28 <f20>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff28),        //call 16c68 <f21>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff36),        //call 16ca8 <f22>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff44),        //call 16ce8 <f23>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff52),        //call 16d28 <f24>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff60),        //call 16d68 <f25>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff6e),        //call 16da8 <f26>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff7c),        //call 16de8 <f27>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff8a),        //call 16e28 <f28>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff98),        //call 16e68 <f29>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffa6),        //call 16ea8 <f30>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffb4),        //call 16ee8 <f31>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 17048 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 17448 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 19120 <_exit>
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
     _32(0x98000161),        //call 175e0 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x0000000080000100e000f000),        //make $r0 = 263104 (0x403c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 17084 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 19120 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110111100101000; //0x16f28
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f3, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f4, 0b00010110100001011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f5, 0b00010110100010010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f6, 0b00010110100011001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f7, 0b00010110100100000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f8, 0b00010110100100111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f9, 0b00010110100101110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f10, 0b00010110100110101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f11, 0b00010110100111101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f12, 0b00010110101000101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f13, 0b00010110101001101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f14, 0b00010110101010101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f15, 0b00010110101011101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f16, 0b00010110101100101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f17, 0b00010110101101101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f18, 0b00010110101110101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f19, 0b00010110101111101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f20, 0b00010110110000101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f21, 0b00010110110001101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f22, 0b00010110110010101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f23, 0b00010110110011101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f24, 0b00010110110100101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f25, 0b00010110110101101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f26, 0b00010110110110101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f27, 0b00010110110111101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f28, 0b00010110111000101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f29, 0b00010110111001101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f30, 0b00010110111010101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f31, 0b00010110111011101000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110111100101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010111000000101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010111000001001000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
