// executing pr22061_3.c.out.dumped test 
val k1_pr22061_3.c.out.dumped: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pr22061_3.c.out.dumped() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo_2124: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x2705020c),        //sd 8 (0x8)[$r12] = $r1;;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _32(0x71040041),        //addw $r1 = $r1, 1 (0x1);;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _32(0x691bf001),        //sxwd $r6 = $r1;;
     _32(0x6118ffc6),        //addd $r6 = $r6, -1 (0xffffffff);;
     _32(0x2719060c),        //sd 24 (0x18)[$r12] = $r6;;
     _32(0x691bf001),        //sxwd $r6 = $r1;;
     _32(0x6a080006),        //copyd $r2 = $r6;;
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0x7b1a2f42),        //srld $r6 = $r2, 61 (0x3d);;
     _32(0x791620c3),        //slld $r5 = $r3, 3 (0x3);;
     _32(0x7a150146),        //ord $r5 = $r6, $r5;;
     _32(0x791220c2),        //slld $r4 = $r2, 3 (0x3);;
     _32(0x30080000),        //lwz $r2 = 0 (0x0)[$r0];;
     _32(0x71080102),        //addw $r2 = $r2, 4 (0x4);;
     _32(0x7808ffc2),        //zxwd $r2 = $r2;;
     _32(0x26090000),        //sw 0 (0x0)[$r0] = $r2;;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let bar: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x2601020c),        //sw 8 (0x8)[$r12] = $r0;;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffd9),        //call 16820 <foo.2124>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b080),        //compw.eq $r0 = $r0, 2 (0x2);;
     _32(0x0c000080),        //cb.wnez $r0? 168d4 <bar+0x44>;;
     _32(0x1800001c),        //call 16940 <abort>;;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffd0),        //call 16820 <foo.2124>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b1c0),        //compw.eq $r0 = $r0, 7 (0x7);;
     _32(0x0c000080),        //cb.wnez $r0? 168f8 <bar+0x68>;;
     _32(0x18000013),        //call 16940 <abort>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _64(0x00000000f101b2c0),        //compw.eq $r0 = $r0, 11 (0xb);;
     _32(0x0c000080),        //cb.wnez $r0? 1690c <bar+0x7c>;;
     _32(0x1800000e),        //call 16940 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffffd8),        //call 16890 <bar>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 16960 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16d60 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18a38 <_exit>
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
     _32(0x98000161),        //call 16ef8 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 1699c <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18a38 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100100000; //0x16920
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo_2124, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100010010000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100101000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit, 0b00010110100101100000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
