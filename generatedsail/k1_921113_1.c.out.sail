// executing 921113_1.c.out.dumped test 
val k1_921113_1.: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_921113_1.() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let w: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f1: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x73030040),        //fcompw.une $r0 = $r0, $r1;;
     _32(0x08000140),        //cb.dnez $r0? 1686c <f1+0x34>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x72030040),        //fcompw.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16870 <f1+0x38>;;
     _32(0x18000075),        //call 16a40 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let f2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x000fe000e0040000),        //make $r1 = 1065353216 (0x3f800000);;
     _32(0x73030040),        //fcompw.une $r0 = $r0, $r1;;
     _32(0x08000180),        //cb.dnez $r0? 168c4 <f2+0x3c>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _64(0x000fe000e0040000),        //make $r1 = 1065353216 (0x3f800000);;
     _32(0x72030040),        //fcompw.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 168c8 <f2+0x40>;;
     _32(0x1800005f),        //call 16a40 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let gitter: list_I = 
 [|
     _64(0x07ffffbfe130f00c),        //addd $r12 = $r12, -65600 (0xfffffffffffeffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x26010c0c),        //sw 48 (0x30)[$r12] = $r0;;
     _32(0x27050a0c),        //sd 40 (0x28)[$r12] = $r1;;
     _32(0x2709080c),        //sd 32 (0x20)[$r12] = $r2;;
     _32(0x270d060c),        //sd 24 (0x18)[$r12] = $r3;;
     _32(0x2711040c),        //sd 16 (0x10)[$r12] = $r4;;
     _32(0x2615020c),        //sw 8 (0x8)[$r12] = $r5;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x30080000),        //lwz $r2 = 0 (0x0)[$r0];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _32(0x7a000002),        //copyw $r0 = $r2;;
     _32(0x1fffffc6),        //call 16838 <f1>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _32(0x30080000),        //lwz $r2 = 0 (0x0)[$r0];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _32(0x7a000002),        //copyw $r0 = $r2;;
     _32(0x1fffffd1),        //call 16888 <f2>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x18000040a6010f0c),        //sw 65596 (0x1003c)[$r12] = $r0;;
     _64(0x18000040b0000f0c),        //lwz $r0 = 65596 (0x1003c)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x76030001),        //fcompw.oge $r0 = $r1, $r0;;
     _32(0x08800600),        //cb.deqz $r0? 169d4 <gitter+0xf4>;;
     _32(0x3004020c),        //lwz $r1 = 8 (0x8)[$r12];;
     _64(0x18000040b0000f0c),        //lwz $r0 = 65596 (0x1003c)[$r12];;
     _32(0x1fffffa7),        //call 16820 <w>;;
     _64(0x18000040b0000f0c),        //lwz $r0 = 65596 (0x1003c)[$r12];;
     _32(0x78033000),        //fwidenlwd $r0 = $r0;;
     _32(0x3004020c),        //lwz $r1 = 8 (0x8)[$r12];;
     _32(0x78073001),        //fwidenlwd $r1 = $r1;;
     _96(0x01ff000080000000e0080000),        //make $r2 = 4602678819172646912 (0x3fe0000000000000);;
     _32(0x58057081),        //fmuld $r1 = $r1, $r2;;
     _32(0x7e030001),        //fcompd.oge $r0 = $r1, $r0;;
     _32(0x08800240),        //cb.deqz $r0? 169d4 <gitter+0xf4>;;
     _32(0x3004020c),        //lwz $r1 = 8 (0x8)[$r12];;
     _64(0x18000040b0000f0c),        //lwz $r0 = 65596 (0x1003c)[$r12];;
     _32(0x1fffff98),        //call 16820 <w>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _64(0x000fe000e0040000),        //make $r1 = 1065353216 (0x3f800000);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _64(0x00000040e130100c),        //addd $r12 = $r12, 65600 (0x10040);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x6104060c),        //addd $r1 = $r12, 24 (0x18);;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _64(0x000fe000e0140000),        //make $r5 = 1065353216 (0x3f800000);;
     _96(0x00000000800000f8e0100200),        //make $r4 = 253960 (0x3e008);;
     _32(0x6a0c0001),        //copyd $r3 = $r1;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _96(0x0000000080000106e0047000),        //make $r1 = 268736 (0x419c0);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffffac),        //call 168e0 <gitter>;;
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

let adr_start:bits(addr_bits) = 0b00010110100111110000; //0x169f0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(w, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f1, 0b00010110100000111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f2, 0b00010110100010001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(gitter, 0b00010110100011100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100111110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101001000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit, 0b00010110101001100000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
