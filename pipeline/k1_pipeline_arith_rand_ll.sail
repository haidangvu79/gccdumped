// executing pipeline arith_rand_ll.c.out.dumped test 
val k1_pipeline_arith_rand_ll: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_arith_rand_ll() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let simple_rand: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _64(0x10107193c4009b40),        //muld $r0 = $r0, 1103515245 (0x41c64e6d);;
     _64(0x0000000ce1000e40),        //addd $r0 = $r0, 12345 (0x3039);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000f8e0040200),        //make $r1 = 253960 (0x3e008);;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x7b022200),        //srld $r0 = $r0, 8 (0x8);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let random_bitstring: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x1fffffe5),        //call 16820 <simple_rand>;;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x7a062040),        //srad $r1 = $r0, 1 (0x1);;
     _32(0x7a022fc1),        //srad $r0 = $r1, 63 (0x3f);;
     _32(0x7b022f00),        //srld $r0 = $r0, 60 (0x3c);;
     _32(0x71050001),        //addd $r1 = $r1, $r0;;
     _32(0x680403c1),        //andd $r1 = $r1, 15 (0xf);;
     _32(0x75010040),        //sbfd $r0 = $r0, $r1;;
     _32(0x2601090c),        //sw 36 (0x24)[$r12] = $r0;;
     _32(0x30040d0c),        //lwz $r1 = 52 (0x34)[$r12];;
     _32(0x3000090c),        //lwz $r0 = 36 (0x24)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x3000090c),        //lwz $r0 = 36 (0x24)[$r12];;
     _32(0x0c0000c0),        //cb.wnez $r0? 168d4 <random_bitstring+0x64>;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x10000017),        //goto 1692c <random_bitstring+0xbc>;;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x3000090c),        //lwz $r0 = 36 (0x24)[$r12];;
     _32(0x79026001),        //slld $r0 = $r1, $r0;;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x68000040),        //andd $r0 = $r0, 1 (0x1);;
     _32(0x088002c0),        //cb.deqz $r0? 16918 <random_bitstring+0xa8>;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x3000090c),        //lwz $r0 = 36 (0x24)[$r12];;
     _32(0x79027001),        //sllw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x7a010001),        //ord $r0 = $r1, $r0;;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _64(0x00000002f801b180),        //compw.leu $r0 = $r0, 70 (0x46);;
     _32(0x0c7ff680),        //cb.wnez $r0? 1688c <random_bitstring+0x1c>;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130d80c),        //addd $r12 = $r12, -160 (0xffffff60);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701260c),        //sd 152 (0x98)[$r12] = $r0;;
     _32(0x1000014b),        //goto 16e80 <main+0x540>;;
     _32(0x1fffffc6),        //call 16870 <random_bitstring>;;
     _32(0x2701240c),        //sd 144 (0x90)[$r12] = $r0;;
     _32(0x1fffffc4),        //call 16870 <random_bitstring>;;
     _32(0x2701220c),        //sd 136 (0x88)[$r12] = $r0;;
     _32(0x3800240c),        //ld $r0 = 144 (0x90)[$r12];;
     _32(0x2701200c),        //sd 128 (0x80)[$r12] = $r0;;
     _32(0x3800220c),        //ld $r0 = 136 (0x88)[$r12];;
     _32(0x27011e0c),        //sd 120 (0x78)[$r12] = $r0;;
     _32(0x38001e0c),        //ld $r0 = 120 (0x78)[$r12];;
     _32(0x08804cc0),        //cb.deqz $r0? 16e48 <main+0x508>;;
     _32(0x38041e0c),        //ld $r1 = 120 (0x78)[$r12];;
     _32(0x3800200c),        //ld $r0 = 128 (0x80)[$r12];;
     _32(0x18000144),        //call 16e98 <__udivdi3>;;
     _32(0x27011c0c),        //sd 112 (0x70)[$r12] = $r0;;
     _32(0x3800200c),        //ld $r0 = 128 (0x80)[$r12];;
     _32(0x38041e0c),        //ld $r1 = 120 (0x78)[$r12];;
     _32(0x18000162),        //call 16f20 <__umoddi3>;;
     _32(0x27011a0c),        //sd 104 (0x68)[$r12] = $r0;;
     _32(0x38041a0c),        //ld $r1 = 104 (0x68)[$r12];;
     _32(0x38001e0c),        //ld $r0 = 120 (0x78)[$r12];;
     _32(0x7701a001),        //compd.geu $r0 = $r1, $r0;;
     _32(0x08000240),        //cb.dnez $r0? 169d0 <main+0x90>;;
     _32(0x38041c0c),        //ld $r1 = 112 (0x70)[$r12];;
     _32(0x38001e0c),        //ld $r0 = 120 (0x78)[$r12];;
     _32(0x54041001),        //muld $r1 = $r1, $r0;;
     _32(0x38001a0c),        //ld $r0 = 104 (0x68)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3804200c),        //ld $r1 = 128 (0x80)[$r12];;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 169d4 <main+0x94>;;
     _32(0x180001dc),        //call 17140 <abort>;;
     _32(0x3800240c),        //ld $r0 = 144 (0x90)[$r12];;
     _32(0x2701180c),        //sd 96 (0x60)[$r12] = $r0;;
     _32(0x3800220c),        //ld $r0 = 136 (0x88)[$r12];;
     _32(0x2701160c),        //sd 88 (0x58)[$r12] = $r0;;
     _32(0x3800180c),        //ld $r0 = 96 (0x60)[$r12];;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x08000100),        //cb.dnez $r0? 169fc <main+0xbc>;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x6001ffc0),        //compd.ne $r0 = $r0, -1 (0xffffffff);;
     _32(0x08804580),        //cb.deqz $r0? 16e50 <main+0x510>;;
     _32(0x3804160c),        //ld $r1 = 88 (0x58)[$r12];;
     _32(0x3800180c),        //ld $r0 = 96 (0x60)[$r12];;
     _32(0x1800018b),        //call 17030 <__divdi3>;;
     _32(0x2701140c),        //sd 80 (0x50)[$r12] = $r0;;
     _32(0x3800180c),        //ld $r0 = 96 (0x60)[$r12];;
     _32(0x3804160c),        //ld $r1 = 88 (0x58)[$r12];;
     _32(0x180001ad),        //call 170c8 <__moddi3>;;
     _32(0x2701120c),        //sd 72 (0x48)[$r12] = $r0;;
     _32(0x3800120c),        //ld $r0 = 72 (0x48)[$r12];;
     _32(0x64000000),        //absd $r0 = $r0;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x64000000),        //absd $r0 = $r0;;
     _32(0x7701a001),        //compd.geu $r0 = $r1, $r0;;
     _32(0x08000240),        //cb.dnez $r0? 16a58 <main+0x118>;;
     _32(0x3804140c),        //ld $r1 = 80 (0x50)[$r12];;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x54041001),        //muld $r1 = $r1, $r0;;
     _32(0x3800120c),        //ld $r0 = 72 (0x48)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3804180c),        //ld $r1 = 96 (0x60)[$r12];;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16a5c <main+0x11c>;;
     _32(0x180001ba),        //call 17140 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3800240c),        //ld $r0 = 144 (0x90)[$r12];;
     _32(0x2601110c),        //sw 68 (0x44)[$r12] = $r0;;
     _32(0x3800220c),        //ld $r0 = 136 (0x88)[$r12];;
     _32(0x2601100c),        //sw 64 (0x40)[$r12] = $r0;;
     _32(0x3000100c),        //lwz $r0 = 64 (0x40)[$r12];;
     _32(0x0c803e40),        //cb.weqz $r0? 16e58 <main+0x518>;;
     _32(0x3000110c),        //lwz $r0 = 68 (0x44)[$r12];;
     _32(0x3004100c),        //lwz $r1 = 64 (0x40)[$r12];;
     _32(0x18000106),        //call 16e98 <__udivdi3>;;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x3000110c),        //lwz $r0 = 68 (0x44)[$r12];;
     _32(0x3004100c),        //lwz $r1 = 64 (0x40)[$r12];;
     _32(0x18000124),        //call 16f20 <__umoddi3>;;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x30040e0c),        //lwz $r1 = 56 (0x38)[$r12];;
     _32(0x3000100c),        //lwz $r0 = 64 (0x40)[$r12];;
     _32(0x7701b001),        //compw.geu $r0 = $r1, $r0;;
     _32(0x0c0002c0),        //cb.wnez $r0? 16ad0 <main+0x190>;;
     _32(0x30040f0c),        //lwz $r1 = 60 (0x3c)[$r12];;
     _32(0x3000100c),        //lwz $r0 = 64 (0x40)[$r12];;
     _32(0x5b003001),        //mulw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x30040e0c),        //lwz $r1 = 56 (0x38)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004110c),        //lwz $r1 = 68 (0x44)[$r12];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16ad4 <main+0x194>;;
     _32(0x1800019c),        //call 17140 <abort>;;
     _32(0x3800240c),        //ld $r0 = 144 (0x90)[$r12];;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x3800220c),        //ld $r0 = 136 (0x88)[$r12];;
     _32(0x26010c0c),        //sw 48 (0x30)[$r12] = $r0;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000140),        //cb.dnez $r0? 16b04 <main+0x1c4>;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _64(0x07fffffff001b7c0),        //compw.ne $r0 = $r0, 4294967295 (0xffffffff);;
     _32(0x0c803600),        //cb.weqz $r0? 16e60 <main+0x520>;;
     _32(0x34000d0c),        //lws $r0 = 52 (0x34)[$r12];;
     _32(0x34040c0c),        //lws $r1 = 48 (0x30)[$r12];;
     _32(0x18000149),        //call 17030 <__divdi3>;;
     _32(0x26010b0c),        //sw 44 (0x2c)[$r12] = $r0;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x34040c0c),        //lws $r1 = 48 (0x30)[$r12];;
     _32(0x1800016a),        //call 170c8 <__moddi3>;;
     _32(0x26010a0c),        //sw 40 (0x28)[$r12] = $r0;;
     _32(0x30000a0c),        //lwz $r0 = 40 (0x28)[$r12];;
     _32(0x74000000),        //absw $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _32(0x74000000),        //absw $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7701b001),        //compw.geu $r0 = $r1, $r0;;
     _32(0x0c000580),        //cb.wnez $r0? 16ba4 <main+0x264>;;
     _32(0x30040b0c),        //lwz $r1 = 44 (0x2c)[$r12];;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _32(0x5b003001),        //mulw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x30040a0c),        //lwz $r1 = 40 (0x28)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x30040d0c),        //lwz $r1 = 52 (0x34)[$r12];;
     _32(0x7001b001),        //compw.ne $r0 = $r1, $r0;;
     _32(0x0c000300),        //cb.wnez $r0? 16ba4 <main+0x264>;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _32(0x7b0237c0),        //srlw $r0 = $r0, 31 (0x1f);;
     _32(0x78043fc0),        //zxbd $r1 = $r0;;
     _32(0x30000a0c),        //lwz $r0 = 40 (0x28)[$r12];;
     _32(0x7b0237c0),        //srlw $r0 = $r0, 31 (0x1f);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7c011001),        //xorw $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x08800100),        //cb.deqz $r0? 16ba8 <main+0x268>;;
     _32(0x30000a0c),        //lwz $r0 = 40 (0x28)[$r12];;
     _32(0x0c800080),        //cb.weqz $r0? 16ba8 <main+0x268>;;
     _32(0x18000167),        //call 17140 <abort>;;
     _32(0x3800240c),        //ld $r0 = 144 (0x90)[$r12];;
     _32(0x2501098c),        //sh 38 (0x26)[$r12] = $r0;;
     _32(0x3800220c),        //ld $r0 = 136 (0x88)[$r12];;
     _32(0x2501090c),        //sh 36 (0x24)[$r12] = $r0;;
     _32(0x2800090c),        //lhz $r0 = 36 (0x24)[$r12];;
     _32(0x0c802ac0),        //cb.weqz $r0? 16e68 <main+0x528>;;
     _32(0x2800098c),        //lhz $r0 = 38 (0x26)[$r12];;
     _32(0x2804090c),        //lhz $r1 = 36 (0x24)[$r12];;
     _32(0x180000b4),        //call 16e98 <__udivdi3>;;
     _32(0x2501088c),        //sh 34 (0x22)[$r12] = $r0;;
     _32(0x2800098c),        //lhz $r0 = 38 (0x26)[$r12];;
     _32(0x2804090c),        //lhz $r1 = 36 (0x24)[$r12];;
     _32(0x180000d2),        //call 16f20 <__umoddi3>;;
     _32(0x2501080c),        //sh 32 (0x20)[$r12] = $r0;;
     _32(0x2800080c),        //lhz $r0 = 32 (0x20)[$r12];;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _32(0x2800090c),        //lhz $r0 = 36 (0x24)[$r12];;
     _32(0x7701b001),        //compw.geu $r0 = $r1, $r0;;
     _32(0x0c0003c0),        //cb.wnez $r0? 16c2c <main+0x2ec>;;
     _32(0x2800088c),        //lhz $r0 = 34 (0x22)[$r12];;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x2800090c),        //lhz $r0 = 36 (0x24)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x5b003001),        //mulw $r0 = $r1, $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x2800080c),        //lhz $r0 = 32 (0x20)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x2800098c),        //lhz $r0 = 38 (0x26)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16c30 <main+0x2f0>;;
     _32(0x18000145),        //call 17140 <abort>;;
     _32(0x3800240c),        //ld $r0 = 144 (0x90)[$r12];;
     _32(0x2501078c),        //sh 30 (0x1e)[$r12] = $r0;;
     _32(0x3800220c),        //ld $r0 = 136 (0x88)[$r12];;
     _32(0x2501070c),        //sh 28 (0x1c)[$r12] = $r0;;
     _32(0x2c00078c),        //lhs $r0 = 30 (0x1e)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x2c04070c),        //lhs $r1 = 28 (0x1c)[$r12];;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x6907f001),        //sxwd $r1 = $r1;;
     _32(0x180000f6),        //call 17030 <__divdi3>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x2501068c),        //sh 26 (0x1a)[$r12] = $r0;;
     _32(0x2c00078c),        //lhs $r0 = 30 (0x1e)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x2c04070c),        //lhs $r1 = 28 (0x1c)[$r12];;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x6907f001),        //sxwd $r1 = $r1;;
     _32(0x18000113),        //call 170c8 <__moddi3>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x2501060c),        //sh 24 (0x18)[$r12] = $r0;;
     _32(0x2c00060c),        //lhs $r0 = 24 (0x18)[$r12];;
     _32(0x74000000),        //absw $r0 = $r0;;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x2c00070c),        //lhs $r0 = 28 (0x1c)[$r12];;
     _32(0x0d800180),        //cb.wgez $r0? 16cb4 <main+0x374>;;
     _32(0x2800070c),        //lhz $r0 = 28 (0x1c)[$r12];;
     _32(0x75000000),        //negw $r0 = $r0;;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x10000003),        //goto 16cbc <main+0x37c>;;
     _32(0x2800070c),        //lhz $r0 = 28 (0x1c)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7401b040),        //compw.le $r0 = $r0, $r1;;
     _32(0x0c000340),        //cb.wnez $r0? 16cf4 <main+0x3b4>;;
     _32(0x2804068c),        //lhz $r1 = 26 (0x1a)[$r12];;
     _32(0x2800070c),        //lhz $r0 = 28 (0x1c)[$r12];;
     _32(0x5b003001),        //mulw $r0 = $r1, $r0;;
     _32(0x6407f000),        //zxhd $r1 = $r0;;
     _32(0x2800060c),        //lhz $r0 = 24 (0x18)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x2c04078c),        //lhs $r1 = 30 (0x1e)[$r12];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16cf8 <main+0x3b8>;;
     _32(0x18000113),        //call 17140 <abort>;;
     _32(0x3800240c),        //ld $r0 = 144 (0x90)[$r12];;
     _32(0x240105cc),        //sb 23 (0x17)[$r12] = $r0;;
     _32(0x3800220c),        //ld $r0 = 136 (0x88)[$r12];;
     _32(0x2401058c),        //sb 22 (0x16)[$r12] = $r0;;
     _32(0x2000058c),        //lbz $r0 = 22 (0x16)[$r12];;
     _32(0x0c801640),        //cb.weqz $r0? 16e70 <main+0x530>;;
     _32(0x200005cc),        //lbz $r0 = 23 (0x17)[$r12];;
     _32(0x2004058c),        //lbz $r1 = 22 (0x16)[$r12];;
     _32(0x18000060),        //call 16e98 <__udivdi3>;;
     _32(0x2401054c),        //sb 21 (0x15)[$r12] = $r0;;
     _32(0x200005cc),        //lbz $r0 = 23 (0x17)[$r12];;
     _32(0x2004058c),        //lbz $r1 = 22 (0x16)[$r12];;
     _32(0x1800007e),        //call 16f20 <__umoddi3>;;
     _32(0x2401050c),        //sb 20 (0x14)[$r12] = $r0;;
     _32(0x2000050c),        //lbz $r0 = 20 (0x14)[$r12];;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _32(0x2000058c),        //lbz $r0 = 22 (0x16)[$r12];;
     _32(0x7701b001),        //compw.geu $r0 = $r1, $r0;;
     _32(0x0c0003c0),        //cb.wnez $r0? 16d7c <main+0x43c>;;
     _32(0x2000054c),        //lbz $r0 = 21 (0x15)[$r12];;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x2000058c),        //lbz $r0 = 22 (0x16)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x5b003001),        //mulw $r0 = $r1, $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x2000050c),        //lbz $r0 = 20 (0x14)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x200005cc),        //lbz $r0 = 23 (0x17)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16d80 <main+0x440>;;
     _32(0x180000f1),        //call 17140 <abort>;;
     _32(0x3800240c),        //ld $r0 = 144 (0x90)[$r12];;
     _32(0x240104cc),        //sb 19 (0x13)[$r12] = $r0;;
     _32(0x3800220c),        //ld $r0 = 136 (0x88)[$r12];;
     _32(0x2401048c),        //sb 18 (0x12)[$r12] = $r0;;
     _32(0x240004cc),        //lbs $r0 = 19 (0x13)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x2404048c),        //lbs $r1 = 18 (0x12)[$r12];;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x6907f001),        //sxwd $r1 = $r1;;
     _32(0x180000a2),        //call 17030 <__divdi3>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x2401044c),        //sb 17 (0x11)[$r12] = $r0;;
     _32(0x240004cc),        //lbs $r0 = 19 (0x13)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x2404048c),        //lbs $r1 = 18 (0x12)[$r12];;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x6907f001),        //sxwd $r1 = $r1;;
     _32(0x180000bf),        //call 170c8 <__moddi3>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x2401040c),        //sb 16 (0x10)[$r12] = $r0;;
     _32(0x2400040c),        //lbs $r0 = 16 (0x10)[$r12];;
     _32(0x74000000),        //absw $r0 = $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x2400048c),        //lbs $r0 = 18 (0x12)[$r12];;
     _32(0x0d800180),        //cb.wgez $r0? 16e04 <main+0x4c4>;;
     _32(0x2000048c),        //lbz $r0 = 18 (0x12)[$r12];;
     _32(0x75000000),        //negw $r0 = $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x10000003),        //goto 16e0c <main+0x4cc>;;
     _32(0x2000048c),        //lbz $r0 = 18 (0x12)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7401b040),        //compw.le $r0 = $r0, $r1;;
     _32(0x0c000340),        //cb.wnez $r0? 16e44 <main+0x504>;;
     _32(0x2004044c),        //lbz $r1 = 17 (0x11)[$r12];;
     _32(0x2000048c),        //lbz $r0 = 18 (0x12)[$r12];;
     _32(0x5b003001),        //mulw $r0 = $r1, $r0;;
     _32(0x78043fc0),        //zxbd $r1 = $r0;;
     _32(0x2000040c),        //lbz $r0 = 16 (0x10)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x240404cc),        //lbs $r1 = 19 (0x13)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000340),        //cb.wnez $r0? 16e74 <main+0x534>;;
     _32(0x180000bf),        //call 17140 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x1000000a),        //goto 16e74 <main+0x534>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x10000008),        //goto 16e74 <main+0x534>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x10000006),        //goto 16e74 <main+0x534>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x10000004),        //goto 16e74 <main+0x534>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x10000002),        //goto 16e74 <main+0x534>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3800260c),        //ld $r0 = 152 (0x98)[$r12];;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x2701260c),        //sd 152 (0x98)[$r12] = $r0;;
     _32(0x3800260c),        //ld $r0 = 152 (0x98)[$r12];;
     _64(0x00000009e401c3c0),        //compd.le $r0 = $r0, 9999 (0x270f);;
     _32(0x087facc0),        //cb.dnez $r0? 16958 <main+0x18>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x180000b3)        //call 17160 <exit>;;
 |];

let __udivdi3: list_I = 
 [|
     _32(0x88800641),        //cb.deqz $r1? 16efc <__udivdi3+0x64>
     _32(0x760da040),        //compd.ltu $r3 = $r0, $r1;;
     _32(0xea080000),        //copyd $r2 = $r0
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x08000503),        //cb.dnez $r3? 16ef8 <__udivdi3+0x60>;;
     _32(0xf00e2001),        //clzd $r3 = $r1
     _32(0x70122002),        //clzd $r4 = $r2;;
     _32(0x751110c4),        //sbfw $r4 = $r4, $r3;;
     _32(0x79066101),        //slld $r1 = $r1, $r4;;
     _32(0x760da042),        //compd.ltu $r3 = $r2, $r1;;
     _32(0x08000103),        //cb.dnez $r3? 16ed0 <__udivdi3+0x38>;;
     _32(0xe0000001),        //make $r0 = 1 (0x1)
     _32(0x75090081),        //sbfd $r2 = $r1, $r2;;
     _32(0x79026100),        //slld $r0 = $r0, $r4;;
     _32(0x0e000284),        //cb.wlez $r4? 16ef8 <__udivdi3+0x60>;;
     _32(0xe0140001),        //make $r5 = 1 (0x1)
     _32(0xfa0c0004),        //copyw $r3 = $r4
     _32(0x7b062041),        //srld $r1 = $r1, 1 (0x1);;
     _32(0x79126105),        //slld $r4 = $r5, $r4;;
     _32(0x6110ffc4),        //addd $r4 = $r4, -1 (0xffffffff);;
     _32(0x0f000083),        //loopdo $r3, 16ef0 <__udivdi3+0x58>;;
     _32(0x70090081),        //stsud $r2 = $r1, $r2;;
     _32(0x78090084),        //andd $r2 = $r4, $r2;;
     _32(0x71010080),        //addd $r0 = $r0, $r2;;
     _32(0x0fd00000),        //ret ;;
     _96(0x800000a1e0000000f0042500),        //pcrel $r1 = 165012 (0x28494)
     _32(0x00000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000b8040201),        //ld $r1 = 8 (0x8)[$r1];;
     _32(0x087ffe41),        //cb.dnez $r1? 16ef8 <__udivdi3+0x60>;;
     _32(0x00000000),        //errop ;;
     _32(0x7f03f000)        //nop ;;
 |];

let __umoddi3: list_I = 
 [|
     _32(0x888004c1),        //cb.deqz $r1? 16f6c <__umoddi3+0x4c>
     _32(0x760da040),        //compd.ltu $r3 = $r0, $r1;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x080003c3),        //cb.dnez $r3? 16f68 <__umoddi3+0x48>;;
     _32(0xf0022000),        //clzd $r0 = $r0
     _32(0x700e2001),        //clzd $r3 = $r1;;
     _32(0x750d10c0),        //sbfw $r3 = $r0, $r3;;
     _32(0x790660c1),        //slld $r1 = $r1, $r3;;
     _32(0xf611a042),        //compd.ltu $r4 = $r2, $r1
     _32(0xf5010081),        //sbfd $r0 = $r1, $r2
     _32(0x7b062041),        //srld $r1 = $r1, 1 (0x1);;
     _32(0x710a0004),        //cmoved.deqz $r4? $r2 = $r0;;
     _32(0x8e000183),        //cb.wlez $r3? 16f68 <__umoddi3+0x48>
     _32(0x6a000002),        //copyd $r0 = $r2;;
     _32(0x7a000003),        //copyw $r0 = $r3;;
     _32(0x0f000080),        //loopdo $r0, 16f64 <__umoddi3+0x44>;;
     _32(0x70090081),        //stsud $r2 = $r1, $r2;;
     _32(0x7b0260c2),        //srld $r0 = $r2, $r3;;
     _32(0x0fd00000),        //ret ;;
     _96(0x800000a1e0000000f0040900),        //pcrel $r1 = 164900 (0x28424)
     _32(0x00000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000b8040201),        //ld $r1 = 8 (0x8)[$r1];;
     _32(0x087ffe41),        //cb.dnez $r1? 16f68 <__umoddi3+0x48>;;
     _32(0x00000000),        //errop ;;
     _32(0x7f03f000)        //nop ;;
 |];

let __udivmoddi4: list_I = 
 [|
     _32(0x88800801),        //cb.deqz $r1? 17010 <__udivmoddi4+0x80>
     _32(0xf0162001),        //clzd $r5 = $r1
     _32(0x6a0c0000),        //copyd $r3 = $r0;;
     _32(0xf0122003),        //clzd $r4 = $r3
     _32(0x7601a040),        //compd.ltu $r0 = $r0, $r1;;
     _32(0x75111144),        //sbfw $r4 = $r4, $r5;;
     _32(0x88000580),        //cb.dnez $r0? 17000 <__udivmoddi4+0x70>
     _32(0x79166101),        //slld $r5 = $r1, $r4;;
     _32(0xf605a143),        //compd.ltu $r1 = $r3, $r5
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x08000101),        //cb.dnez $r1? 16fc8 <__udivmoddi4+0x38>;;
     _32(0xe0000001),        //make $r0 = 1 (0x1)
     _32(0x750d00c5),        //sbfd $r3 = $r5, $r3;;
     _32(0x79026100),        //slld $r0 = $r0, $r4;;
     _32(0x8e000304),        //cb.wlez $r4? 16ff8 <__udivmoddi4+0x68>
     _32(0xe0180001),        //make $r6 = 1 (0x1)
     _32(0x6a040003),        //copyd $r1 = $r3;;
     _32(0xf91a6106),        //slld $r6 = $r6, $r4
     _32(0xfb162045),        //srld $r5 = $r5, 1 (0x1)
     _32(0x7a040004),        //copyw $r1 = $r4;;
     _32(0x6118ffc6),        //addd $r6 = $r6, -1 (0xffffffff);;
     _32(0x0f000081),        //loopdo $r1, 16fec <__udivmoddi4+0x5c>;;
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
     _96(0x800000a0e0000000f00ce000),        //pcrel $r3 = 164736 (0x28380)
     _32(0x00000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000b80c0203),        //ld $r3 = 8 (0x8)[$r3];;
     _32(0x087ffd03),        //cb.dnez $r3? 16ff8 <__udivmoddi4+0x68>;;
     _32(0x00000000)        //errop ;;
 |];

let __divdi3: list_I = 
 [|
     _32(0x88800781),        //cb.deqz $r1? 170a8 <__divdi3+0x78>
     _32(0xe40c0000),        //absd $r3 = $r0
     _32(0xe4100001),        //absd $r4 = $r1
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0xf01a2003),        //clzd $r6 = $r3
     _32(0xf615a103),        //compd.ltu $r5 = $r3, $r4
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x080004c5),        //cb.dnez $r5? 17098 <__divdi3+0x68>;;
     _32(0x70162004),        //clzd $r5 = $r4;;
     _32(0x75191146),        //sbfw $r6 = $r6, $r5;;
     _32(0x79126184),        //slld $r4 = $r4, $r6;;
     _32(0x7615a103),        //compd.ltu $r5 = $r3, $r4;;
     _32(0x08000105),        //cb.dnez $r5? 17070 <__divdi3+0x40>;;
     _32(0xe0000001),        //make $r0 = 1 (0x1)
     _32(0x750d00c4),        //sbfd $r3 = $r4, $r3;;
     _32(0x79026180),        //slld $r0 = $r0, $r6;;
     _32(0x0e000286),        //cb.wlez $r6? 17098 <__divdi3+0x68>;;
     _32(0xe01c0001),        //make $r7 = 1 (0x1)
     _32(0xfa140006),        //copyw $r5 = $r6
     _32(0x7b122044),        //srld $r4 = $r4, 1 (0x1);;
     _32(0x791a6187),        //slld $r6 = $r7, $r6;;
     _32(0x6118ffc6),        //addd $r6 = $r6, -1 (0xffffffff);;
     _32(0x0f000085),        //loopdo $r5, 17090 <__divdi3+0x60>;;
     _32(0x700d00c4),        //stsud $r3 = $r4, $r3;;
     _32(0x780d00c6),        //andd $r3 = $r6, $r3;;
     _32(0x710100c0),        //addd $r0 = $r0, $r3;;
     _32(0xfc090042),        //xord $r2 = $r2, $r1
     _32(0x65040000),        //negd $r1 = $r0;;
     _32(0x8fd00000),        //ret 
     _32(0x72020042),        //cmoved.dltz $r2? $r0 = $r1;;
     _96(0x800000a0e0000000f00cba00),        //pcrel $r3 = 164584 (0x282e8)
     _32(0x00000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000b80c0203),        //ld $r3 = 8 (0x8)[$r3];;
     _32(0x087ffd83),        //cb.dnez $r3? 17098 <__divdi3+0x68>;;
     _32(0x00000000)        //errop ;;
 |];

let __moddi3: list_I = 
 [|
     _32(0x88800581),        //cb.deqz $r1? 17120 <__moddi3+0x58>
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0xe4000000),        //absd $r0 = $r0
     _32(0x64040001),        //absd $r1 = $r1;;
     _32(0xf0122001),        //clzd $r4 = $r1
     _32(0x760da040),        //compd.ltu $r3 = $r0, $r1;;
     _32(0x08000343),        //cb.dnez $r3? 17114 <__moddi3+0x4c>;;
     _32(0x700e2000),        //clzd $r3 = $r0;;
     _32(0x75111103),        //sbfw $r4 = $r3, $r4;;
     _32(0x79066101),        //slld $r1 = $r1, $r4;;
     _32(0xf615a040),        //compd.ltu $r5 = $r0, $r1
     _32(0xf50d0001),        //sbfd $r3 = $r1, $r0
     _32(0x7b062041),        //srld $r1 = $r1, 1 (0x1);;
     _32(0x8e000184),        //cb.wlez $r4? 17114 <__moddi3+0x4c>
     _32(0x710200c5),        //cmoved.deqz $r5? $r0 = $r3;;
     _32(0x7a0c0004),        //copyw $r3 = $r4;;
     _32(0x0f000083),        //loopdo $r3, 17110 <__moddi3+0x48>;;
     _32(0x70010001),        //stsud $r0 = $r1, $r0;;
     _32(0x7b026100),        //srld $r0 = $r0, $r4;;
     _32(0x65040000),        //negd $r1 = $r0;;
     _32(0x8fd00000),        //ret 
     _32(0x72020042),        //cmoved.dltz $r2? $r0 = $r1;;
     _96(0x800000a0e0000000f0049c00),        //pcrel $r1 = 164464 (0x28270)
     _32(0x00000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000b8040201),        //ld $r1 = 8 (0x8)[$r1];;
     _32(0x087ffdc1),        //cb.dnez $r1? 17114 <__moddi3+0x4c>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 17560 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 19238 <_exit>
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
     _32(0x98000161),        //call 176f8 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 1719c <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 19238 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100101000000; //0x16940
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(simple_rand, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(random_bitstring, 0b00010110100001110000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100101000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__udivdi3, 0b00010110111010011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__umoddi3, 0b00010110111100100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__udivmoddi4, 0b00010110111110010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__divdi3, 0b00010111000000110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__moddi3, 0b00010111000011001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010111000101000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010111000101100000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016940;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
