// executing 20091229_1 test 
val k1_20091229_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20091229_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x00200000e0040000),        //make $r1 = 2147483648 (0x80000000);;
     _32(0x1800007b),        //call 16a28 <__divdi3>;;
     _32(0x65000000),        //negd $r0 = $r0;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _64(0x00200000e0000000),        //make $r0 = 2147483648 (0x80000000);;
     _32(0x1fffffeb),        //call 16820 <foo>;;
     _32(0x6101ffc0),        //compd.eq $r0 = $r0, -1 (0xffffffff);;
     _32(0x08000080),        //cb.dnez $r0? 16884 <main+0x2c>;;
     _32(0x180000ae),        //call 16b38 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x180000b4),        //call 16b58 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let __udivdi3: list_I = 
 [|
     _32(0x88800641),        //cb.deqz $r1? 168f4 <__udivdi3+0x64>
     _32(0x760da040),        //compd.ltu $r3 = $r0, $r1;;
     _32(0xea080000),        //copyd $r2 = $r0
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x08000503),        //cb.dnez $r3? 168f0 <__udivdi3+0x60>;;
     _32(0xf00e2001),        //clzd $r3 = $r1
     _32(0x70122002),        //clzd $r4 = $r2;;
     _32(0x751110c4),        //sbfw $r4 = $r4, $r3;;
     _32(0x79066101),        //slld $r1 = $r1, $r4;;
     _32(0x760da042),        //compd.ltu $r3 = $r2, $r1;;
     _32(0x08000103),        //cb.dnez $r3? 168c8 <__udivdi3+0x38>;;
     _32(0xe0000001),        //make $r0 = 1 (0x1)
     _32(0x75090081),        //sbfd $r2 = $r1, $r2;;
     _32(0x79026100),        //slld $r0 = $r0, $r4;;
     _32(0x0e000284),        //cb.wlez $r4? 168f0 <__udivdi3+0x60>;;
     _32(0xe0140001),        //make $r5 = 1 (0x1)
     _32(0xfa0c0004),        //copyw $r3 = $r4
     _32(0x7b062041),        //srld $r1 = $r1, 1 (0x1);;
     _32(0x79126105),        //slld $r4 = $r5, $r4;;
     _32(0x6110ffc4),        //addd $r4 = $r4, -1 (0xffffffff);;
     _32(0x0f000083),        //loopdo $r3, 168e8 <__udivdi3+0x58>;;
     _32(0x70090081),        //stsud $r2 = $r1, $r2;;
     _32(0x78090084),        //andd $r2 = $r4, $r2;;
     _32(0x71010080),        //addd $r0 = $r0, $r2;;
     _32(0x0fd00000),        //ret ;;
     _96(0x800000a2e0000000f004a700),        //pcrel $r1 = 166556 (0x28a9c)
     _32(0x00000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000b8040201),        //ld $r1 = 8 (0x8)[$r1];;
     _32(0x087ffe41),        //cb.dnez $r1? 168f0 <__udivdi3+0x60>;;
     _32(0x00000000),        //errop ;;
     _32(0x7f03f000)        //nop ;;
 |];

let __umoddi3: list_I = 
 [|
     _32(0x888004c1),        //cb.deqz $r1? 16964 <__umoddi3+0x4c>
     _32(0x760da040),        //compd.ltu $r3 = $r0, $r1;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x080003c3),        //cb.dnez $r3? 16960 <__umoddi3+0x48>;;
     _32(0xf0022000),        //clzd $r0 = $r0
     _32(0x700e2001),        //clzd $r3 = $r1;;
     _32(0x750d10c0),        //sbfw $r3 = $r0, $r3;;
     _32(0x790660c1),        //slld $r1 = $r1, $r3;;
     _32(0xf611a042),        //compd.ltu $r4 = $r2, $r1
     _32(0xf5010081),        //sbfd $r0 = $r1, $r2
     _32(0x7b062041),        //srld $r1 = $r1, 1 (0x1);;
     _32(0x710a0004),        //cmoved.deqz $r4? $r2 = $r0;;
     _32(0x8e000183),        //cb.wlez $r3? 16960 <__umoddi3+0x48>
     _32(0x6a000002),        //copyd $r0 = $r2;;
     _32(0x7a000003),        //copyw $r0 = $r3;;
     _32(0x0f000080),        //loopdo $r0, 1695c <__umoddi3+0x44>;;
     _32(0x70090081),        //stsud $r2 = $r1, $r2;;
     _32(0x7b0260c2),        //srld $r0 = $r2, $r3;;
     _32(0x0fd00000),        //ret ;;
     _96(0x800000a2e0000000f0048b00),        //pcrel $r1 = 166444 (0x28a2c)
     _32(0x00000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000b8040201),        //ld $r1 = 8 (0x8)[$r1];;
     _32(0x087ffe41),        //cb.dnez $r1? 16960 <__umoddi3+0x48>;;
     _32(0x00000000),        //errop ;;
     _32(0x7f03f000)        //nop ;;
 |];

let __udivmoddi4: list_I = 
 [|
     _32(0x88800801),        //cb.deqz $r1? 16a08 <__udivmoddi4+0x80>
     _32(0xf0162001),        //clzd $r5 = $r1
     _32(0x6a0c0000),        //copyd $r3 = $r0;;
     _32(0xf0122003),        //clzd $r4 = $r3
     _32(0x7601a040),        //compd.ltu $r0 = $r0, $r1;;
     _32(0x75111144),        //sbfw $r4 = $r4, $r5;;
     _32(0x88000580),        //cb.dnez $r0? 169f8 <__udivmoddi4+0x70>
     _32(0x79166101),        //slld $r5 = $r1, $r4;;
     _32(0xf605a143),        //compd.ltu $r1 = $r3, $r5
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x08000101),        //cb.dnez $r1? 169c0 <__udivmoddi4+0x38>;;
     _32(0xe0000001),        //make $r0 = 1 (0x1)
     _32(0x750d00c5),        //sbfd $r3 = $r5, $r3;;
     _32(0x79026100),        //slld $r0 = $r0, $r4;;
     _32(0x8e000304),        //cb.wlez $r4? 169f0 <__udivmoddi4+0x68>
     _32(0xe0180001),        //make $r6 = 1 (0x1)
     _32(0x6a040003),        //copyd $r1 = $r3;;
     _32(0xf91a6106),        //slld $r6 = $r6, $r4
     _32(0xfb162045),        //srld $r5 = $r5, 1 (0x1)
     _32(0x7a040004),        //copyw $r1 = $r4;;
     _32(0x6118ffc6),        //addd $r6 = $r6, -1 (0xffffffff);;
     _32(0x0f000081),        //loopdo $r1, 169e4 <__udivmoddi4+0x5c>;;
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
     _96(0x800000a2e0000000f00c6200),        //pcrel $r3 = 166280 (0x28988)
     _32(0x00000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000b80c0203),        //ld $r3 = 8 (0x8)[$r3];;
     _32(0x087ffd03),        //cb.dnez $r3? 169f0 <__udivmoddi4+0x68>;;
     _32(0x00000000)        //errop ;;
 |];

let __divdi3: list_I = 
 [|
     _32(0x88800781),        //cb.deqz $r1? 16aa0 <__divdi3+0x78>
     _32(0xe40c0000),        //absd $r3 = $r0
     _32(0xe4100001),        //absd $r4 = $r1
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0xf01a2003),        //clzd $r6 = $r3
     _32(0xf615a103),        //compd.ltu $r5 = $r3, $r4
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x080004c5),        //cb.dnez $r5? 16a90 <__divdi3+0x68>;;
     _32(0x70162004),        //clzd $r5 = $r4;;
     _32(0x75191146),        //sbfw $r6 = $r6, $r5;;
     _32(0x79126184),        //slld $r4 = $r4, $r6;;
     _32(0x7615a103),        //compd.ltu $r5 = $r3, $r4;;
     _32(0x08000105),        //cb.dnez $r5? 16a68 <__divdi3+0x40>;;
     _32(0xe0000001),        //make $r0 = 1 (0x1)
     _32(0x750d00c4),        //sbfd $r3 = $r4, $r3;;
     _32(0x79026180),        //slld $r0 = $r0, $r6;;
     _32(0x0e000286),        //cb.wlez $r6? 16a90 <__divdi3+0x68>;;
     _32(0xe01c0001),        //make $r7 = 1 (0x1)
     _32(0xfa140006),        //copyw $r5 = $r6
     _32(0x7b122044),        //srld $r4 = $r4, 1 (0x1);;
     _32(0x791a6187),        //slld $r6 = $r7, $r6;;
     _32(0x6118ffc6),        //addd $r6 = $r6, -1 (0xffffffff);;
     _32(0x0f000085),        //loopdo $r5, 16a88 <__divdi3+0x60>;;
     _32(0x700d00c4),        //stsud $r3 = $r4, $r3;;
     _32(0x780d00c6),        //andd $r3 = $r6, $r3;;
     _32(0x710100c0),        //addd $r0 = $r0, $r3;;
     _32(0xfc090042),        //xord $r2 = $r2, $r1
     _32(0x65040000),        //negd $r1 = $r0;;
     _32(0x8fd00000),        //ret 
     _32(0x72020042),        //cmoved.dltz $r2? $r0 = $r1;;
     _96(0x800000a2e0000000f00c3c00),        //pcrel $r3 = 166128 (0x288f0)
     _32(0x00000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000b80c0203),        //ld $r3 = 8 (0x8)[$r3];;
     _32(0x087ffd83),        //cb.dnez $r3? 16a90 <__divdi3+0x68>;;
     _32(0x00000000)        //errop ;;
 |];

let __moddi3: list_I = 
 [|
     _32(0x88800581),        //cb.deqz $r1? 16b18 <__moddi3+0x58>
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0xe4000000),        //absd $r0 = $r0
     _32(0x64040001),        //absd $r1 = $r1;;
     _32(0xf0122001),        //clzd $r4 = $r1
     _32(0x760da040),        //compd.ltu $r3 = $r0, $r1;;
     _32(0x08000343),        //cb.dnez $r3? 16b0c <__moddi3+0x4c>;;
     _32(0x700e2000),        //clzd $r3 = $r0;;
     _32(0x75111103),        //sbfw $r4 = $r3, $r4;;
     _32(0x79066101),        //slld $r1 = $r1, $r4;;
     _32(0xf615a040),        //compd.ltu $r5 = $r0, $r1
     _32(0xf50d0001),        //sbfd $r3 = $r1, $r0
     _32(0x7b062041),        //srld $r1 = $r1, 1 (0x1);;
     _32(0x8e000184),        //cb.wlez $r4? 16b0c <__moddi3+0x4c>
     _32(0x710200c5),        //cmoved.deqz $r5? $r0 = $r3;;
     _32(0x7a0c0004),        //copyw $r3 = $r4;;
     _32(0x0f000083),        //loopdo $r3, 16b08 <__moddi3+0x48>;;
     _32(0x70010001),        //stsud $r0 = $r1, $r0;;
     _32(0x7b026100),        //srld $r0 = $r0, $r4;;
     _32(0x65040000),        //negd $r1 = $r0;;
     _32(0x8fd00000),        //ret 
     _32(0x72020042),        //cmoved.dltz $r2? $r0 = $r1;;
     _96(0x800000a2e0000000f0041e00),        //pcrel $r1 = 166008 (0x28878)
     _32(0x00000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000b8040201),        //ld $r1 = 8 (0x8)[$r1];;
     _32(0x087ffdc1),        //cb.dnez $r1? 16b0c <__moddi3+0x4c>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16f58 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18c30 <_exit>
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
     _32(0x98000161),        //call 170f0 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16b94 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18c30 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100001011000; //0x16858
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100001011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__udivdi3, 0b00010110100010010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__umoddi3, 0b00010110100100011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__udivmoddi4, 0b00010110100110001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__divdi3, 0b00010110101000101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__moddi3, 0b00010110101011000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101100111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110101101011000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
