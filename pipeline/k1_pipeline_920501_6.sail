// executing pipeline 920501_6 test 
val k1_pipeline_920501_6: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_920501_6() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let str2llu: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701020c),        //sd 8 (0x8)[$r12] = $r0;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x61040040),        //addd $r1 = $r0, 1 (0x1);;
     _32(0x2705020c),        //sd 8 (0x8)[$r12] = $r1;;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7100f400),        //addw $r0 = $r0, -48 (0xffffffd0);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x61040040),        //addd $r1 = $r0, 1 (0x1);;
     _32(0x2705020c),        //sd 8 (0x8)[$r12] = $r1;;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x3000050c),        //lwz $r0 = 20 (0x14)[$r12];;
     _32(0x0c800380),        //cb.weqz $r0? 168a4 <str2llu+0x84>;;
     _32(0x3000050c),        //lwz $r0 = 20 (0x14)[$r12];;
     _32(0x7100f400),        //addw $r0 = $r0, -48 (0xffffffd0);;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x3400050c),        //lws $r0 = 20 (0x14)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x17ffffec),        //goto 16850 <str2llu+0x30>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let sqrtllu: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x2701020c),        //sd 8 (0x8)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x7b022040),        //srld $r0 = $r0, 1 (0x1);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x087ffe40),        //cb.dnez $r0? 168dc <sqrtllu+0x24>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x7b022040),        //srld $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x79026001),        //slld $r0 = $r1, $r0;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x68000040),        //andd $r0 = $r0, 1 (0x1);;
     _32(0x08800180),        //cb.deqz $r0? 16934 <sqrtllu+0x7c>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x7b022040),        //srld $r0 = $r0, 1 (0x1);;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x1800006f),        //call 16af8 <__udivdi3>;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x7b022040),        //srld $r0 = $r0, 1 (0x1);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x7601a001),        //compd.ltu $r0 = $r1, $r0;;
     _32(0x087ffd00),        //cb.dnez $r0? 16934 <sqrtllu+0x7c>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let plist: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x27050a0c),        //sd 40 (0x28)[$r12] = $r1;;
     _32(0x2709080c),        //sd 32 (0x20)[$r12] = $r2;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x2701120c),        //sd 72 (0x48)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x2701160c),        //sd 88 (0x58)[$r12] = $r0;;
     _32(0x1000001e),        //goto 16a20 <plist+0xa0>;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x1fffffc2),        //call 168b8 <sqrtllu>;;
     _32(0x2701100c),        //sd 64 (0x40)[$r12] = $r0;;
     _32(0x60000003),        //make $r0 = 3 (0x3);;
     _32(0x2701140c),        //sd 80 (0x50)[$r12] = $r0;;
     _32(0x1000000a),        //goto 169e8 <plist+0x68>;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x3804140c),        //ld $r1 = 80 (0x50)[$r12];;
     _32(0x1800006d),        //call 16b80 <__umoddi3>;;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x08800380),        //cb.deqz $r0? 16a10 <plist+0x90>;;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _32(0x61000080),        //addd $r0 = $r0, 2 (0x2);;
     _32(0x2701140c),        //sd 80 (0x50)[$r12] = $r0;;
     _32(0x3804140c),        //ld $r1 = 80 (0x50)[$r12];;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x7801a001),        //compd.leu $r0 = $r1, $r0;;
     _32(0x087ffd00),        //cb.dnez $r0? 169c4 <plist+0x44>;;
     _32(0x3800120c),        //ld $r0 = 72 (0x48)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705120c),        //sd 72 (0x48)[$r12] = $r1;;
     _32(0x3804160c),        //ld $r1 = 88 (0x58)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x10000002),        //goto 16a14 <plist+0x94>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x61000080),        //addd $r0 = $r0, 2 (0x2);;
     _32(0x2701160c),        //sd 88 (0x58)[$r12] = $r0;;
     _32(0x3804160c),        //ld $r1 = 88 (0x58)[$r12];;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x7801a001),        //compd.leu $r0 = $r1, $r0;;
     _32(0x087ff800),        //cb.dnez $r0? 169ac <plist+0x2c>;;
     _32(0x3800120c),        //ld $r0 = 72 (0x48)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x3804120c),        //ld $r1 = 72 (0x48)[$r12];;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x75010040),        //sbfd $r0 = $r0, $r1;;
     _32(0x7a0220c0),        //srad $r0 = $r0, 3 (0x3);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2739020c),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0x2601080c),        //sw 32 (0x20)[$r12] = $r0;;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x1fffff67),        //call 16820 <str2llu>;;
     _32(0x6a380000),        //copyd $r14 = $r0;;
     _96(0x00000000800000fce000f400),        //make $r0 = 259024 (0x3f3d0);;
     _32(0x1fffff62),        //call 16820 <str2llu>;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x61000a0c),        //addd $r0 = $r12, 40 (0x28);;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x6a00000e),        //copyd $r0 = $r14;;
     _32(0x1fffffb5),        //call 16980 <plist>;;
     _32(0x26011f0c),        //sw 124 (0x7c)[$r12] = $r0;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _64(0x001263c2e001a340),        //compd.ne $r0 = $r0, 1234111117 (0x498f0a8d);;
     _32(0x080002c0),        //cb.dnez $r0? 16aec <main+0x8c>;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _64(0x001263c2e001a440),        //compd.ne $r0 = $r0, 1234111121 (0x498f0a91);;
     _32(0x080001c0),        //cb.dnez $r0? 16aec <main+0x8c>;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _64(0x001263c2e001a5c0),        //compd.ne $r0 = $r0, 1234111127 (0x498f0a97);;
     _32(0x080000c0),        //cb.dnez $r0? 16aec <main+0x8c>;;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x08800080),        //cb.deqz $r0? 16af0 <main+0x90>;;
     _32(0x180000ad),        //call 16da0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x180000b3)        //call 16dc0 <exit>;;
 |];

let __udivdi3: list_I = 
 [|
     _32(0x88800641),        //cb.deqz $r1? 16b5c <__udivdi3+0x64>
     _32(0x760da040),        //compd.ltu $r3 = $r0, $r1;;
     _32(0xea080000),        //copyd $r2 = $r0
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x08000503),        //cb.dnez $r3? 16b58 <__udivdi3+0x60>;;
     _32(0xf00e2001),        //clzd $r3 = $r1
     _32(0x70122002),        //clzd $r4 = $r2;;
     _32(0x751110c4),        //sbfw $r4 = $r4, $r3;;
     _32(0x79066101),        //slld $r1 = $r1, $r4;;
     _32(0x760da042),        //compd.ltu $r3 = $r2, $r1;;
     _32(0x08000103),        //cb.dnez $r3? 16b30 <__udivdi3+0x38>;;
     _32(0xe0000001),        //make $r0 = 1 (0x1)
     _32(0x75090081),        //sbfd $r2 = $r1, $r2;;
     _32(0x79026100),        //slld $r0 = $r0, $r4;;
     _32(0x0e000284),        //cb.wlez $r4? 16b58 <__udivdi3+0x60>;;
     _32(0xe0140001),        //make $r5 = 1 (0x1)
     _32(0xfa0c0004),        //copyw $r3 = $r4
     _32(0x7b062041),        //srld $r1 = $r1, 1 (0x1);;
     _32(0x79126105),        //slld $r4 = $r5, $r4;;
     _32(0x6110ffc4),        //addd $r4 = $r4, -1 (0xffffffff);;
     _32(0x0f000083),        //loopdo $r3, 16b50 <__udivdi3+0x58>;;
     _32(0x70090081),        //stsud $r2 = $r1, $r2;;
     _32(0x78090084),        //andd $r2 = $r4, $r2;;
     _32(0x71010080),        //addd $r0 = $r0, $r2;;
     _32(0x0fd00000),        //ret ;;
     _96(0x800000a2e0000000f0040d00),        //pcrel $r1 = 165940 (0x28834)
     _32(0x00000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000b8040201),        //ld $r1 = 8 (0x8)[$r1];;
     _32(0x087ffe41),        //cb.dnez $r1? 16b58 <__udivdi3+0x60>;;
     _32(0x00000000),        //errop ;;
     _32(0x7f03f000)        //nop ;;
 |];

let __umoddi3: list_I = 
 [|
     _32(0x888004c1),        //cb.deqz $r1? 16bcc <__umoddi3+0x4c>
     _32(0x760da040),        //compd.ltu $r3 = $r0, $r1;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x080003c3),        //cb.dnez $r3? 16bc8 <__umoddi3+0x48>;;
     _32(0xf0022000),        //clzd $r0 = $r0
     _32(0x700e2001),        //clzd $r3 = $r1;;
     _32(0x750d10c0),        //sbfw $r3 = $r0, $r3;;
     _32(0x790660c1),        //slld $r1 = $r1, $r3;;
     _32(0xf611a042),        //compd.ltu $r4 = $r2, $r1
     _32(0xf5010081),        //sbfd $r0 = $r1, $r2
     _32(0x7b062041),        //srld $r1 = $r1, 1 (0x1);;
     _32(0x710a0004),        //cmoved.deqz $r4? $r2 = $r0;;
     _32(0x8e000183),        //cb.wlez $r3? 16bc8 <__umoddi3+0x48>
     _32(0x6a000002),        //copyd $r0 = $r2;;
     _32(0x7a000003),        //copyw $r0 = $r3;;
     _32(0x0f000080),        //loopdo $r0, 16bc4 <__umoddi3+0x44>;;
     _32(0x70090081),        //stsud $r2 = $r1, $r2;;
     _32(0x7b0260c2),        //srld $r0 = $r2, $r3;;
     _32(0x0fd00000),        //ret ;;
     _96(0x800000a1e0000000f004f100),        //pcrel $r1 = 165828 (0x287c4)
     _32(0x00000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000b8040201),        //ld $r1 = 8 (0x8)[$r1];;
     _32(0x087ffe41),        //cb.dnez $r1? 16bc8 <__umoddi3+0x48>;;
     _32(0x00000000),        //errop ;;
     _32(0x7f03f000)        //nop ;;
 |];

let __udivmoddi4: list_I = 
 [|
     _32(0x88800801),        //cb.deqz $r1? 16c70 <__udivmoddi4+0x80>
     _32(0xf0162001),        //clzd $r5 = $r1
     _32(0x6a0c0000),        //copyd $r3 = $r0;;
     _32(0xf0122003),        //clzd $r4 = $r3
     _32(0x7601a040),        //compd.ltu $r0 = $r0, $r1;;
     _32(0x75111144),        //sbfw $r4 = $r4, $r5;;
     _32(0x88000580),        //cb.dnez $r0? 16c60 <__udivmoddi4+0x70>
     _32(0x79166101),        //slld $r5 = $r1, $r4;;
     _32(0xf605a143),        //compd.ltu $r1 = $r3, $r5
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x08000101),        //cb.dnez $r1? 16c28 <__udivmoddi4+0x38>;;
     _32(0xe0000001),        //make $r0 = 1 (0x1)
     _32(0x750d00c5),        //sbfd $r3 = $r5, $r3;;
     _32(0x79026100),        //slld $r0 = $r0, $r4;;
     _32(0x8e000304),        //cb.wlez $r4? 16c58 <__udivmoddi4+0x68>
     _32(0xe0180001),        //make $r6 = 1 (0x1)
     _32(0x6a040003),        //copyd $r1 = $r3;;
     _32(0xf91a6106),        //slld $r6 = $r6, $r4
     _32(0xfb162045),        //srld $r5 = $r5, 1 (0x1)
     _32(0x7a040004),        //copyw $r1 = $r4;;
     _32(0x6118ffc6),        //addd $r6 = $r6, -1 (0xffffffff);;
     _32(0x0f000081),        //loopdo $r1, 16c4c <__udivmoddi4+0x5c>;;
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
     _96(0x800000a1e0000000f00cc800),        //pcrel $r3 = 165664 (0x28720)
     _32(0x00000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000b80c0203),        //ld $r3 = 8 (0x8)[$r3];;
     _32(0x087ffd03),        //cb.dnez $r3? 16c58 <__udivmoddi4+0x68>;;
     _32(0x00000000)        //errop ;;
 |];

let __divdi3: list_I = 
 [|
     _32(0x88800781),        //cb.deqz $r1? 16d08 <__divdi3+0x78>
     _32(0xe40c0000),        //absd $r3 = $r0
     _32(0xe4100001),        //absd $r4 = $r1
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0xf01a2003),        //clzd $r6 = $r3
     _32(0xf615a103),        //compd.ltu $r5 = $r3, $r4
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x080004c5),        //cb.dnez $r5? 16cf8 <__divdi3+0x68>;;
     _32(0x70162004),        //clzd $r5 = $r4;;
     _32(0x75191146),        //sbfw $r6 = $r6, $r5;;
     _32(0x79126184),        //slld $r4 = $r4, $r6;;
     _32(0x7615a103),        //compd.ltu $r5 = $r3, $r4;;
     _32(0x08000105),        //cb.dnez $r5? 16cd0 <__divdi3+0x40>;;
     _32(0xe0000001),        //make $r0 = 1 (0x1)
     _32(0x750d00c4),        //sbfd $r3 = $r4, $r3;;
     _32(0x79026180),        //slld $r0 = $r0, $r6;;
     _32(0x0e000286),        //cb.wlez $r6? 16cf8 <__divdi3+0x68>;;
     _32(0xe01c0001),        //make $r7 = 1 (0x1)
     _32(0xfa140006),        //copyw $r5 = $r6
     _32(0x7b122044),        //srld $r4 = $r4, 1 (0x1);;
     _32(0x791a6187),        //slld $r6 = $r7, $r6;;
     _32(0x6118ffc6),        //addd $r6 = $r6, -1 (0xffffffff);;
     _32(0x0f000085),        //loopdo $r5, 16cf0 <__divdi3+0x60>;;
     _32(0x700d00c4),        //stsud $r3 = $r4, $r3;;
     _32(0x780d00c6),        //andd $r3 = $r6, $r3;;
     _32(0x710100c0),        //addd $r0 = $r0, $r3;;
     _32(0xfc090042),        //xord $r2 = $r2, $r1
     _32(0x65040000),        //negd $r1 = $r0;;
     _32(0x8fd00000),        //ret 
     _32(0x72020042),        //cmoved.dltz $r2? $r0 = $r1;;
     _96(0x800000a1e0000000f00ca200),        //pcrel $r3 = 165512 (0x28688)
     _32(0x00000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000b80c0203),        //ld $r3 = 8 (0x8)[$r3];;
     _32(0x087ffd83),        //cb.dnez $r3? 16cf8 <__divdi3+0x68>;;
     _32(0x00000000)        //errop ;;
 |];

let __moddi3: list_I = 
 [|
     _32(0x88800581),        //cb.deqz $r1? 16d80 <__moddi3+0x58>
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0xe4000000),        //absd $r0 = $r0
     _32(0x64040001),        //absd $r1 = $r1;;
     _32(0xf0122001),        //clzd $r4 = $r1
     _32(0x760da040),        //compd.ltu $r3 = $r0, $r1;;
     _32(0x08000343),        //cb.dnez $r3? 16d74 <__moddi3+0x4c>;;
     _32(0x700e2000),        //clzd $r3 = $r0;;
     _32(0x75111103),        //sbfw $r4 = $r3, $r4;;
     _32(0x79066101),        //slld $r1 = $r1, $r4;;
     _32(0xf615a040),        //compd.ltu $r5 = $r0, $r1
     _32(0xf50d0001),        //sbfd $r3 = $r1, $r0
     _32(0x7b062041),        //srld $r1 = $r1, 1 (0x1);;
     _32(0x8e000184),        //cb.wlez $r4? 16d74 <__moddi3+0x4c>
     _32(0x710200c5),        //cmoved.deqz $r5? $r0 = $r3;;
     _32(0x7a0c0004),        //copyw $r3 = $r4;;
     _32(0x0f000083),        //loopdo $r3, 16d70 <__moddi3+0x48>;;
     _32(0x70010001),        //stsud $r0 = $r1, $r0;;
     _32(0x7b026100),        //srld $r0 = $r0, $r4;;
     _32(0x65040000),        //negd $r1 = $r0;;
     _32(0x8fd00000),        //ret 
     _32(0x72020042),        //cmoved.dltz $r2? $r0 = $r1;;
     _96(0x800000a1e0000000f0048400),        //pcrel $r1 = 165392 (0x28610)
     _32(0x00000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000b8040201),        //ld $r1 = 8 (0x8)[$r1];;
     _32(0x087ffdc1),        //cb.dnez $r1? 16d74 <__moddi3+0x4c>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 171c0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18e98 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
 |];

let adr_start:bits(addr_bits) = 0b00010110101001100000; //0x16a60
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(str2llu, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(sqrtllu, 0b00010110100010111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(plist, 0b00010110100110000000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101001100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__udivdi3, 0b00010110101011111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__umoddi3, 0b00010110101110000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__udivmoddi4, 0b00010110101111110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__divdi3, 0b00010110110010010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__moddi3, 0b00010110110100101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110110110100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110110111000000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016a60;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
