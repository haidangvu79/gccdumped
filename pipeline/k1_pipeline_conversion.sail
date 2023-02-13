// executing pipeline conversion.c.out.dumped test 
val k1_pipeline_conversion: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_conversion() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let u2f: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x49030000),        //floatuw.rn $r0 = $r0, 0 (0x0);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let u2d: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x45030000),        //floatud.rn $r0 = $r0, 0 (0x0);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let u2ld: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x45030000),        //floatud.rn $r0 = $r0, 0 (0x0);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let s2f: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x48030000),        //floatw.rn $r0 = $r0, 0 (0x0);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let s2d: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3400060c),        //lws $r0 = 24 (0x18)[$r12];;
     _32(0x44030000),        //floatd.rn $r0 = $r0, 0 (0x0);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let s2ld: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3400060c),        //lws $r0 = 24 (0x18)[$r12];;
     _32(0x44030000),        //floatd.rn $r0 = $r0, 0 (0x0);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let fnear: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x5d027040),        //fsbfw $r0 = $r0, $r1;;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x72030040),        //fcompw.oeq $r0 = $r0, $r1;;
     _32(0x08000240),        //cb.dnez $r0? 16904 <fnear+0x54>;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x1800052f),        //call 17da8 <__divsf3>;;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _64(0x00125d09e0000000),        //make $r0 = 1232348160 (0x49742400);;
     _32(0x74030040),        //fcompw.olt $r0 = $r0, $r1;;
     _32(0x088000c0),        //cb.deqz $r0? 1690c <fnear+0x5c>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x10000002),        //goto 16910 <fnear+0x60>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let dnear: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2705020c),        //sd 8 (0x8)[$r12] = $r1;;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x54027040),        //fsbfd $r0 = $r0, $r1;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000280),        //cb.dnez $r0? 16980 <dnear+0x58>;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x1800078b),        //call 18790 <__divdf3>;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x0216b5e68107a400e0000000),        //make $r0 = 4816244402031689728 (0x42d6bcc41e900000);;
     _32(0x7c030040),        //fcompd.olt $r0 = $r0, $r1;;
     _32(0x088000c0),        //cb.deqz $r0? 16988 <dnear+0x60>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x10000002),        //goto 1698c <dnear+0x64>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let ldnear: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2705020c),        //sd 8 (0x8)[$r12] = $r1;;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x54027040),        //fsbfd $r0 = $r0, $r1;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000280),        //cb.dnez $r0? 169f8 <ldnear+0x58>;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x1800076d),        //call 18790 <__divdf3>;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x02349dc5856d415be00085c0),        //make $r0 = 5085611494797045271 (0x4693b8b5b5056e17);;
     _32(0x7c030040),        //fcompd.olt $r0 = $r0, $r1;;
     _32(0x088000c0),        //cb.deqz $r0? 16a00 <ldnear+0x60>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x10000002),        //goto 16a04 <ldnear+0x64>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let test_integer_to_float: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff7e),        //call 16820 <u2f>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x72030040),        //fcompw.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16a3c <test_integer_to_float+0x24>;;
     _32(0x18000b0a),        //call 19660 <abort>;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1fffff78),        //call 16820 <u2f>;;
     _64(0x0013e000e0040000),        //make $r1 = 1333788672 (0x4f800000);;
     _32(0x1fffff99),        //call 168b0 <fnear>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16a5c <test_integer_to_float+0x44>;;
     _32(0x18000b02),        //call 19660 <abort>;;
     _64(0x001fffffe000ffc0),        //make $r0 = 2147483647 (0x7fffffff);;
     _32(0x1fffff6f),        //call 16820 <u2f>;;
     _64(0x0013c000e0040000),        //make $r1 = 1325400064 (0x4f000000);;
     _32(0x1fffff90),        //call 168b0 <fnear>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16a80 <test_integer_to_float+0x68>;;
     _32(0x18000af9),        //call 19660 <abort>;;
     _64(0x07e00000e000003f),        //make $r0 = -2147483648 (0xffffffff80000000);;
     _32(0x1fffff66),        //call 16820 <u2f>;;
     _64(0x0013c000e0040000),        //make $r1 = 1325400064 (0x4f000000);;
     _32(0x72030040),        //fcompw.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16aa0 <test_integer_to_float+0x88>;;
     _32(0x18000af1),        //call 19660 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff65),        //call 16838 <u2d>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16ab8 <test_integer_to_float+0xa0>;;
     _32(0x18000aeb),        //call 19660 <abort>;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1fffff5f),        //call 16838 <u2d>;;
     _96(0x020f7fff87fff800e0040000),        //make $r1 = 4751297606873776128 (0x41efffffffe00000);;
     _32(0x1fffff97),        //call 16928 <dnear>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16adc <test_integer_to_float+0xc4>;;
     _32(0x18000ae2),        //call 19660 <abort>;;
     _64(0x001fffffe000ffc0),        //make $r0 = 2147483647 (0x7fffffff);;
     _32(0x1fffff55),        //call 16838 <u2d>;;
     _96(0x020effff87fff000e0040000),        //make $r1 = 4746794007244308480 (0x41dfffffffc00000);;
     _32(0x1fffff8d),        //call 16928 <dnear>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16b04 <test_integer_to_float+0xec>;;
     _32(0x18000ad8),        //call 19660 <abort>;;
     _64(0x07e00000e000003f),        //make $r0 = -2147483648 (0xffffffff80000000);;
     _32(0x1fffff4b),        //call 16838 <u2d>;;
     _96(0x020f000080000000e0040000),        //make $r1 = 4746794007248502784 (0x41e0000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16b28 <test_integer_to_float+0x110>;;
     _32(0x18000acf),        //call 19660 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff49),        //call 16850 <u2ld>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16b40 <test_integer_to_float+0x128>;;
     _32(0x18000ac9),        //call 19660 <abort>;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1fffff43),        //call 16850 <u2ld>;;
     _96(0x020f7fff87fff800e0040000),        //make $r1 = 4751297606873776128 (0x41efffffffe00000);;
     _32(0x1fffff93),        //call 169a0 <ldnear>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16b64 <test_integer_to_float+0x14c>;;
     _32(0x18000ac0),        //call 19660 <abort>;;
     _64(0x001fffffe000ffc0),        //make $r0 = 2147483647 (0x7fffffff);;
     _32(0x1fffff39),        //call 16850 <u2ld>;;
     _96(0x020effff87fff000e0040000),        //make $r1 = 4746794007244308480 (0x41dfffffffc00000);;
     _32(0x1fffff89),        //call 169a0 <ldnear>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16b8c <test_integer_to_float+0x174>;;
     _32(0x18000ab6),        //call 19660 <abort>;;
     _64(0x07e00000e000003f),        //make $r0 = -2147483648 (0xffffffff80000000);;
     _32(0x1fffff2f),        //call 16850 <u2ld>;;
     _96(0x020f000080000000e0040000),        //make $r1 = 4746794007248502784 (0x41e0000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16bb0 <test_integer_to_float+0x198>;;
     _32(0x18000aad),        //call 19660 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff2d),        //call 16868 <s2f>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x72030040),        //fcompw.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16bc8 <test_integer_to_float+0x1b0>;;
     _32(0x18000aa7),        //call 19660 <abort>;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1fffff27),        //call 16868 <s2f>;;
     _64(0x002fe000e0040000),        //make $r1 = 3212836864 (0xbf800000);;
     _32(0x1fffff36),        //call 168b0 <fnear>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16be8 <test_integer_to_float+0x1d0>;;
     _32(0x18000a9f),        //call 19660 <abort>;;
     _64(0x001fffffe000ffc0),        //make $r0 = 2147483647 (0x7fffffff);;
     _32(0x1fffff1e),        //call 16868 <s2f>;;
     _64(0x0013c000e0040000),        //make $r1 = 1325400064 (0x4f000000);;
     _32(0x1fffff2d),        //call 168b0 <fnear>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16c0c <test_integer_to_float+0x1f4>;;
     _32(0x18000a96),        //call 19660 <abort>;;
     _64(0x07e00000e000003f),        //make $r0 = -2147483648 (0xffffffff80000000);;
     _32(0x1fffff15),        //call 16868 <s2f>;;
     _64(0x0033c000e0040000),        //make $r1 = 3472883712 (0xcf000000);;
     _32(0x72030040),        //fcompw.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16c2c <test_integer_to_float+0x214>;;
     _32(0x18000a8e),        //call 19660 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff14),        //call 16880 <s2d>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16c44 <test_integer_to_float+0x22c>;;
     _32(0x18000a88),        //call 19660 <abort>;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1fffff0e),        //call 16880 <s2d>;;
     _96(0x05ff800080000000e0040000),        //make $r1 = 13830554455654793216 (0xbff0000000000000);;
     _32(0x1fffff34),        //call 16928 <dnear>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16c68 <test_integer_to_float+0x250>;;
     _32(0x18000a7f),        //call 19660 <abort>;;
     _64(0x001fffffe000ffc0),        //make $r0 = 2147483647 (0x7fffffff);;
     _32(0x1fffff04),        //call 16880 <s2d>;;
     _96(0x020effff87fff000e0040000),        //make $r1 = 4746794007244308480 (0x41dfffffffc00000);;
     _32(0x1fffff2a),        //call 16928 <dnear>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16c90 <test_integer_to_float+0x278>;;
     _32(0x18000a75),        //call 19660 <abort>;;
     _64(0x07e00000e000003f),        //make $r0 = -2147483648 (0xffffffff80000000);;
     _32(0x1ffffefa),        //call 16880 <s2d>;;
     _96(0x060f000080000000e0040000),        //make $r1 = 13970166044103278592 (0xc1e0000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16cb4 <test_integer_to_float+0x29c>;;
     _32(0x18000a6c),        //call 19660 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1ffffef8),        //call 16898 <s2ld>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16ccc <test_integer_to_float+0x2b4>;;
     _32(0x18000a66),        //call 19660 <abort>;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1ffffef2),        //call 16898 <s2ld>;;
     _96(0x05ff800080000000e0040000),        //make $r1 = 13830554455654793216 (0xbff0000000000000);;
     _32(0x1fffff30),        //call 169a0 <ldnear>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16cf0 <test_integer_to_float+0x2d8>;;
     _32(0x18000a5d),        //call 19660 <abort>;;
     _64(0x001fffffe000ffc0),        //make $r0 = 2147483647 (0x7fffffff);;
     _32(0x1ffffee8),        //call 16898 <s2ld>;;
     _96(0x020effff87fff000e0040000),        //make $r1 = 4746794007244308480 (0x41dfffffffc00000);;
     _32(0x1fffff26),        //call 169a0 <ldnear>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16d18 <test_integer_to_float+0x300>;;
     _32(0x18000a53),        //call 19660 <abort>;;
     _64(0x07e00000e000003f),        //make $r0 = -2147483648 (0xffffffff80000000);;
     _32(0x1ffffede),        //call 16898 <s2ld>;;
     _96(0x060f000080000000e0040000),        //make $r1 = 13970166044103278592 (0xc1e0000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16d3c <test_integer_to_float+0x324>;;
     _32(0x18000a4a),        //call 19660 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let ull2f: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x18000629),        //call 18608 <__floatundisf>;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let ull2d: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x45030000),        //floatud.rn $r0 = $r0, 0 (0x0);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let ull2ld: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x45030000),        //floatud.rn $r0 = $r0, 0 (0x0);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let sll2f: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x1800059d),        //call 18430 <__floatdisf>;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let sll2d: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x44030000),        //floatd.rn $r0 = $r0, 0 (0x0);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let sll2ld: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x44030000),        //floatd.rn $r0 = $r0, 0 (0x0);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let test_longlong_integer_to_float: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffd0),        //call 16d50 <ull2f>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x72030040),        //fcompw.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16e24 <test_longlong_integer_to_float+0x24>;;
     _32(0x18000a10),        //call 19660 <abort>;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1fffffca),        //call 16d50 <ull2f>;;
     _64(0x0017e000e0040000),        //make $r1 = 1602224128 (0x5f800000);;
     _32(0x72030040),        //fcompw.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16e40 <test_longlong_integer_to_float+0x40>;;
     _32(0x18000a09),        //call 19660 <abort>;;
     _96(0x03ffffff87ffffffe000ffc0),        //make $r0 = 9223372036854775807 (0x7fffffffffffffff);;
     _32(0x1fffffc1),        //call 16d50 <ull2f>;;
     _64(0x0017c000e0040000),        //make $r1 = 1593835520 (0x5f000000);;
     _32(0x72030040),        //fcompw.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16e64 <test_longlong_integer_to_float+0x64>;;
     _32(0x18000a00),        //call 19660 <abort>;;
     _96(0x0400000080000000e0000000),        //make $r0 = 9223372036854775808 (0x8000000000000000);;
     _32(0x1fffffb8),        //call 16d50 <ull2f>;;
     _64(0x0017c000e0040000),        //make $r1 = 1593835520 (0x5f000000);;
     _32(0x72030040),        //fcompw.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16e88 <test_longlong_integer_to_float+0x88>;;
     _32(0x180009f7),        //call 19660 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffbb),        //call 16d78 <ull2d>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16ea0 <test_longlong_integer_to_float+0xa0>;;
     _32(0x180009f1),        //call 19660 <abort>;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1fffffb5),        //call 16d78 <ull2d>;;
     _96(0x021f800080000000e0040000),        //make $r1 = 4895412794951729152 (0x43f0000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16ec0 <test_longlong_integer_to_float+0xc0>;;
     _32(0x180009e9),        //call 19660 <abort>;;
     _96(0x03ffffff87ffffffe000ffc0),        //make $r0 = 9223372036854775807 (0x7fffffffffffffff);;
     _32(0x1fffffab),        //call 16d78 <ull2d>;;
     _96(0x021f000080000000e0040000),        //make $r1 = 4890909195324358656 (0x43e0000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16ee8 <test_longlong_integer_to_float+0xe8>;;
     _32(0x180009df),        //call 19660 <abort>;;
     _96(0x0400000080000000e0000000),        //make $r0 = 9223372036854775808 (0x8000000000000000);;
     _32(0x1fffffa1),        //call 16d78 <ull2d>;;
     _96(0x021f000080000000e0040000),        //make $r1 = 4890909195324358656 (0x43e0000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16f10 <test_longlong_integer_to_float+0x110>;;
     _32(0x180009d5),        //call 19660 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff9f),        //call 16d90 <ull2ld>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16f28 <test_longlong_integer_to_float+0x128>;;
     _32(0x180009cf),        //call 19660 <abort>;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1fffff99),        //call 16d90 <ull2ld>;;
     _96(0x021f800080000000e0040000),        //make $r1 = 4895412794951729152 (0x43f0000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16f48 <test_longlong_integer_to_float+0x148>;;
     _32(0x180009c7),        //call 19660 <abort>;;
     _96(0x03ffffff87ffffffe000ffc0),        //make $r0 = 9223372036854775807 (0x7fffffffffffffff);;
     _32(0x1fffff8f),        //call 16d90 <ull2ld>;;
     _96(0x021f000080000000e0040000),        //make $r1 = 4890909195324358656 (0x43e0000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16f70 <test_longlong_integer_to_float+0x170>;;
     _32(0x180009bd),        //call 19660 <abort>;;
     _96(0x0400000080000000e0000000),        //make $r0 = 9223372036854775808 (0x8000000000000000);;
     _32(0x1fffff85),        //call 16d90 <ull2ld>;;
     _96(0x021f000080000000e0040000),        //make $r1 = 4890909195324358656 (0x43e0000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16f98 <test_longlong_integer_to_float+0x198>;;
     _32(0x180009b3),        //call 19660 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff83),        //call 16da8 <sll2f>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x72030040),        //fcompw.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16fb0 <test_longlong_integer_to_float+0x1b0>;;
     _32(0x180009ad),        //call 19660 <abort>;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1fffff7d),        //call 16da8 <sll2f>;;
     _64(0x002fe000e0040000),        //make $r1 = 3212836864 (0xbf800000);;
     _32(0x72030040),        //fcompw.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16fcc <test_longlong_integer_to_float+0x1cc>;;
     _32(0x180009a6),        //call 19660 <abort>;;
     _96(0x03ffffff87ffffffe000ffc0),        //make $r0 = 9223372036854775807 (0x7fffffffffffffff);;
     _32(0x1fffff74),        //call 16da8 <sll2f>;;
     _64(0x0017c000e0040000),        //make $r1 = 1593835520 (0x5f000000);;
     _32(0x1ffffe33),        //call 168b0 <fnear>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16ff4 <test_longlong_integer_to_float+0x1f4>;;
     _32(0x1800099c),        //call 19660 <abort>;;
     _96(0x0400000080000000e0000000),        //make $r0 = 9223372036854775808 (0x8000000000000000);;
     _32(0x1fffff6a),        //call 16da8 <sll2f>;;
     _64(0x0037c000e0040000),        //make $r1 = 3741319168 (0xdf000000);;
     _32(0x72030040),        //fcompw.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 17018 <test_longlong_integer_to_float+0x218>;;
     _32(0x18000993),        //call 19660 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff6d),        //call 16dd0 <sll2d>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 17030 <test_longlong_integer_to_float+0x230>;;
     _32(0x1800098d),        //call 19660 <abort>;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1fffff67),        //call 16dd0 <sll2d>;;
     _96(0x05ff800080000000e0040000),        //make $r1 = 13830554455654793216 (0xbff0000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 17050 <test_longlong_integer_to_float+0x250>;;
     _32(0x18000985),        //call 19660 <abort>;;
     _96(0x03ffffff87ffffffe000ffc0),        //make $r0 = 9223372036854775807 (0x7fffffffffffffff);;
     _32(0x1fffff5d),        //call 16dd0 <sll2d>;;
     _96(0x021f000080000000e0040000),        //make $r1 = 4890909195324358656 (0x43e0000000000000);;
     _32(0x1ffffe2f),        //call 16928 <dnear>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 1707c <test_longlong_integer_to_float+0x27c>;;
     _32(0x1800097a),        //call 19660 <abort>;;
     _96(0x0400000080000000e0000000),        //make $r0 = 9223372036854775808 (0x8000000000000000);;
     _32(0x1fffff52),        //call 16dd0 <sll2d>;;
     _96(0x061f000080000000e0040000),        //make $r1 = 14114281232179134464 (0xc3e0000000000000);;
     _32(0x1ffffe24),        //call 16928 <dnear>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 170a8 <test_longlong_integer_to_float+0x2a8>;;
     _32(0x1800096f),        //call 19660 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff4f),        //call 16de8 <sll2ld>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 170c0 <test_longlong_integer_to_float+0x2c0>;;
     _32(0x18000969),        //call 19660 <abort>;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1fffff49),        //call 16de8 <sll2ld>;;
     _96(0x05ff800080000000e0040000),        //make $r1 = 13830554455654793216 (0xbff0000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 170e0 <test_longlong_integer_to_float+0x2e0>;;
     _32(0x18000961),        //call 19660 <abort>;;
     _96(0x03ffffff87ffffffe000ffc0),        //make $r0 = 9223372036854775807 (0x7fffffffffffffff);;
     _32(0x1fffff3f),        //call 16de8 <sll2ld>;;
     _96(0x021f000080000000e0040000),        //make $r1 = 4890909195324358656 (0x43e0000000000000);;
     _32(0x1ffffe29),        //call 169a0 <ldnear>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 1710c <test_longlong_integer_to_float+0x30c>;;
     _32(0x18000956),        //call 19660 <abort>;;
     _96(0x0400000080000000e0000000),        //make $r0 = 9223372036854775808 (0x8000000000000000);;
     _32(0x1fffff34),        //call 16de8 <sll2ld>;;
     _96(0x061f000080000000e0040000),        //make $r1 = 14114281232179134464 (0xc3e0000000000000);;
     _32(0x1ffffe1e),        //call 169a0 <ldnear>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 17138 <test_longlong_integer_to_float+0x338>;;
     _32(0x1800094b),        //call 19660 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let f2u: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x4b033000),        //fixeduw.rz $r0 = $r0, 0 (0x0);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let d2u: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x47033000),        //fixedud.rz $r0 = $r0, 0 (0x0);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let ld2u: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x47033000),        //fixedud.rz $r0 = $r0, 0 (0x0);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let f2s: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x4a033000),        //fixedw.rz $r0 = $r0, 0 (0x0);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let d2s: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x46033000),        //fixedd.rz $r0 = $r0, 0 (0x0);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let ld2s: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x46033000),        //fixedd.rz $r0 = $r0, 0 (0x0);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test_float_to_integer: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffcc),        //call 17150 <f2u>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 17230 <test_float_to_integer+0x20>;;
     _32(0x1800090d),        //call 19660 <abort>;;
     _64(0x000fdfefe0009dc0),        //make $r0 = 1065336439 (0x3f7fbe77);;
     _32(0x1fffffc6),        //call 17150 <f2u>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 17248 <test_float_to_integer+0x38>;;
     _32(0x18000907),        //call 19660 <abort>;;
     _64(0x000fe000e0000000),        //make $r0 = 1065353216 (0x3f800000);;
     _32(0x1fffffc0),        //call 17150 <f2u>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 17268 <test_float_to_integer+0x58>;;
     _32(0x180008ff),        //call 19660 <abort>;;
     _64(0x000fffaee0001480),        //make $r0 = 1073657938 (0x3ffeb852);;
     _32(0x1fffffb8),        //call 17150 <f2u>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 17288 <test_float_to_integer+0x78>;;
     _32(0x180008f7),        //call 19660 <abort>;;
     _64(0x0013c000e0000000),        //make $r0 = 1325400064 (0x4f000000);;
     _32(0x1fffffb0),        //call 17150 <f2u>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x03fffffff101b7c0),        //compw.eq $r0 = $r0, 2147483647 (0x7fffffff);;
     _32(0x0c000240),        //cb.wnez $r0? 172c4 <test_float_to_integer+0xb4>;;
     _64(0x0013c000e0000000),        //make $r0 = 1325400064 (0x4f000000);;
     _32(0x1fffffa9),        //call 17150 <f2u>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x04000000f101b000),        //compw.eq $r0 = $r0, 2147483648 (0x80000000);;
     _32(0x0c000080),        //cb.wnez $r0? 172c4 <test_float_to_integer+0xb4>;;
     _32(0x180008e8),        //call 19660 <abort>;;
     _64(0x0013c000e0000000),        //make $r0 = 1325400064 (0x4f000000);;
     _32(0x1fffffa1),        //call 17150 <f2u>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x04000000f101b000),        //compw.eq $r0 = $r0, 2147483648 (0x80000000);;
     _32(0x0c000080),        //cb.wnez $r0? 172e4 <test_float_to_integer+0xd4>;;
     _32(0x180008e0),        //call 19660 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffa2),        //call 17170 <d2u>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 172f8 <test_float_to_integer+0xe8>;;
     _32(0x180008db),        //call 19660 <abort>;;
     _96(0x01ff7fbe83b645a1e000cac0),        //make $r0 = 4607173411600762667 (0x3feff7ced916872b);;
     _32(0x1fffff9b),        //call 17170 <d2u>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 17314 <test_float_to_integer+0x104>;;
     _32(0x180008d4),        //call 19660 <abort>;;
     _96(0x01ff800080000000e0000000),        //make $r0 = 4607182418800017408 (0x3ff0000000000000);;
     _32(0x1fffff94),        //call 17170 <d2u>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 17338 <test_float_to_integer+0x128>;;
     _32(0x180008cb),        //call 19660 <abort>;;
     _96(0x01fffeb8828f5c28e000f5c0),        //make $r0 = 4611640982431114199 (0x3fffd70a3d70a3d7);;
     _32(0x1fffff8b),        //call 17170 <d2u>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 1735c <test_float_to_integer+0x14c>;;
     _32(0x180008c2),        //call 19660 <abort>;;
     _96(0x020f7fff87fff800e0000000),        //make $r0 = 4751297606873776128 (0x41efffffffe00000);;
     _32(0x1fffff82),        //call 17170 <d2u>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x07fffffff101b7c0),        //compw.eq $r0 = $r0, 4294967295 (0xffffffff);;
     _32(0x0c000080),        //cb.wnez $r0? 17380 <test_float_to_integer+0x170>;;
     _32(0x180008b9),        //call 19660 <abort>;;
     _96(0x020effff87fff000e0000000),        //make $r0 = 4746794007244308480 (0x41dfffffffc00000);;
     _32(0x1fffff79),        //call 17170 <d2u>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x03fffffff101b7c0),        //compw.eq $r0 = $r0, 2147483647 (0x7fffffff);;
     _32(0x0c000080),        //cb.wnez $r0? 173a4 <test_float_to_integer+0x194>;;
     _32(0x180008b0),        //call 19660 <abort>;;
     _96(0x020f000080000000e0000000),        //make $r0 = 4746794007248502784 (0x41e0000000000000);;
     _32(0x1fffff70),        //call 17170 <d2u>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x04000000f101b000),        //compw.eq $r0 = $r0, 2147483648 (0x80000000);;
     _32(0x0c000080),        //cb.wnez $r0? 173c8 <test_float_to_integer+0x1b8>;;
     _32(0x180008a7),        //call 19660 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff71),        //call 17190 <ld2u>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 173dc <test_float_to_integer+0x1cc>;;
     _32(0x180008a2),        //call 19660 <abort>;;
     _96(0x01ff7fbe83b645a1e000cac0),        //make $r0 = 4607173411600762667 (0x3feff7ced916872b);;
     _32(0x1fffff6a),        //call 17190 <ld2u>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 173f8 <test_float_to_integer+0x1e8>;;
     _32(0x1800089b),        //call 19660 <abort>;;
     _96(0x01ff800080000000e0000000),        //make $r0 = 4607182418800017408 (0x3ff0000000000000);;
     _32(0x1fffff63),        //call 17190 <ld2u>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 1741c <test_float_to_integer+0x20c>;;
     _32(0x18000892),        //call 19660 <abort>;;
     _96(0x01fffeb8828f5c28e000f5c0),        //make $r0 = 4611640982431114199 (0x3fffd70a3d70a3d7);;
     _32(0x1fffff5a),        //call 17190 <ld2u>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 17440 <test_float_to_integer+0x230>;;
     _32(0x18000889),        //call 19660 <abort>;;
     _96(0x020f7fff87fff800e0000000),        //make $r0 = 4751297606873776128 (0x41efffffffe00000);;
     _32(0x1fffff51),        //call 17190 <ld2u>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x07fffffff101b7c0),        //compw.eq $r0 = $r0, 4294967295 (0xffffffff);;
     _32(0x0c000080),        //cb.wnez $r0? 17464 <test_float_to_integer+0x254>;;
     _32(0x18000880),        //call 19660 <abort>;;
     _96(0x020effff87fff000e0000000),        //make $r0 = 4746794007244308480 (0x41dfffffffc00000);;
     _32(0x1fffff48),        //call 17190 <ld2u>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x03fffffff101b7c0),        //compw.eq $r0 = $r0, 2147483647 (0x7fffffff);;
     _32(0x0c000080),        //cb.wnez $r0? 17488 <test_float_to_integer+0x278>;;
     _32(0x18000877),        //call 19660 <abort>;;
     _96(0x020f000080000000e0000000),        //make $r0 = 4746794007248502784 (0x41e0000000000000);;
     _32(0x1fffff3f),        //call 17190 <ld2u>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x04000000f101b000),        //compw.eq $r0 = $r0, 2147483648 (0x80000000);;
     _32(0x0c000080),        //cb.wnez $r0? 174ac <test_float_to_integer+0x29c>;;
     _32(0x1800086e),        //call 19660 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff40),        //call 171b0 <f2s>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 174c0 <test_float_to_integer+0x2b0>;;
     _32(0x18000869),        //call 19660 <abort>;;
     _64(0x000fdfefe0009dc0),        //make $r0 = 1065336439 (0x3f7fbe77);;
     _32(0x1fffff3a),        //call 171b0 <f2s>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 174d8 <test_float_to_integer+0x2c8>;;
     _32(0x18000863),        //call 19660 <abort>;;
     _64(0x000fe000e0000000),        //make $r0 = 1065353216 (0x3f800000);;
     _32(0x1fffff34),        //call 171b0 <f2s>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 174f8 <test_float_to_integer+0x2e8>;;
     _32(0x1800085b),        //call 19660 <abort>;;
     _64(0x000fffaee0001480),        //make $r0 = 1073657938 (0x3ffeb852);;
     _32(0x1fffff2c),        //call 171b0 <f2s>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 17518 <test_float_to_integer+0x308>;;
     _32(0x18000853),        //call 19660 <abort>;;
     _64(0x002fdfefe0009dc0),        //make $r0 = 3212820087 (0xbf7fbe77);;
     _32(0x1fffff24),        //call 171b0 <f2s>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 17530 <test_float_to_integer+0x320>;;
     _32(0x1800084d),        //call 19660 <abort>;;
     _64(0x002fe000e0000000),        //make $r0 = 3212836864 (0xbf800000);;
     _32(0x1fffff1e),        //call 171b0 <f2s>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x07fffffff101b7c0),        //compw.eq $r0 = $r0, 4294967295 (0xffffffff);;
     _32(0x0c000080),        //cb.wnez $r0? 17550 <test_float_to_integer+0x340>;;
     _32(0x18000845),        //call 19660 <abort>;;
     _64(0x002fffaee0001480),        //make $r0 = 3221141586 (0xbffeb852);;
     _32(0x1fffff16),        //call 171b0 <f2s>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x07fffffff101b7c0),        //compw.eq $r0 = $r0, 4294967295 (0xffffffff);;
     _32(0x0c000080),        //cb.wnez $r0? 17570 <test_float_to_integer+0x360>;;
     _32(0x1800083d),        //call 19660 <abort>;;
     _64(0x0033c000e0000000),        //make $r0 = 3472883712 (0xcf000000);;
     _32(0x1fffff0e),        //call 171b0 <f2s>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x04000000f101b000),        //compw.eq $r0 = $r0, 2147483648 (0x80000000);;
     _32(0x0c000080),        //cb.wnez $r0? 17590 <test_float_to_integer+0x380>;;
     _32(0x18000835),        //call 19660 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff0f),        //call 171d0 <d2s>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 175a4 <test_float_to_integer+0x394>;;
     _32(0x18000830),        //call 19660 <abort>;;
     _96(0x01ff7fbe83b645a1e000cac0),        //make $r0 = 4607173411600762667 (0x3feff7ced916872b);;
     _32(0x1fffff08),        //call 171d0 <d2s>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 175c0 <test_float_to_integer+0x3b0>;;
     _32(0x18000829),        //call 19660 <abort>;;
     _96(0x01ff800080000000e0000000),        //make $r0 = 4607182418800017408 (0x3ff0000000000000);;
     _32(0x1fffff01),        //call 171d0 <d2s>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 175e4 <test_float_to_integer+0x3d4>;;
     _32(0x18000820),        //call 19660 <abort>;;
     _96(0x01fffeb8828f5c28e000f5c0),        //make $r0 = 4611640982431114199 (0x3fffd70a3d70a3d7);;
     _32(0x1ffffef8),        //call 171d0 <d2s>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 17608 <test_float_to_integer+0x3f8>;;
     _32(0x18000817),        //call 19660 <abort>;;
     _96(0x05ff7fbe83b645a1e000cac0),        //make $r0 = 13830545448455538475 (0xbfeff7ced916872b);;
     _32(0x1ffffeef),        //call 171d0 <d2s>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 17624 <test_float_to_integer+0x414>;;
     _32(0x18000810),        //call 19660 <abort>;;
     _96(0x05ff800080000000e0000000),        //make $r0 = 13830554455654793216 (0xbff0000000000000);;
     _32(0x1ffffee8),        //call 171d0 <d2s>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x07fffffff101b7c0),        //compw.eq $r0 = $r0, 4294967295 (0xffffffff);;
     _32(0x0c000080),        //cb.wnez $r0? 17648 <test_float_to_integer+0x438>;;
     _32(0x18000807),        //call 19660 <abort>;;
     _96(0x05fffeb8828f5c28e000f5c0),        //make $r0 = 13835013019285890007 (0xbfffd70a3d70a3d7);;
     _32(0x1ffffedf),        //call 171d0 <d2s>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x07fffffff101b7c0),        //compw.eq $r0 = $r0, 4294967295 (0xffffffff);;
     _32(0x0c000080),        //cb.wnez $r0? 1766c <test_float_to_integer+0x45c>;;
     _32(0x180007fe),        //call 19660 <abort>;;
     _96(0x020effff87fff000e0000000),        //make $r0 = 4746794007244308480 (0x41dfffffffc00000);;
     _32(0x1ffffed6),        //call 171d0 <d2s>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x03fffffff101b7c0),        //compw.eq $r0 = $r0, 2147483647 (0x7fffffff);;
     _32(0x0c000080),        //cb.wnez $r0? 17690 <test_float_to_integer+0x480>;;
     _32(0x180007f5),        //call 19660 <abort>;;
     _96(0x060f000080000000e0000000),        //make $r0 = 13970166044103278592 (0xc1e0000000000000);;
     _32(0x1ffffecd),        //call 171d0 <d2s>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x04000000f101b000),        //compw.eq $r0 = $r0, 2147483648 (0x80000000);;
     _32(0x0c000080),        //cb.wnez $r0? 176b4 <test_float_to_integer+0x4a4>;;
     _32(0x180007ec),        //call 19660 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1ffffece),        //call 171f0 <ld2s>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 176c8 <test_float_to_integer+0x4b8>;;
     _32(0x180007e7),        //call 19660 <abort>;;
     _96(0x01ff7fbe83b645a1e000cac0),        //make $r0 = 4607173411600762667 (0x3feff7ced916872b);;
     _32(0x1ffffec7),        //call 171f0 <ld2s>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 176e4 <test_float_to_integer+0x4d4>;;
     _32(0x180007e0),        //call 19660 <abort>;;
     _96(0x01ff800080000000e0000000),        //make $r0 = 4607182418800017408 (0x3ff0000000000000);;
     _32(0x1ffffec0),        //call 171f0 <ld2s>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 17708 <test_float_to_integer+0x4f8>;;
     _32(0x180007d7),        //call 19660 <abort>;;
     _96(0x01fffeb8828f5c28e000f5c0),        //make $r0 = 4611640982431114199 (0x3fffd70a3d70a3d7);;
     _32(0x1ffffeb7),        //call 171f0 <ld2s>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 1772c <test_float_to_integer+0x51c>;;
     _32(0x180007ce),        //call 19660 <abort>;;
     _96(0x05ff7fbe83b645a1e000cac0),        //make $r0 = 13830545448455538475 (0xbfeff7ced916872b);;
     _32(0x1ffffeae),        //call 171f0 <ld2s>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 17748 <test_float_to_integer+0x538>;;
     _32(0x180007c7),        //call 19660 <abort>;;
     _96(0x05ff800080000000e0000000),        //make $r0 = 13830554455654793216 (0xbff0000000000000);;
     _32(0x1ffffea7),        //call 171f0 <ld2s>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x07fffffff101b7c0),        //compw.eq $r0 = $r0, 4294967295 (0xffffffff);;
     _32(0x0c000080),        //cb.wnez $r0? 1776c <test_float_to_integer+0x55c>;;
     _32(0x180007be),        //call 19660 <abort>;;
     _96(0x05fffeb8828f5c28e000f5c0),        //make $r0 = 13835013019285890007 (0xbfffd70a3d70a3d7);;
     _32(0x1ffffe9e),        //call 171f0 <ld2s>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x07fffffff101b7c0),        //compw.eq $r0 = $r0, 4294967295 (0xffffffff);;
     _32(0x0c000080),        //cb.wnez $r0? 17790 <test_float_to_integer+0x580>;;
     _32(0x180007b5),        //call 19660 <abort>;;
     _96(0x020effff87fff000e0000000),        //make $r0 = 4746794007244308480 (0x41dfffffffc00000);;
     _32(0x1ffffe95),        //call 171f0 <ld2s>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x03fffffff101b7c0),        //compw.eq $r0 = $r0, 2147483647 (0x7fffffff);;
     _32(0x0c000080),        //cb.wnez $r0? 177b4 <test_float_to_integer+0x5a4>;;
     _32(0x180007ac),        //call 19660 <abort>;;
     _96(0x060f000080000000e0000000),        //make $r0 = 13970166044103278592 (0xc1e0000000000000);;
     _32(0x1ffffe8c),        //call 171f0 <ld2s>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x04000000f101b000),        //compw.eq $r0 = $r0, 2147483648 (0x80000000);;
     _32(0x0c000080),        //cb.wnez $r0? 177d8 <test_float_to_integer+0x5c8>;;
     _32(0x180007a3),        //call 19660 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let f2ull: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x78033000),        //fwidenlwd $r0 = $r0;;
     _32(0x47033000),        //fixedud.rz $r0 = $r0, 0 (0x0);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let d2ull: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x47033000),        //fixedud.rz $r0 = $r0, 0 (0x0);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let ld2ull: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x47033000),        //fixedud.rz $r0 = $r0, 0 (0x0);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f2sll: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x78033000),        //fwidenlwd $r0 = $r0;;
     _32(0x46033000),        //fixedd.rz $r0 = $r0, 0 (0x0);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let d2sll: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x46033000),        //fixedd.rz $r0 = $r0, 0 (0x0);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let ld2sll: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x46033000),        //fixedd.rz $r0 = $r0, 0 (0x0);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let test_float_to_longlong_integer: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffd4),        //call 177f0 <f2ull>;;
     _32(0x08800080),        //cb.deqz $r0? 178ac <test_float_to_longlong_integer+0x1c>;;
     _32(0x1800076e),        //call 19660 <abort>;;
     _64(0x000fdfefe0009dc0),        //make $r0 = 1065336439 (0x3f7fbe77);;
     _32(0x1fffffcf),        //call 177f0 <f2ull>;;
     _32(0x08800080),        //cb.deqz $r0? 178c0 <test_float_to_longlong_integer+0x30>;;
     _32(0x18000769),        //call 19660 <abort>;;
     _64(0x000fe000e0000000),        //make $r0 = 1065353216 (0x3f800000);;
     _32(0x1fffffca),        //call 177f0 <f2ull>;;
     _32(0x61010040),        //compd.eq $r0 = $r0, 1 (0x1);;
     _32(0x08000080),        //cb.dnez $r0? 178d8 <test_float_to_longlong_integer+0x48>;;
     _32(0x18000763),        //call 19660 <abort>;;
     _64(0x000fffaee0001480),        //make $r0 = 1073657938 (0x3ffeb852);;
     _32(0x1fffffc4),        //call 177f0 <f2ull>;;
     _32(0x61010040),        //compd.eq $r0 = $r0, 1 (0x1);;
     _32(0x08000080),        //cb.dnez $r0? 178f0 <test_float_to_longlong_integer+0x60>;;
     _32(0x1800075d),        //call 19660 <abort>;;
     _64(0x0017c000e0000000),        //make $r0 = 1593835520 (0x5f000000);;
     _32(0x1fffffbe),        //call 177f0 <f2ull>;;
     _96(0x03ffffff87ffffffe004ffc0),        //make $r1 = 9223372036854775807 (0x7fffffffffffffff);;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x08000280),        //cb.dnez $r0? 17934 <test_float_to_longlong_integer+0xa4>;;
     _64(0x0017c000e0000000),        //make $r0 = 1593835520 (0x5f000000);;
     _32(0x1fffffb6),        //call 177f0 <f2ull>;;
     _96(0x0400000080000000e0040000),        //make $r1 = 9223372036854775808 (0x8000000000000000);;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 17934 <test_float_to_longlong_integer+0xa4>;;
     _32(0x1800074c),        //call 19660 <abort>;;
     _64(0x0017c000e0000000),        //make $r0 = 1593835520 (0x5f000000);;
     _32(0x1fffffad),        //call 177f0 <f2ull>;;
     _96(0x0400000080000000e0040000),        //make $r1 = 9223372036854775808 (0x8000000000000000);;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 17958 <test_float_to_longlong_integer+0xc8>;;
     _32(0x18000743),        //call 19660 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffad),        //call 17810 <d2ull>;;
     _32(0x08800080),        //cb.deqz $r0? 17968 <test_float_to_longlong_integer+0xd8>;;
     _32(0x1800073f),        //call 19660 <abort>;;
     _96(0x01ff7fbe83b645a1e000cac0),        //make $r0 = 4607173411600762667 (0x3feff7ced916872b);;
     _32(0x1fffffa7),        //call 17810 <d2ull>;;
     _32(0x08800080),        //cb.deqz $r0? 17980 <test_float_to_longlong_integer+0xf0>;;
     _32(0x18000739),        //call 19660 <abort>;;
     _96(0x01ff800080000000e0000000),        //make $r0 = 4607182418800017408 (0x3ff0000000000000);;
     _32(0x1fffffa1),        //call 17810 <d2ull>;;
     _32(0x61010040),        //compd.eq $r0 = $r0, 1 (0x1);;
     _32(0x08000080),        //cb.dnez $r0? 1799c <test_float_to_longlong_integer+0x10c>;;
     _32(0x18000732),        //call 19660 <abort>;;
     _96(0x01fffeb8828f5c28e000f5c0),        //make $r0 = 4611640982431114199 (0x3fffd70a3d70a3d7);;
     _32(0x1fffff9a),        //call 17810 <d2ull>;;
     _32(0x61010040),        //compd.eq $r0 = $r0, 1 (0x1);;
     _32(0x08000080),        //cb.dnez $r0? 179b8 <test_float_to_longlong_integer+0x128>;;
     _32(0x1800072b),        //call 19660 <abort>;;
     _96(0x021f000080000000e0000000),        //make $r0 = 4890909195324358656 (0x43e0000000000000);;
     _32(0x1fffff93),        //call 17810 <d2ull>;;
     _96(0x03ffffff87ffffffe004ffc0),        //make $r1 = 9223372036854775807 (0x7fffffffffffffff);;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x080002c0),        //cb.dnez $r0? 17a04 <test_float_to_longlong_integer+0x174>;;
     _96(0x021f000080000000e0000000),        //make $r0 = 4890909195324358656 (0x43e0000000000000);;
     _32(0x1fffff8a),        //call 17810 <d2ull>;;
     _96(0x0400000080000000e0040000),        //make $r1 = 9223372036854775808 (0x8000000000000000);;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 17a04 <test_float_to_longlong_integer+0x174>;;
     _32(0x18000718),        //call 19660 <abort>;;
     _96(0x021f000080000000e0000000),        //make $r0 = 4890909195324358656 (0x43e0000000000000);;
     _32(0x1fffff80),        //call 17810 <d2ull>;;
     _96(0x0400000080000000e0040000),        //make $r1 = 9223372036854775808 (0x8000000000000000);;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 17a2c <test_float_to_longlong_integer+0x19c>;;
     _32(0x1800070e),        //call 19660 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff7e),        //call 17828 <ld2ull>;;
     _32(0x08800080),        //cb.deqz $r0? 17a3c <test_float_to_longlong_integer+0x1ac>;;
     _32(0x1800070a),        //call 19660 <abort>;;
     _96(0x01ff7fbe83b645a1e000cac0),        //make $r0 = 4607173411600762667 (0x3feff7ced916872b);;
     _32(0x1fffff78),        //call 17828 <ld2ull>;;
     _32(0x08800080),        //cb.deqz $r0? 17a54 <test_float_to_longlong_integer+0x1c4>;;
     _32(0x18000704),        //call 19660 <abort>;;
     _96(0x01ff800080000000e0000000),        //make $r0 = 4607182418800017408 (0x3ff0000000000000);;
     _32(0x1fffff72),        //call 17828 <ld2ull>;;
     _32(0x61010040),        //compd.eq $r0 = $r0, 1 (0x1);;
     _32(0x08000080),        //cb.dnez $r0? 17a70 <test_float_to_longlong_integer+0x1e0>;;
     _32(0x180006fd),        //call 19660 <abort>;;
     _96(0x01fffeb8828f5c28e000f5c0),        //make $r0 = 4611640982431114199 (0x3fffd70a3d70a3d7);;
     _32(0x1fffff6b),        //call 17828 <ld2ull>;;
     _32(0x61010040),        //compd.eq $r0 = $r0, 1 (0x1);;
     _32(0x08000080),        //cb.dnez $r0? 17a8c <test_float_to_longlong_integer+0x1fc>;;
     _32(0x180006f6),        //call 19660 <abort>;;
     _96(0x021f000080000000e0000000),        //make $r0 = 4890909195324358656 (0x43e0000000000000);;
     _32(0x1fffff64),        //call 17828 <ld2ull>;;
     _96(0x03ffffff87ffffffe004ffc0),        //make $r1 = 9223372036854775807 (0x7fffffffffffffff);;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x080002c0),        //cb.dnez $r0? 17ad8 <test_float_to_longlong_integer+0x248>;;
     _96(0x021f000080000000e0000000),        //make $r0 = 4890909195324358656 (0x43e0000000000000);;
     _32(0x1fffff5b),        //call 17828 <ld2ull>;;
     _96(0x0400000080000000e0040000),        //make $r1 = 9223372036854775808 (0x8000000000000000);;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 17ad8 <test_float_to_longlong_integer+0x248>;;
     _32(0x180006e3),        //call 19660 <abort>;;
     _96(0x021f000080000000e0000000),        //make $r0 = 4890909195324358656 (0x43e0000000000000);;
     _32(0x1fffff51),        //call 17828 <ld2ull>;;
     _96(0x0400000080000000e0040000),        //make $r1 = 9223372036854775808 (0x8000000000000000);;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 17b00 <test_float_to_longlong_integer+0x270>;;
     _32(0x180006d9),        //call 19660 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff4f),        //call 17840 <f2sll>;;
     _32(0x08800080),        //cb.deqz $r0? 17b10 <test_float_to_longlong_integer+0x280>;;
     _32(0x180006d5),        //call 19660 <abort>;;
     _64(0x000fdfefe0009dc0),        //make $r0 = 1065336439 (0x3f7fbe77);;
     _32(0x1fffff4a),        //call 17840 <f2sll>;;
     _32(0x08800080),        //cb.deqz $r0? 17b24 <test_float_to_longlong_integer+0x294>;;
     _32(0x180006d0),        //call 19660 <abort>;;
     _64(0x000fe000e0000000),        //make $r0 = 1065353216 (0x3f800000);;
     _32(0x1fffff45),        //call 17840 <f2sll>;;
     _32(0x61010040),        //compd.eq $r0 = $r0, 1 (0x1);;
     _32(0x08000080),        //cb.dnez $r0? 17b3c <test_float_to_longlong_integer+0x2ac>;;
     _32(0x180006ca),        //call 19660 <abort>;;
     _64(0x000fffaee0001480),        //make $r0 = 1073657938 (0x3ffeb852);;
     _32(0x1fffff3f),        //call 17840 <f2sll>;;
     _32(0x61010040),        //compd.eq $r0 = $r0, 1 (0x1);;
     _32(0x08000080),        //cb.dnez $r0? 17b54 <test_float_to_longlong_integer+0x2c4>;;
     _32(0x180006c4),        //call 19660 <abort>;;
     _64(0x002fdfefe0009dc0),        //make $r0 = 3212820087 (0xbf7fbe77);;
     _32(0x1fffff39),        //call 17840 <f2sll>;;
     _32(0x08800080),        //cb.deqz $r0? 17b68 <test_float_to_longlong_integer+0x2d8>;;
     _32(0x180006bf),        //call 19660 <abort>;;
     _64(0x002fe000e0000000),        //make $r0 = 3212836864 (0xbf800000);;
     _32(0x1fffff34),        //call 17840 <f2sll>;;
     _32(0x6101ffc0),        //compd.eq $r0 = $r0, -1 (0xffffffff);;
     _32(0x08000080),        //cb.dnez $r0? 17b80 <test_float_to_longlong_integer+0x2f0>;;
     _32(0x180006b9),        //call 19660 <abort>;;
     _64(0x002fffaee0001480),        //make $r0 = 3221141586 (0xbffeb852);;
     _32(0x1fffff2e),        //call 17840 <f2sll>;;
     _32(0x6101ffc0),        //compd.eq $r0 = $r0, -1 (0xffffffff);;
     _32(0x08000080),        //cb.dnez $r0? 17b98 <test_float_to_longlong_integer+0x308>;;
     _32(0x180006b3),        //call 19660 <abort>;;
     _64(0x0037c000e0000000),        //make $r0 = 3741319168 (0xdf000000);;
     _32(0x1fffff28),        //call 17840 <f2sll>;;
     _96(0x0400000080000000e0040000),        //make $r1 = 9223372036854775808 (0x8000000000000000);;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 17bbc <test_float_to_longlong_integer+0x32c>;;
     _32(0x180006aa),        //call 19660 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff28),        //call 17860 <d2sll>;;
     _32(0x08800080),        //cb.deqz $r0? 17bcc <test_float_to_longlong_integer+0x33c>;;
     _32(0x180006a6),        //call 19660 <abort>;;
     _96(0x01ff7fbe83b645a1e000cac0),        //make $r0 = 4607173411600762667 (0x3feff7ced916872b);;
     _32(0x1fffff22),        //call 17860 <d2sll>;;
     _32(0x08800080),        //cb.deqz $r0? 17be4 <test_float_to_longlong_integer+0x354>;;
     _32(0x180006a0),        //call 19660 <abort>;;
     _96(0x01ff800080000000e0000000),        //make $r0 = 4607182418800017408 (0x3ff0000000000000);;
     _32(0x1fffff1c),        //call 17860 <d2sll>;;
     _32(0x61010040),        //compd.eq $r0 = $r0, 1 (0x1);;
     _32(0x08000080),        //cb.dnez $r0? 17c00 <test_float_to_longlong_integer+0x370>;;
     _32(0x18000699),        //call 19660 <abort>;;
     _96(0x01fffeb8828f5c28e000f5c0),        //make $r0 = 4611640982431114199 (0x3fffd70a3d70a3d7);;
     _32(0x1fffff15),        //call 17860 <d2sll>;;
     _32(0x61010040),        //compd.eq $r0 = $r0, 1 (0x1);;
     _32(0x08000080),        //cb.dnez $r0? 17c1c <test_float_to_longlong_integer+0x38c>;;
     _32(0x18000692),        //call 19660 <abort>;;
     _96(0x05ff7fbe83b645a1e000cac0),        //make $r0 = 13830545448455538475 (0xbfeff7ced916872b);;
     _32(0x1fffff0e),        //call 17860 <d2sll>;;
     _32(0x08800080),        //cb.deqz $r0? 17c34 <test_float_to_longlong_integer+0x3a4>;;
     _32(0x1800068c),        //call 19660 <abort>;;
     _96(0x05ff800080000000e0000000),        //make $r0 = 13830554455654793216 (0xbff0000000000000);;
     _32(0x1fffff08),        //call 17860 <d2sll>;;
     _32(0x6101ffc0),        //compd.eq $r0 = $r0, -1 (0xffffffff);;
     _32(0x08000080),        //cb.dnez $r0? 17c50 <test_float_to_longlong_integer+0x3c0>;;
     _32(0x18000685),        //call 19660 <abort>;;
     _96(0x05fffeb8828f5c28e000f5c0),        //make $r0 = 13835013019285890007 (0xbfffd70a3d70a3d7);;
     _32(0x1fffff01),        //call 17860 <d2sll>;;
     _32(0x6101ffc0),        //compd.eq $r0 = $r0, -1 (0xffffffff);;
     _32(0x08000080),        //cb.dnez $r0? 17c6c <test_float_to_longlong_integer+0x3dc>;;
     _32(0x1800067e),        //call 19660 <abort>;;
     _96(0x061f000080000000e0000000),        //make $r0 = 14114281232179134464 (0xc3e0000000000000);;
     _32(0x1ffffefa),        //call 17860 <d2sll>;;
     _96(0x0400000080000000e0040000),        //make $r1 = 9223372036854775808 (0x8000000000000000);;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 17c94 <test_float_to_longlong_integer+0x404>;;
     _32(0x18000674),        //call 19660 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1ffffef8),        //call 17878 <ld2sll>;;
     _32(0x08800080),        //cb.deqz $r0? 17ca4 <test_float_to_longlong_integer+0x414>;;
     _32(0x18000670),        //call 19660 <abort>;;
     _96(0x01ff7fbe83b645a1e000cac0),        //make $r0 = 4607173411600762667 (0x3feff7ced916872b);;
     _32(0x1ffffef2),        //call 17878 <ld2sll>;;
     _32(0x08800080),        //cb.deqz $r0? 17cbc <test_float_to_longlong_integer+0x42c>;;
     _32(0x1800066a),        //call 19660 <abort>;;
     _96(0x01ff800080000000e0000000),        //make $r0 = 4607182418800017408 (0x3ff0000000000000);;
     _32(0x1ffffeec),        //call 17878 <ld2sll>;;
     _32(0x61010040),        //compd.eq $r0 = $r0, 1 (0x1);;
     _32(0x08000080),        //cb.dnez $r0? 17cd8 <test_float_to_longlong_integer+0x448>;;
     _32(0x18000663),        //call 19660 <abort>;;
     _96(0x01fffeb8828f5c28e000f5c0),        //make $r0 = 4611640982431114199 (0x3fffd70a3d70a3d7);;
     _32(0x1ffffee5),        //call 17878 <ld2sll>;;
     _32(0x61010040),        //compd.eq $r0 = $r0, 1 (0x1);;
     _32(0x08000080),        //cb.dnez $r0? 17cf4 <test_float_to_longlong_integer+0x464>;;
     _32(0x1800065c),        //call 19660 <abort>;;
     _96(0x05ff7fbe83b645a1e000cac0),        //make $r0 = 13830545448455538475 (0xbfeff7ced916872b);;
     _32(0x1ffffede),        //call 17878 <ld2sll>;;
     _32(0x08800080),        //cb.deqz $r0? 17d0c <test_float_to_longlong_integer+0x47c>;;
     _32(0x18000656),        //call 19660 <abort>;;
     _96(0x05ff800080000000e0000000),        //make $r0 = 13830554455654793216 (0xbff0000000000000);;
     _32(0x1ffffed8),        //call 17878 <ld2sll>;;
     _32(0x6101ffc0),        //compd.eq $r0 = $r0, -1 (0xffffffff);;
     _32(0x08000080),        //cb.dnez $r0? 17d28 <test_float_to_longlong_integer+0x498>;;
     _32(0x1800064f),        //call 19660 <abort>;;
     _96(0x05fffeb8828f5c28e000f5c0),        //make $r0 = 13835013019285890007 (0xbfffd70a3d70a3d7);;
     _32(0x1ffffed1),        //call 17878 <ld2sll>;;
     _32(0x6101ffc0),        //compd.eq $r0 = $r0, -1 (0xffffffff);;
     _32(0x08000080),        //cb.dnez $r0? 17d44 <test_float_to_longlong_integer+0x4b4>;;
     _32(0x18000648),        //call 19660 <abort>;;
     _96(0x061f000080000000e0000000),        //make $r0 = 14114281232179134464 (0xc3e0000000000000);;
     _32(0x1ffffeca),        //call 17878 <ld2sll>;;
     _96(0x0400000080000000e0040000),        //make $r1 = 9223372036854775808 (0x8000000000000000);;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 17d6c <test_float_to_longlong_integer+0x4dc>;;
     _32(0x1800063e),        //call 19660 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1ffffb23),        //call 16a18 <test_integer_to_float>;;
     _32(0x1ffffd20),        //call 17210 <test_float_to_integer>;;
     _32(0x1ffffc1b),        //call 16e00 <test_longlong_integer_to_float>;;
     _32(0x1ffffebe),        //call 17890 <test_float_to_longlong_integer>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000638),        //call 19680 <exit>;;
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
     _32(0x08801c83),        //cb.deqz $r3? 17f9c <__divsf3+0x1f4>;;
     _32(0x0c002744),        //cb.wnez $r4? 1804c <__divsf3+0x2a4>;;
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
     _32(0x08801b82),        //cb.deqz $r2? 17fd0 <__divsf3+0x228>;;
     _64(0x00000007f129b7c2),        //compw.eq $r10 = $r2, 255 (0xff);;
     _32(0x0c00098a),        //cb.wnez $r10? 17ebc <__divsf3+0x114>;;
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
     _32(0x880020c1),        //cb.dnez $r1? 180c8 <__divsf3+0x320>
     _32(0x710cc043),        //addw $r3 = $r3, -255 (0xffffff01);;
     _32(0x90000045),        //goto 17fd8 <__divsf3+0x230>
     _32(0x60800002),        //make $r32 = 2 (0x2);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0xf824ffc7),        //zxwd $r9 = $r7
     _32(0xea140007),        //copyd $r5 = $r7
     _32(0xea000001),        //copyd $r0 = $r1
     _32(0x6a400020),        //copyd $r16 = $r32;;
     _64(0x00000000f105b050),        //compw.eq $r1 = $r16, 1 (0x1);;
     _32(0x0c003401),        //cb.wnez $r1? 18228 <__divsf3+0x480>;;
     _32(0x088001d0),        //cb.deqz $r16? 17f08 <__divsf3+0x160>;;
     _64(0xf141b0d0f105b090),        //compw.eq $r1 = $r16, 2 (0x2)
     _64(0x0800000080000000),        //compw.eq $r16 = $r16, 3 (0x3);;
     _32(0x0c0046c1),        //cb.wnez $r1? 1836c <__divsf3+0x5c4>;;
     _32(0x0c002050),        //cb.wnez $r16? 18108 <__divsf3+0x360>;;
     _32(0xf1041fc3),        //addw $r1 = $r3, 127 (0x7f)
     _32(0x71081fc3),        //addw $r2 = $r3, 127 (0x7f);;
     _32(0x0e002281),        //cb.wlez $r1? 18138 <__divsf3+0x390>;;
     _32(0x780401c0),        //andw $r1 = $r0, 7 (0x7);;
     _32(0x0c800501),        //cb.weqz $r1? 17f68 <__divsf3+0x1c0>;;
     _32(0xea200000),        //copyd $r8 = $r0
     _64(0xfa180806f8040011),        //andw $r1 = $r17, 3342336 (0x330000)
     _64(0x88000cc0e81c0011),        //orw $r6 = $r6, 8224 (0x2020)
     _64(0x18000cc090000008),        //andd $r7 = $r17, 3342336 (0x330000);;
     _64(0xf105b001f111b001),        //compw.eq $r4 = $r1, 1114112 (0x110000)
     _64(0x0801100080008800),        //compw.eq $r1 = $r1, 2228224 (0x220000);;
     _32(0x0c004a04),        //cb.wnez $r4? 183e8 <__divsf3+0x640>;;
     _32(0x0c004741),        //cb.wnez $r1? 183c0 <__divsf3+0x618>;;
     _32(0xf81003c0),        //andw $r4 = $r0, 15 (0xf)
     _32(0x71040100),        //addw $r1 = $r0, 4 (0x4);;
     _64(0x00000000f111b104),        //compw.eq $r4 = $r4, 4 (0x4);;
     _32(0x79220044),        //cmoved.weqz $r4? $r8 = $r1;;
     _32(0x71020207),        //cmoved.deqz $r7? $r0 = $r8;;
     _64(0x00020000f8040000),        //andw $r1 = $r0, 134217728 (0x8000000);;
     _32(0x0c800101),        //cb.weqz $r1? 17f80 <__divsf3+0x1d8>;;
     _32(0xf1082003),        //addw $r2 = $r3, 128 (0x80)
     _64(0x083dffffe800ffc0),        //andd $r0 = $r0, 4160749567 (0xf7ffffff);;
     _64(0x00000007f505b782),        //compw.gt $r1 = $r2, 254 (0xfe);;
     _32(0x0c0033c1),        //cb.wnez $r1? 182c4 <__divsf3+0x51c>;;
     _32(0x90000059),        //goto 180f0 <__divsf3+0x348>
     _32(0xe50f90c0),        //extfz $r3 = $r0, 25 (0x19), 3 (0x3)
     _32(0xf8043fc2),        //zxbd $r1 = $r2
     _32(0x791a2806),        //slld $r6 = $r6, 32 (0x20);;
     _32(0x08001080),        //cb.dnez $r0? 180a4 <__divsf3+0x2fc>;;
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
     _32(0x087fe502),        //cb.dnez $r2? 17e1c <__divsf3+0x74>;;
     _32(0x08000941),        //cb.dnez $r1? 18064 <__divsf3+0x2bc>;;
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
     _32(0x08000380),        //cb.dnez $r0? 18084 <__divsf3+0x2dc>;;
     _32(0x97ffff6b),        //goto 17dfc <__divsf3+0x54>
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
     _32(0x97ffff72),        //goto 17e44 <__divsf3+0x9c>
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0xe0180202),        //make $r6 = 514 (0x202)
     _32(0xe010000c),        //make $r4 = 12 (0xc)
     _32(0xe00c00ff),        //make $r3 = 255 (0xff)
     _64(0x18001000f8080002),        //andw $r2 = $r2, 4194304 (0x400000);;
     _32(0x97ffff59),        //goto 17dfc <__divsf3+0x54>
     _32(0xe81a0002),        //cmoved.wnez $r2? $r6 = 0 (0x0)
     _32(0x60400003),        //make $r16 = 3 (0x3);;
     _32(0xf00e3002),        //clzw $r3 = $r2
     _32(0xe0100000),        //make $r4 = 0 (0x0)
     _32(0xe0400000),        //make $r16 = 0 (0x0)
     _32(0x60180000),        //make $r6 = 0 (0x0);;
     _32(0xf100fec3),        //addw $r0 = $r3, -5 (0xfffffffb)
     _32(0x750ce283),        //sbfw $r3 = $r3, -118 (0xffffff8a);;
     _32(0x79027002),        //sllw $r0 = $r2, $r0;;
     _32(0x97ffff4f),        //goto 17dfc <__divsf3+0x54>
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0xe0080202),        //make $r2 = 514 (0x202)
     _32(0xe0800003),        //make $r32 = 3 (0x3)
     _64(0x10001000f8200008),        //andw $r8 = $r8, 4194304 (0x400000);;
     _32(0x97ffff5b),        //goto 17e44 <__divsf3+0x9c>
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
     _32(0x0c001e42),        //cb.wnez $r2? 18328 <__divsf3+0x580>;;
     _32(0xf10c2783),        //addw $r3 = $r3, 158 (0x9e)
     _32(0x7b0a7040),        //srlw $r2 = $r0, $r1;;
     _32(0x790270c0),        //sllw $r0 = $r0, $r3;;
     _64(0x00000000f001b000),        //compw.ne $r0 = $r0, 0 (0x0);;
     _32(0xfa051002),        //orw $r1 = $r2, $r0
     _32(0x7a011002),        //orw $r0 = $r2, $r0;;
     _32(0x780801c1),        //andw $r2 = $r1, 7 (0x7);;
     _32(0x0c802142),        //cb.weqz $r2? 1837c <__divsf3+0x5d4>;;
     _64(0xfa180806f8080011),        //andw $r2 = $r17, 3342336 (0x330000)
     _64(0x80000cc0e8440011),        //orw $r6 = $r6, 8224 (0x2020)
     _64(0x10000cc088000008),        //andd $r17 = $r17, 3342336 (0x330000);;
     _64(0xf109b002f10db002),        //compw.eq $r3 = $r2, 1114112 (0x110000)
     _64(0x0801100080008800),        //compw.eq $r2 = $r2, 2228224 (0x220000);;
     _32(0x0c0027c3),        //cb.wnez $r3? 18410 <__divsf3+0x668>;;
     _32(0x0c0026c2),        //cb.wnez $r2? 18404 <__divsf3+0x65c>;;
     _32(0xf80803c1),        //andw $r2 = $r1, 15 (0xf)
     _32(0xea0c0000),        //copyd $r3 = $r0
     _32(0x71040101),        //addw $r1 = $r1, 4 (0x4);;
     _64(0x00000000f109b102),        //compw.eq $r2 = $r2, 4 (0x4);;
     _32(0x790e0042),        //cmoved.weqz $r2? $r3 = $r1;;
     _32(0x710200d1),        //cmoved.deqz $r17? $r0 = $r3;;
     _64(0x00010000f8040000),        //andw $r1 = $r0, 67108864 (0x4000000);;
     _32(0x0c8025c1),        //cb.weqz $r1? 1841c <__divsf3+0x674>;;
     _32(0xe0040001),        //make $r1 = 1 (0x1)
     _32(0xe00c0000),        //make $r3 = 0 (0x0)
     _64(0x10000008fa180806),        //orw $r6 = $r6, 8224 (0x2020);;
     _64(0x00000004fa180406),        //orw $r6 = $r6, 4112 (0x1010);;
     _32(0x97ffffc5),        //goto 180f0 <__divsf3+0x348>
     _32(0x791a2806),        //slld $r6 = $r6, 32 (0x20);;
     _32(0x97ffffcf),        //goto 18120 <__divsf3+0x378>
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
     _32(0x97ffffb2),        //goto 180f0 <__divsf3+0x348>
     _32(0xf91a2806),        //slld $r6 = $r6, 32 (0x20)
     _32(0xe0040000),        //make $r1 = 0 (0x0)
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0xea14000a),        //copyd $r5 = $r10
     _32(0xe00400ff),        //make $r1 = 255 (0xff)
     _32(0xe00c0000),        //make $r3 = 0 (0x0)
     _64(0x18000001fa180106),        //orw $r6 = $r6, 1028 (0x404);;
     _32(0x97ffffa9),        //goto 180f0 <__divsf3+0x348>
     _32(0x791a2806),        //slld $r6 = $r6, 32 (0x20);;
     _32(0xf90a3140),        //sllw $r2 = $r0, 5 (0x5)
     _32(0xf9063141),        //sllw $r1 = $r1, 5 (0x5)
     _32(0x6014001b),        //make $r5 = 27 (0x1b);;
     _32(0xf611b042),        //compw.ltu $r4 = $r2, $r1
     _32(0xf81cffc1),        //zxwd $r7 = $r1
     _32(0x7800ffc2),        //zxwd $r0 = $r2;;
     _32(0x0c800a84),        //cb.weqz $r4? 18314 <__divsf3+0x56c>;;
     _32(0xf10cffc3),        //addw $r3 = $r3, -1 (0xffffffff)
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x0f000285),        //loopdo $r5, 182a0 <__divsf3+0x4f8>;;
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
     _32(0x0effc581),        //cb.wgtz $r1? 17f14 <__divsf3+0x16c>;;
     _32(0x17ffff9e),        //goto 18138 <__divsf3+0x390>;;
     _32(0xe00c0000),        //make $r3 = 0 (0x0)
     _64(0xe8440011f8000011),        //andw $r0 = $r17, 3342336 (0x330000)
     _64(0x10000cc088000cc0),        //andd $r17 = $r17, 3342336 (0x330000);;
     _64(0xf101b000f105b000),        //compw.eq $r1 = $r0, 1114112 (0x110000)
     _64(0x0801100080008800),        //compw.eq $r0 = $r0, 2228224 (0x220000);;
     _32(0x0c000e41),        //cb.wnez $r1? 183cc <__divsf3+0x624>;;
     _32(0x8c000bc0),        //cb.wnez $r0? 183a8 <__divsf3+0x600>
     _32(0x600400ff),        //make $r1 = 255 (0xff);;
     _32(0xe0063f91),        //cmoved.dnez $r17? $r1 = 254 (0xfe)
     _64(0x08001fffe000ffc0),        //make $r0 = 8388607 (0x7fffff);;
     _32(0x700e0011),        //cmoved.dnez $r17? $r3 = $r0;;
     _64(0x0000000afa180a06),        //orw $r6 = $r6, 10280 (0x2828);;
     _32(0x97ffff79),        //goto 180f0 <__divsf3+0x348>
     _32(0x791a2806),        //slld $r6 = $r6, 32 (0x20);;
     _32(0xf5051081),        //sbfw $r1 = $r1, $r2
     _32(0xe014001a),        //make $r5 = 26 (0x1a)
     _32(0x60080001),        //make $r2 = 1 (0x1);;
     _32(0x97ffffd6),        //goto 18278 <__divsf3+0x4d0>
     _32(0x7800ffc1),        //zxwd $r0 = $r1;;
     _32(0x88800300),        //cb.deqz $r0? 18358 <__divsf3+0x5b0>
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _64(0xfa180806f8440011),        //andw $r17 = $r17, 3342336 (0x330000)
     _64(0x0800000880000cc0),        //orw $r6 = $r6, 8224 (0x2020);;
     _64(0xf145b011f101b011),        //compw.eq $r0 = $r17, 1114112 (0x110000)
     _64(0x0801100080008800),        //compw.eq $r17 = $r17, 2228224 (0x220000);;
     _32(0x780e0251),        //cmoved.wnez $r17? $r3 = $r9;;
     _32(0x0c000a00),        //cb.wnez $r0? 183f4 <__divsf3+0x64c>;;
     _32(0xe0040000),        //make $r1 = 0 (0x0)
     _64(0x08000004fa180406),        //orw $r6 = $r6, 4112 (0x1010);;
     _32(0x97ffff63),        //goto 180f0 <__divsf3+0x348>
     _32(0x791a2806),        //slld $r6 = $r6, 32 (0x20);;
     _32(0x97ffff61),        //goto 180f0 <__divsf3+0x348>
     _32(0xf91a2806),        //slld $r6 = $r6, 32 (0x20)
     _32(0xe00400ff),        //make $r1 = 255 (0xff)
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _64(0xf8080806f8000001),        //andw $r0 = $r1, 67108864 (0x4000000)
     _64(0x0800000880010000),        //andw $r2 = $r6, 8224 (0x2020);;
     _32(0x0c7fe380),        //cb.wnez $r0? 181c4 <__divsf3+0x41c>;;
     _32(0xe50390c1),        //extfz $r0 = $r1, 25 (0x19), 3 (0x3)
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x8c000902),        //cb.wnez $r2? 18428 <__divsf3+0x680>
     _32(0x780cffc0),        //zxwd $r3 = $r0;;
     _32(0x97ffff54),        //goto 180f0 <__divsf3+0x348>
     _32(0x791a2806),        //slld $r6 = $r6, 32 (0x20);;
     _32(0xe1063f89),        //cmoved.deqz $r9? $r1 = 254 (0xfe)
     _32(0xe00c0000),        //make $r3 = 0 (0x0)
     _64(0x10001fffe000ffc0),        //make $r0 = 8388607 (0x7fffff);;
     _32(0x97ffffd3),        //goto 18304 <__divsf3+0x55c>
     _32(0x710e0009),        //cmoved.deqz $r9? $r3 = $r0;;
     _32(0x71040200),        //addw $r1 = $r0, 8 (0x8);;
     _32(0x97fffee9),        //goto 17f68 <__divsf3+0x1c0>
     _32(0x70020049),        //cmoved.dnez $r9? $r0 = $r1;;
     _32(0xe00400ff),        //make $r1 = 255 (0xff)
     _32(0xe00c0000),        //make $r3 = 0 (0x0)
     _64(0x10001fffe000ffc0),        //make $r0 = 8388607 (0x7fffff);;
     _32(0x97ffffca),        //goto 18304 <__divsf3+0x55c>
     _32(0xe0063f89),        //cmoved.dnez $r9? $r1 = 254 (0xfe)
     _32(0x700e0009),        //cmoved.dnez $r9? $r3 = $r0;;
     _32(0x71040200),        //addw $r1 = $r0, 8 (0x8);;
     _32(0x97fffedf),        //goto 17f68 <__divsf3+0x1c0>
     _32(0x71020049),        //cmoved.deqz $r9? $r0 = $r1;;
     _32(0x75000049),        //sbfw $r0 = $r9, 1 (0x1);;
     _32(0x97ffffd8),        //goto 18358 <__divsf3+0x5b0>
     _64(0x00001fffe80cffc0),        //andd $r3 = $r0, 8388607 (0x7fffff);;
     _32(0x71040201),        //addw $r1 = $r1, 8 (0x8);;
     _32(0x97ffff6c),        //goto 181b8 <__divsf3+0x410>
     _32(0x70020049),        //cmoved.dnez $r9? $r0 = $r1;;
     _32(0x71040201),        //addw $r1 = $r1, 8 (0x8);;
     _32(0x97ffff69),        //goto 181b8 <__divsf3+0x410>
     _32(0x71020049),        //cmoved.deqz $r9? $r0 = $r1;;
     _32(0x97ffff6e),        //goto 181d4 <__divsf3+0x42c>
     _32(0xe50f90c0),        //extfz $r3 = $r0, 25 (0x19), 3 (0x3)
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x97ffff6b),        //goto 181d4 <__divsf3+0x42c>
     _32(0x60040000)        //make $r1 = 0 (0x0);;
 |];

let __floatdisf: list_I = 
 [|
     _32(0x6a0c0000),        //copyd $r3 = $r0;;
     _32(0x0fc40106),        //get $r6 = $cs;;
     _32(0x88800fc3),        //cb.deqz $r3? 18534 <__floatdisf+0x104>
     _32(0xe0100000),        //make $r4 = 0 (0x0)
     _32(0xe0040000),        //make $r1 = 0 (0x0)
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0xe4040003),        //absd $r1 = $r3
     _32(0x7b122fc3),        //srld $r4 = $r3, 63 (0x3f);;
     _32(0x7b0a2801),        //srld $r2 = $r1, 32 (0x20);;
     _32(0x08800f82),        //cb.deqz $r2? 1854c <__floatdisf+0x11c>;;
     _32(0x700a3002),        //clzw $r2 = $r2;;
     _32(0xf81cffc2),        //zxwd $r7 = $r2
     _32(0x75082f82),        //sbfw $r2 = $r2, 190 (0xbe);;
     _32(0xf10006c7),        //addw $r0 = $r7, 27 (0x1b)
     _32(0x75140947),        //sbfw $r5 = $r7, 37 (0x25);;
     _32(0xf9026001),        //slld $r0 = $r1, $r0
     _32(0x7b066141),        //srld $r1 = $r1, $r5;;
     _32(0x60010000),        //compd.ne $r0 = $r0, 0 (0x0);;
     _32(0x7a050001),        //ord $r1 = $r1, $r0;;
     _32(0x7814ffc1),        //zxwd $r5 = $r1;;
     _32(0xf100f6c7),        //addw $r0 = $r7, -37 (0xffffffdb)
     _64(0x08000001f405b147),        //compw.le $r1 = $r7, 37 (0x25);;
     _32(0x79027005),        //sllw $r0 = $r5, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x79160001),        //cmoved.weqz $r1? $r5 = $r0;;
     _32(0xea000005),        //copyd $r0 = $r5
     _32(0x781401c5),        //andw $r5 = $r5, 7 (0x7);;
     _64(0xf820ffc0e804ffc0),        //andd $r1 = $r0, 4227858431 (0xfbffffff)
     _64(0x0ffeffff803effff),        //andw $r8 = $r0, -67108865 (0xfffffffffbffffff);;
     _32(0x0c801045),        //cb.weqz $r5? 185b4 <__floatdisf+0x184>;;
     _64(0xe8180006f8140006),        //andw $r5 = $r6, 3342336 (0x330000)
     _64(0x08000cc080000cc0),        //andd $r6 = $r6, 3342336 (0x330000);;
     _64(0xf115b005f125b005),        //compw.eq $r9 = $r5, 1114112 (0x110000)
     _64(0x0801100080008800),        //compw.eq $r5 = $r5, 2228224 (0x220000);;
     _32(0x0c001149),        //cb.wnez $r9? 185e8 <__floatdisf+0x1b8>;;
     _32(0x0c000fc5),        //cb.wnez $r5? 185d4 <__floatdisf+0x1a4>;;
     _32(0x88000dc6),        //cb.dnez $r6? 185b8 <__floatdisf+0x188>
     _96(0x0000010180000000e00c0000),        //make $r3 = 35321811042304 (0x202000000000);;
     _32(0x780003c0),        //andw $r0 = $r0, 15 (0xf);;
     _64(0x00000000f101b100),        //compw.eq $r0 = $r0, 4 (0x4);;
     _32(0x0c000c00),        //cb.wnez $r0? 185b8 <__floatdisf+0x188>;;
     _32(0xf1000108),        //addw $r0 = $r8, 4 (0x4)
     _32(0x71040108),        //addw $r1 = $r8, 4 (0x4);;
     _64(0x00010000f8000000),        //andw $r0 = $r0, 67108864 (0x4000000);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800c80),        //cb.deqz $r0? 185d8 <__floatdisf+0x1a8>;;
     _32(0xf5082fc7),        //sbfw $r2 = $r7, 191 (0xbf)
     _64(0xe00c0000e804ffc1),        //andd $r1 = $r1, 4227858431 (0xfbffffff)
     _96(0x1000010190000000883effff),        //make $r3 = 35321811042304 (0x202000000000);;
     _32(0xe50390c1),        //extfz $r0 = $r1, 25 (0x19), 3 (0x3)
     _32(0x78043fc2),        //zxbd $r1 = $r2;;
     _32(0xf90635c1),        //sllw $r1 = $r1, 23 (0x17)
     _32(0x791237c4),        //sllw $r4 = $r4, 31 (0x1f);;
     _32(0x7a051001),        //orw $r1 = $r1, $r0;;
     _32(0x7a011101),        //orw $r0 = $r1, $r4;;
     _32(0x0fb80103),        //wfxl $cs, $r3;;
     _32(0x0fd00000),        //ret ;;
     _32(0xf0023001),        //clzw $r0 = $r1
     _32(0x7814ffc1),        //zxwd $r5 = $r1;;
     _32(0x71200800),        //addw $r8 = $r0, 32 (0x20);;
     _32(0xf5242f88),        //sbfw $r9 = $r8, 190 (0xbe)
     _32(0xf81cffc8),        //zxwd $r7 = $r8
     _32(0x75082f88),        //sbfw $r2 = $r8, 190 (0xbe);;
     _64(0x00000004f529b589),        //compw.gt $r10 = $r9, 150 (0x96);;
     _32(0x0c00058a),        //cb.wnez $r10? 185c4 <__floatdisf+0x194>;;
     _32(0xf118fe00),        //addw $r6 = $r0, -8 (0xfffffff8)
     _32(0xf8043fc2),        //zxbd $r1 = $r2
     _64(0xe800ffc1f521b208),        //compw.gt $r8 = $r8, 40 (0x28)
     _64(0x18001fff90000001),        //andd $r0 = $r1, 8388607 (0x7fffff);;
     _32(0xf9167185),        //sllw $r5 = $r5, $r6
     _32(0xf90635c1),        //sllw $r1 = $r1, 23 (0x17)
     _32(0xf91237c4),        //sllw $r4 = $r4, 31 (0x1f)
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _64(0x00001fffe814ffc5),        //andd $r5 = $r5, 8388607 (0x7fffff);;
     _32(0x78020148),        //cmoved.wnez $r8? $r0 = $r5;;
     _32(0x7a051001),        //orw $r1 = $r1, $r0;;
     _32(0x7a011101),        //orw $r0 = $r1, $r4;;
     _32(0x0fb80103),        //wfxl $cs, $r3;;
     _32(0x0fd00000),        //ret ;;
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0x97ffffdf),        //goto 18534 <__floatdisf+0x104>
     _32(0xe50390c1),        //extfz $r0 = $r1, 25 (0x19), 3 (0x3)
     _32(0x78043fc2),        //zxbd $r1 = $r2;;
     _64(0x00000004f425b649),        //compw.le $r9 = $r9, 153 (0x99);;
     _32(0x0c7feb49),        //cb.wnez $r9? 18480 <__floatdisf+0x50>;;
     _32(0x17ffffa5),        //goto 18464 <__floatdisf+0x34>;;
     _32(0x09000183),        //cb.dltz $r3? 185ec <__floatdisf+0x1bc>;;
     _32(0x97fffff8),        //goto 185b8 <__floatdisf+0x188>
     _96(0x0000010180000000e00c0000),        //make $r3 = 35321811042304 (0x202000000000);;
     _32(0x097fff03),        //cb.dltz $r3? 185d8 <__floatdisf+0x1a8>;;
     _32(0xf1000208),        //addw $r0 = $r8, 8 (0x8)
     _32(0x71040208),        //addw $r1 = $r8, 8 (0x8);;
     _64(0x00010000f8000000),        //andw $r0 = $r0, 67108864 (0x4000000);;
     _32(0x97ffffc5),        //goto 18510 <__floatdisf+0xe0>
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x00000000)        //errop ;;
 |];

let __floatundisf: list_I = 
 [|
     _32(0x0fc40104),        //get $r4 = $cs;;
     _32(0x88800cc0),        //cb.deqz $r0? 186d8 <__floatundisf+0xd0>
     _32(0xe0080000),        //make $r2 = 0 (0x0)
     _32(0xe0040000),        //make $r1 = 0 (0x0)
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0x7b0a2800),        //srld $r2 = $r0, 32 (0x20);;
     _32(0x08800c82),        //cb.deqz $r2? 186e8 <__floatundisf+0xe0>;;
     _32(0x70063002),        //clzw $r1 = $r2;;
     _32(0xf814ffc1),        //zxwd $r5 = $r1
     _32(0x75042f81),        //sbfw $r1 = $r1, 190 (0xbe);;
     _32(0xf10806c5),        //addw $r2 = $r5, 27 (0x1b)
     _32(0x750c0945),        //sbfw $r3 = $r5, 37 (0x25);;
     _32(0xf90a6080),        //slld $r2 = $r0, $r2
     _32(0x7b0260c0),        //srld $r0 = $r0, $r3;;
     _32(0x60090002),        //compd.ne $r2 = $r2, 0 (0x0);;
     _32(0x7a010002),        //ord $r0 = $r2, $r0;;
     _32(0x780cffc0),        //zxwd $r3 = $r0;;
     _32(0xf100f6c5),        //addw $r0 = $r5, -37 (0xffffffdb)
     _32(0xe0080000),        //make $r2 = 0 (0x0)
     _64(0x10000001f419b145),        //compw.le $r6 = $r5, 37 (0x25);;
     _32(0x79027003),        //sllw $r0 = $r3, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x790e0006),        //cmoved.weqz $r6? $r3 = $r0;;
     _32(0xf81801c3),        //andw $r6 = $r3, 7 (0x7)
     _64(0xf81cffc3e800ffc3),        //andd $r0 = $r3, 4227858431 (0xfbffffff)
     _64(0x17feffff883effff),        //andw $r7 = $r3, -67108865 (0xfffffffffbffffff);;
     _32(0x0c800546),        //cb.weqz $r6? 186d0 <__floatundisf+0xc8>;;
     _64(0xf8100004e8080004),        //andd $r2 = $r4, 3342336 (0x330000)
     _64(0x08000cc080000cc0),        //andw $r4 = $r4, 3342336 (0x330000);;
     _64(0x00008800f111b004),        //compw.eq $r4 = $r4, 1114112 (0x110000);;
     _32(0x08800d02),        //cb.deqz $r2? 18768 <__floatundisf+0x160>;;
     _32(0x0c800bc4),        //cb.weqz $r4? 18758 <__floatundisf+0x150>;;
     _32(0xf1080207),        //addw $r2 = $r7, 8 (0x8)
     _32(0x71000207),        //addw $r0 = $r7, 8 (0x8);;
     _64(0x00010000f8080002),        //andw $r2 = $r2, 67108864 (0x4000000);;
     _32(0x7808ffc2),        //zxwd $r2 = $r2;;
     _32(0x08800a42),        //cb.deqz $r2? 18758 <__floatundisf+0x150>;;
     _32(0xf5042fc5),        //sbfw $r1 = $r5, 191 (0xbf)
     _64(0xe0080000e800ffc0),        //andd $r0 = $r0, 4227858431 (0xfbffffff)
     _96(0x1000010190000000883effff),        //make $r2 = 35321811042304 (0x202000000000);;
     _32(0xe50f90c0),        //extfz $r3 = $r0, 25 (0x19), 3 (0x3)
     _32(0x78043fc1),        //zxbd $r1 = $r1;;
     _32(0x790635c1),        //sllw $r1 = $r1, 23 (0x17);;
     _32(0x7a0110c1),        //orw $r0 = $r1, $r3;;
     _32(0x0fb80102),        //wfxl $cs, $r2;;
     _32(0x0fd00000),        //ret ;;
     _32(0xf0223000),        //clzw $r8 = $r0
     _32(0x780cffc0),        //zxwd $r3 = $r0;;
     _32(0x71180808),        //addw $r6 = $r8, 32 (0x20);;
     _32(0xf51c2f86),        //sbfw $r7 = $r6, 190 (0xbe)
     _32(0xf814ffc6),        //zxwd $r5 = $r6
     _32(0x75042f86),        //sbfw $r1 = $r6, 190 (0xbe);;
     _64(0x00000004f525b587),        //compw.gt $r9 = $r7, 150 (0x96);;
     _32(0x0c000409),        //cb.wnez $r9? 18748 <__floatundisf+0x140>;;
     _32(0xf120fe08),        //addw $r8 = $r8, -8 (0xfffffff8)
     _32(0xf8043fc1),        //zxbd $r1 = $r1
     _64(0xe800ffc0f519b206),        //compw.gt $r6 = $r6, 40 (0x28)
     _64(0x18001fff90000001),        //andd $r0 = $r0, 8388607 (0x7fffff);;
     _32(0xf90e7203),        //sllw $r3 = $r3, $r8
     _32(0x790635c1),        //sllw $r1 = $r1, 23 (0x17);;
     _64(0x00001fffe80cffc3),        //andd $r3 = $r3, 8388607 (0x7fffff);;
     _32(0x780200c6),        //cmoved.wnez $r6? $r0 = $r3;;
     _32(0x6a0c0000),        //copyd $r3 = $r0;;
     _32(0x7a0110c1),        //orw $r0 = $r1, $r3;;
     _32(0x0fb80102),        //wfxl $cs, $r2;;
     _32(0x0fd00000),        //ret ;;
     _64(0x00000004f41db647),        //compw.le $r7 = $r7, 153 (0x99);;
     _32(0x0c7fefc7),        //cb.wnez $r7? 1864c <__floatundisf+0x44>;;
     _32(0x17ffffb7),        //goto 18630 <__floatundisf+0x28>;;
     _32(0x97ffffde),        //goto 186d0 <__floatundisf+0xc8>
     _96(0x0000010180000000e0080000),        //make $r2 = 35321811042304 (0x202000000000);;
     _32(0xf80c03c3),        //andw $r3 = $r3, 15 (0xf)
     _32(0x71080107),        //addw $r2 = $r7, 4 (0x4);;
     _64(0xf8080002f10db103),        //compw.eq $r3 = $r3, 4 (0x4)
     _64(0x0801000080000000),        //andw $r2 = $r2, 67108864 (0x4000000);;
     _32(0x7808ffc2),        //zxwd $r2 = $r2;;
     _32(0x0c7ffd43),        //cb.wnez $r3? 18758 <__floatundisf+0x150>;;
     _32(0x97ffffcb),        //goto 186b4 <__floatundisf+0xac>
     _32(0x71000107)        //addw $r0 = $r7, 4 (0x4);;
 |];

let __divdf3: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0x6130d80c),        //addd $r12 = $r12, -160 (0xffffff60);;
     _32(0x2739060c),        //sd 24 (0x18)[$r12] = $r14;;
     _32(0x2849080c),        //sq 32 (0x20)[$r12] = $r18r19;;
     _32(0x28550c0c),        //so 48 (0x30)[$r12] = $r20r21r22r23;;
     _32(0x2865140c),        //so 80 (0x50)[$r12] = $r24r25r26r27;;
     _32(0x28751c0c),        //so 112 (0x70)[$r12] = $r28r29r30r31;;
     _32(0x2741240c),        //sd 144 (0x90)[$r12] = $r16;;
     _32(0x0fc4011a),        //get $r26 = $cs;;
     _32(0xe713ed00),        //extfz $r4 = $r0, 62 (0x3e), 52 (0x34)
     _32(0xe70f3800),        //extfz $r3 = $r0, 51 (0x33), 32 (0x20)
     _32(0x7b2a2fc0),        //srld $r10 = $r0, 63 (0x3f);;
     _32(0xf808ffc0),        //zxwd $r2 = $r0
     _32(0xea00000a),        //copyd $r0 = $r10
     _32(0xea180003),        //copyd $r6 = $r3
     _64(0x1800003ff115b7c4),        //compw.eq $r5 = $r4, 2047 (0x7ff);;
     _32(0x08802684),        //cb.deqz $r4? 18a3c <__divdf3+0x2ac>;;
     _32(0x0c002b05),        //cb.wnez $r5? 18a88 <__divdf3+0x2f8>;;
     _32(0xfb4a3742),        //srlw $r18 = $r2, 29 (0x1d)
     _32(0xf90e30c3),        //sllw $r3 = $r3, 3 (0x3)
     _32(0xf90a30c2),        //sllw $r2 = $r2, 3 (0x3)
     _64(0x1ffffffff1540044),        //addw $r21 = $r4, -1023 (0xfffffffffffffc01);;
     _32(0xfa0d10d2),        //orw $r3 = $r18, $r3
     _32(0xe01c0000),        //make $r7 = 0 (0x0)
     _32(0xf808ffc2),        //zxwd $r2 = $r2
     _32(0x60200000),        //make $r8 = 0 (0x0);;
     _32(0xe0580000),        //make $r22 = 0 (0x0)
     _64(0x08002000fa480003),        //orw $r18 = $r3, 8388608 (0x800000);;
     _32(0x7848ffd2),        //zxwd $r18 = $r18;;
     _32(0xe713ed01),        //extfz $r4 = $r1, 62 (0x3e), 52 (0x34)
     _32(0x671b3801),        //extfz $r6 = $r1, 51 (0x33), 32 (0x20);;
     _32(0xf814ffc1),        //zxwd $r5 = $r1
     _32(0xfb062fc1),        //srld $r1 = $r1, 63 (0x3f)
     _32(0xea0c0006),        //copyd $r3 = $r6
     _64(0x1800003ff125b7c4),        //compw.eq $r9 = $r4, 2047 (0x7ff);;
     _32(0x08801c84),        //cb.deqz $r4? 189f4 <__divdf3+0x264>;;
     _32(0x0c000ac9),        //cb.wnez $r9? 188dc <__divdf3+0x14c>;;
     _32(0xfb0e3745),        //srlw $r3 = $r5, 29 (0x1d)
     _32(0xf91a30c6),        //sllw $r6 = $r6, 3 (0x3)
     _32(0xf91630c5),        //sllw $r5 = $r5, 3 (0x3)
     _64(0x1ffffffff1100044),        //addw $r4 = $r4, -1023 (0xfffffffffffffc01);;
     _32(0xfa0d1183),        //orw $r3 = $r3, $r6
     _32(0xe0240000),        //make $r9 = 0 (0x0)
     _32(0xf814ffc5),        //zxwd $r5 = $r5
     _32(0x75551544),        //sbfw $r21 = $r4, $r21;;
     _64(0x00002000fa0c0003),        //orw $r3 = $r3, 8388608 (0x800000);;
     _32(0x780cffc3),        //zxwd $r3 = $r3;;
     _96(0xf911b3c7f051a04af0180e00),        //pcrel $r6 = 56 (0x38)
     _32(0x80000000),        //compd.ne $r20 = $r10, $r1
     _64(0x1000000080000000),        //compw.gtu $r4 = $r7, 15 (0xf);;
     _32(0x6a6c0014),        //copyd $r27 = $r20;;
     _32(0x0c003604),        //cb.wnez $r4? 18be0 <__divdf3+0x450>;;
     _96(0x0000000080000000f0100600),        //pcrel $r4 = 24 (0x18);;
     _32(0x3412f1c4),        //lws.xs $r4 = $r7[$r4];;
     _32(0x71110184),        //addd $r4 = $r4, $r6;;
     _32(0x0fd80004),        //igoto $r4;;
     _32(0x00000344),        //    invalid opcode    
     _32(0x000002cc),        //    invalid opcode    
     _32(0x00000104),        //    invalid opcode    
     _32(0x00000064),        //    invalid opcode    
     _32(0x00000104),        //    invalid opcode    
     _32(0x00000278),        //    invalid opcode    
     _32(0x00000104),        //    invalid opcode    
     _32(0x00000064),        //    invalid opcode    
     _32(0x00000298),        //    invalid opcode    
     _32(0x00000298),        //    invalid opcode    
     _32(0x00000278),        //    invalid opcode    
     _32(0x00000064),        //    invalid opcode    
     _32(0x00000074),        //    invalid opcode    
     _32(0x00000074),        //    invalid opcode    
     _32(0x00000074),        //    invalid opcode    
     _32(0x000002ac),        //    invalid opcode    
     _32(0xfa111146),        //orw $r4 = $r6, $r5
     _64(0x0ffffffef1540055),        //addw $r21 = $r21, -2047 (0xfffffffffffff801);;
     _32(0x08001c04),        //cb.dnez $r4? 18aa8 <__divdf3+0x318>;;
     _32(0x97ffffde),        //goto 18864 <__divdf3+0xd4>
     _32(0xfa1c0087),        //orw $r7 = $r7, 2 (0x2)
     _32(0xe00c0000),        //make $r3 = 0 (0x0)
     _32(0xe0140000),        //make $r5 = 0 (0x0)
     _32(0x60240002),        //make $r9 = 2 (0x2);;
     _32(0xf800ffc1),        //zxwd $r0 = $r1
     _32(0xea480003),        //copyd $r18 = $r3
     _32(0xea080005),        //copyd $r2 = $r5
     _32(0x6a200009),        //copyd $r8 = $r9;;
     _64(0x00000000f105b048),        //compw.eq $r1 = $r8, 1 (0x1);;
     _32(0x0c000841),        //cb.wnez $r1? 1899c <__divdf3+0x20c>;;
     _32(0x088001c8),        //cb.deqz $r8? 18938 <__divdf3+0x1a8>;;
     _64(0xf121b0c8f105b088),        //compw.eq $r1 = $r8, 2 (0x2)
     _64(0x0800000080000000),        //compw.eq $r8 = $r8, 3 (0x3);;
     _32(0x0c007f81),        //cb.wnez $r1? 19128 <__divdf3+0x998>;;
     _32(0x0c007d48),        //cb.wnez $r8? 19108 <__divdf3+0x978>;;
     _32(0xea6c0000),        //copyd $r27 = $r0
     _64(0x08000000f138ffd5),        //addw $r14 = $r21, 1023 (0x3ff);;
     _32(0x8e00614e),        //cb.wlez $r14? 18f58 <__divdf3+0x7c8>
     _32(0x780001c2),        //andw $r0 = $r2, 7 (0x7);;
     _32(0x0c002380),        //cb.wnez $r0? 18b84 <__divdf3+0x3f4>;;
     _32(0x6850005b),        //andd $r20 = $r27, 1 (0x1);;
     _64(0x00004000f8000012),        //andw $r0 = $r18, 16777216 (0x1000000);;
     _32(0x0c800140),        //cb.weqz $r0? 18970 <__divdf3+0x1e0>;;
     _64(0xf1380015e848ffd2),        //andd $r18 = $r18, 4278190079 (0xfeffffff)
     _64(0x08000001803fbfff),        //addw $r14 = $r21, 1024 (0x400);;
     _64(0x0000003ff501b78e),        //compw.gt $r0 = $r14, 2046 (0x7fe);;
     _32(0x0c007380),        //cb.wnez $r0? 190b0 <__divdf3+0x920>;;
     _32(0xe54b60d2),        //extfz $r18 = $r18, 22 (0x16), 3 (0x3)
     _32(0xf9023752),        //sllw $r0 = $r18, 29 (0x1d)
     _32(0xfb0a30c2),        //srlw $r2 = $r2, 3 (0x3)
     _64(0x18000001e804ffce),        //andd $r1 = $r14, 2047 (0x7ff);;
     _32(0x90000008),        //goto 189b0 <__divdf3+0x220>
     _32(0xf95a2816),        //slld $r22 = $r22, 32 (0x20)
     _32(0x7a091080),        //orw $r2 = $r0, $r2;;
     _32(0x6a500000),        //copyd $r20 = $r0;;
     _32(0xf95a2816),        //slld $r22 = $r22, 32 (0x20)
     _32(0xe0040000),        //make $r1 = 0 (0x0)
     _32(0xe0480000),        //make $r18 = 0 (0x0)
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0xf9063501),        //sllw $r1 = $r1, 20 (0x14)
     _32(0xf95237d4),        //sllw $r20 = $r20, 31 (0x1f)
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0xe103f002),        //insf $r0 = $r2, 31 (0x1f), 0 (0x0)
     _32(0x7a051481),        //orw $r1 = $r1, $r18;;
     _32(0x7a051501),        //orw $r1 = $r1, $r20;;
     _32(0x6303f801),        //insf $r0 = $r1, 63 (0x3f), 32 (0x20);;
     _32(0x0fb80116),        //wfxl $cs, $r22;;
     _32(0x3840240c),        //ld $r16 = 144 (0x90)[$r12];;
     _32(0x3838060c),        //ld $r14 = 24 (0x18)[$r12];;
     _32(0x3c48080c),        //lq $r18r19 = 32 (0x20)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3c540c0c),        //lo $r20r21r22r23 = 48 (0x30)[$r12];;
     _32(0x3c64140c),        //lo $r24r25r26r27 = 80 (0x50)[$r12];;
     _32(0x8fd00000),        //ret 
     _32(0xe130280c),        //addd $r12 = $r12, 160 (0xa0)
     _32(0x3c741c0c),        //lo $r28r29r30r31 = 112 (0x70)[$r12];;
     _32(0x7a111146),        //orw $r4 = $r6, $r5;;
     _32(0x08801084),        //cb.deqz $r4? 18b00 <__divdf3+0x370>;;
     _32(0x08806806),        //cb.deqz $r6? 1907c <__divdf3+0x8ec>;;
     _32(0x700e3006),        //clzw $r3 = $r6;;
     _32(0xf824ffc3),        //zxwd $r9 = $r3
     _32(0x710cfd43),        //addw $r3 = $r3, -11 (0xfffffff5);;
     _32(0xf12cfe09),        //addw $r11 = $r9, -8 (0xfffffff8)
     _32(0x750c0743),        //sbfw $r3 = $r3, 29 (0x1d);;
     _32(0xfb1270c5),        //srlw $r4 = $r5, $r3
     _32(0xf90e72c6),        //sllw $r3 = $r6, $r11
     _32(0x791672c5),        //sllw $r5 = $r5, $r11;;
     _32(0xfa0d10c4),        //orw $r3 = $r4, $r3
     _32(0x7814ffc5),        //zxwd $r5 = $r5;;
     _32(0xe0240000),        //make $r9 = 0 (0x0)
     _64(0x0ffffffff5100349),        //sbfw $r4 = $r9, -1011 (0xfffffffffffffc0d);;
     _32(0x97ffff8c),        //goto 18864 <__divdf3+0xd4>
     _32(0x75551544),        //sbfw $r21 = $r4, $r21;;
     _32(0x7a491083),        //orw $r18 = $r3, $r2;;
     _32(0x08800a92),        //cb.deqz $r18? 18ae8 <__divdf3+0x358>;;
     _32(0x08806043),        //cb.deqz $r3? 19048 <__divdf3+0x8b8>;;
     _32(0x70163003),        //clzw $r5 = $r3;;
     _32(0xf810ffc5),        //zxwd $r4 = $r5
     _32(0x7114fd45),        //addw $r5 = $r5, -11 (0xfffffff5);;
     _32(0xf118fe04),        //addw $r6 = $r4, -8 (0xfffffff8)
     _32(0x75480745),        //sbfw $r18 = $r5, 29 (0x1d);;
     _32(0xfb4a7482),        //srlw $r18 = $r2, $r18
     _32(0xf90e7183),        //sllw $r3 = $r3, $r6
     _32(0x790a7182),        //sllw $r2 = $r2, $r6;;
     _32(0xfa4910d2),        //orw $r18 = $r18, $r3
     _32(0x7808ffc2),        //zxwd $r2 = $r2;;
     _32(0x97ffff68),        //goto 18810 <__divdf3+0x80>
     _32(0xe01c0000),        //make $r7 = 0 (0x0)
     _32(0xe0200000),        //make $r8 = 0 (0x0)
     _32(0xe0580000),        //make $r22 = 0 (0x0)
     _64(0x1ffffffff5540344),        //sbfw $r21 = $r4, -1011 (0xfffffffffffffc0d);;
     _32(0x7a491083),        //orw $r18 = $r3, $r2;;
     _32(0x08000392),        //cb.dnez $r18? 18ac4 <__divdf3+0x334>;;
     _32(0xe0080000),        //make $r2 = 0 (0x0)
     _32(0xe01c0008),        //make $r7 = 8 (0x8)
     _32(0xe05407ff),        //make $r21 = 2047 (0x7ff)
     _32(0x60200002),        //make $r8 = 2 (0x2);;
     _32(0x97ffff5c),        //goto 18810 <__divdf3+0x80>
     _32(0x60580000),        //make $r22 = 0 (0x0);;
     _32(0xe0100202),        //make $r4 = 514 (0x202)
     _32(0xfa1c00c7),        //orw $r7 = $r7, 3 (0x3)
     _32(0xe0240003),        //make $r9 = 3 (0x3)
     _64(0x18000200f8180006),        //andw $r6 = $r6, 524288 (0x80000);;
     _32(0x97ffff6a),        //goto 18864 <__divdf3+0xd4>
     _32(0x795a0106),        //cmoved.weqz $r6? $r22 = $r4;;
     _32(0xe0580202),        //make $r22 = 514 (0x202)
     _32(0xea480006),        //copyd $r18 = $r6
     _32(0xe01c000c),        //make $r7 = 12 (0xc)
     _64(0x18000200f80c0003),        //andw $r3 = $r3, 524288 (0x80000);;
     _32(0x97ffff4e),        //goto 18810 <__divdf3+0x80>
     _32(0xe85a0003),        //cmoved.wnez $r3? $r22 = 0 (0x0)
     _32(0xe05407ff),        //make $r21 = 2047 (0x7ff)
     _32(0x60200003),        //make $r8 = 3 (0x3);;
     _32(0xe0080000),        //make $r2 = 0 (0x0)
     _32(0xe01c0004),        //make $r7 = 4 (0x4)
     _32(0xe0540000),        //make $r21 = 0 (0x0)
     _32(0x60200001),        //make $r8 = 1 (0x1);;
     _32(0x97ffff46),        //goto 18810 <__divdf3+0x80>
     _32(0x60580000),        //make $r22 = 0 (0x0);;
     _32(0x97ffff59),        //goto 18864 <__divdf3+0xd4>
     _32(0xfa1c0047),        //orw $r7 = $r7, 1 (0x1)
     _32(0xe00c0000),        //make $r3 = 0 (0x0)
     _32(0xe0140000),        //make $r5 = 0 (0x0)
     _32(0x60240001),        //make $r9 = 1 (0x1);;
     _32(0xe0500001),        //make $r20 = 1 (0x1)
     _32(0xe0080000),        //make $r2 = 0 (0x0)
     _64(0xe0480000e0580010),        //make $r22 = 2207613190144 (0x20200000000)
     _64(0x1800020090800000),        //make $r18 = 524288 (0x80000);;
     _32(0x97ffffa1),        //goto 189b0 <__divdf3+0x220>
     _32(0x600407ff),        //make $r1 = 2047 (0x7ff);;
     _32(0x97ffff9f),        //goto 189b0 <__divdf3+0x220>
     _32(0xf95a2816),        //slld $r22 = $r22, 32 (0x20)
     _32(0xe00407ff),        //make $r1 = 2047 (0x7ff)
     _32(0xe0480000),        //make $r18 = 0 (0x0)
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0xf95a2816),        //slld $r22 = $r22, 32 (0x20)
     _32(0xea50000a),        //copyd $r20 = $r10
     _32(0xe00407ff),        //make $r1 = 2047 (0x7ff)
     _64(0x18000200fa480012),        //orw $r18 = $r18, 524288 (0x80000);;
     _32(0x97ffff95),        //goto 189b0 <__divdf3+0x220>
     _64(0x000003ffe848ffd2),        //andd $r18 = $r18, 1048575 (0xfffff);;
     _32(0xe00407ff),        //make $r1 = 2047 (0x7ff)
     _32(0xe0480000),        //make $r18 = 0 (0x0)
     _32(0xe0080000),        //make $r2 = 0 (0x0)
     _64(0x18000001fa580116),        //orw $r22 = $r22, 1028 (0x404);;
     _32(0x97ffff8d),        //goto 189b0 <__divdf3+0x220>
     _32(0x795a2816),        //slld $r22 = $r22, 32 (0x20);;
     _64(0xfa580816f800001a),        //andw $r0 = $r26, 3342336 (0x330000)
     _64(0x80000cc0e804001a),        //orw $r22 = $r22, 8224 (0x2020)
     _64(0x10000cc088000008),        //andd $r1 = $r26, 3342336 (0x330000);;
     _64(0xf101b000f10db000),        //compw.eq $r3 = $r0, 1114112 (0x110000)
     _64(0x0801100080008800),        //compw.eq $r0 = $r0, 2228224 (0x220000);;
     _32(0x0c007083),        //cb.wnez $r3? 192b4 <__divdf3+0xb24>;;
     _32(0x0c006540),        //cb.wnez $r0? 19204 <__divdf3+0xa74>;;
     _32(0x087fd9c1),        //cb.dnez $r1? 18950 <__divdf3+0x1c0>;;
     _32(0xf80003c2),        //andw $r0 = $r2, 15 (0xf)
     _32(0x6850005b),        //andd $r20 = $r27, 1 (0x1);;
     _64(0x00000000f101b100),        //compw.eq $r0 = $r0, 4 (0x4);;
     _32(0x0c7fd8c0),        //cb.wnez $r0? 18954 <__divdf3+0x1c4>;;
     _32(0xf1080102),        //addw $r2 = $r2, 4 (0x4)
     _64(0x0ffffffff701b702),        //compw.geu $r0 = $r2, 4294967292 (0xfffffffc);;
     _32(0x97ffff5f),        //goto 18954 <__divdf3+0x1c4>
     _32(0x71491480),        //addw $r18 = $r0, $r18;;
     _32(0x7601b483),        //compw.ltu $r0 = $r3, $r18;;
     _32(0x0c000140),        //cb.wnez $r0? 18bf8 <__divdf3+0x468>;;
     _32(0xf101b483),        //compw.eq $r0 = $r3, $r18
     _32(0x7805b085),        //compw.leu $r1 = $r5, $r2;;
     _32(0x78011040),        //andw $r0 = $r0, $r1;;
     _32(0x0c805900),        //cb.weqz $r0? 19184 <__divdf3+0x9f4>;;
     _32(0xe57bf052),        //extfz $r30 = $r18, 31 (0x1f), 1 (0x1)
     _32(0xf93a37d2),        //sllw $r14 = $r18, 31 (0x1f)
     _32(0xfb023042),        //srlw $r0 = $r2, 1 (0x1)
     _32(0x795e37c2),        //sllw $r23 = $r2, 31 (0x1f);;
     _32(0xfa39100e),        //orw $r14 = $r14, $r0
     _32(0x785cffd7),        //zxwd $r23 = $r23;;
     _32(0xf90e3203),        //sllw $r3 = $r3, 8 (0x8)
     _32(0xfb723605),        //srlw $r28 = $r5, 24 (0x18)
     _32(0xf94e3205),        //sllw $r19 = $r5, 8 (0x8)
     _32(0x6a00001e),        //copyd $r0 = $r30;;
     _32(0xfb763403),        //srlw $r29 = $r3, 16 (0x10)
     _32(0x7a7110dc),        //orw $r28 = $r28, $r3;;
     _32(0xe463f01c),        //zxhd $r24 = $r28
     _32(0x7874ffdd),        //zxwd $r29 = $r29;;
     _32(0x980001e2),        //call 193b8 <__udivdi3>
     _32(0x6a04001d),        //copyd $r1 = $r29;;
     _32(0x98000202),        //call 19440 <__umoddi3>
     _32(0xea480000),        //copyd $r18 = $r0
     _32(0xea04001d),        //copyd $r1 = $r29
     _32(0x6a00001e),        //copyd $r0 = $r30;;
     _32(0xfb16340e),        //srlw $r5 = $r14, 16 (0x10)
     _32(0xf9663400),        //sllw $r25 = $r0, 16 (0x10)
     _32(0xdb783498),        //mulw $r30 = $r24, $r18
     _32(0x7848ffd2),        //zxwd $r18 = $r18;;
     _32(0xfa011645),        //orw $r0 = $r5, $r25
     _32(0x7a151645),        //orw $r5 = $r5, $r25;;
     _32(0x7805b01e),        //compw.leu $r1 = $r30, $r0;;
     _32(0x0c000201),        //cb.wnez $r1? 18c84 <__divdf3+0x4f4>;;
     _32(0xf105101c),        //addw $r1 = $r28, $r0
     _32(0x7115101c),        //addw $r5 = $r28, $r0;;
     _32(0xf809b05c),        //compw.leu $r2 = $r28, $r1
     _32(0x7901b05e),        //compw.gtu $r0 = $r30, $r1;;
     _32(0x78011080),        //andw $r0 = $r0, $r2;;
     _32(0x0c005a80),        //cb.wnez $r0? 19224 <__divdf3+0xa94>;;
     _32(0x7148ffd2),        //addw $r18 = $r18, -1 (0xffffffff);;
     _32(0xf579115e),        //sbfw $r30 = $r30, $r5
     _32(0x6a04001d),        //copyd $r1 = $r29;;
     _32(0x980001cb),        //call 193b8 <__udivdi3>
     _32(0x6a00001e),        //copyd $r0 = $r30;;
     _32(0xea140000),        //copyd $r5 = $r0
     _32(0xea04001d),        //copyd $r1 = $r29
     _32(0x6a00001e),        //copyd $r0 = $r30;;
     _32(0x980001e8),        //call 19440 <__umoddi3>
     _32(0xf864ffc5),        //zxwd $r25 = $r5
     _32(0x5b7c3158),        //mulw $r31 = $r24, $r5;;
     _32(0xe40bf00e),        //zxhd $r2 = $r14
     _32(0x79023400),        //sllw $r0 = $r0, 16 (0x10);;
     _32(0xfa051002),        //orw $r1 = $r2, $r0
     _32(0x7a111002),        //orw $r4 = $r2, $r0;;
     _32(0x7801b05f),        //compw.leu $r0 = $r31, $r1;;
     _32(0x0c000200),        //cb.wnez $r0? 18ce0 <__divdf3+0x550>;;
     _32(0xf109105c),        //addw $r2 = $r28, $r1
     _32(0x7111105c),        //addw $r4 = $r28, $r1;;
     _32(0xf901b09f),        //compw.gtu $r0 = $r31, $r2
     _32(0x7805b09c),        //compw.leu $r1 = $r28, $r2;;
     _32(0x78011040),        //andw $r0 = $r0, $r1;;
     _32(0x0c005580),        //cb.wnez $r0? 19230 <__divdf3+0xaa0>;;
     _32(0x7164ffd9),        //addw $r25 = $r25, -1 (0xffffffff);;
     _32(0xe47bf013),        //zxhd $r30 = $r19
     _32(0xf94a3412),        //sllw $r18 = $r18, 16 (0x10)
     _32(0xfb1e3413),        //srlw $r7 = $r19, 16 (0x10)
     _32(0x7525111f),        //sbfw $r9 = $r31, $r4;;
     _32(0xfa0d1652),        //orw $r3 = $r18, $r25
     _32(0xfa491652),        //orw $r18 = $r18, $r25
     _32(0x7511111f),        //sbfw $r4 = $r31, $r4;;
     _32(0xe403f003),        //zxhd $r0 = $r3
     _32(0x7b1a3403),        //srlw $r6 = $r3, 16 (0x10);;
     _32(0x5b083786),        //mulw $r2 = $r6, $r30;;
     _32(0x5b643780),        //mulw $r25 = $r0, $r30;;
     _32(0xfa040002),        //copyw $r1 = $r2
     _32(0x5b1831c6),        //mulw $r6 = $r6, $r7;;
     _32(0xfb163419),        //srlw $r5 = $r25, 16 (0x10)
     _32(0x53043007),        //maddw $r1 = $r7, $r0;;
     _32(0xf820ffc6),        //zxwd $r8 = $r6
     _64(0x08000040f1180006),        //addw $r6 = $r6, 65536 (0x10000);;
     _32(0xe407f019),        //zxhd $r1 = $r25
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x71151005),        //addw $r5 = $r5, $r0;;
     _32(0xf809b142),        //compw.leu $r2 = $r2, $r5
     _32(0xfb023405),        //srlw $r0 = $r5, 16 (0x10)
     _32(0x79663405),        //sllw $r25 = $r5, 16 (0x10);;
     _32(0xf81a0202),        //cmoved.wnez $r2? $r6 = $r8
     _32(0x71651059),        //addw $r25 = $r25, $r1;;
     _32(0x71011180),        //addw $r0 = $r0, $r6;;
     _32(0x7605b009),        //compw.ltu $r1 = $r9, $r0;;
     _32(0x0c001c01),        //cb.wnez $r1? 18f10 <__divdf3+0x780>;;
     _32(0xf105b009),        //compw.eq $r1 = $r9, $r0
     _32(0x7615b657),        //compw.ltu $r5 = $r23, $r25;;
     _32(0x78051141),        //andw $r1 = $r1, $r5;;
     _32(0x0c001b01),        //cb.wnez $r1? 18f10 <__divdf3+0x780>;;
     _32(0xf56515d9),        //sbfw $r25 = $r25, $r23
     _32(0xf5011100),        //sbfw $r0 = $r0, $r4
     _64(0xf110ffd5f138ffd5),        //addw $r14 = $r21, 1023 (0x3ff)
     _64(0x1800000090000000),        //addw $r4 = $r21, 1023 (0x3ff);;
     _32(0x765db657),        //compw.ltu $r23 = $r23, $r25;;
     _32(0xf5051017),        //sbfw $r1 = $r23, $r0
     _32(0x755d1017),        //sbfw $r23 = $r23, $r0;;
     _32(0xf001b05c),        //compw.ne $r0 = $r28, $r1
     _32(0x6a04001d),        //copyd $r1 = $r29;;
     _32(0x0c804ac0),        //cb.weqz $r0? 1923c <__divdf3+0xaac>;;
     _32(0x98000189),        //call 193b8 <__udivdi3>
     _32(0xea000017),        //copyd $r0 = $r23
     _32(0x271d260c),        //sd 152 (0x98)[$r12] = $r7;;
     _32(0xea080000),        //copyd $r2 = $r0
     _32(0xea04001d),        //copyd $r1 = $r29
     _32(0x6a000017),        //copyd $r0 = $r23;;
     _32(0x980001a5),        //call 19440 <__umoddi3>
     _32(0xf85cffc2),        //zxwd $r23 = $r2
     _32(0x5b7c3098),        //mulw $r31 = $r24, $r2;;
     _32(0xfb0a3419),        //srlw $r2 = $r25, 16 (0x10)
     _32(0xf9523400),        //sllw $r20 = $r0, 16 (0x10)
     _32(0x381c260c),        //ld $r7 = 152 (0x98)[$r12];;
     _32(0xfa011502),        //orw $r0 = $r2, $r20
     _32(0x7a091502),        //orw $r2 = $r2, $r20;;
     _32(0x7805b01f),        //compw.leu $r1 = $r31, $r0;;
     _32(0x0c000241),        //cb.wnez $r1? 18df4 <__divdf3+0x664>;;
     _32(0xf105101c),        //addw $r1 = $r28, $r0
     _32(0xf109101c),        //addw $r2 = $r28, $r0
     _32(0x7110ffd7),        //addw $r4 = $r23, -1 (0xffffffff);;
     _32(0xf901b05f),        //compw.gtu $r0 = $r31, $r1
     _32(0x780db05c),        //compw.leu $r3 = $r28, $r1;;
     _32(0x780110c0),        //andw $r0 = $r0, $r3;;
     _32(0x0c005200),        //cb.wnez $r0? 1930c <__divdf3+0xb7c>;;
     _32(0x6a5c0004),        //copyd $r23 = $r4;;
     _32(0xe467f019),        //zxhd $r25 = $r25
     _32(0xf57d109f),        //sbfw $r31 = $r31, $r2
     _32(0xea04001d),        //copyd $r1 = $r29
     _32(0x271d260c),        //sd 152 (0x98)[$r12] = $r7;;
     _32(0x9800016d),        //call 193b8 <__udivdi3>
     _32(0x6a00001f),        //copyd $r0 = $r31;;
     _32(0xea080000),        //copyd $r2 = $r0
     _32(0xea04001d),        //copyd $r1 = $r29
     _32(0x6a00001f),        //copyd $r0 = $r31;;
     _32(0x9800018a),        //call 19440 <__umoddi3>
     _32(0xf850ffc2),        //zxwd $r20 = $r2
     _32(0x5b603098),        //mulw $r24 = $r24, $r2;;
     _32(0xf9023400),        //sllw $r0 = $r0, 16 (0x10)
     _32(0x381c260c),        //ld $r7 = 152 (0x98)[$r12];;
     _32(0xfa051019),        //orw $r1 = $r25, $r0
     _32(0x7a651019),        //orw $r25 = $r25, $r0;;
     _32(0x7801b058),        //compw.leu $r0 = $r24, $r1;;
     _32(0x0c000240),        //cb.wnez $r0? 18e5c <__divdf3+0x6cc>;;
     _32(0xf109105c),        //addw $r2 = $r28, $r1
     _32(0xf165105c),        //addw $r25 = $r28, $r1
     _32(0x710cffd4),        //addw $r3 = $r20, -1 (0xffffffff);;
     _32(0xf901b098),        //compw.gtu $r0 = $r24, $r2
     _32(0x7805b09c),        //compw.leu $r1 = $r28, $r2;;
     _32(0x78011040),        //andw $r0 = $r0, $r1;;
     _32(0x0c004c40),        //cb.wnez $r0? 19318 <__divdf3+0xb88>;;
     _32(0x6a500003),        //copyd $r20 = $r3;;
     _32(0xf90a3417),        //sllw $r2 = $r23, 16 (0x10)
     _32(0xf5211658),        //sbfw $r8 = $r24, $r25
     _32(0x75651658),        //sbfw $r25 = $r24, $r25;;
     _32(0xfa191502),        //orw $r6 = $r2, $r20
     _32(0x7a091502),        //orw $r2 = $r2, $r20;;
     _32(0xe403f006),        //zxhd $r0 = $r6
     _32(0x7b0e3406),        //srlw $r3 = $r6, 16 (0x10);;
     _32(0x5b103783),        //mulw $r4 = $r3, $r30;;
     _32(0x5b04301e),        //mulw $r1 = $r30, $r0;;
     _32(0xfa140004),        //copyw $r5 = $r4
     _32(0x5b0c30c7),        //mulw $r3 = $r7, $r3;;
     _32(0xe407f001),        //zxhd $r1 = $r1
     _32(0xfb023401),        //srlw $r0 = $r1, 16 (0x10)
     _32(0x53143007),        //maddw $r5 = $r7, $r0;;
     _32(0xfa1c0005),        //copyw $r7 = $r5
     _32(0xf814ffc3),        //zxwd $r5 = $r3
     _64(0x10000040f10c0003),        //addw $r3 = $r3, 65536 (0x10000);;
     _32(0x710111c0),        //addw $r0 = $r0, $r7;;
     _32(0xf811b004),        //compw.leu $r4 = $r4, $r0
     _32(0xfb623400),        //srlw $r24 = $r0, 16 (0x10)
     _32(0x79023400),        //sllw $r0 = $r0, 16 (0x10);;
     _32(0xf80e0144),        //cmoved.wnez $r4? $r3 = $r5
     _32(0x71011040),        //addw $r0 = $r0, $r1;;
     _32(0x716110d8),        //addw $r24 = $r24, $r3;;
     _32(0x7605b608),        //compw.ltu $r1 = $r8, $r24;;
     _32(0x0c802901),        //cb.weqz $r1? 19154 <__divdf3+0x9c4>;;
     _32(0xf105121c),        //addw $r1 = $r28, $r8
     _32(0xf108ffc6),        //addw $r2 = $r6, -1 (0xffffffff)
     _32(0x7165121c),        //addw $r25 = $r28, $r8;;
     _32(0x770db701),        //compw.geu $r3 = $r1, $r28;;
     _32(0x0c8001c3),        //cb.weqz $r3? 18ef4 <__divdf3+0x764>;;
     _32(0x760db601),        //compw.ltu $r3 = $r1, $r24;;
     _32(0x0c003b43),        //cb.wnez $r3? 19294 <__divdf3+0xb04>;;
     _32(0xf10db601),        //compw.eq $r3 = $r1, $r24
     _32(0x7611b013),        //compw.ltu $r4 = $r19, $r0;;
     _32(0x780d1103),        //andw $r3 = $r3, $r4;;
     _32(0x0c003a43),        //cb.wnez $r3? 19294 <__divdf3+0xb04>;;
     _32(0x7001b013),        //compw.ne $r0 = $r19, $r0;;
     _32(0x68140040),        //andd $r5 = $r0, 1 (0x1);;
     _32(0xf065b619),        //compw.ne $r25 = $r25, $r24
     _32(0x7a000042),        //orw $r0 = $r2, 1 (0x1);;
     _32(0x7a651159),        //orw $r25 = $r25, $r5;;
     _32(0x97fffe8f),        //goto 18944 <__divdf3+0x1b4>
     _32(0x780a0019),        //cmoved.wnez $r25? $r2 = $r0;;
     _32(0xf10514d7),        //addw $r1 = $r23, $r19
     _32(0x7148ffc3),        //addw $r18 = $r3, -1 (0xffffffff);;
     _32(0xf911b053),        //compw.gtu $r4 = $r19, $r1
     _32(0x785cffc1),        //zxwd $r23 = $r1;;
     _32(0x71111704),        //addw $r4 = $r4, $r28;;
     _32(0xf1091244),        //addw $r2 = $r4, $r9
     _32(0x71111244),        //addw $r4 = $r4, $r9;;
     _32(0x7615b09c),        //compw.ltu $r5 = $r28, $r2;;
     _32(0x0c802105),        //cb.weqz $r5? 19140 <__divdf3+0x9b0>;;
     _32(0x7915b080),        //compw.gtu $r5 = $r0, $r2;;
     _32(0x0c802385),        //cb.weqz $r5? 19170 <__divdf3+0x9e0>;;
     _32(0xf1111053),        //addw $r4 = $r19, $r1
     _32(0xf148ff83),        //addw $r18 = $r3, -2 (0xfffffffe)
     _32(0x715d1053),        //addw $r23 = $r19, $r1;;
     _32(0x7911b113),        //compw.gtu $r4 = $r19, $r4;;
     _32(0x71111704),        //addw $r4 = $r4, $r28;;
     _32(0x97ffff85),        //goto 18d64 <__divdf3+0x5d4>
     _32(0x71111084),        //addw $r4 = $r4, $r2;;
     _32(0xf504004e),        //sbfw $r1 = $r14, 1 (0x1)
     _32(0xf500004e),        //sbfw $r0 = $r14, 1 (0x1)
     _32(0x6850005b),        //andd $r20 = $r27, 1 (0x1);;
     _64(0x00000001f505b601),        //compw.gt $r1 = $r1, 56 (0x38);;
     _32(0x0c800241),        //cb.weqz $r1? 18f90 <__divdf3+0x800>;;
     _32(0x7a091482),        //orw $r2 = $r2, $r18;;
     _32(0x08002e82),        //cb.dnez $r2? 1925c <__divdf3+0xacc>;;
     _32(0xe0040000),        //make $r1 = 0 (0x0)
     _32(0xe0480000),        //make $r18 = 0 (0x0)
     _64(0x10000004fa580416),        //orw $r22 = $r22, 4112 (0x1010);;
     _32(0x97fffe8a),        //goto 189b0 <__divdf3+0x220>
     _32(0x795a2816),        //slld $r22 = $r22, 32 (0x20);;
     _64(0x00000000f505b7c0),        //compw.gt $r1 = $r0, 31 (0x1f);;
     _32(0x0c802001),        //cb.weqz $r1? 19198 <__divdf3+0xa08>;;
     _32(0xf504f84e),        //sbfw $r1 = $r14, -31 (0xffffffe1)
     _64(0xf101b000f10c0f95),        //addw $r3 = $r21, 1086 (0x43e)
     _64(0x1000000188000001),        //compw.eq $r0 = $r0, 32 (0x20);;
     _32(0xf90e70d2),        //sllw $r3 = $r18, $r3
     _32(0x7b4a7052),        //srlw $r18 = $r18, $r1;;
     _32(0x7a0d1083),        //orw $r3 = $r3, $r2;;
     _32(0x790a00c0),        //cmoved.weqz $r0? $r2 = $r3;;
     _64(0x00000000f009b002),        //compw.ne $r2 = $r2, 0 (0x0);;
     _32(0xfa0d1482),        //orw $r3 = $r2, $r18
     _32(0x7a011482),        //orw $r0 = $r2, $r18;;
     _32(0x680801c3),        //andd $r2 = $r3, 7 (0x7);;
     _32(0x08803302),        //cb.deqz $r2? 19304 <__divdf3+0xb74>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _64(0xfa580816f808001a),        //andw $r2 = $r26, 3342336 (0x330000)
     _64(0x80000cc0e868001a),        //orw $r22 = $r22, 8224 (0x2020)
     _64(0x10000cc088000008),        //andd $r26 = $r26, 3342336 (0x330000);;
     _64(0xf109b002f10db002),        //compw.eq $r3 = $r2, 1114112 (0x110000)
     _64(0x0801100080008800),        //compw.eq $r2 = $r2, 2228224 (0x220000);;
     _32(0x0c003203),        //cb.wnez $r3? 19324 <__divdf3+0xb94>;;
     _32(0x0c003882),        //cb.wnez $r2? 19390 <__divdf3+0xc00>;;
     _32(0x0880355a),        //cb.deqz $r26? 19360 <__divdf3+0xbd0>;;
     _32(0xe54b60c1),        //extfz $r18 = $r1, 22 (0x16), 3 (0x3)
     _64(0x08002000f8080001),        //andw $r2 = $r1, 8388608 (0x800000);;
     _32(0x0c003682),        //cb.wnez $r2? 19384 <__divdf3+0xbf4>;;
     _32(0x790a3741),        //sllw $r2 = $r1, 29 (0x1d);;
     _32(0x7808ffc2),        //zxwd $r2 = $r2;;
     _32(0xfb0230c0),        //srlw $r0 = $r0, 3 (0x3)
     _64(0x08000008f8040816),        //andw $r1 = $r22, 8224 (0x2020);;
     _32(0x7a091080),        //orw $r2 = $r0, $r2;;
     _32(0x0c003601),        //cb.wnez $r1? 19398 <__divdf3+0xc08>;;
     _32(0x97fffe5d),        //goto 189b0 <__divdf3+0x220>
     _32(0xf95a2816),        //slld $r22 = $r22, 32 (0x20)
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x704a3002),        //clzw $r18 = $r2;;
     _32(0xf1140552),        //addw $r5 = $r18, 21 (0x15)
     _32(0xf1100812),        //addw $r4 = $r18, 32 (0x20)
     _32(0x7148fe12),        //addw $r18 = $r18, -8 (0xfffffff8);;
     _32(0xf810ffc4),        //zxwd $r4 = $r4
     _32(0xf814ffc5),        //zxwd $r5 = $r5
     _32(0xf94a7482),        //sllw $r18 = $r2, $r18
     _64(0x18000000f519b705),        //compw.gt $r6 = $r5, 28 (0x1c);;
     _32(0x7848ffd2),        //zxwd $r18 = $r18;;
     _32(0x0cff9e46),        //cb.weqz $r6? 18a54 <__divdf3+0x2c4>;;
     _32(0x97fffe7f),        //goto 18a70 <__divdf3+0x2e0>
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x70123005),        //clzw $r4 = $r5;;
     _32(0xf10c0544),        //addw $r3 = $r4, 21 (0x15)
     _32(0x71240804),        //addw $r9 = $r4, 32 (0x20);;
     _32(0xf824ffc9),        //zxwd $r9 = $r9
     _32(0xf80cffc3),        //zxwd $r3 = $r3
     _64(0x10000000f52db703),        //compw.gt $r11 = $r3, 28 (0x1c);;
     _32(0x0cff974b),        //cb.weqz $r11? 18a0c <__divdf3+0x27c>;;
     _32(0x710cfe04),        //addw $r3 = $r4, -8 (0xfffffff8);;
     _32(0xf90e70c5),        //sllw $r3 = $r5, $r3
     _32(0x60140000),        //make $r5 = 0 (0x0);;
     _32(0x97fffe60),        //goto 18a28 <__divdf3+0x298>
     _32(0x780cffc3),        //zxwd $r3 = $r3;;
     _32(0xe0480000),        //make $r18 = 0 (0x0)
     _64(0xe808001af800001a),        //andw $r0 = $r26, 3342336 (0x330000)
     _64(0x10000cc088000cc0),        //andd $r2 = $r26, 3342336 (0x330000);;
     _64(0xf101b000f105b000),        //compw.eq $r1 = $r0, 1114112 (0x110000)
     _64(0x0801100080008800),        //compw.eq $r0 = $r0, 2228224 (0x220000);;
     _32(0x0c002001),        //cb.wnez $r1? 192d4 <__divdf3+0xb44>;;
     _32(0x0c000fc0),        //cb.wnez $r0? 191d4 <__divdf3+0xa44>;;
     _32(0x888001c2),        //cb.deqz $r2? 190f8 <__divdf3+0x968>
     _32(0x600407ff),        //make $r1 = 2047 (0x7ff);;
     _32(0xe00407fe),        //make $r1 = 2046 (0x7fe)
     _64(0xe008ffc0e048ffc0),        //make $r18 = 1048575 (0xfffff)
     _64(0x103fffff880003ff),        //make $r2 = 4294967295 (0xffffffff);;
     _64(0x0000000afa580a16),        //orw $r22 = $r22, 10280 (0x2828);;
     _32(0x97fffe2c),        //goto 189b0 <__divdf3+0x220>
     _32(0x795a2816),        //slld $r22 = $r22, 32 (0x20);;
     _32(0xea500000),        //copyd $r20 = $r0
     _32(0xf95a2816),        //slld $r22 = $r22, 32 (0x20)
     _32(0xe00407ff),        //make $r1 = 2047 (0x7ff)
     _64(0x18000200fa480012),        //orw $r18 = $r18, 524288 (0x80000);;
     _32(0x97fffe25),        //goto 189b0 <__divdf3+0x220>
     _64(0x000003ffe848ffd2),        //andd $r18 = $r18, 1048575 (0xfffff);;
     _32(0xea500000),        //copyd $r20 = $r0
     _32(0xf95a2816),        //slld $r22 = $r22, 32 (0x20)
     _32(0xe00407ff),        //make $r1 = 2047 (0x7ff)
     _32(0x60480000),        //make $r18 = 0 (0x0);;
     _32(0x97fffe1e),        //goto 189b0 <__divdf3+0x220>
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0xf115b09c),        //compw.eq $r5 = $r28, $r2
     _32(0x7819b053),        //compw.leu $r6 = $r19, $r1;;
     _32(0x78151185),        //andw $r5 = $r5, $r6;;
     _32(0x0cffc185),        //cb.weqz $r5? 18d64 <__divdf3+0x5d4>;;
     _32(0x17ffff79),        //goto 18f34 <__divdf3+0x7a4>;;
     _32(0xf105b608),        //compw.eq $r1 = $r8, $r24
     _64(0x08000000f015b000),        //compw.ne $r5 = $r0, 0 (0x0);;
     _32(0x68140045),        //andd $r5 = $r5, 1 (0x1);;
     _32(0x78051141),        //andw $r1 = $r1, $r5;;
     _32(0x0cffd941),        //cb.weqz $r1? 18efc <__divdf3+0x76c>;;
     _32(0x17ffff57),        //goto 18ec8 <__divdf3+0x738>;;
     _32(0xf115b080),        //compw.eq $r5 = $r0, $r2
     _32(0x7919b059),        //compw.gtu $r6 = $r25, $r1;;
     _32(0x78151185),        //andw $r5 = $r5, $r6;;
     _32(0x0cffbe85),        //cb.weqz $r5? 18d64 <__divdf3+0x5d4>;;
     _32(0x17ffff6f),        //goto 18f3c <__divdf3+0x7ac>;;
     _32(0x97fffea3),        //goto 18c10 <__divdf3+0x480>
     _32(0xf154ffd5),        //addw $r21 = $r21, -1 (0xffffffff)
     _32(0xea380002),        //copyd $r14 = $r2
     _32(0xea780012),        //copyd $r30 = $r18
     _32(0x605c0000),        //make $r23 = 0 (0x0);;
     _32(0xfb0e7002),        //srlw $r3 = $r2, $r0
     _32(0xfb027012),        //srlw $r0 = $r18, $r0
     _64(0x10000001f1100795),        //addw $r4 = $r21, 1054 (0x41e);;
     _32(0xf90a7102),        //sllw $r2 = $r2, $r4
     _32(0xf94a7112),        //sllw $r18 = $r18, $r4
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0xfa0110d2),        //orw $r0 = $r18, $r3
     _64(0x08000000f009b002),        //compw.ne $r2 = $r2, 0 (0x0);;
     _32(0xfa0d1080),        //orw $r3 = $r0, $r2
     _32(0x7a011080),        //orw $r0 = $r0, $r2;;
     _32(0x780801c3),        //andw $r2 = $r3, 7 (0x7);;
     _32(0x0cffe442),        //cb.weqz $r2? 19010 <__divdf3+0x880>;;
     _32(0x17ffff83),        //goto 18fdc <__divdf3+0x84c>;;
     _32(0xe01007fe),        //make $r4 = 2046 (0x7fe)
     _32(0xe00407ff),        //make $r1 = 2047 (0x7ff)
     _64(0xe000ffc0e00cffc0),        //make $r3 = 1048575 (0xfffff)
     _64(0x183fffff900003ff),        //make $r0 = 4294967295 (0xffffffff);;
     _32(0xf106011b),        //cmoved.deqz $r27? $r1 = $r4
     _32(0xe0480000),        //make $r18 = 0 (0x0)
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x97ffffc0),        //goto 190f8 <__divdf3+0x968>
     _32(0xf14a00db),        //cmoved.deqz $r27? $r18 = $r3
     _32(0x710a001b),        //cmoved.deqz $r27? $r2 = $r0;;
     _32(0x88ff751b),        //cb.deqz $r27? 18954 <__divdf3+0x1c4>
     _32(0x60500000),        //make $r20 = 0 (0x0);;
     _32(0xe0500001),        //make $r20 = 1 (0x1)
     _32(0xf1080202),        //addw $r2 = $r2, 8 (0x8)
     _64(0x17fffffff701b602),        //compw.geu $r0 = $r2, 4294967288 (0xfffffff8);;
     _32(0x97fffdce),        //goto 18954 <__divdf3+0x1c4>
     _32(0x71491480),        //addw $r18 = $r0, $r18;;
     _32(0x97fffe98),        //goto 18c84 <__divdf3+0x4f4>
     _32(0xf148ff92),        //addw $r18 = $r18, -2 (0xfffffffe)
     _32(0x7115105c),        //addw $r5 = $r28, $r1;;
     _32(0x97fffeac),        //goto 18ce0 <__divdf3+0x550>
     _32(0xf164ff99),        //addw $r25 = $r25, -2 (0xfffffffe)
     _32(0x7111109c),        //addw $r4 = $r28, $r2;;
     _32(0x8eff9484),        //cb.wgtz $r4? 18b84 <__divdf3+0x3f4>
     _64(0x003fffffe008ffc0),        //make $r2 = 4294967295 (0xffffffff);;
     _32(0xf5040044),        //sbfw $r1 = $r4, 1 (0x1)
     _32(0x75000044),        //sbfw $r0 = $r4, 1 (0x1);;
     _64(0x00000001f405b601),        //compw.le $r1 = $r1, 56 (0x38);;
     _32(0x0c7fd381),        //cb.wnez $r1? 18f90 <__divdf3+0x800>;;
     _32(0xf508005b),        //sbfw $r2 = $r27, 1 (0x1)
     _32(0xe0000000),        //make $r0 = 0 (0x0)
     _32(0xf86cffdb),        //zxwd $r27 = $r27
     _64(0x18000cc0f868001a),        //andw $r26 = $r26, 3342336 (0x330000);;
     _64(0xf169b01af105b01a),        //compw.eq $r1 = $r26, 2228224 (0x220000)
     _64(0x80011000fa580816),        //compw.eq $r26 = $r26, 1114112 (0x110000)
     _64(0x1000000888008800),        //orw $r22 = $r22, 8224 (0x2020);;
     _32(0x780206c1),        //cmoved.wnez $r1? $r0 = $r27;;
     _32(0x97ffff3b),        //goto 18f78 <__divdf3+0x7e8>
     _32(0x790a001a),        //cmoved.weqz $r26? $r2 = $r0;;
     _32(0xf9663053),        //sllw $r25 = $r19, 1 (0x1)
     _32(0x7108ff86),        //addw $r2 = $r6, -2 (0xfffffffe);;
     _32(0xf915b653),        //compw.gtu $r5 = $r19, $r25
     _32(0x7001b640),        //compw.ne $r0 = $r0, $r25;;
     _32(0xf10d1705),        //addw $r3 = $r5, $r28
     _32(0x68140040),        //andd $r5 = $r0, 1 (0x1);;
     _32(0x97ffff14),        //goto 18efc <__divdf3+0x76c>
     _32(0x71651043),        //addw $r25 = $r3, $r1;;
     _32(0x887f6a1b),        //cb.dnez $r27? 18954 <__divdf3+0x1c4>
     _32(0x60500001),        //make $r20 = 1 (0x1);;
     _32(0xe0500000),        //make $r20 = 0 (0x0)
     _32(0xf1080202),        //addw $r2 = $r2, 8 (0x8)
     _64(0x17fffffff701b602),        //compw.geu $r0 = $r2, 4294967288 (0xfffffff8);;
     _32(0x97fffda2),        //goto 18954 <__divdf3+0x1c4>
     _32(0x71491480),        //addw $r18 = $r0, $r18;;
     _32(0xe01007fe),        //make $r4 = 2046 (0x7fe)
     _32(0xe00407ff),        //make $r1 = 2047 (0x7ff)
     _64(0xe000ffc0e00cffc0),        //make $r3 = 1048575 (0xfffff)
     _64(0x183fffff900003ff),        //make $r0 = 4294967295 (0xffffffff);;
     _32(0xf006011b),        //cmoved.dnez $r27? $r1 = $r4
     _32(0xe0480000),        //make $r18 = 0 (0x0)
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x97ffff80),        //goto 190f8 <__divdf3+0x968>
     _32(0xf04a00db),        //cmoved.dnez $r27? $r18 = $r3
     _32(0x700a001b),        //cmoved.dnez $r27? $r2 = $r0;;
     _32(0x97ffff49),        //goto 19028 <__divdf3+0x898>
     _32(0x60480000),        //make $r18 = 0 (0x0);;
     _32(0x97fffeba),        //goto 18df4 <__divdf3+0x664>
     _32(0xf15cff97),        //addw $r23 = $r23, -2 (0xfffffffe)
     _32(0x7109105c),        //addw $r2 = $r28, $r1;;
     _32(0x97fffed1),        //goto 18e5c <__divdf3+0x6cc>
     _32(0xf150ff94),        //addw $r20 = $r20, -2 (0xfffffffe)
     _32(0x7165109c),        //addw $r25 = $r28, $r2;;
     _32(0x0800015b),        //cb.dnez $r27? 19338 <__divdf3+0xba8>;;
     _32(0xf1000200),        //addw $r0 = $r0, 8 (0x8)
     _64(0x0ffffffff709b600),        //compw.geu $r2 = $r0, 4294967288 (0xfffffff8);;
     _32(0x71051042),        //addw $r1 = $r2, $r1;;
     _64(0x00002000f8080001),        //andw $r2 = $r1, 8388608 (0x800000);;
     _32(0x0c800602),        //cb.weqz $r2? 193a0 <__divdf3+0xc10>;;
     _32(0xe0040001),        //make $r1 = 1 (0x1)
     _32(0xe0480000),        //make $r18 = 0 (0x0)
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _64(0x00000004fa580416),        //orw $r22 = $r22, 4112 (0x1010);;
     _32(0x97fffd96),        //goto 189b0 <__divdf3+0x220>
     _32(0x795a2816),        //slld $r22 = $r22, 32 (0x20);;
     _32(0x780803c0),        //andw $r2 = $r0, 15 (0xf);;
     _64(0x00000000f109b102),        //compw.eq $r2 = $r2, 4 (0x4);;
     _32(0x0c7ffcc2),        //cb.wnez $r2? 19338 <__divdf3+0xba8>;;
     _32(0xf1000100),        //addw $r0 = $r0, 4 (0x4)
     _64(0x0ffffffff709b700),        //compw.geu $r2 = $r0, 4294967292 (0xfffffffc);;
     _32(0x97ffffef),        //goto 19338 <__divdf3+0xba8>
     _32(0x71051042),        //addw $r1 = $r2, $r1;;
     _32(0x97fffff0),        //goto 19344 <__divdf3+0xbb4>
     _64(0x00000008fa580816),        //orw $r22 = $r22, 8224 (0x2020);;
     _32(0x08fffa9b),        //cb.deqz $r27? 19338 <__divdf3+0xba8>;;
     _32(0x17ffffe5),        //goto 19328 <__divdf3+0xb98>;;
     _32(0x97ffffee),        //goto 19350 <__divdf3+0xbc0>
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0xe54b60c1),        //extfz $r18 = $r1, 22 (0x16), 3 (0x3)
     _32(0xfb0230c0),        //srlw $r0 = $r0, 3 (0x3)
     _32(0xf90a3741),        //sllw $r2 = $r1, 29 (0x1d)
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x97ffffe8),        //goto 19350 <__divdf3+0xbc0>
     _32(0x7a091002)        //orw $r2 = $r2, $r0;;
 |];

let __udivdi3: list_I = 
 [|
     _32(0x88800641),        //cb.deqz $r1? 1941c <__udivdi3+0x64>
     _32(0x760da040),        //compd.ltu $r3 = $r0, $r1;;
     _32(0xea080000),        //copyd $r2 = $r0
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x08000503),        //cb.dnez $r3? 19418 <__udivdi3+0x60>;;
     _32(0xf00e2001),        //clzd $r3 = $r1
     _32(0x70122002),        //clzd $r4 = $r2;;
     _32(0x751110c4),        //sbfw $r4 = $r4, $r3;;
     _32(0x79066101),        //slld $r1 = $r1, $r4;;
     _32(0x760da042),        //compd.ltu $r3 = $r2, $r1;;
     _32(0x08000103),        //cb.dnez $r3? 193f0 <__udivdi3+0x38>;;
     _32(0xe0000001),        //make $r0 = 1 (0x1)
     _32(0x75090081),        //sbfd $r2 = $r1, $r2;;
     _32(0x79026100),        //slld $r0 = $r0, $r4;;
     _32(0x0e000284),        //cb.wlez $r4? 19418 <__udivdi3+0x60>;;
     _32(0xe0140001),        //make $r5 = 1 (0x1)
     _32(0xfa0c0004),        //copyw $r3 = $r4
     _32(0x7b062041),        //srld $r1 = $r1, 1 (0x1);;
     _32(0x79126105),        //slld $r4 = $r5, $r4;;
     _32(0x6110ffc4),        //addd $r4 = $r4, -1 (0xffffffff);;
     _32(0x0f000083),        //loopdo $r3, 19410 <__udivdi3+0x58>;;
     _32(0x70090081),        //stsud $r2 = $r1, $r2;;
     _32(0x78090084),        //andd $r2 = $r4, $r2;;
     _32(0x71010080),        //addd $r0 = $r0, $r2;;
     _32(0x0fd00000),        //ret ;;
     _96(0x8000009fe0000000f004dd00),        //pcrel $r1 = 163700 (0x27f74)
     _32(0x00000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000b8040201),        //ld $r1 = 8 (0x8)[$r1];;
     _32(0x087ffe41),        //cb.dnez $r1? 19418 <__udivdi3+0x60>;;
     _32(0x00000000),        //errop ;;
     _32(0x7f03f000)        //nop ;;
 |];

let __umoddi3: list_I = 
 [|
     _32(0x888004c1),        //cb.deqz $r1? 1948c <__umoddi3+0x4c>
     _32(0x760da040),        //compd.ltu $r3 = $r0, $r1;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x080003c3),        //cb.dnez $r3? 19488 <__umoddi3+0x48>;;
     _32(0xf0022000),        //clzd $r0 = $r0
     _32(0x700e2001),        //clzd $r3 = $r1;;
     _32(0x750d10c0),        //sbfw $r3 = $r0, $r3;;
     _32(0x790660c1),        //slld $r1 = $r1, $r3;;
     _32(0xf611a042),        //compd.ltu $r4 = $r2, $r1
     _32(0xf5010081),        //sbfd $r0 = $r1, $r2
     _32(0x7b062041),        //srld $r1 = $r1, 1 (0x1);;
     _32(0x710a0004),        //cmoved.deqz $r4? $r2 = $r0;;
     _32(0x8e000183),        //cb.wlez $r3? 19488 <__umoddi3+0x48>
     _32(0x6a000002),        //copyd $r0 = $r2;;
     _32(0x7a000003),        //copyw $r0 = $r3;;
     _32(0x0f000080),        //loopdo $r0, 19484 <__umoddi3+0x44>;;
     _32(0x70090081),        //stsud $r2 = $r1, $r2;;
     _32(0x7b0260c2),        //srld $r0 = $r2, $r3;;
     _32(0x0fd00000),        //ret ;;
     _96(0x8000009fe0000000f004c100),        //pcrel $r1 = 163588 (0x27f04)
     _32(0x00000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000b8040201),        //ld $r1 = 8 (0x8)[$r1];;
     _32(0x087ffe41),        //cb.dnez $r1? 19488 <__umoddi3+0x48>;;
     _32(0x00000000),        //errop ;;
     _32(0x7f03f000)        //nop ;;
 |];

let __udivmoddi4: list_I = 
 [|
     _32(0x88800801),        //cb.deqz $r1? 19530 <__udivmoddi4+0x80>
     _32(0xf0162001),        //clzd $r5 = $r1
     _32(0x6a0c0000),        //copyd $r3 = $r0;;
     _32(0xf0122003),        //clzd $r4 = $r3
     _32(0x7601a040),        //compd.ltu $r0 = $r0, $r1;;
     _32(0x75111144),        //sbfw $r4 = $r4, $r5;;
     _32(0x88000580),        //cb.dnez $r0? 19520 <__udivmoddi4+0x70>
     _32(0x79166101),        //slld $r5 = $r1, $r4;;
     _32(0xf605a143),        //compd.ltu $r1 = $r3, $r5
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x08000101),        //cb.dnez $r1? 194e8 <__udivmoddi4+0x38>;;
     _32(0xe0000001),        //make $r0 = 1 (0x1)
     _32(0x750d00c5),        //sbfd $r3 = $r5, $r3;;
     _32(0x79026100),        //slld $r0 = $r0, $r4;;
     _32(0x8e000304),        //cb.wlez $r4? 19518 <__udivmoddi4+0x68>
     _32(0xe0180001),        //make $r6 = 1 (0x1)
     _32(0x6a040003),        //copyd $r1 = $r3;;
     _32(0xf91a6106),        //slld $r6 = $r6, $r4
     _32(0xfb162045),        //srld $r5 = $r5, 1 (0x1)
     _32(0x7a040004),        //copyw $r1 = $r4;;
     _32(0x6118ffc6),        //addd $r6 = $r6, -1 (0xffffffff);;
     _32(0x0f000081),        //loopdo $r1, 1950c <__udivmoddi4+0x5c>;;
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
     _96(0x8000009fe0000000f00c9800),        //pcrel $r3 = 163424 (0x27e60)
     _32(0x00000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000b80c0203),        //ld $r3 = 8 (0x8)[$r3];;
     _32(0x087ffd03),        //cb.dnez $r3? 19518 <__udivmoddi4+0x68>;;
     _32(0x00000000)        //errop ;;
 |];

let __divdi3: list_I = 
 [|
     _32(0x88800781),        //cb.deqz $r1? 195c8 <__divdi3+0x78>
     _32(0xe40c0000),        //absd $r3 = $r0
     _32(0xe4100001),        //absd $r4 = $r1
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0xf01a2003),        //clzd $r6 = $r3
     _32(0xf615a103),        //compd.ltu $r5 = $r3, $r4
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x080004c5),        //cb.dnez $r5? 195b8 <__divdi3+0x68>;;
     _32(0x70162004),        //clzd $r5 = $r4;;
     _32(0x75191146),        //sbfw $r6 = $r6, $r5;;
     _32(0x79126184),        //slld $r4 = $r4, $r6;;
     _32(0x7615a103),        //compd.ltu $r5 = $r3, $r4;;
     _32(0x08000105),        //cb.dnez $r5? 19590 <__divdi3+0x40>;;
     _32(0xe0000001),        //make $r0 = 1 (0x1)
     _32(0x750d00c4),        //sbfd $r3 = $r4, $r3;;
     _32(0x79026180),        //slld $r0 = $r0, $r6;;
     _32(0x0e000286),        //cb.wlez $r6? 195b8 <__divdi3+0x68>;;
     _32(0xe01c0001),        //make $r7 = 1 (0x1)
     _32(0xfa140006),        //copyw $r5 = $r6
     _32(0x7b122044),        //srld $r4 = $r4, 1 (0x1);;
     _32(0x791a6187),        //slld $r6 = $r7, $r6;;
     _32(0x6118ffc6),        //addd $r6 = $r6, -1 (0xffffffff);;
     _32(0x0f000085),        //loopdo $r5, 195b0 <__divdi3+0x60>;;
     _32(0x700d00c4),        //stsud $r3 = $r4, $r3;;
     _32(0x780d00c6),        //andd $r3 = $r6, $r3;;
     _32(0x710100c0),        //addd $r0 = $r0, $r3;;
     _32(0xfc090042),        //xord $r2 = $r2, $r1
     _32(0x65040000),        //negd $r1 = $r0;;
     _32(0x8fd00000),        //ret 
     _32(0x72020042),        //cmoved.dltz $r2? $r0 = $r1;;
     _96(0x8000009fe0000000f00c7200),        //pcrel $r3 = 163272 (0x27dc8)
     _32(0x00000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000b80c0203),        //ld $r3 = 8 (0x8)[$r3];;
     _32(0x087ffd83),        //cb.dnez $r3? 195b8 <__divdi3+0x68>;;
     _32(0x00000000)        //errop ;;
 |];

let __moddi3: list_I = 
 [|
     _32(0x88800581),        //cb.deqz $r1? 19640 <__moddi3+0x58>
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0xe4000000),        //absd $r0 = $r0
     _32(0x64040001),        //absd $r1 = $r1;;
     _32(0xf0122001),        //clzd $r4 = $r1
     _32(0x760da040),        //compd.ltu $r3 = $r0, $r1;;
     _32(0x08000343),        //cb.dnez $r3? 19634 <__moddi3+0x4c>;;
     _32(0x700e2000),        //clzd $r3 = $r0;;
     _32(0x75111103),        //sbfw $r4 = $r3, $r4;;
     _32(0x79066101),        //slld $r1 = $r1, $r4;;
     _32(0xf615a040),        //compd.ltu $r5 = $r0, $r1
     _32(0xf50d0001),        //sbfd $r3 = $r1, $r0
     _32(0x7b062041),        //srld $r1 = $r1, 1 (0x1);;
     _32(0x8e000184),        //cb.wlez $r4? 19634 <__moddi3+0x4c>
     _32(0x710200c5),        //cmoved.deqz $r5? $r0 = $r3;;
     _32(0x7a0c0004),        //copyw $r3 = $r4;;
     _32(0x0f000083),        //loopdo $r3, 19630 <__moddi3+0x48>;;
     _32(0x70010001),        //stsud $r0 = $r1, $r0;;
     _32(0x7b026100),        //srld $r0 = $r0, $r4;;
     _32(0x65040000),        //negd $r1 = $r0;;
     _32(0x8fd00000),        //ret 
     _32(0x72020042),        //cmoved.dltz $r2? $r0 = $r1;;
     _96(0x8000009fe0000000f0045400),        //pcrel $r1 = 163152 (0x27d50)
     _32(0x00000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000b8040201),        //ld $r1 = 8 (0x8)[$r1];;
     _32(0x087ffdc1),        //cb.dnez $r1? 19634 <__moddi3+0x4c>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 19a80 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 1b758 <_exit>
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
     _32(0x98000161),        //call 19c18 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x0000000080000104e000f000),        //make $r0 = 267200 (0x413c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 196bc <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 1b758 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010111110110000000; //0x17d80
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(u2f, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(u2d, 0b00010110100000111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(u2ld, 0b00010110100001010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(s2f, 0b00010110100001101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(s2d, 0b00010110100010000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(s2ld, 0b00010110100010011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fnear, 0b00010110100010110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(dnear, 0b00010110100100101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(ldnear, 0b00010110100110100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test_integer_to_float, 0b00010110101000011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(ull2f, 0b00010110110101010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(ull2d, 0b00010110110101111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(ull2ld, 0b00010110110110010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(sll2f, 0b00010110110110101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(sll2d, 0b00010110110111010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(sll2ld, 0b00010110110111101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test_longlong_integer_to_float, 0b00010110111000000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f2u, 0b00010111000101010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(d2u, 0b00010111000101110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(ld2u, 0b00010111000110010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f2s, 0b00010111000110110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(d2s, 0b00010111000111010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(ld2s, 0b00010111000111110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test_float_to_integer, 0b00010111001000010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f2ull, 0b00010111011111110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(d2ull, 0b00010111100000010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(ld2ull, 0b00010111100000101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f2sll, 0b00010111100001000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(d2sll, 0b00010111100001100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(ld2sll, 0b00010111100001111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test_float_to_longlong_integer, 0b00010111100010010000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010111110110000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__divsf3, 0b00010111110110101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__floatdisf, 0b00011000010000110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__floatundisf, 0b00011000011000001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__divdf3, 0b00011000011110010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__udivdi3, 0b00011001001110111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__umoddi3, 0b00011001010001000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__udivmoddi4, 0b00011001010010110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__divdi3, 0b00011001010101010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__moddi3, 0b00011001010111101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00011001011001100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00011001011010000000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000017d80;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
