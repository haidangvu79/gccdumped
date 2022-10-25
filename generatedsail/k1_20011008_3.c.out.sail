// executing 20011008_3.c.out.dumped test 
val k1_20011008_3.c.out.dumped: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20011008_3.c.out.dumped() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let log_compare: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let __db_txnlist_lsnadd: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x26010a0c),        //sw 40 (0x28)[$r12] = $r0;;
     _32(0x2705080c),        //sd 32 (0x20)[$r12] = $r1;;
     _32(0x2709060c),        //sd 24 (0x18)[$r12] = $r2;;
     _32(0x260d040c),        //sw 16 (0x10)[$r12] = $r3;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x10000040),        //goto 1695c <__db_txnlist_lsnadd+0x124>;;
     _32(0x30000a0c),        //lwz $r0 = 40 (0x28)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010a0c),        //sw 40 (0x28)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x10000030),        //goto 16934 <__db_txnlist_lsnadd+0xfc>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x38040800),        //ld $r1 = 32 (0x20)[$r0];;
     _32(0x34000e0c),        //lws $r0 = 56 (0x38)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x71090001),        //addd $r2 = $r1, $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x38040800),        //ld $r1 = 32 (0x20)[$r0];;
     _32(0x34000e0c),        //lws $r0 = 56 (0x38)[$r12];;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x6a000002),        //copyd $r0 = $r2;;
     _32(0x1fffffdd),        //call 16820 <log_compare>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x0d800740),        //cb.wgez $r0? 16928 <__db_txnlist_lsnadd+0xf0>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x38040800),        //ld $r1 = 32 (0x20)[$r0];;
     _32(0x34000e0c),        //lws $r0 = 56 (0x38)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x38040800),        //ld $r1 = 32 (0x20)[$r0];;
     _32(0x34000e0c),        //lws $r0 = 56 (0x38)[$r12];;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x71050001),        //addd $r1 = $r1, $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x38080800),        //ld $r2 = 32 (0x20)[$r0];;
     _32(0x34000e0c),        //lws $r0 = 56 (0x38)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x38040001),        //ld $r1 = 0 (0x0)[$r1];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x38040800),        //ld $r1 = 32 (0x20)[$r0];;
     _32(0x34000e0c),        //lws $r0 = 56 (0x38)[$r12];;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x38040c0c),        //ld $r1 = 48 (0x30)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x30000600),        //lwz $r0 = 24 (0x18)[$r0];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x30040e0c),        //lwz $r1 = 56 (0x38)[$r12];;
     _32(0x7201b001),        //compw.lt $r0 = $r1, $r0;;
     _32(0x0c7ff2c0),        //cb.wnez $r0? 16878 <__db_txnlist_lsnadd+0x40>;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x78000040),        //andw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800100),        //cb.deqz $r0? 16978 <__db_txnlist_lsnadd+0x140>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x30000600),        //lwz $r0 = 24 (0x18)[$r0];;
     _32(0x10000002),        //goto 1697c <__db_txnlist_lsnadd+0x144>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x30040f0c),        //lwz $r1 = 60 (0x3c)[$r12];;
     _32(0x7201b001),        //compw.lt $r0 = $r1, $r0;;
     _32(0x0c7fedc0),        //cb.wnez $r0? 16860 <__db_txnlist_lsnadd+0x28>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x38040800),        //ld $r1 = 32 (0x20)[$r0];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x38040001),        //ld $r1 = 0 (0x0)[$r1];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x30000a0c),        //lwz $r0 = 40 (0x28)[$r12];;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _64(0x07fffff6e130400c),        //addd $r12 = $r12, -9984 (0xffffffffffffd900);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x600004d2),        //make $r0 = 1234 (0x4d2);;
     _64(0x18000009a601b20c),        //sw 9928 (0x26c8)[$r12] = $r0;;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _64(0x18000009a701b40c),        //sd 9936 (0x26d0)[$r12] = $r0;;
     _64(0x00000009e104aa0c),        //addd $r1 = $r12, 9896 (0x26a8);;
     _64(0x00000009e100ac0c),        //addd $r0 = $r12, 9904 (0x26b0);;
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff90),        //call 16838 <__db_txnlist_lsnadd>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16a10 <main+0x60>;;
     _32(0x18000011),        //call 16a50 <abort>;;
     _64(0x00000009e104aa0c),        //addd $r1 = $r12, 9896 (0x26a8);;
     _64(0x00000009e100ac0c),        //addd $r0 = $r12, 9904 (0x26b0);;
     _32(0x600c0001),        //make $r3 = 1 (0x1);;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff82),        //call 16838 <__db_txnlist_lsnadd>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000026f101b480),        //compw.eq $r0 = $r0, 1234 (0x4d2);;
     _32(0x0c000080),        //cb.wnez $r0? 16a48 <main+0x98>;;
     _32(0x18000003),        //call 16a50 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16a70 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16e70 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18b48 <_exit>
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
     _32(0x98000161),        //call 17008 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16aac <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18b48 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100110110000; //0x169b0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(log_compare, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__db_txnlist_lsnadd, 0b00010110100000111000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100110110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101001010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit, 0b00010110101001110000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
