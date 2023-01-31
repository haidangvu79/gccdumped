// executing pipeline pr84748.c.out.dumped test 
val k1_pipeline_pr84748: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr84748() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let store: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _96(0x000000008000011be0046e00),        //make $r1 = 290232 (0x46db8);;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x000000008000011be0046800),        //make $r1 = 290208 (0x46da0);;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let foo: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x2849060c),        //sq 24 (0x18)[$r12] = $r18r19;;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x27410a0c),        //sd 40 (0x28)[$r12] = $r16;;
     _96(0x000000008000011be0087000),        //make $r2 = 290240 (0x46dc0);;
     _32(0x30080002),        //lwz $r2 = 0 (0x0)[$r2];;
     _32(0x690bf002),        //sxwd $r2 = $r2;;
     _32(0x6a000002),        //copyd $r0 = $r2;;
     _32(0x7a0a2fc2),        //srad $r2 = $r2, 63 (0x3f);;
     _32(0x6a040002),        //copyd $r1 = $r2;;
     _96(0x000000008000011be0086400),        //make $r2 = 290192 (0x46d90);;
     _32(0x3c080002),        //lq $r2r3 = 0 (0x0)[$r2];;
     _32(0x7e11d080),        //addcd.i $r4 = $r0, $r2;;
     _32(0x7e15c0c1),        //addcd $r5 = $r1, $r3;;
     _96(0x000000008000011be0006400),        //make $r0 = 290192 (0x46d90);;
     _32(0x28110000),        //sq 0 (0x0)[$r0] = $r4r5;;
     _96(0x000000008000011be0006c00),        //make $r0 = 290224 (0x46db0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000a4bf001b6c0),        //compw.ne $r0 = $r0, 84347 (0x1497b);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x000000008000011be0006a00),        //make $r0 = 290216 (0x46da8);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x000000008000011be0006400),        //make $r0 = 290192 (0x46d90);;
     _32(0x3c000000),        //lq $r0r1 = 0 (0x0)[$r0];;
     _96(0x000000008000011be0086a00),        //make $r2 = 290216 (0x46da8);;
     _32(0x30080002),        //lwz $r2 = 0 (0x0)[$r2];;
     _32(0x690bf002),        //sxwd $r2 = $r2;;
     _32(0x6a180002),        //copyd $r6 = $r2;;
     _32(0x7a0a2fc2),        //srad $r2 = $r2, 63 (0x3f);;
     _32(0x6a1c0002),        //copyd $r7 = $r2;;
     _32(0x6a080006),        //copyd $r2 = $r6;;
     _32(0x6a0c0007),        //copyd $r3 = $r7;;
     _32(0x1800002c),        //call 169d0 <__udivti3>;;
     _96(0x000000008000011be0086400),        //make $r2 = 290192 (0x46d90);;
     _32(0x28010002),        //sq 0 (0x0)[$r2] = $r0r1;;
     _96(0x000000008000011be0006400),        //make $r0 = 290192 (0x46d90);;
     _32(0x3c000000),        //lq $r0r1 = 0 (0x0)[$r0];;
     _32(0x28010c0c),        //sq 48 (0x30)[$r12] = $r0r1;;
     _32(0x38080c0c),        //ld $r2 = 48 (0x30)[$r12];;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x7b4a2000),        //srld $r18 = $r0, 0 (0x0);;
     _32(0x604c0000),        //make $r19 = 0 (0x0);;
     _32(0x6a000012),        //copyd $r0 = $r18;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x6a000002),        //copyd $r0 = $r2;;
     _32(0x1fffffaf),        //call 16820 <store>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3c48060c),        //lq $r18r19 = 24 (0x18)[$r12];;
     _32(0x38400a0c),        //ld $r16 = 40 (0x28)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1fffffb5),        //call 16860 <foo>;;
     _96(0x000000008000011be0006e00),        //make $r0 = 290232 (0x46db8);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x08000180),        //cb.dnez $r0? 169b8 <main+0x38>;;
     _96(0x000000008000011be0006800),        //make $r0 = 290208 (0x46da0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x08800080),        //cb.deqz $r0? 169bc <main+0x3c>;;
     _32(0x18000226),        //call 17250 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let __udivti3: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0xea4c0002),        //copyd $r19 = $r2
     _32(0xea480000),        //copyd $r18 = $r0
     _32(0x2849040c),        //sq 16 (0x10)[$r12] = $r18r19;;
     _32(0xea500000),        //copyd $r20 = $r0
     _32(0xea540001),        //copyd $r21 = $r1
     _32(0x2855080c),        //so 32 (0x20)[$r12] = $r20r21r22r23;;
     _32(0xea380001),        //copyd $r14 = $r1
     _32(0x2739020c),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0x2741160c),        //sd 88 (0x58)[$r12] = $r16;;
     _32(0x2861100c),        //sq 64 (0x40)[$r12] = $r24r25;;
     _32(0x88002883),        //cb.dnez $r3? 16c88 <__udivti3+0x2b8>
     _32(0x2769140c),        //sd 80 (0x50)[$r12] = $r26;;
     _32(0x7801a042),        //compd.leu $r0 = $r2, $r1;;
     _32(0x08001580),        //cb.dnez $r0? 16b64 <__udivti3+0x194>;;
     _32(0xe0040038),        //make $r1 = 56 (0x38)
     _32(0x60000007),        //make $r0 = 7 (0x7);;
     _32(0xfb0e6042),        //srld $r3 = $r2, $r1
     _32(0x6100ffc0),        //addd $r0 = $r0, -1 (0xffffffff);;
     _32(0x68103fc3),        //andd $r4 = $r3, 255 (0xff);;
     _32(0x08005284),        //cb.dnez $r4? 16f4c <__udivti3+0x57c>;;
     _32(0x887fff00),        //cb.dnez $r0? 16a18 <__udivti3+0x48>
     _32(0x6104fe01),        //addd $r1 = $r1, -8 (0xfffffff8);;
     _32(0xea0c0002),        //copyd $r3 = $r2
     _32(0x60040040),        //make $r1 = 64 (0x40);;
     _96(0x00000000800000a6f0005600),        //pcrel $r0 = 170328 (0x29958);;
     _64(0x18000000b8000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x2002e0c0),        //lbz $r0 = $r3[$r0];;
     _32(0x75050040),        //sbfd $r1 = $r0, $r1;;
     _32(0x088001c1),        //cb.deqz $r1? 16a70 <__udivti3+0xa0>;;
     _32(0xf5001001),        //sbfw $r0 = $r1, 64 (0x40)
     _32(0xf93a604e),        //slld $r14 = $r14, $r1
     _32(0xf94e6042),        //slld $r19 = $r2, $r1
     _32(0x794a6054),        //slld $r18 = $r20, $r1;;
     _32(0x7b026014),        //srld $r0 = $r20, $r0;;
     _32(0x7a550380),        //ord $r21 = $r0, $r14;;
     _32(0xfb5e2813),        //srld $r23 = $r19, 32 (0x20)
     _32(0xea000015),        //copyd $r0 = $r21
     _64(0x103fffffe858ffd3),        //andd $r22 = $r19, 4294967295 (0xffffffff);;
     _32(0x9800016c),        //call 17030 <__umoddi3>
     _32(0x6a040017),        //copyd $r1 = $r23;;
     _32(0x98000148),        //call 16fa8 <__udivdi3>
     _32(0xea380000),        //copyd $r14 = $r0
     _32(0xea040017),        //copyd $r1 = $r23
     _32(0x6a000015),        //copyd $r0 = $r21;;
     _32(0xf90a280e),        //slld $r2 = $r14, 32 (0x20)
     _32(0xea380000),        //copyd $r14 = $r0
     _32(0x7b062812),        //srld $r1 = $r18, 32 (0x20);;
     _32(0xfa010042),        //ord $r0 = $r2, $r1
     _32(0x54501396),        //muld $r20 = $r22, $r14;;
     _32(0x7805a014),        //compd.leu $r1 = $r20, $r0;;
     _32(0x08000201),        //cb.dnez $r1? 16ad0 <__udivti3+0x100>;;
     _32(0xf10104c0),        //addd $r0 = $r0, $r19
     _32(0x610cffce),        //addd $r3 = $r14, -1 (0xffffffff);;
     _32(0xf805a013),        //compd.leu $r1 = $r19, $r0
     _32(0x7909a014),        //compd.gtu $r2 = $r20, $r0;;
     _32(0x78051081),        //andw $r1 = $r1, $r2;;
     _32(0x0c004c81),        //cb.wnez $r1? 16f90 <__udivti3+0x5c0>;;
     _32(0x6a380003),        //copyd $r14 = $r3;;
     _32(0xf5510014),        //sbfd $r20 = $r20, $r0
     _32(0xea040017),        //copyd $r1 = $r23
     _64(0x103fffffe848ffd2),        //andd $r18 = $r18, 4294967295 (0xffffffff);;
     _32(0x98000154),        //call 17030 <__umoddi3>
     _32(0x6a000014),        //copyd $r0 = $r20;;
     _32(0xea080000),        //copyd $r2 = $r0
     _32(0xea040017),        //copyd $r1 = $r23
     _32(0x6a000014),        //copyd $r0 = $r20;;
     _32(0x9800012d),        //call 16fa8 <__udivdi3>
     _32(0x6a500002),        //copyd $r20 = $r2;;
     _32(0xf90a2814),        //slld $r2 = $r20, 32 (0x20)
     _32(0x54581016),        //muld $r22 = $r22, $r0;;
     _32(0x7a490482),        //ord $r18 = $r2, $r18;;
     _32(0x7805a496),        //compd.leu $r1 = $r22, $r18;;
     _32(0x08000241),        //cb.dnez $r1? 16b30 <__udivti3+0x160>;;
     _32(0xf1490493),        //addd $r18 = $r19, $r18
     _32(0xe104ffc0),        //addd $r1 = $r0, -1 (0xffffffff)
     _32(0x6100ff80),        //addd $r0 = $r0, -2 (0xfffffffe);;
     _32(0xf959a496),        //compd.gtu $r22 = $r22, $r18
     _32(0x7849a493),        //compd.leu $r18 = $r19, $r18;;
     _32(0x78490496),        //andd $r18 = $r22, $r18;;
     _32(0x78060012),        //cmoved.wnez $r18? $r1 = $r0;;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0xf93a280e),        //slld $r14 = $r14, 32 (0x20)
     _32(0x60580000),        //make $r22 = 0 (0x0);;
     _32(0x7a01000e),        //ord $r0 = $r14, $r0;;
     _32(0xea040016),        //copyd $r1 = $r22
     _32(0x3840160c),        //ld $r16 = 88 (0x58)[$r12];;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0x3c48040c),        //lq $r18r19 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3c54080c),        //lo $r20r21r22r23 = 32 (0x20)[$r12];;
     _32(0x3c60100c),        //lq $r24r25 = 64 (0x40)[$r12];;
     _32(0x8fd00000),        //ret 
     _32(0xe130180c),        //addd $r12 = $r12, 96 (0x60)
     _32(0x3868140c),        //ld $r26 = 80 (0x50)[$r12];;
     _32(0x08802e02),        //cb.deqz $r2? 16e44 <__udivti3+0x474>;;
     _32(0xe0000038),        //make $r0 = 56 (0x38)
     _32(0x60040007),        //make $r1 = 7 (0x7);;
     _32(0xfb0a6013),        //srld $r2 = $r19, $r0
     _32(0x6104ffc1),        //addd $r1 = $r1, -1 (0xffffffff);;
     _32(0x680c3fc2),        //andd $r3 = $r2, 255 (0xff);;
     _32(0x08000103),        //cb.dnez $r3? 16b8c <__udivti3+0x1bc>;;
     _32(0x887fff01),        //cb.dnez $r1? 16b70 <__udivti3+0x1a0>
     _32(0x6100fe00),        //addd $r0 = $r0, -8 (0xfffffff8);;
     _32(0x6a080013),        //copyd $r2 = $r19;;
     _96(0x00000000800000a6f0040100),        //pcrel $r1 = 169988 (0x29804);;
     _64(0x18000000b8040401),        //ld $r1 = 16 (0x10)[$r1];;
     _32(0x2006e081),        //lbz $r1 = $r2[$r1];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x65041000),        //sbfd $r1 = $r0, 64 (0x40);;
     _32(0x08002c01),        //cb.dnez $r1? 16e6c <__udivti3+0x49c>;;
     _32(0xf5390393),        //sbfd $r14 = $r19, $r14
     _32(0xfb5e2813),        //srld $r23 = $r19, 32 (0x20)
     _32(0xe0580001),        //make $r22 = 1 (0x1)
     _64(0x183fffffe854ffd3),        //andd $r21 = $r19, 4294967295 (0xffffffff);;
     _32(0x9800011b),        //call 17030 <__umoddi3>
     _32(0xea040017),        //copyd $r1 = $r23
     _32(0x6a00000e),        //copyd $r0 = $r14;;
     _32(0xea080000),        //copyd $r2 = $r0
     _32(0xea040017),        //copyd $r1 = $r23
     _32(0x6a00000e),        //copyd $r0 = $r14;;
     _32(0x980000f3),        //call 16fa8 <__udivdi3>
     _32(0x6a380002),        //copyd $r14 = $r2;;
     _32(0xf90a280e),        //slld $r2 = $r14, 32 (0x20)
     _32(0xea380000),        //copyd $r14 = $r0
     _32(0x7b062812),        //srld $r1 = $r18, 32 (0x20);;
     _32(0xfa010042),        //ord $r0 = $r2, $r1
     _32(0x5450154e),        //muld $r20 = $r14, $r21;;
     _32(0x7805a014),        //compd.leu $r1 = $r20, $r0;;
     _32(0x08000201),        //cb.dnez $r1? 16c1c <__udivti3+0x24c>;;
     _32(0xf10104c0),        //addd $r0 = $r0, $r19
     _32(0x610cffce),        //addd $r3 = $r14, -1 (0xffffffff);;
     _32(0xf805a013),        //compd.leu $r1 = $r19, $r0
     _32(0x7909a014),        //compd.gtu $r2 = $r20, $r0;;
     _32(0x78051081),        //andw $r1 = $r1, $r2;;
     _32(0x0c003881),        //cb.wnez $r1? 16f9c <__udivti3+0x5cc>;;
     _32(0x6a380003),        //copyd $r14 = $r3;;
     _32(0xf5510014),        //sbfd $r20 = $r20, $r0
     _32(0xea040017),        //copyd $r1 = $r23
     _64(0x103fffffe848ffd2),        //andd $r18 = $r18, 4294967295 (0xffffffff);;
     _32(0x98000101),        //call 17030 <__umoddi3>
     _32(0x6a000014),        //copyd $r0 = $r20;;
     _32(0xea080000),        //copyd $r2 = $r0
     _32(0xea040017),        //copyd $r1 = $r23
     _32(0x6a000014),        //copyd $r0 = $r20;;
     _32(0x980000da),        //call 16fa8 <__udivdi3>
     _32(0x6a500002),        //copyd $r20 = $r2;;
     _32(0xf90a2814),        //slld $r2 = $r20, 32 (0x20)
     _32(0x54541540),        //muld $r21 = $r0, $r21;;
     _32(0x7a490482),        //ord $r18 = $r2, $r18;;
     _32(0x7805a495),        //compd.leu $r1 = $r21, $r18;;
     _32(0x08000241),        //cb.dnez $r1? 16c7c <__udivti3+0x2ac>;;
     _32(0xf1490493),        //addd $r18 = $r19, $r18
     _32(0xe104ffc0),        //addd $r1 = $r0, -1 (0xffffffff)
     _32(0x6100ff80),        //addd $r0 = $r0, -2 (0xfffffffe);;
     _32(0xf955a495),        //compd.gtu $r21 = $r21, $r18
     _32(0x784da493),        //compd.leu $r19 = $r19, $r18;;
     _32(0x784d04d5),        //andd $r19 = $r21, $r19;;
     _32(0x78060013),        //cmoved.wnez $r19? $r1 = $r0;;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x793a280e),        //slld $r14 = $r14, 32 (0x20);;
     _32(0x97ffffaf),        //goto 16b3c <__udivti3+0x16c>
     _32(0x7a01000e),        //ord $r0 = $r14, $r0;;
     _32(0xf905a043),        //compd.gtu $r1 = $r3, $r1
     _32(0xe0580000),        //make $r22 = 0 (0x0)
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x087fea81),        //cb.dnez $r1? 16b3c <__udivti3+0x16c>;;
     _32(0xe0000038),        //make $r0 = 56 (0x38)
     _32(0x60040007),        //make $r1 = 7 (0x7);;
     _32(0xfb126003),        //srld $r4 = $r3, $r0
     _32(0x6104ffc1),        //addd $r1 = $r1, -1 (0xffffffff);;
     _32(0x68143fc4),        //andd $r5 = $r4, 255 (0xff);;
     _32(0x08000105),        //cb.dnez $r5? 16cbc <__udivti3+0x2ec>;;
     _32(0x887fff01),        //cb.dnez $r1? 16ca0 <__udivti3+0x2d0>
     _32(0x6100fe00),        //addd $r0 = $r0, -8 (0xfffffff8);;
     _32(0x6a100003),        //copyd $r4 = $r3;;
     _96(0x00000000800000a5f004b500),        //pcrel $r1 = 169684 (0x296d4);;
     _64(0x18000000b8040401),        //ld $r1 = 16 (0x10)[$r1];;
     _32(0x204ee101),        //lbz $r19 = $r4[$r1];;
     _32(0x71010013),        //addd $r0 = $r19, $r0;;
     _32(0x65481000),        //sbfd $r18 = $r0, 64 (0x40);;
     _32(0x088017d2),        //cb.deqz $r18? 16e58 <__udivti3+0x488>;;
     _32(0xf90e6483),        //slld $r3 = $r3, $r18
     _32(0xfb626002),        //srld $r24 = $r2, $r0
     _32(0xfb6a600e),        //srld $r26 = $r14, $r0
     _32(0x793a648e),        //slld $r14 = $r14, $r18;;
     _32(0xfa6100d8),        //ord $r24 = $r24, $r3
     _32(0xfb026014),        //srld $r0 = $r20, $r0
     _32(0xf858ffd2),        //zxwd $r22 = $r18
     _32(0x794a6482),        //slld $r18 = $r2, $r18;;
     _32(0xfb662818),        //srld $r25 = $r24, 32 (0x20)
     _32(0xfa4d0380),        //ord $r19 = $r0, $r14
     _32(0xea00001a),        //copyd $r0 = $r26
     _64(0x183fffffe85cffd8),        //andd $r23 = $r24, 4294967295 (0xffffffff);;
     _32(0x980000c7),        //call 17030 <__umoddi3>
     _32(0x6a040019),        //copyd $r1 = $r25;;
     _32(0x980000a3),        //call 16fa8 <__udivdi3>
     _32(0xea540000),        //copyd $r21 = $r0
     _32(0xea040019),        //copyd $r1 = $r25
     _32(0x6a00001a),        //copyd $r0 = $r26;;
     _32(0xea380000),        //copyd $r14 = $r0
     _32(0xfb062813),        //srld $r1 = $r19, 32 (0x20)
     _32(0x79022815),        //slld $r0 = $r21, 32 (0x20);;
     _32(0xfa010040),        //ord $r0 = $r0, $r1
     _32(0x54541397),        //muld $r21 = $r23, $r14;;
     _32(0x7805a015),        //compd.leu $r1 = $r21, $r0;;
     _32(0x08000201),        //cb.dnez $r1? 16d64 <__udivti3+0x394>;;
     _32(0xf1010600),        //addd $r0 = $r0, $r24
     _32(0x610cffce),        //addd $r3 = $r14, -1 (0xffffffff);;
     _32(0xf905a015),        //compd.gtu $r1 = $r21, $r0
     _32(0x7809a018),        //compd.leu $r2 = $r24, $r0;;
     _32(0x78051081),        //andw $r1 = $r1, $r2;;
     _32(0x0c002041),        //cb.wnez $r1? 16f60 <__udivti3+0x590>;;
     _32(0x6a380003),        //copyd $r14 = $r3;;
     _32(0xf5550015),        //sbfd $r21 = $r21, $r0
     _32(0xea040019),        //copyd $r1 = $r25
     _64(0x103fffffe84cffd3),        //andd $r19 = $r19, 4294967295 (0xffffffff);;
     _32(0x980000af),        //call 17030 <__umoddi3>
     _32(0x6a000015),        //copyd $r0 = $r21;;
     _32(0xea080000),        //copyd $r2 = $r0
     _32(0xea040019),        //copyd $r1 = $r25
     _32(0x6a000015),        //copyd $r0 = $r21;;
     _32(0x98000088),        //call 16fa8 <__udivdi3>
     _32(0x6a540002),        //copyd $r21 = $r2;;
     _32(0xf90a2815),        //slld $r2 = $r21, 32 (0x20)
     _32(0x545c1017),        //muld $r23 = $r23, $r0;;
     _32(0x7a4d04c2),        //ord $r19 = $r2, $r19;;
     _32(0x7805a4d7),        //compd.leu $r1 = $r23, $r19;;
     _32(0x08000201),        //cb.dnez $r1? 16dc0 <__udivti3+0x3f0>;;
     _32(0xf14d0613),        //addd $r19 = $r19, $r24
     _32(0x610cffc0),        //addd $r3 = $r0, -1 (0xffffffff);;
     _32(0xf805a4d8),        //compd.leu $r1 = $r24, $r19
     _32(0x7909a4d7),        //compd.gtu $r2 = $r23, $r19;;
     _32(0x78051081),        //andw $r1 = $r1, $r2;;
     _32(0x0c001b41),        //cb.wnez $r1? 16f6c <__udivti3+0x59c>;;
     _32(0x6a000003),        //copyd $r0 = $r3;;
     _32(0xf93a280e),        //slld $r14 = $r14, 32 (0x20)
     _32(0xf818ffc0),        //zxwd $r6 = $r0
     _32(0xfb0a2812),        //srld $r2 = $r18, 32 (0x20)
     _64(0x183fffffe80cffd2),        //andd $r3 = $r18, 4294967295 (0xffffffff);;
     _32(0xfa39000e),        //ord $r14 = $r14, $r0
     _32(0xf54d04d7),        //sbfd $r19 = $r23, $r19
     _32(0x541410c6),        //muld $r5 = $r6, $r3;;
     _32(0x7b06280e),        //srld $r1 = $r14, 32 (0x20);;
     _32(0xfb122805),        //srld $r4 = $r5, 32 (0x20)
     _32(0x540c10c1),        //muld $r3 = $r1, $r3;;
     _32(0x54041081),        //muld $r1 = $r1, $r2;;
     _32(0x6a000003),        //copyd $r0 = $r3;;
     _64(0xd0000086e1180001),        //addd $r6 = $r1, 4294967296 (0x100000000)
     _32(0x00400000),        //maddd $r0 = $r6, $r2;;
     _32(0x71090004),        //addd $r2 = $r4, $r0;;
     _32(0xf80da083),        //compd.leu $r3 = $r3, $r2
     _32(0x7b022802),        //srld $r0 = $r2, 32 (0x20);;
     _32(0x71060183),        //cmoved.deqz $r3? $r1 = $r6;;
     _32(0x71050040),        //addd $r1 = $r0, $r1;;
     _32(0x7601a053),        //compd.ltu $r0 = $r19, $r1;;
     _32(0x08000200),        //cb.dnez $r0? 16e38 <__udivti3+0x468>;;
     _32(0xf90a2802),        //slld $r2 = $r2, 32 (0x20)
     _32(0xf9026594),        //slld $r0 = $r20, $r22
     _32(0x714da053),        //compd.eq $r19 = $r19, $r1;;
     _32(0x7a094085),        //adduwd $r2 = $r5, $r2;;
     _32(0x7601a080),        //compd.ltu $r0 = $r0, $r2;;
     _32(0x780114c0),        //andw $r0 = $r0, $r19;;
     _32(0x0c801200),        //cb.weqz $r0? 16f54 <__udivti3+0x584>;;
     _32(0x97ffff41),        //goto 16b3c <__udivti3+0x16c>
     _32(0xe100ffce),        //addd $r0 = $r14, -1 (0xffffffff)
     _32(0x60580000),        //make $r22 = 0 (0x0);;
     _32(0x98000059),        //call 16fa8 <__udivdi3>
     _32(0xe0040000),        //make $r1 = 0 (0x0)
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x97ffff46),        //goto 16b68 <__udivti3+0x198>
     _32(0x6a4c0000),        //copyd $r19 = $r0;;
     _32(0xf60da383),        //compd.ltu $r3 = $r3, $r14
     _32(0xf801a502),        //compd.leu $r0 = $r2, $r20
     _32(0x60580000),        //make $r22 = 0 (0x0);;
     _32(0x97ffff36),        //goto 16b3c <__udivti3+0x16c>
     _32(0x7a010003),        //ord $r0 = $r3, $r0;;
     _32(0xf94e6053),        //slld $r19 = $r19, $r1
     _32(0xfb5a600e),        //srld $r22 = $r14, $r0
     _32(0xfb026014),        //srld $r0 = $r20, $r0
     _32(0x793a604e),        //slld $r14 = $r14, $r1;;
     _32(0xfb5e2813),        //srld $r23 = $r19, 32 (0x20)
     _32(0xf94a6054),        //slld $r18 = $r20, $r1
     _32(0xfa610380),        //ord $r24 = $r0, $r14
     _32(0x6a000016),        //copyd $r0 = $r22;;
     _32(0x98000069),        //call 17030 <__umoddi3>
     _32(0x6a040017),        //copyd $r1 = $r23;;
     _32(0x98000045),        //call 16fa8 <__udivdi3>
     _32(0xea500000),        //copyd $r20 = $r0
     _32(0xea040017),        //copyd $r1 = $r23
     _32(0x6a000016),        //copyd $r0 = $r22;;
     _32(0xf90a2814),        //slld $r2 = $r20, 32 (0x20)
     _32(0xea500000),        //copyd $r20 = $r0
     _32(0xfb062818),        //srld $r1 = $r24, 32 (0x20)
     _64(0x183fffffe854ffd3),        //andd $r21 = $r19, 4294967295 (0xffffffff);;
     _32(0xfa010042),        //ord $r0 = $r2, $r1
     _32(0x54581515),        //muld $r22 = $r21, $r20;;
     _32(0x7805a016),        //compd.leu $r1 = $r22, $r0;;
     _32(0x08000201),        //cb.dnez $r1? 16ee4 <__udivti3+0x514>;;
     _32(0xf10104c0),        //addd $r0 = $r0, $r19
     _32(0x610cffd4),        //addd $r3 = $r20, -1 (0xffffffff);;
     _32(0xf805a013),        //compd.leu $r1 = $r19, $r0
     _32(0x7909a016),        //compd.gtu $r2 = $r22, $r0;;
     _32(0x78051081),        //andw $r1 = $r1, $r2;;
     _32(0x0c0009c1),        //cb.wnez $r1? 16f78 <__udivti3+0x5a8>;;
     _32(0x6a500003),        //copyd $r20 = $r3;;
     _32(0xf5590016),        //sbfd $r22 = $r22, $r0
     _32(0xea040017),        //copyd $r1 = $r23
     _64(0x103fffffe860ffd8),        //andd $r24 = $r24, 4294967295 (0xffffffff);;
     _32(0x9800004f),        //call 17030 <__umoddi3>
     _32(0x6a000016),        //copyd $r0 = $r22;;
     _32(0x9800002b),        //call 16fa8 <__udivdi3>
     _32(0xea380000),        //copyd $r14 = $r0
     _32(0xea040017),        //copyd $r1 = $r23
     _32(0x6a000016),        //copyd $r0 = $r22;;
     _32(0xf93a280e),        //slld $r14 = $r14, 32 (0x20)
     _32(0x54041015),        //muld $r1 = $r21, $r0;;
     _32(0x7a39060e),        //ord $r14 = $r14, $r24;;
     _32(0x7809a381),        //compd.leu $r2 = $r1, $r14;;
     _32(0x08000202),        //cb.dnez $r2? 16f3c <__udivti3+0x56c>;;
     _32(0xf13904ce),        //addd $r14 = $r14, $r19
     _32(0x6110ffc0),        //addd $r4 = $r0, -1 (0xffffffff);;
     _32(0xf809a393),        //compd.leu $r2 = $r19, $r14
     _32(0x790da381),        //compd.gtu $r3 = $r1, $r14;;
     _32(0x780910c2),        //andw $r2 = $r2, $r3;;
     _32(0x0c000502),        //cb.wnez $r2? 16f84 <__udivti3+0x5b4>;;
     _32(0x6a000004),        //copyd $r0 = $r4;;
     _32(0xf9522814),        //slld $r20 = $r20, 32 (0x20)
     _32(0x75390381),        //sbfd $r14 = $r1, $r14;;
     _32(0x97ffff20),        //goto 16bc4 <__udivti3+0x1f4>
     _32(0x7a590014),        //ord $r22 = $r20, $r0;;
     _32(0x97fffebb),        //goto 16a38 <__udivti3+0x68>
     _32(0x65041001),        //sbfd $r1 = $r1, 64 (0x40);;
     _32(0x97fffefa),        //goto 16b3c <__udivti3+0x16c>
     _32(0xea00000e),        //copyd $r0 = $r14
     _32(0x60580000),        //make $r22 = 0 (0x0);;
     _32(0x97ffff81),        //goto 16d64 <__udivti3+0x394>
     _32(0xe138ff8e),        //addd $r14 = $r14, -2 (0xfffffffe)
     _32(0x71010600),        //addd $r0 = $r0, $r24;;
     _32(0x97ffff95),        //goto 16dc0 <__udivti3+0x3f0>
     _32(0xe100ff80),        //addd $r0 = $r0, -2 (0xfffffffe)
     _32(0x714d0613),        //addd $r19 = $r19, $r24;;
     _32(0x97ffffdb),        //goto 16ee4 <__udivti3+0x514>
     _32(0xe150ff94),        //addd $r20 = $r20, -2 (0xfffffffe)
     _32(0x710104c0),        //addd $r0 = $r0, $r19;;
     _32(0x97ffffee),        //goto 16f3c <__udivti3+0x56c>
     _32(0xe100ff80),        //addd $r0 = $r0, -2 (0xfffffffe)
     _32(0x713904ce),        //addd $r14 = $r14, $r19;;
     _32(0x97fffed0),        //goto 16ad0 <__udivti3+0x100>
     _32(0xe138ff8e),        //addd $r14 = $r14, -2 (0xfffffffe)
     _32(0x710104c0),        //addd $r0 = $r0, $r19;;
     _32(0x97ffff20),        //goto 16c1c <__udivti3+0x24c>
     _32(0xe138ff8e),        //addd $r14 = $r14, -2 (0xfffffffe)
     _32(0x710104c0)        //addd $r0 = $r0, $r19;;
 |];

let __udivdi3: list_I = 
 [|
     _32(0x88800641),        //cb.deqz $r1? 1700c <__udivdi3+0x64>
     _32(0x760da040),        //compd.ltu $r3 = $r0, $r1;;
     _32(0xea080000),        //copyd $r2 = $r0
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x08000503),        //cb.dnez $r3? 17008 <__udivdi3+0x60>;;
     _32(0xf00e2001),        //clzd $r3 = $r1
     _32(0x70122002),        //clzd $r4 = $r2;;
     _32(0x751110c4),        //sbfw $r4 = $r4, $r3;;
     _32(0x79066101),        //slld $r1 = $r1, $r4;;
     _32(0x760da042),        //compd.ltu $r3 = $r2, $r1;;
     _32(0x08000103),        //cb.dnez $r3? 16fe0 <__udivdi3+0x38>;;
     _32(0xe0000001),        //make $r0 = 1 (0x1)
     _32(0x75090081),        //sbfd $r2 = $r1, $r2;;
     _32(0x79026100),        //slld $r0 = $r0, $r4;;
     _32(0x0e000284),        //cb.wlez $r4? 17008 <__udivdi3+0x60>;;
     _32(0xe0140001),        //make $r5 = 1 (0x1)
     _32(0xfa0c0004),        //copyw $r3 = $r4
     _32(0x7b062041),        //srld $r1 = $r1, 1 (0x1);;
     _32(0x79126105),        //slld $r4 = $r5, $r4;;
     _32(0x6110ffc4),        //addd $r4 = $r4, -1 (0xffffffff);;
     _32(0x0f000083),        //loopdo $r3, 17000 <__udivdi3+0x58>;;
     _32(0x70090081),        //stsud $r2 = $r1, $r2;;
     _32(0x78090084),        //andd $r2 = $r4, $r2;;
     _32(0x71010080),        //addd $r0 = $r0, $r2;;
     _32(0x0fd00000),        //ret ;;
     _96(0x800000a4e0000000f004e100),        //pcrel $r1 = 168836 (0x29384)
     _32(0x00000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000b8040201),        //ld $r1 = 8 (0x8)[$r1];;
     _32(0x087ffe41),        //cb.dnez $r1? 17008 <__udivdi3+0x60>;;
     _32(0x00000000),        //errop ;;
     _32(0x7f03f000)        //nop ;;
 |];

let __umoddi3: list_I = 
 [|
     _32(0x888004c1),        //cb.deqz $r1? 1707c <__umoddi3+0x4c>
     _32(0x760da040),        //compd.ltu $r3 = $r0, $r1;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x080003c3),        //cb.dnez $r3? 17078 <__umoddi3+0x48>;;
     _32(0xf0022000),        //clzd $r0 = $r0
     _32(0x700e2001),        //clzd $r3 = $r1;;
     _32(0x750d10c0),        //sbfw $r3 = $r0, $r3;;
     _32(0x790660c1),        //slld $r1 = $r1, $r3;;
     _32(0xf611a042),        //compd.ltu $r4 = $r2, $r1
     _32(0xf5010081),        //sbfd $r0 = $r1, $r2
     _32(0x7b062041),        //srld $r1 = $r1, 1 (0x1);;
     _32(0x710a0004),        //cmoved.deqz $r4? $r2 = $r0;;
     _32(0x8e000183),        //cb.wlez $r3? 17078 <__umoddi3+0x48>
     _32(0x6a000002),        //copyd $r0 = $r2;;
     _32(0x7a000003),        //copyw $r0 = $r3;;
     _32(0x0f000080),        //loopdo $r0, 17074 <__umoddi3+0x44>;;
     _32(0x70090081),        //stsud $r2 = $r1, $r2;;
     _32(0x7b0260c2),        //srld $r0 = $r2, $r3;;
     _32(0x0fd00000),        //ret ;;
     _96(0x800000a4e0000000f004c500),        //pcrel $r1 = 168724 (0x29314)
     _32(0x00000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000b8040201),        //ld $r1 = 8 (0x8)[$r1];;
     _32(0x087ffe41),        //cb.dnez $r1? 17078 <__umoddi3+0x48>;;
     _32(0x00000000),        //errop ;;
     _32(0x7f03f000)        //nop ;;
 |];

let __udivmoddi4: list_I = 
 [|
     _32(0x88800801),        //cb.deqz $r1? 17120 <__udivmoddi4+0x80>
     _32(0xf0162001),        //clzd $r5 = $r1
     _32(0x6a0c0000),        //copyd $r3 = $r0;;
     _32(0xf0122003),        //clzd $r4 = $r3
     _32(0x7601a040),        //compd.ltu $r0 = $r0, $r1;;
     _32(0x75111144),        //sbfw $r4 = $r4, $r5;;
     _32(0x88000580),        //cb.dnez $r0? 17110 <__udivmoddi4+0x70>
     _32(0x79166101),        //slld $r5 = $r1, $r4;;
     _32(0xf605a143),        //compd.ltu $r1 = $r3, $r5
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x08000101),        //cb.dnez $r1? 170d8 <__udivmoddi4+0x38>;;
     _32(0xe0000001),        //make $r0 = 1 (0x1)
     _32(0x750d00c5),        //sbfd $r3 = $r5, $r3;;
     _32(0x79026100),        //slld $r0 = $r0, $r4;;
     _32(0x8e000304),        //cb.wlez $r4? 17108 <__udivmoddi4+0x68>
     _32(0xe0180001),        //make $r6 = 1 (0x1)
     _32(0x6a040003),        //copyd $r1 = $r3;;
     _32(0xf91a6106),        //slld $r6 = $r6, $r4
     _32(0xfb162045),        //srld $r5 = $r5, 1 (0x1)
     _32(0x7a040004),        //copyw $r1 = $r4;;
     _32(0x6118ffc6),        //addd $r6 = $r6, -1 (0xffffffff);;
     _32(0x0f000081),        //loopdo $r1, 170fc <__udivmoddi4+0x5c>;;
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
     _96(0x800000a4e0000000f00c9c00),        //pcrel $r3 = 168560 (0x29270)
     _32(0x00000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000b80c0203),        //ld $r3 = 8 (0x8)[$r3];;
     _32(0x087ffd03),        //cb.dnez $r3? 17108 <__udivmoddi4+0x68>;;
     _32(0x00000000)        //errop ;;
 |];

let __divdi3: list_I = 
 [|
     _32(0x88800781),        //cb.deqz $r1? 171b8 <__divdi3+0x78>
     _32(0xe40c0000),        //absd $r3 = $r0
     _32(0xe4100001),        //absd $r4 = $r1
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0xf01a2003),        //clzd $r6 = $r3
     _32(0xf615a103),        //compd.ltu $r5 = $r3, $r4
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x080004c5),        //cb.dnez $r5? 171a8 <__divdi3+0x68>;;
     _32(0x70162004),        //clzd $r5 = $r4;;
     _32(0x75191146),        //sbfw $r6 = $r6, $r5;;
     _32(0x79126184),        //slld $r4 = $r4, $r6;;
     _32(0x7615a103),        //compd.ltu $r5 = $r3, $r4;;
     _32(0x08000105),        //cb.dnez $r5? 17180 <__divdi3+0x40>;;
     _32(0xe0000001),        //make $r0 = 1 (0x1)
     _32(0x750d00c4),        //sbfd $r3 = $r4, $r3;;
     _32(0x79026180),        //slld $r0 = $r0, $r6;;
     _32(0x0e000286),        //cb.wlez $r6? 171a8 <__divdi3+0x68>;;
     _32(0xe01c0001),        //make $r7 = 1 (0x1)
     _32(0xfa140006),        //copyw $r5 = $r6
     _32(0x7b122044),        //srld $r4 = $r4, 1 (0x1);;
     _32(0x791a6187),        //slld $r6 = $r7, $r6;;
     _32(0x6118ffc6),        //addd $r6 = $r6, -1 (0xffffffff);;
     _32(0x0f000085),        //loopdo $r5, 171a0 <__divdi3+0x60>;;
     _32(0x700d00c4),        //stsud $r3 = $r4, $r3;;
     _32(0x780d00c6),        //andd $r3 = $r6, $r3;;
     _32(0x710100c0),        //addd $r0 = $r0, $r3;;
     _32(0xfc090042),        //xord $r2 = $r2, $r1
     _32(0x65040000),        //negd $r1 = $r0;;
     _32(0x8fd00000),        //ret 
     _32(0x72020042),        //cmoved.dltz $r2? $r0 = $r1;;
     _96(0x800000a4e0000000f00c7600),        //pcrel $r3 = 168408 (0x291d8)
     _32(0x00000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000b80c0203),        //ld $r3 = 8 (0x8)[$r3];;
     _32(0x087ffd83),        //cb.dnez $r3? 171a8 <__divdi3+0x68>;;
     _32(0x00000000)        //errop ;;
 |];

let __moddi3: list_I = 
 [|
     _32(0x88800581),        //cb.deqz $r1? 17230 <__moddi3+0x58>
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0xe4000000),        //absd $r0 = $r0
     _32(0x64040001),        //absd $r1 = $r1;;
     _32(0xf0122001),        //clzd $r4 = $r1
     _32(0x760da040),        //compd.ltu $r3 = $r0, $r1;;
     _32(0x08000343),        //cb.dnez $r3? 17224 <__moddi3+0x4c>;;
     _32(0x700e2000),        //clzd $r3 = $r0;;
     _32(0x75111103),        //sbfw $r4 = $r3, $r4;;
     _32(0x79066101),        //slld $r1 = $r1, $r4;;
     _32(0xf615a040),        //compd.ltu $r5 = $r0, $r1
     _32(0xf50d0001),        //sbfd $r3 = $r1, $r0
     _32(0x7b062041),        //srld $r1 = $r1, 1 (0x1);;
     _32(0x8e000184),        //cb.wlez $r4? 17224 <__moddi3+0x4c>
     _32(0x710200c5),        //cmoved.deqz $r5? $r0 = $r3;;
     _32(0x7a0c0004),        //copyw $r3 = $r4;;
     _32(0x0f000083),        //loopdo $r3, 17220 <__moddi3+0x48>;;
     _32(0x70010001),        //stsud $r0 = $r1, $r0;;
     _32(0x7b026100),        //srld $r0 = $r0, $r4;;
     _32(0x65040000),        //negd $r1 = $r0;;
     _32(0x8fd00000),        //ret 
     _32(0x72020042),        //cmoved.dltz $r2? $r0 = $r1;;
     _96(0x800000a4e0000000f0045800),        //pcrel $r1 = 168288 (0x29160)
     _32(0x00000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000b8040201),        //ld $r1 = 8 (0x8)[$r1];;
     _32(0x087ffdc1),        //cb.dnez $r1? 17224 <__moddi3+0x4c>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 17628 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 19158 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100110000000; //0x16980
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(store, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100001100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100110000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__udivti3, 0b00010110100111010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__udivdi3, 0b00010110111110101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__umoddi3, 0b00010111000000110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__udivmoddi4, 0b00010111000010100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__divdi3, 0b00010111000101000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__moddi3, 0b00010111000111011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010111001001010000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016980;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
