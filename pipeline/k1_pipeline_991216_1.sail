// executing pipeline 991216_1 test 
val k1_pipeline_991216_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_991216_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let test1: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x2609020c),        //sw 8 (0x8)[$r12] = $r2;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c0002c0),        //cb.wnez $r0? 16870 <test1+0x50>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _96(0x00091a2b81e26af3e0047bc0),        //make $r1 = 81985529216486895 (0x123456789abcdef);;
     _32(0x7001a040),        //compd.ne $r0 = $r0, $r1;;
     _32(0x08000140),        //cb.dnez $r0? 16870 <test1+0x50>;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _64(0x00000002f101b540),        //compw.eq $r0 = $r0, 85 (0x55);;
     _32(0x0c000080),        //cb.wnez $r0? 16874 <test1+0x54>;;
     _32(0x1800019e),        //call 16ee8 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let test2: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x26050c0c),        //sw 48 (0x30)[$r12] = $r1;;
     _32(0x27090a0c),        //sd 40 (0x28)[$r12] = $r2;;
     _32(0x260d080c),        //sw 32 (0x20)[$r12] = $r3;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c0003c0),        //cb.wnez $r0? 168ec <test2+0x64>;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _64(0x00000000f001b080),        //compw.ne $r0 = $r0, 2 (0x2);;
     _32(0x0c0002c0),        //cb.wnez $r0? 168ec <test2+0x64>;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _96(0x00091a2b81e26af3e0047bc0),        //make $r1 = 81985529216486895 (0x123456789abcdef);;
     _32(0x7001a040),        //compd.ne $r0 = $r0, $r1;;
     _32(0x08000140),        //cb.dnez $r0? 168ec <test2+0x64>;;
     _32(0x3000080c),        //lwz $r0 = 32 (0x20)[$r12];;
     _64(0x00000002f101b540),        //compw.eq $r0 = $r0, 85 (0x55);;
     _32(0x0c000080),        //cb.wnez $r0? 168f0 <test2+0x68>;;
     _32(0x1800017f),        //call 16ee8 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test3: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x26050c0c),        //sw 48 (0x30)[$r12] = $r1;;
     _32(0x26090a0c),        //sw 40 (0x28)[$r12] = $r2;;
     _32(0x270d080c),        //sd 32 (0x20)[$r12] = $r3;;
     _32(0x2611060c),        //sw 24 (0x18)[$r12] = $r4;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c0004c0),        //cb.wnez $r0? 16980 <test3+0x78>;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _64(0x00000000f001b080),        //compw.ne $r0 = $r0, 2 (0x2);;
     _32(0x0c0003c0),        //cb.wnez $r0? 16980 <test3+0x78>;;
     _32(0x30000a0c),        //lwz $r0 = 40 (0x28)[$r12];;
     _64(0x00000000f001b0c0),        //compw.ne $r0 = $r0, 3 (0x3);;
     _32(0x0c0002c0),        //cb.wnez $r0? 16980 <test3+0x78>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _96(0x00091a2b81e26af3e0047bc0),        //make $r1 = 81985529216486895 (0x123456789abcdef);;
     _32(0x7001a040),        //compd.ne $r0 = $r0, $r1;;
     _32(0x08000140),        //cb.dnez $r0? 16980 <test3+0x78>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000002f101b540),        //compw.eq $r0 = $r0, 85 (0x55);;
     _32(0x0c000080),        //cb.wnez $r0? 16984 <test3+0x7c>;;
     _32(0x1800015a),        //call 16ee8 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let test4: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x26050c0c),        //sw 48 (0x30)[$r12] = $r1;;
     _32(0x26090a0c),        //sw 40 (0x28)[$r12] = $r2;;
     _32(0x260d080c),        //sw 32 (0x20)[$r12] = $r3;;
     _32(0x2711060c),        //sd 24 (0x18)[$r12] = $r4;;
     _32(0x2615040c),        //sw 16 (0x10)[$r12] = $r5;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c0005c0),        //cb.wnez $r0? 16a24 <test4+0x8c>;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _64(0x00000000f001b080),        //compw.ne $r0 = $r0, 2 (0x2);;
     _32(0x0c0004c0),        //cb.wnez $r0? 16a24 <test4+0x8c>;;
     _32(0x30000a0c),        //lwz $r0 = 40 (0x28)[$r12];;
     _64(0x00000000f001b0c0),        //compw.ne $r0 = $r0, 3 (0x3);;
     _32(0x0c0003c0),        //cb.wnez $r0? 16a24 <test4+0x8c>;;
     _32(0x3000080c),        //lwz $r0 = 32 (0x20)[$r12];;
     _64(0x00000000f001b100),        //compw.ne $r0 = $r0, 4 (0x4);;
     _32(0x0c0002c0),        //cb.wnez $r0? 16a24 <test4+0x8c>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _96(0x00091a2b81e26af3e0047bc0),        //make $r1 = 81985529216486895 (0x123456789abcdef);;
     _32(0x7001a040),        //compd.ne $r0 = $r0, $r1;;
     _32(0x08000140),        //cb.dnez $r0? 16a24 <test4+0x8c>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _64(0x00000002f101b540),        //compw.eq $r0 = $r0, 85 (0x55);;
     _32(0x0c000080),        //cb.wnez $r0? 16a28 <test4+0x90>;;
     _32(0x18000131),        //call 16ee8 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test5: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x26050c0c),        //sw 48 (0x30)[$r12] = $r1;;
     _32(0x26090a0c),        //sw 40 (0x28)[$r12] = $r2;;
     _32(0x260d080c),        //sw 32 (0x20)[$r12] = $r3;;
     _32(0x2611060c),        //sw 24 (0x18)[$r12] = $r4;;
     _32(0x2715040c),        //sd 16 (0x10)[$r12] = $r5;;
     _32(0x2619020c),        //sw 8 (0x8)[$r12] = $r6;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c0006c0),        //cb.wnez $r0? 16ae0 <test5+0xa0>;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _64(0x00000000f001b080),        //compw.ne $r0 = $r0, 2 (0x2);;
     _32(0x0c0005c0),        //cb.wnez $r0? 16ae0 <test5+0xa0>;;
     _32(0x30000a0c),        //lwz $r0 = 40 (0x28)[$r12];;
     _64(0x00000000f001b0c0),        //compw.ne $r0 = $r0, 3 (0x3);;
     _32(0x0c0004c0),        //cb.wnez $r0? 16ae0 <test5+0xa0>;;
     _32(0x3000080c),        //lwz $r0 = 32 (0x20)[$r12];;
     _64(0x00000000f001b100),        //compw.ne $r0 = $r0, 4 (0x4);;
     _32(0x0c0003c0),        //cb.wnez $r0? 16ae0 <test5+0xa0>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f001b140),        //compw.ne $r0 = $r0, 5 (0x5);;
     _32(0x0c0002c0),        //cb.wnez $r0? 16ae0 <test5+0xa0>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _96(0x00091a2b81e26af3e0047bc0),        //make $r1 = 81985529216486895 (0x123456789abcdef);;
     _32(0x7001a040),        //compd.ne $r0 = $r0, $r1;;
     _32(0x08000140),        //cb.dnez $r0? 16ae0 <test5+0xa0>;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _64(0x00000002f101b540),        //compw.eq $r0 = $r0, 85 (0x55);;
     _32(0x0c000080),        //cb.wnez $r0? 16ae4 <test5+0xa4>;;
     _32(0x18000102),        //call 16ee8 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let test6: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x2601160c),        //sw 88 (0x58)[$r12] = $r0;;
     _32(0x2605140c),        //sw 80 (0x50)[$r12] = $r1;;
     _32(0x2609120c),        //sw 72 (0x48)[$r12] = $r2;;
     _32(0x260d100c),        //sw 64 (0x40)[$r12] = $r3;;
     _32(0x26110e0c),        //sw 56 (0x38)[$r12] = $r4;;
     _32(0x26150c0c),        //sw 48 (0x30)[$r12] = $r5;;
     _32(0x27190a0c),        //sd 40 (0x28)[$r12] = $r6;;
     _32(0x261d080c),        //sw 32 (0x20)[$r12] = $r7;;
     _32(0x3000160c),        //lwz $r0 = 88 (0x58)[$r12];;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c0007c0),        //cb.wnez $r0? 16bac <test6+0xb4>;;
     _32(0x3000140c),        //lwz $r0 = 80 (0x50)[$r12];;
     _64(0x00000000f001b080),        //compw.ne $r0 = $r0, 2 (0x2);;
     _32(0x0c0006c0),        //cb.wnez $r0? 16bac <test6+0xb4>;;
     _32(0x3000120c),        //lwz $r0 = 72 (0x48)[$r12];;
     _64(0x00000000f001b0c0),        //compw.ne $r0 = $r0, 3 (0x3);;
     _32(0x0c0005c0),        //cb.wnez $r0? 16bac <test6+0xb4>;;
     _32(0x3000100c),        //lwz $r0 = 64 (0x40)[$r12];;
     _64(0x00000000f001b100),        //compw.ne $r0 = $r0, 4 (0x4);;
     _32(0x0c0004c0),        //cb.wnez $r0? 16bac <test6+0xb4>;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _64(0x00000000f001b140),        //compw.ne $r0 = $r0, 5 (0x5);;
     _32(0x0c0003c0),        //cb.wnez $r0? 16bac <test6+0xb4>;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _64(0x00000000f001b180),        //compw.ne $r0 = $r0, 6 (0x6);;
     _32(0x0c0002c0),        //cb.wnez $r0? 16bac <test6+0xb4>;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _96(0x00091a2b81e26af3e0047bc0),        //make $r1 = 81985529216486895 (0x123456789abcdef);;
     _32(0x7001a040),        //compd.ne $r0 = $r0, $r1;;
     _32(0x08000140),        //cb.dnez $r0? 16bac <test6+0xb4>;;
     _32(0x3000080c),        //lwz $r0 = 32 (0x20)[$r12];;
     _64(0x00000002f101b540),        //compw.eq $r0 = $r0, 85 (0x55);;
     _32(0x0c000080),        //cb.wnez $r0? 16bb0 <test6+0xb8>;;
     _32(0x180000cf),        //call 16ee8 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test7: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2601160c),        //sw 88 (0x58)[$r12] = $r0;;
     _32(0x2605140c),        //sw 80 (0x50)[$r12] = $r1;;
     _32(0x2609120c),        //sw 72 (0x48)[$r12] = $r2;;
     _32(0x260d100c),        //sw 64 (0x40)[$r12] = $r3;;
     _32(0x26110e0c),        //sw 56 (0x38)[$r12] = $r4;;
     _32(0x26150c0c),        //sw 48 (0x30)[$r12] = $r5;;
     _32(0x26190a0c),        //sw 40 (0x28)[$r12] = $r6;;
     _32(0x271d080c),        //sd 32 (0x20)[$r12] = $r7;;
     _32(0x2621060c),        //sw 24 (0x18)[$r12] = $r8;;
     _32(0x3000160c),        //lwz $r0 = 88 (0x58)[$r12];;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c0008c0),        //cb.wnez $r0? 16c90 <test7+0xc8>;;
     _32(0x3000140c),        //lwz $r0 = 80 (0x50)[$r12];;
     _64(0x00000000f001b080),        //compw.ne $r0 = $r0, 2 (0x2);;
     _32(0x0c0007c0),        //cb.wnez $r0? 16c90 <test7+0xc8>;;
     _32(0x3000120c),        //lwz $r0 = 72 (0x48)[$r12];;
     _64(0x00000000f001b0c0),        //compw.ne $r0 = $r0, 3 (0x3);;
     _32(0x0c0006c0),        //cb.wnez $r0? 16c90 <test7+0xc8>;;
     _32(0x3000100c),        //lwz $r0 = 64 (0x40)[$r12];;
     _64(0x00000000f001b100),        //compw.ne $r0 = $r0, 4 (0x4);;
     _32(0x0c0005c0),        //cb.wnez $r0? 16c90 <test7+0xc8>;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _64(0x00000000f001b140),        //compw.ne $r0 = $r0, 5 (0x5);;
     _32(0x0c0004c0),        //cb.wnez $r0? 16c90 <test7+0xc8>;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _64(0x00000000f001b180),        //compw.ne $r0 = $r0, 6 (0x6);;
     _32(0x0c0003c0),        //cb.wnez $r0? 16c90 <test7+0xc8>;;
     _32(0x30000a0c),        //lwz $r0 = 40 (0x28)[$r12];;
     _64(0x00000000f001b1c0),        //compw.ne $r0 = $r0, 7 (0x7);;
     _32(0x0c0002c0),        //cb.wnez $r0? 16c90 <test7+0xc8>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _96(0x00091a2b81e26af3e0047bc0),        //make $r1 = 81985529216486895 (0x123456789abcdef);;
     _32(0x7001a040),        //compd.ne $r0 = $r0, $r1;;
     _32(0x08000140),        //cb.dnez $r0? 16c90 <test7+0xc8>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000002f101b540),        //compw.eq $r0 = $r0, 85 (0x55);;
     _32(0x0c000080),        //cb.wnez $r0? 16c94 <test7+0xcc>;;
     _32(0x18000096),        //call 16ee8 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000)        //ret ;;
 |];

let test8: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2601160c),        //sw 88 (0x58)[$r12] = $r0;;
     _32(0x2605140c),        //sw 80 (0x50)[$r12] = $r1;;
     _32(0x2609120c),        //sw 72 (0x48)[$r12] = $r2;;
     _32(0x260d100c),        //sw 64 (0x40)[$r12] = $r3;;
     _32(0x26110e0c),        //sw 56 (0x38)[$r12] = $r4;;
     _32(0x26150c0c),        //sw 48 (0x30)[$r12] = $r5;;
     _32(0x26190a0c),        //sw 40 (0x28)[$r12] = $r6;;
     _32(0x261d080c),        //sw 32 (0x20)[$r12] = $r7;;
     _32(0x2721060c),        //sd 24 (0x18)[$r12] = $r8;;
     _32(0x2625040c),        //sw 16 (0x10)[$r12] = $r9;;
     _32(0x3000160c),        //lwz $r0 = 88 (0x58)[$r12];;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c0009c0),        //cb.wnez $r0? 16d84 <test8+0xdc>;;
     _32(0x3000140c),        //lwz $r0 = 80 (0x50)[$r12];;
     _64(0x00000000f001b080),        //compw.ne $r0 = $r0, 2 (0x2);;
     _32(0x0c0008c0),        //cb.wnez $r0? 16d84 <test8+0xdc>;;
     _32(0x3000120c),        //lwz $r0 = 72 (0x48)[$r12];;
     _64(0x00000000f001b0c0),        //compw.ne $r0 = $r0, 3 (0x3);;
     _32(0x0c0007c0),        //cb.wnez $r0? 16d84 <test8+0xdc>;;
     _32(0x3000100c),        //lwz $r0 = 64 (0x40)[$r12];;
     _64(0x00000000f001b100),        //compw.ne $r0 = $r0, 4 (0x4);;
     _32(0x0c0006c0),        //cb.wnez $r0? 16d84 <test8+0xdc>;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _64(0x00000000f001b140),        //compw.ne $r0 = $r0, 5 (0x5);;
     _32(0x0c0005c0),        //cb.wnez $r0? 16d84 <test8+0xdc>;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _64(0x00000000f001b180),        //compw.ne $r0 = $r0, 6 (0x6);;
     _32(0x0c0004c0),        //cb.wnez $r0? 16d84 <test8+0xdc>;;
     _32(0x30000a0c),        //lwz $r0 = 40 (0x28)[$r12];;
     _64(0x00000000f001b1c0),        //compw.ne $r0 = $r0, 7 (0x7);;
     _32(0x0c0003c0),        //cb.wnez $r0? 16d84 <test8+0xdc>;;
     _32(0x3000080c),        //lwz $r0 = 32 (0x20)[$r12];;
     _64(0x00000000f001b200),        //compw.ne $r0 = $r0, 8 (0x8);;
     _32(0x0c0002c0),        //cb.wnez $r0? 16d84 <test8+0xdc>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _96(0x00091a2b81e26af3e0047bc0),        //make $r1 = 81985529216486895 (0x123456789abcdef);;
     _32(0x7001a040),        //compd.ne $r0 = $r0, $r1;;
     _32(0x08000140),        //cb.dnez $r0? 16d84 <test8+0xdc>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _64(0x00000002f101b540),        //compw.eq $r0 = $r0, 85 (0x55);;
     _32(0x0c000080),        //cb.wnez $r0? 16d88 <test8+0xe0>;;
     _32(0x18000059),        //call 16ee8 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60080055),        //make $r2 = 85 (0x55);;
     _96(0x00091a2b81e26af3e0047bc0),        //make $r1 = 81985529216486895 (0x123456789abcdef);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1ffffe98),        //call 16820 <test1>;;
     _32(0x600c0055),        //make $r3 = 85 (0x55);;
     _96(0x00091a2b81e26af3e0087bc0),        //make $r2 = 81985529216486895 (0x123456789abcdef);;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1ffffeab),        //call 16888 <test2>;;
     _32(0x60100055),        //make $r4 = 85 (0x55);;
     _96(0x00091a2b81e26af3e00c7bc0),        //make $r3 = 81985529216486895 (0x123456789abcdef);;
     _32(0x60080003),        //make $r2 = 3 (0x3);;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1ffffec3),        //call 16908 <test3>;;
     _32(0x60140055),        //make $r5 = 85 (0x55);;
     _96(0x00091a2b81e26af3e0107bc0),        //make $r4 = 81985529216486895 (0x123456789abcdef);;
     _32(0x600c0004),        //make $r3 = 4 (0x4);;
     _32(0x60080003),        //make $r2 = 3 (0x3);;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1ffffede),        //call 16998 <test4>;;
     _32(0x60180055),        //make $r6 = 85 (0x55);;
     _96(0x00091a2b81e26af3e0147bc0),        //make $r5 = 81985529216486895 (0x123456789abcdef);;
     _32(0x60100005),        //make $r4 = 5 (0x5);;
     _32(0x600c0004),        //make $r3 = 4 (0x4);;
     _32(0x60080003),        //make $r2 = 3 (0x3);;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1ffffefe),        //call 16a40 <test5>;;
     _32(0x601c0055),        //make $r7 = 85 (0x55);;
     _96(0x00091a2b81e26af3e0187bc0),        //make $r6 = 81985529216486895 (0x123456789abcdef);;
     _32(0x60140006),        //make $r5 = 6 (0x6);;
     _32(0x60100005),        //make $r4 = 5 (0x5);;
     _32(0x600c0004),        //make $r3 = 4 (0x4);;
     _32(0x60080003),        //make $r2 = 3 (0x3);;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffff21),        //call 16af8 <test6>;;
     _32(0x60200055),        //make $r8 = 85 (0x55);;
     _96(0x00091a2b81e26af3e01c7bc0),        //make $r7 = 81985529216486895 (0x123456789abcdef);;
     _32(0x60180007),        //make $r6 = 7 (0x7);;
     _32(0x60140006),        //make $r5 = 6 (0x6);;
     _32(0x60100005),        //make $r4 = 5 (0x5);;
     _32(0x600c0004),        //make $r3 = 4 (0x4);;
     _32(0x60080003),        //make $r2 = 3 (0x3);;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffff49),        //call 16bc8 <test7>;;
     _32(0x60240055),        //make $r9 = 85 (0x55);;
     _96(0x00091a2b81e26af3e0207bc0),        //make $r8 = 81985529216486895 (0x123456789abcdef);;
     _32(0x601c0008),        //make $r7 = 8 (0x8);;
     _32(0x60180007),        //make $r6 = 7 (0x7);;
     _32(0x60140006),        //make $r5 = 6 (0x6);;
     _32(0x60100005),        //make $r4 = 5 (0x5);;
     _32(0x600c0004),        //make $r3 = 4 (0x4);;
     _32(0x60080003),        //make $r2 = 3 (0x3);;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffff74),        //call 16ca8 <test8>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 16f08 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 17308 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18fe0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
 |];

let adr_start:bits(addr_bits) = 0b00010110110110100000; //0x16da0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test1, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test2, 0b00010110100010001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test3, 0b00010110100100001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test4, 0b00010110100110011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test5, 0b00010110101001000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test6, 0b00010110101011111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test7, 0b00010110101111001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test8, 0b00010110110010101000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110110110100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110111011101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110111100001000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016da0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
