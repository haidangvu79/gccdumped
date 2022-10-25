// executing 991216_2.c.out.dumped test 
val k1_991216_2.: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_991216_2.() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let test: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x27050a0c),        //sd 40 (0x28)[$r12] = $r1;;
     _32(0x28090c0c),        //sq 48 (0x30)[$r12] = $r2r3;;
     _32(0x2811100c),        //sq 64 (0x40)[$r12] = $r4r5;;
     _32(0x2819140c),        //sq 80 (0x50)[$r12] = $r6r7;;
     _32(0x2821180c),        //sq 96 (0x60)[$r12] = $r8r9;;
     _32(0x28291c0c),        //sq 112 (0x70)[$r12] = $r10r11;;
     _32(0x2601020c),        //sw 8 (0x8)[$r12] = $r0;;
     _32(0x61000a0c),        //addd $r0 = $r12, 40 (0x28);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000000c),        //goto 16888 <test+0x68>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 1687c <test+0x5c>;;
     _32(0x18000072),        //call 16a40 <abort>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x7401b001),        //compw.le $r0 = $r1, $r0;;
     _32(0x0c7ffc80),        //cb.wnez $r0? 1685c <test+0x3c>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x00091a2b81e26af3e0047bc0),        //make $r1 = 81985529216486895 (0x123456789abcdef);;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 168c0 <test+0xa0>;;
     _32(0x18000061),        //call 16a40 <abort>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000002f101b540),        //compw.eq $r0 = $r0, 85 (0x55);;
     _32(0x0c000080),        //cb.wnez $r0? 168e0 <test+0xc0>;;
     _32(0x18000059),        //call 16a40 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130200c),        //addd $r12 = $r12, 128 (0x80);;
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
     _32(0x1fffffc2),        //call 16820 <test>;;
     _32(0x600c0055),        //make $r3 = 85 (0x55);;
     _96(0x00091a2b81e26af3e0087bc0),        //make $r2 = 81985529216486895 (0x123456789abcdef);;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x1fffffbb),        //call 16820 <test>;;
     _32(0x60100055),        //make $r4 = 85 (0x55);;
     _96(0x00091a2b81e26af3e00c7bc0),        //make $r3 = 81985529216486895 (0x123456789abcdef);;
     _32(0x60080003),        //make $r2 = 3 (0x3);;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _32(0x60000003),        //make $r0 = 3 (0x3);;
     _32(0x1fffffb3),        //call 16820 <test>;;
     _32(0x60140055),        //make $r5 = 85 (0x55);;
     _96(0x00091a2b81e26af3e0107bc0),        //make $r4 = 81985529216486895 (0x123456789abcdef);;
     _32(0x600c0004),        //make $r3 = 4 (0x4);;
     _32(0x60080003),        //make $r2 = 3 (0x3);;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _32(0x60000004),        //make $r0 = 4 (0x4);;
     _32(0x1fffffaa),        //call 16820 <test>;;
     _32(0x60180055),        //make $r6 = 85 (0x55);;
     _96(0x00091a2b81e26af3e0147bc0),        //make $r5 = 81985529216486895 (0x123456789abcdef);;
     _32(0x60100005),        //make $r4 = 5 (0x5);;
     _32(0x600c0004),        //make $r3 = 4 (0x4);;
     _32(0x60080003),        //make $r2 = 3 (0x3);;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1fffffa0),        //call 16820 <test>;;
     _32(0x601c0055),        //make $r7 = 85 (0x55);;
     _96(0x00091a2b81e26af3e0187bc0),        //make $r6 = 81985529216486895 (0x123456789abcdef);;
     _32(0x60140006),        //make $r5 = 6 (0x6);;
     _32(0x60100005),        //make $r4 = 5 (0x5);;
     _32(0x600c0004),        //make $r3 = 4 (0x4);;
     _32(0x60080003),        //make $r2 = 3 (0x3);;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x1fffff95),        //call 16820 <test>;;
     _32(0x60200055),        //make $r8 = 85 (0x55);;
     _96(0x00091a2b81e26af3e01c7bc0),        //make $r7 = 81985529216486895 (0x123456789abcdef);;
     _32(0x60180007),        //make $r6 = 7 (0x7);;
     _32(0x60140006),        //make $r5 = 6 (0x6);;
     _32(0x60100005),        //make $r4 = 5 (0x5);;
     _32(0x600c0004),        //make $r3 = 4 (0x4);;
     _32(0x60080003),        //make $r2 = 3 (0x3);;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _32(0x60000007),        //make $r0 = 7 (0x7);;
     _32(0x1fffff89),        //call 16820 <test>;;
     _32(0x60240055),        //make $r9 = 85 (0x55);;
     _96(0x00091a2b81e26af3e0207bc0),        //make $r8 = 81985529216486895 (0x123456789abcdef);;
     _32(0x601c0008),        //make $r7 = 8 (0x8);;
     _32(0x60180007),        //make $r6 = 7 (0x7);;
     _32(0x60140006),        //make $r5 = 6 (0x6);;
     _32(0x60100005),        //make $r4 = 5 (0x5);;
     _32(0x600c0004),        //make $r3 = 4 (0x4);;
     _32(0x60080003),        //make $r2 = 3 (0x3);;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _32(0x60000008),        //make $r0 = 8 (0x8);;
     _32(0x1fffff7c),        //call 16820 <test>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 16a60 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16e60 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18b38 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0xf838ffc0),        //zxwd $r14 = $r0
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x98000161),        //call 16ff8 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16a9c <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18b38 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100011111000; //0x168f8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100011111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101001000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit, 0b00010110101001100000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
