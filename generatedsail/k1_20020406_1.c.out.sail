// executing 20020406_1.c.out.dumped test 
val k1_20020406_1.: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20020406_1.() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let FFmul: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let DUPFFdeg: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let DUPFFnew: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x60000010),        //make $r0 = 16 (0x10);;
     _32(0x180001c1),        //call 16f68 <malloc>;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x27050200),        //sd 8 (0x8)[$r0] = $r1;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x0d000280),        //cb.wltz $r0? 168a4 <DUPFFnew+0x54>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x60040004),        //make $r1 = 4 (0x4);;
     _32(0x1800013b),        //call 16d80 <calloc>;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x27050200),        //sd 8 (0x8)[$r0] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3004040c),        //lwz $r1 = 16 (0x10)[$r12];;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6004ffff),        //make $r1 = -1 (0xffffffff);;
     _32(0x26050100),        //sw 4 (0x4)[$r0] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let DUPFFfree: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let DUPFFswap: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let DUPFFcopy: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let DUPFFshift_add: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x2609020c),        //sw 8 (0x8)[$r12] = $r2;;
     _32(0x260d000c),        //sw 0 (0x0)[$r12] = $r3;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let DUPFFexgcd: list_I = 
 [|
     _32(0x6130d80c),        //addd $r12 = $r12, -160 (0xffffff60);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741080c),        //sd 32 (0x20)[$r12] = $r16;;
     _32(0x2739060c),        //sd 24 (0x18)[$r12] = $r14;;
     _32(0x2701100c),        //sd 64 (0x40)[$r12] = $r0;;
     _32(0x27050e0c),        //sd 56 (0x38)[$r12] = $r1;;
     _32(0x27090c0c),        //sd 48 (0x30)[$r12] = $r2;;
     _32(0x270d0a0c),        //sd 40 (0x28)[$r12] = $r3;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x1fffffb7),        //call 16838 <DUPFFdeg>;;
     _32(0x7838ffc0),        //zxwd $r14 = $r0;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x1fffffb4),        //call 16838 <DUPFFdeg>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a080000),        //copyw $r2 = $r0;;
     _32(0x7a04000e),        //copyw $r1 = $r14;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x18000479),        //call 17b68 <printf>;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x1fffffab),        //call 16838 <DUPFFdeg>;;
     _32(0x7838ffc0),        //zxwd $r14 = $r0;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x1fffffa8),        //call 16838 <DUPFFdeg>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7301b00e),        //compw.ge $r0 = $r14, $r0;;
     _32(0x0c0001c0),        //cb.wnez $r0? 169c0 <DUPFFexgcd+0x88>;;
     _32(0x380c0c0c),        //ld $r3 = 48 (0x30)[$r12];;
     _32(0x38080a0c),        //ld $r2 = 40 (0x28)[$r12];;
     _32(0x3804100c),        //ld $r1 = 64 (0x40)[$r12];;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x1fffffe0),        //call 16938 <DUPFFexgcd>;;
     _32(0x100000b2),        //goto 16c84 <DUPFFexgcd+0x34c>;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x1fffff9d),        //call 16838 <DUPFFdeg>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f001b080),        //compw.ne $r0 = $r0, 2 (0x2);;
     _32(0x0c0001c0),        //cb.wnez $r0? 169f0 <DUPFFexgcd+0xb8>;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x1fffff97),        //call 16838 <DUPFFdeg>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 169f4 <DUPFFexgcd+0xbc>;;
     _32(0x180000dc),        //call 16d60 <abort>;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x080000c0),        //cb.dnez $r0? 16a0c <DUPFFexgcd+0xd4>;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x1000009f),        //goto 16c84 <DUPFFexgcd+0x34c>;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x2601250c),        //sw 148 (0x94)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x1fffff88),        //call 16838 <DUPFFdeg>;;
     _32(0x2601270c),        //sw 156 (0x9c)[$r12] = $r0;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _32(0x0d8000c0),        //cb.wgez $r0? 16a30 <DUPFFexgcd+0xf8>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601270c),        //sw 156 (0x9c)[$r12] = $r0;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x1fffff81),        //call 16838 <DUPFFdeg>;;
     _32(0x2601260c),        //sw 152 (0x98)[$r12] = $r0;;
     _32(0x3000260c),        //lwz $r0 = 152 (0x98)[$r12];;
     _32(0x0d8000c0),        //cb.wgez $r0? 16a4c <DUPFFexgcd+0x114>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601260c),        //sw 152 (0x98)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x1fffffac),        //call 16900 <DUPFFcopy>;;
     _32(0x2701220c),        //sd 136 (0x88)[$r12] = $r0;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x1fffffa9),        //call 16900 <DUPFFcopy>;;
     _32(0x2701200c),        //sd 128 (0x80)[$r12] = $r0;;
     _32(0x3000260c),        //lwz $r0 = 152 (0x98)[$r12];;
     _32(0x1fffff7a),        //call 16850 <DUPFFnew>;;
     _32(0x27011e0c),        //sd 120 (0x78)[$r12] = $r0;;
     _32(0x38001e0c),        //ld $r0 = 120 (0x78)[$r12];;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x38001e0c),        //ld $r0 = 120 (0x78)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050100),        //sw 4 (0x4)[$r0] = $r1;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _32(0x1fffff70),        //call 16850 <DUPFFnew>;;
     _32(0x27011c0c),        //sd 112 (0x70)[$r12] = $r0;;
     _32(0x3000260c),        //lwz $r0 = 152 (0x98)[$r12];;
     _32(0x1fffff6d),        //call 16850 <DUPFFnew>;;
     _32(0x27011a0c),        //sd 104 (0x68)[$r12] = $r0;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _32(0x1fffff6a),        //call 16850 <DUPFFnew>;;
     _32(0x2701180c),        //sd 96 (0x60)[$r12] = $r0;;
     _32(0x3800180c),        //ld $r0 = 96 (0x60)[$r12];;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x3800180c),        //ld $r0 = 96 (0x60)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050100),        //sw 4 (0x4)[$r0] = $r1;;
     _32(0x10000050),        //goto 16c0c <DUPFFexgcd+0x2d4>;;
     _32(0x3800200c),        //ld $r0 = 128 (0x80)[$r12];;
     _32(0x1fffff59),        //call 16838 <DUPFFdeg>;;
     _32(0x2601170c),        //sw 92 (0x5c)[$r12] = $r0;;
     _32(0x3800200c),        //ld $r0 = 128 (0x80)[$r12];;
     _32(0x38040200),        //ld $r1 = 8 (0x8)[$r0];;
     _32(0x3400170c),        //lws $r0 = 92 (0x5c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffff49),        //call 16820 <FFmul>;;
     _32(0x2601160c),        //sw 88 (0x58)[$r12] = $r0;;
     _32(0x10000033),        //goto 16bd0 <DUPFFexgcd+0x298>;;
     _32(0x3800220c),        //ld $r0 = 136 (0x88)[$r12];;
     _32(0x1fffff4b),        //call 16838 <DUPFFdeg>;;
     _32(0x2601150c),        //sw 84 (0x54)[$r12] = $r0;;
     _32(0x3800220c),        //ld $r0 = 136 (0x88)[$r12];;
     _32(0x38040200),        //ld $r1 = 8 (0x8)[$r0];;
     _32(0x3400150c),        //lws $r0 = 84 (0x54)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x2601140c),        //sw 80 (0x50)[$r12] = $r0;;
     _32(0x3004160c),        //lwz $r1 = 88 (0x58)[$r12];;
     _32(0x3000140c),        //lwz $r0 = 80 (0x50)[$r12];;
     _32(0x1fffff3a),        //call 16820 <FFmul>;;
     _32(0x2601130c),        //sw 76 (0x4c)[$r12] = $r0;;
     _32(0x3004150c),        //lwz $r1 = 84 (0x54)[$r12];;
     _32(0x3000170c),        //lwz $r0 = 92 (0x5c)[$r12];;
     _32(0x75011040),        //sbfw $r0 = $r0, $r1;;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _32(0x3004250c),        //lwz $r1 = 148 (0x94)[$r12];;
     _32(0x3000130c),        //lwz $r0 = 76 (0x4c)[$r12];;
     _32(0x75011040),        //sbfw $r0 = $r0, $r1;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a0c0000),        //copyw $r3 = $r0;;
     _32(0x3804200c),        //ld $r1 = 128 (0x80)[$r12];;
     _32(0x3800220c),        //ld $r0 = 136 (0x88)[$r12];;
     _32(0x1fffff6b),        //call 16918 <DUPFFshift_add>;;
     _32(0x3004150c),        //lwz $r1 = 84 (0x54)[$r12];;
     _32(0x3000170c),        //lwz $r0 = 92 (0x5c)[$r12];;
     _32(0x75011040),        //sbfw $r0 = $r0, $r1;;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _32(0x3004250c),        //lwz $r1 = 148 (0x94)[$r12];;
     _32(0x3000130c),        //lwz $r0 = 76 (0x4c)[$r12];;
     _32(0x75011040),        //sbfw $r0 = $r0, $r1;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a0c0000),        //copyw $r3 = $r0;;
     _32(0x38041a0c),        //ld $r1 = 104 (0x68)[$r12];;
     _32(0x38001e0c),        //ld $r0 = 120 (0x78)[$r12];;
     _32(0x1fffff5f),        //call 16918 <DUPFFshift_add>;;
     _32(0x3004150c),        //lwz $r1 = 84 (0x54)[$r12];;
     _32(0x3000170c),        //lwz $r0 = 92 (0x5c)[$r12];;
     _32(0x75011040),        //sbfw $r0 = $r0, $r1;;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _32(0x3004250c),        //lwz $r1 = 148 (0x94)[$r12];;
     _32(0x3000130c),        //lwz $r0 = 76 (0x4c)[$r12];;
     _32(0x75011040),        //sbfw $r0 = $r0, $r1;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a0c0000),        //copyw $r3 = $r0;;
     _32(0x3804180c),        //ld $r1 = 96 (0x60)[$r12];;
     _32(0x38001c0c),        //ld $r0 = 112 (0x70)[$r12];;
     _32(0x1fffff53),        //call 16918 <DUPFFshift_add>;;
     _32(0x3800220c),        //ld $r0 = 136 (0x88)[$r12];;
     _32(0x1fffff19),        //call 16838 <DUPFFdeg>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004170c),        //lwz $r1 = 92 (0x5c)[$r12];;
     _32(0x7401b001),        //compw.le $r0 = $r1, $r0;;
     _32(0x0c7ff240),        //cb.wnez $r0? 16b08 <DUPFFexgcd+0x1d0>;;
     _32(0x3804200c),        //ld $r1 = 128 (0x80)[$r12];;
     _32(0x3800220c),        //ld $r0 = 136 (0x88)[$r12];;
     _32(0x1fffff3e),        //call 168e8 <DUPFFswap>;;
     _32(0x38041a0c),        //ld $r1 = 104 (0x68)[$r12];;
     _32(0x38001e0c),        //ld $r0 = 120 (0x78)[$r12];;
     _32(0x1fffff3b),        //call 168e8 <DUPFFswap>;;
     _32(0x3804180c),        //ld $r1 = 96 (0x60)[$r12];;
     _32(0x38001c0c),        //ld $r0 = 112 (0x70)[$r12];;
     _32(0x1fffff38),        //call 168e8 <DUPFFswap>;;
     _32(0x3800200c),        //ld $r0 = 128 (0x80)[$r12];;
     _32(0x1fffff0a),        //call 16838 <DUPFFdeg>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x0effeb80),        //cb.wgtz $r0? 16ad0 <DUPFFexgcd+0x198>;;
     _32(0x3800200c),        //ld $r0 = 128 (0x80)[$r12];;
     _32(0x1fffff06),        //call 16838 <DUPFFdeg>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000280),        //cb.dnez $r0? 16c50 <DUPFFexgcd+0x318>;;
     _32(0x3804200c),        //ld $r1 = 128 (0x80)[$r12];;
     _32(0x3800220c),        //ld $r0 = 136 (0x88)[$r12];;
     _32(0x1fffff2d),        //call 168e8 <DUPFFswap>;;
     _32(0x38041a0c),        //ld $r1 = 104 (0x68)[$r12];;
     _32(0x38001e0c),        //ld $r0 = 120 (0x78)[$r12];;
     _32(0x1fffff2a),        //call 168e8 <DUPFFswap>;;
     _32(0x3804180c),        //ld $r1 = 96 (0x60)[$r12];;
     _32(0x38001c0c),        //ld $r0 = 112 (0x70)[$r12];;
     _32(0x1fffff27),        //call 168e8 <DUPFFswap>;;
     _32(0x38001a0c),        //ld $r0 = 104 (0x68)[$r12];;
     _32(0x1fffff1f),        //call 168d0 <DUPFFfree>;;
     _32(0x3800180c),        //ld $r0 = 96 (0x60)[$r12];;
     _32(0x1fffff1d),        //call 168d0 <DUPFFfree>;;
     _32(0x3800200c),        //ld $r0 = 128 (0x80)[$r12];;
     _32(0x1fffff1b),        //call 168d0 <DUPFFfree>;;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x38041e0c),        //ld $r1 = 120 (0x78)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x38041c0c),        //ld $r1 = 112 (0x70)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x3800220c),        //ld $r0 = 136 (0x88)[$r12];;
     _32(0x3840080c),        //ld $r16 = 32 (0x20)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838060c),        //ld $r14 = 24 (0x18)[$r12];;
     _32(0x6130280c),        //addd $r12 = $r12, 160 (0xa0);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2739020c),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1ffffee9),        //call 16850 <DUPFFnew>;;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _32(0x61000100),        //addd $r0 = $r0, 4 (0x4);;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x26050100),        //sw 4 (0x4)[$r0] = $r1;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x1ffffede),        //call 16850 <DUPFFnew>;;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _32(0x26050100),        //sw 4 (0x4)[$r0] = $r1;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x1ffffecd),        //call 16838 <DUPFFdeg>;;
     _32(0x7838ffc0),        //zxwd $r14 = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x1ffffeca),        //call 16838 <DUPFFdeg>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a080000),        //copyw $r2 = $r0;;
     _32(0x7a04000e),        //copyw $r1 = $r14;;
     _96(0x00000000800000fce000fa00),        //make $r0 = 259048 (0x3f3e8);;
     _32(0x1800038f),        //call 17b68 <printf>;;
     _32(0x6104060c),        //addd $r1 = $r12, 24 (0x18);;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x380c0c0c),        //ld $r3 = 48 (0x30)[$r12];;
     _32(0x38080e0c),        //ld $r2 = 56 (0x38)[$r12];;
     _32(0x1ffffefe),        //call 16938 <DUPFFexgcd>;;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000461),        //call 17ef0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98002bdb),        //call 21ce0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let calloc: list_I = 
 [|
     _32(0xea0c0000),        //copyd $r3 = $r0
     _32(0xea080001),        //copyd $r2 = $r1
     _96(0x10000000900000f8e0001000),        //make $r0 = 254016 (0x3e040);;
     _32(0x90000003),        //goto 16da0 <_calloc_r>
     _32(0xea040003),        //copyd $r1 = $r3
     _32(0x38000000)        //ld $r0 = 0 (0x0)[$r0];;
 |];

let _calloc_r: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0xd4041081),        //muld $r1 = $r1, $r2
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x9800007a),        //call 16f98 <_malloc_r>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x88800340),        //cb.deqz $r0? 16dec <_calloc_r+0x4c>
     _32(0x6a380000),        //copyd $r14 = $r0;;
     _32(0x3808fe00),        //ld $r2 = -8 (0xfffffff8)[$r0];;
     _32(0x6808ff02),        //andd $r2 = $r2, -4 (0xfffffffc);;
     _32(0x6108fe02),        //addd $r2 = $r2, -8 (0xfffffff8);;
     _32(0x69051202),        //compd.gtu $r1 = $r2, 72 (0x48);;
     _32(0x080006c1),        //cb.dnez $r1? 16e3c <_calloc_r+0x9c>;;
     _32(0x680509c2),        //compd.leu $r1 = $r2, 39 (0x27);;
     _32(0x088002c1),        //cb.deqz $r1? 16e04 <_calloc_r+0x64>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x27050200),        //sd 8 (0x8)[$r0] = $r1;;
     _32(0x27050400),        //sd 16 (0x10)[$r0] = $r1;;
     _32(0xea00000e),        //copyd $r0 = $r14
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3838040c),        //ld $r14 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0xe9010dc2),        //compd.gtu $r0 = $r2, 55 (0x37)
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x2705000e),        //sd 0 (0x0)[$r14] = $r1;;
     _32(0x888004c0),        //cb.deqz $r0? 16e5c <_calloc_r+0xbc>
     _32(0x2705020e),        //sd 8 (0x8)[$r14] = $r1;;
     _32(0xe1091202),        //compd.eq $r2 = $r2, 72 (0x48)
     _32(0xe100080e),        //addd $r0 = $r14, 32 (0x20)
     _32(0x2705040e),        //sd 16 (0x10)[$r14] = $r1;;
     _32(0x2705060e),        //sd 24 (0x18)[$r14] = $r1;;
     _32(0x08fffb42),        //cb.deqz $r2? 16ddc <_calloc_r+0x3c>;;
     _32(0xe1000c0e),        //addd $r0 = $r14, 48 (0x30)
     _32(0x2705080e),        //sd 32 (0x20)[$r14] = $r1;;
     _32(0x97ffffea),        //goto 16ddc <_calloc_r+0x3c>
     _32(0x27050a0e),        //sd 40 (0x28)[$r14] = $r1;;
     _32(0x980002bd),        //call 17930 <memset>
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0xea00000e),        //copyd $r0 = $r14
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3838040c),        //ld $r14 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0x97ffffe0),        //goto 16ddc <_calloc_r+0x3c>
     _32(0x6100040e),        //addd $r0 = $r14, 16 (0x10);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110110010011000; //0x16c98
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(FFmul, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(DUPFFdeg, 0b00010110100000111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(DUPFFnew, 0b00010110100001010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(DUPFFfree, 0b00010110100011010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(DUPFFswap, 0b00010110100011101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(DUPFFcopy, 0b00010110100100000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(DUPFFshift_add, 0b00010110100100011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(DUPFFexgcd, 0b00010110100100111000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110110010011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110110101100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(calloc, 0b00010110110110000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(_calloc_r, 0b00010110110110100000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
