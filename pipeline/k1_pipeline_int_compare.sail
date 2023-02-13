// executing pipeline int_compare.c.out.dumped test 
val k1_pipeline_int_compare: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_int_compare() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let gt: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x7501b001),        //compw.gt $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let ge: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x7301b001),        //compw.ge $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let lt: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x7201b001),        //compw.lt $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let le: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x7401b001),        //compw.le $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let true: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0c000080),        //cb.wnez $r0? 168dc <true+0x1c>;;
     _32(0x18000140),        //call 16dd8 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let false: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0c800080),        //cb.weqz $r0? 1690c <false+0x1c>;;
     _32(0x18000134),        //call 16dd8 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x1fffffbb),        //call 16820 <gt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffffe1),        //call 168c0 <true>;;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffffb6),        //call 16820 <gt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffffe8),        //call 168f0 <false>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _64(0x001fffffe000ffc0),        //make $r0 = 2147483647 (0x7fffffff);;
     _32(0x1fffffb0),        //call 16820 <gt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffffd6),        //call 168c0 <true>;;
     _64(0x001fffffe004ffc0),        //make $r1 = 2147483647 (0x7fffffff);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffaa),        //call 16820 <gt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffffdc),        //call 168f0 <false>;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _64(0x001fffffe000ffc0),        //make $r0 = 2147483647 (0x7fffffff);;
     _32(0x1fffffa4),        //call 16820 <gt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffffca),        //call 168c0 <true>;;
     _64(0x001fffffe004ffc0),        //make $r1 = 2147483647 (0x7fffffff);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffff9e),        //call 16820 <gt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffffd0),        //call 168f0 <false>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _64(0x07e00000e000003f),        //make $r0 = -2147483648 (0xffffffff80000000);;
     _32(0x1fffff98),        //call 16820 <gt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffffca),        //call 168f0 <false>;;
     _64(0x07e00000e004003f),        //make $r1 = -2147483648 (0xffffffff80000000);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff92),        //call 16820 <gt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffffb8),        //call 168c0 <true>;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _64(0x07e00000e000003f),        //make $r0 = -2147483648 (0xffffffff80000000);;
     _32(0x1fffff8c),        //call 16820 <gt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffffbe),        //call 168f0 <false>;;
     _64(0x07e00000e004003f),        //make $r1 = -2147483648 (0xffffffff80000000);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffff86),        //call 16820 <gt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffffac),        //call 168c0 <true>;;
     _64(0x07e00000e004003f),        //make $r1 = -2147483648 (0xffffffff80000000);;
     _64(0x001fffffe000ffc0),        //make $r0 = 2147483647 (0x7fffffff);;
     _32(0x1fffff7f),        //call 16820 <gt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffffa5),        //call 168c0 <true>;;
     _64(0x001fffffe004ffc0),        //make $r1 = 2147483647 (0x7fffffff);;
     _64(0x07e00000e000003f),        //make $r0 = -2147483648 (0xffffffff80000000);;
     _32(0x1fffff78),        //call 16820 <gt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffffaa),        //call 168f0 <false>;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x1fffff7d),        //call 16848 <ge>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffff99),        //call 168c0 <true>;;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffff78),        //call 16848 <ge>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffffa0),        //call 168f0 <false>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _64(0x001fffffe000ffc0),        //make $r0 = 2147483647 (0x7fffffff);;
     _32(0x1fffff72),        //call 16848 <ge>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffff8e),        //call 168c0 <true>;;
     _64(0x001fffffe004ffc0),        //make $r1 = 2147483647 (0x7fffffff);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff6c),        //call 16848 <ge>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffff94),        //call 168f0 <false>;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _64(0x001fffffe000ffc0),        //make $r0 = 2147483647 (0x7fffffff);;
     _32(0x1fffff66),        //call 16848 <ge>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffff82),        //call 168c0 <true>;;
     _64(0x001fffffe004ffc0),        //make $r1 = 2147483647 (0x7fffffff);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffff60),        //call 16848 <ge>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffff88),        //call 168f0 <false>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _64(0x07e00000e000003f),        //make $r0 = -2147483648 (0xffffffff80000000);;
     _32(0x1fffff5a),        //call 16848 <ge>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffff82),        //call 168f0 <false>;;
     _64(0x07e00000e004003f),        //make $r1 = -2147483648 (0xffffffff80000000);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff54),        //call 16848 <ge>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffff70),        //call 168c0 <true>;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _64(0x07e00000e000003f),        //make $r0 = -2147483648 (0xffffffff80000000);;
     _32(0x1fffff4e),        //call 16848 <ge>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffff76),        //call 168f0 <false>;;
     _64(0x07e00000e004003f),        //make $r1 = -2147483648 (0xffffffff80000000);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffff48),        //call 16848 <ge>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffff64),        //call 168c0 <true>;;
     _64(0x07e00000e004003f),        //make $r1 = -2147483648 (0xffffffff80000000);;
     _64(0x001fffffe000ffc0),        //make $r0 = 2147483647 (0x7fffffff);;
     _32(0x1fffff41),        //call 16848 <ge>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffff5d),        //call 168c0 <true>;;
     _64(0x001fffffe004ffc0),        //make $r1 = 2147483647 (0x7fffffff);;
     _64(0x07e00000e000003f),        //make $r0 = -2147483648 (0xffffffff80000000);;
     _32(0x1fffff3a),        //call 16848 <ge>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffff62),        //call 168f0 <false>;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x1fffff3f),        //call 16870 <lt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffff5d),        //call 168f0 <false>;;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffff3a),        //call 16870 <lt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffff4c),        //call 168c0 <true>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _64(0x001fffffe000ffc0),        //make $r0 = 2147483647 (0x7fffffff);;
     _32(0x1fffff34),        //call 16870 <lt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffff52),        //call 168f0 <false>;;
     _64(0x001fffffe004ffc0),        //make $r1 = 2147483647 (0x7fffffff);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff2e),        //call 16870 <lt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffff40),        //call 168c0 <true>;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _64(0x001fffffe000ffc0),        //make $r0 = 2147483647 (0x7fffffff);;
     _32(0x1fffff28),        //call 16870 <lt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffff46),        //call 168f0 <false>;;
     _64(0x001fffffe004ffc0),        //make $r1 = 2147483647 (0x7fffffff);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffff22),        //call 16870 <lt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffff34),        //call 168c0 <true>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _64(0x07e00000e000003f),        //make $r0 = -2147483648 (0xffffffff80000000);;
     _32(0x1fffff1c),        //call 16870 <lt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffff2e),        //call 168c0 <true>;;
     _64(0x07e00000e004003f),        //make $r1 = -2147483648 (0xffffffff80000000);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff16),        //call 16870 <lt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffff34),        //call 168f0 <false>;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _64(0x07e00000e000003f),        //make $r0 = -2147483648 (0xffffffff80000000);;
     _32(0x1fffff10),        //call 16870 <lt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffff22),        //call 168c0 <true>;;
     _64(0x07e00000e004003f),        //make $r1 = -2147483648 (0xffffffff80000000);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffff0a),        //call 16870 <lt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffff28),        //call 168f0 <false>;;
     _64(0x07e00000e004003f),        //make $r1 = -2147483648 (0xffffffff80000000);;
     _64(0x001fffffe000ffc0),        //make $r0 = 2147483647 (0x7fffffff);;
     _32(0x1fffff03),        //call 16870 <lt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffff21),        //call 168f0 <false>;;
     _64(0x001fffffe004ffc0),        //make $r1 = 2147483647 (0x7fffffff);;
     _64(0x07e00000e000003f),        //make $r0 = -2147483648 (0xffffffff80000000);;
     _32(0x1ffffefc),        //call 16870 <lt>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffff0e),        //call 168c0 <true>;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x1fffff01),        //call 16898 <le>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffff15),        //call 168f0 <false>;;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1ffffefc),        //call 16898 <le>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffff04),        //call 168c0 <true>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _64(0x001fffffe000ffc0),        //make $r0 = 2147483647 (0x7fffffff);;
     _32(0x1ffffef6),        //call 16898 <le>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffff0a),        //call 168f0 <false>;;
     _64(0x001fffffe004ffc0),        //make $r1 = 2147483647 (0x7fffffff);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1ffffef0),        //call 16898 <le>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1ffffef8),        //call 168c0 <true>;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _64(0x001fffffe000ffc0),        //make $r0 = 2147483647 (0x7fffffff);;
     _32(0x1ffffeea),        //call 16898 <le>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1ffffefe),        //call 168f0 <false>;;
     _64(0x001fffffe004ffc0),        //make $r1 = 2147483647 (0x7fffffff);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1ffffee4),        //call 16898 <le>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1ffffeec),        //call 168c0 <true>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _64(0x07e00000e000003f),        //make $r0 = -2147483648 (0xffffffff80000000);;
     _32(0x1ffffede),        //call 16898 <le>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1ffffee6),        //call 168c0 <true>;;
     _64(0x07e00000e004003f),        //make $r1 = -2147483648 (0xffffffff80000000);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1ffffed8),        //call 16898 <le>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1ffffeec),        //call 168f0 <false>;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _64(0x07e00000e000003f),        //make $r0 = -2147483648 (0xffffffff80000000);;
     _32(0x1ffffed2),        //call 16898 <le>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1ffffeda),        //call 168c0 <true>;;
     _64(0x07e00000e004003f),        //make $r1 = -2147483648 (0xffffffff80000000);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1ffffecc),        //call 16898 <le>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1ffffee0),        //call 168f0 <false>;;
     _64(0x07e00000e004003f),        //make $r1 = -2147483648 (0xffffffff80000000);;
     _64(0x001fffffe000ffc0),        //make $r0 = 2147483647 (0x7fffffff);;
     _32(0x1ffffec5),        //call 16898 <le>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1ffffed9),        //call 168f0 <false>;;
     _64(0x001fffffe004ffc0),        //make $r1 = 2147483647 (0x7fffffff);;
     _64(0x07e00000e000003f),        //make $r0 = -2147483648 (0xffffffff80000000);;
     _32(0x1ffffebe),        //call 16898 <le>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1ffffec6),        //call 168c0 <true>;;
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
     _32(0x1ffffed5),        //call 16920 <f>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16df8 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 171f8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18ed0 <_exit>
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
     _32(0x98000161),        //call 17390 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16e34 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18ed0 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110110111000000; //0x16dc0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(gt, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(ge, 0b00010110100001001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(lt, 0b00010110100001110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(le, 0b00010110100010011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(true, 0b00010110100011000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(false, 0b00010110100011110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100100100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110110111000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110110111011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110110111111000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016dc0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
