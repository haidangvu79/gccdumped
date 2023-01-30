// executing pipeline 20050121_1 test 
val k1_pipeline_20050121_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20050121_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo_float: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601020c),        //sw 8 (0x8)[$r12] = $r0;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x48030000),        //floatw.rn $r0 = $r0, 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x48030000),        //floatw.rn $r0 = $r0, 0 (0x0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7a080000),        //copyw $r2 = $r0;;
     _32(0x6103f001),        //insf $r0 = $r1, 31 (0x1f), 0 (0x0);;
     _32(0x7a040002),        //copyw $r1 = $r2;;
     _32(0x6303f801),        //insf $r0 = $r1, 63 (0x3f), 32 (0x20);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let bar_float: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1fffffdf),        //call 16820 <foo_float>;;
     _32(0x6707f800),        //extfz $r1 = $r0, 63 (0x3f), 32 (0x20);;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let baz_float: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1fffffcf),        //call 16820 <foo_float>;;
     _32(0x6703f800),        //extfz $r0 = $r0, 63 (0x3f), 32 (0x20);;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let foo_double: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x44030000),        //floatd.rn $r0 = $r0, 0 (0x0);;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x2705080c),        //sd 32 (0x20)[$r12] = $r1;;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x44030000),        //floatd.rn $r0 = $r0, 0 (0x0);;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x2705080c),        //sd 32 (0x20)[$r12] = $r1;;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x6a0c0001),        //copyd $r3 = $r1;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x6a000003),        //copyd $r0 = $r3;;
     _32(0x6a040002),        //copyd $r1 = $r2;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let bar_double: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1fffffdd),        //call 16910 <foo_double>;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let baz_double: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1fffffcf),        //call 16910 <foo_double>;;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let foo_ldouble_t: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x44030000),        //floatd.rn $r0 = $r0, 0 (0x0);;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x2705080c),        //sd 32 (0x20)[$r12] = $r1;;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x44030000),        //floatd.rn $r0 = $r0, 0 (0x0);;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x2705080c),        //sd 32 (0x20)[$r12] = $r1;;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x6a0c0001),        //copyd $r3 = $r1;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x6a000003),        //copyd $r0 = $r3;;
     _32(0x6a040002),        //copyd $r1 = $r2;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let bar_ldouble_t: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1fffffdd),        //call 16a00 <foo_ldouble_t>;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let baz_ldouble_t: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1fffffcf),        //call 16a00 <foo_ldouble_t>;;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let foo_char: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x240107cc),        //sb 31 (0x1f)[$r12] = $r0;;
     _32(0x2000078c),        //lbz $r0 = 30 (0x1e)[$r12];;
     _32(0x200407cc),        //lbz $r1 = 31 (0x1f)[$r12];;
     _32(0x2405070c),        //sb 28 (0x1c)[$r12] = $r1;;
     _32(0x2401074c),        //sb 29 (0x1d)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x2401078c),        //sb 30 (0x1e)[$r12] = $r0;;
     _32(0x2000078c),        //lbz $r0 = 30 (0x1e)[$r12];;
     _32(0x200407cc),        //lbz $r1 = 31 (0x1f)[$r12];;
     _32(0x2405070c),        //sb 28 (0x1c)[$r12] = $r1;;
     _32(0x2401074c),        //sb 29 (0x1d)[$r12] = $r0;;
     _32(0x200407cc),        //lbz $r1 = 31 (0x1f)[$r12];;
     _32(0x2000078c),        //lbz $r0 = 30 (0x1e)[$r12];;
     _32(0x7a080001),        //copyw $r2 = $r1;;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _32(0x60037002),        //insf $r0 = $r2, 7 (0x7), 0 (0x0);;
     _32(0x6003f201),        //insf $r0 = $r1, 15 (0xf), 8 (0x8);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let bar_char: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1fffffdf),        //call 16af0 <foo_char>;;
     _32(0x6407f200),        //extfz $r1 = $r0, 15 (0xf), 8 (0x8);;
     _32(0x78043fc0),        //zxbd $r1 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let baz_char: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1fffffcf),        //call 16af0 <foo_char>;;
     _32(0x6403f200),        //extfz $r0 = $r0, 15 (0xf), 8 (0x8);;
     _32(0x78043fc0),        //zxbd $r1 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let foo_short: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x2501078c),        //sh 30 (0x1e)[$r12] = $r0;;
     _32(0x2800070c),        //lhz $r0 = 28 (0x1c)[$r12];;
     _32(0x2804078c),        //lhz $r1 = 30 (0x1e)[$r12];;
     _32(0x2505060c),        //sh 24 (0x18)[$r12] = $r1;;
     _32(0x2501068c),        //sh 26 (0x1a)[$r12] = $r0;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x2501070c),        //sh 28 (0x1c)[$r12] = $r0;;
     _32(0x2800070c),        //lhz $r0 = 28 (0x1c)[$r12];;
     _32(0x2804078c),        //lhz $r1 = 30 (0x1e)[$r12];;
     _32(0x2505060c),        //sh 24 (0x18)[$r12] = $r1;;
     _32(0x2501068c),        //sh 26 (0x1a)[$r12] = $r0;;
     _32(0x2804078c),        //lhz $r1 = 30 (0x1e)[$r12];;
     _32(0x2800070c),        //lhz $r0 = 28 (0x1c)[$r12];;
     _32(0x7a080001),        //copyw $r2 = $r1;;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _32(0x6003f002),        //insf $r0 = $r2, 15 (0xf), 0 (0x0);;
     _32(0x6103f401),        //insf $r0 = $r1, 31 (0x1f), 16 (0x10);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let bar_short: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1fffffdf),        //call 16be0 <foo_short>;;
     _32(0x6507f400),        //extfz $r1 = $r0, 31 (0x1f), 16 (0x10);;
     _32(0x6407f000),        //zxhd $r1 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x25050000),        //sh 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let baz_short: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1fffffcf),        //call 16be0 <foo_short>;;
     _32(0x6503f400),        //extfz $r0 = $r0, 31 (0x1f), 16 (0x10);;
     _32(0x6407f000),        //zxhd $r1 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x25050000),        //sh 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let foo_int: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601020c),        //sw 8 (0x8)[$r12] = $r0;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7a080001),        //copyw $r2 = $r1;;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _32(0x6103f002),        //insf $r0 = $r2, 31 (0x1f), 0 (0x0);;
     _32(0x6303f801),        //insf $r0 = $r1, 63 (0x3f), 32 (0x20);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let bar_int: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1fffffe3),        //call 16cd0 <foo_int>;;
     _32(0x6707f800),        //extfz $r1 = $r0, 63 (0x3f), 32 (0x20);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let baz_int: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1fffffd3),        //call 16cd0 <foo_int>;;
     _32(0x6703f800),        //extfz $r0 = $r0, 63 (0x3f), 32 (0x20);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let foo_long: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x2705080c),        //sd 32 (0x20)[$r12] = $r1;;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x2705080c),        //sd 32 (0x20)[$r12] = $r1;;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x6a0c0001),        //copyd $r3 = $r1;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x6a000003),        //copyd $r0 = $r3;;
     _32(0x6a040002),        //copyd $r1 = $r2;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let bar_long: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1fffffdf),        //call 16db0 <foo_long>;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let baz_long: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1fffffd1),        //call 16db0 <foo_long>;;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let foo_llong: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x2705080c),        //sd 32 (0x20)[$r12] = $r1;;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x2705080c),        //sd 32 (0x20)[$r12] = $r1;;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x6a0c0001),        //copyd $r3 = $r1;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x6a000003),        //copyd $r0 = $r3;;
     _32(0x6a040002),        //copyd $r1 = $r2;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let bar_llong: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1fffffdf),        //call 16e98 <foo_llong>;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let baz_llong: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1fffffd1),        //call 16e98 <foo_llong>;;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601160c),        //sw 88 (0x58)[$r12] = $r0;;
     _32(0x6100160c),        //addd $r0 = $r12, 88 (0x58);;
     _32(0x1ffffe3e),        //call 16890 <bar_float>;;
     _32(0x3000160c),        //lwz $r0 = 88 (0x58)[$r12];;
     _64(0x00103000e0040000),        //make $r1 = 1086324736 (0x40c00000);;
     _32(0x72030040),        //fcompw.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16fb4 <main+0x34>;;
     _32(0x18000096),        //call 17208 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601160c),        //sw 88 (0x58)[$r12] = $r0;;
     _32(0x6100160c),        //addd $r0 = $r12, 88 (0x58);;
     _32(0x1ffffe44),        //call 168d0 <baz_float>;;
     _32(0x3000160c),        //lwz $r0 = 88 (0x58)[$r12];;
     _64(0x00102000e0040000),        //make $r1 = 1082130432 (0x40800000);;
     _32(0x72030040),        //fcompw.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16fdc <main+0x5c>;;
     _32(0x1800008c),        //call 17208 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701140c),        //sd 80 (0x50)[$r12] = $r0;;
     _32(0x6100140c),        //addd $r0 = $r12, 80 (0x50);;
     _32(0x1ffffe68),        //call 16988 <bar_double>;;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _96(0x0200c00080000000e0040000),        //make $r1 = 4618441417868443648 (0x4018000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 17008 <main+0x88>;;
     _32(0x18000081),        //call 17208 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701140c),        //sd 80 (0x50)[$r12] = $r0;;
     _32(0x6100140c),        //addd $r0 = $r12, 80 (0x50);;
     _32(0x1ffffe6b),        //call 169c0 <baz_double>;;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _96(0x0200800080000000e0040000),        //make $r1 = 4616189618054758400 (0x4010000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 17034 <main+0xb4>;;
     _32(0x18000076),        //call 17208 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701120c),        //sd 72 (0x48)[$r12] = $r0;;
     _32(0x6100120c),        //addd $r0 = $r12, 72 (0x48);;
     _32(0x1ffffe8e),        //call 16a78 <bar_ldouble_t>;;
     _32(0x3800120c),        //ld $r0 = 72 (0x48)[$r12];;
     _96(0x0200c00080000000e0040000),        //make $r1 = 4618441417868443648 (0x4018000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 17060 <main+0xe0>;;
     _32(0x1800006b),        //call 17208 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701120c),        //sd 72 (0x48)[$r12] = $r0;;
     _32(0x6100120c),        //addd $r0 = $r12, 72 (0x48);;
     _32(0x1ffffe91),        //call 16ab0 <baz_ldouble_t>;;
     _32(0x3800120c),        //ld $r0 = 72 (0x48)[$r12];;
     _96(0x0200800080000000e0040000),        //make $r1 = 4616189618054758400 (0x4010000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 1708c <main+0x10c>;;
     _32(0x18000060),        //call 17208 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2401100c),        //sb 64 (0x40)[$r12] = $r0;;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x1ffffeb2),        //call 16b60 <bar_char>;;
     _32(0x2000100c),        //lbz $r0 = 64 (0x40)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000000f101b180),        //compw.eq $r0 = $r0, 6 (0x6);;
     _32(0x0c000080),        //cb.wnez $r0? 170b4 <main+0x134>;;
     _32(0x18000056),        //call 17208 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2401100c),        //sb 64 (0x40)[$r12] = $r0;;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x1ffffeb8),        //call 16ba0 <baz_char>;;
     _32(0x2000100c),        //lbz $r0 = 64 (0x40)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000000f101b100),        //compw.eq $r0 = $r0, 4 (0x4);;
     _32(0x0c000080),        //cb.wnez $r0? 170dc <main+0x15c>;;
     _32(0x1800004c),        //call 17208 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x25010e0c),        //sh 56 (0x38)[$r12] = $r0;;
     _32(0x61000e0c),        //addd $r0 = $r12, 56 (0x38);;
     _32(0x1ffffeda),        //call 16c50 <bar_short>;;
     _32(0x28000e0c),        //lhz $r0 = 56 (0x38)[$r12];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _64(0x00000000f101b180),        //compw.eq $r0 = $r0, 6 (0x6);;
     _32(0x0c000080),        //cb.wnez $r0? 17104 <main+0x184>;;
     _32(0x18000042),        //call 17208 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x25010e0c),        //sh 56 (0x38)[$r12] = $r0;;
     _32(0x61000e0c),        //addd $r0 = $r12, 56 (0x38);;
     _32(0x1ffffee0),        //call 16c90 <baz_short>;;
     _32(0x28000e0c),        //lhz $r0 = 56 (0x38)[$r12];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _64(0x00000000f101b100),        //compw.eq $r0 = $r0, 4 (0x4);;
     _32(0x0c000080),        //cb.wnez $r0? 1712c <main+0x1ac>;;
     _32(0x18000038),        //call 17208 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010c0c),        //sw 48 (0x30)[$r12] = $r0;;
     _32(0x61000c0c),        //addd $r0 = $r12, 48 (0x30);;
     _32(0x1ffffefe),        //call 16d30 <bar_int>;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _64(0x00000000f101b180),        //compw.eq $r0 = $r0, 6 (0x6);;
     _32(0x0c000080),        //cb.wnez $r0? 17150 <main+0x1d0>;;
     _32(0x1800002f),        //call 17208 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010c0c),        //sw 48 (0x30)[$r12] = $r0;;
     _32(0x61000c0c),        //addd $r0 = $r12, 48 (0x30);;
     _32(0x1fffff05),        //call 16d70 <baz_int>;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _64(0x00000000f101b100),        //compw.eq $r0 = $r0, 4 (0x4);;
     _32(0x0c000080),        //cb.wnez $r0? 17174 <main+0x1f4>;;
     _32(0x18000026),        //call 17208 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x61000a0c),        //addd $r0 = $r12, 40 (0x28);;
     _32(0x1fffff28),        //call 16e20 <bar_long>;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x61010180),        //compd.eq $r0 = $r0, 6 (0x6);;
     _32(0x08000080),        //cb.dnez $r0? 17194 <main+0x214>;;
     _32(0x1800001e),        //call 17208 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x61000a0c),        //addd $r0 = $r12, 40 (0x28);;
     _32(0x1fffff2e),        //call 16e58 <baz_long>;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x61010100),        //compd.eq $r0 = $r0, 4 (0x4);;
     _32(0x08000080),        //cb.dnez $r0? 171b4 <main+0x234>;;
     _32(0x18000016),        //call 17208 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x1fffff52),        //call 16f08 <bar_llong>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x61010180),        //compd.eq $r0 = $r0, 6 (0x6);;
     _32(0x08000080),        //cb.dnez $r0? 171d4 <main+0x254>;;
     _32(0x1800000e),        //call 17208 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x1fffff58),        //call 16f40 <baz_llong>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x61010100),        //compd.eq $r0 = $r0, 4 (0x4);;
     _32(0x08000080),        //cb.dnez $r0? 171f4 <main+0x274>;;
     _32(0x18000006),        //call 17208 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 175e0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 19110 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110111110000000; //0x16f80
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo_float, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar_float, 0b00010110100010010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(baz_float, 0b00010110100011010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo_double, 0b00010110100100010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar_double, 0b00010110100110001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(baz_double, 0b00010110100111000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo_ldouble_t, 0b00010110101000000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar_ldouble_t, 0b00010110101001111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(baz_ldouble_t, 0b00010110101010110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo_char, 0b00010110101011110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar_char, 0b00010110101101100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(baz_char, 0b00010110101110100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo_short, 0b00010110101111100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar_short, 0b00010110110001010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(baz_short, 0b00010110110010010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo_int, 0b00010110110011010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar_int, 0b00010110110100110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(baz_int, 0b00010110110101110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo_long, 0b00010110110110110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar_long, 0b00010110111000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(baz_long, 0b00010110111001011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo_llong, 0b00010110111010011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar_llong, 0b00010110111100001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(baz_llong, 0b00010110111101000000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110111110000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010111001000001000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016f80;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
