// executing 20030916_1 test 
val k1_20030916_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20030916_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let f: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x60000010),        //make $r0 = 16 (0x10);;
     _32(0x240107cc),        //sb 31 (0x1f)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x10000010),        //goto 16878 <f+0x58>;;
     _32(0x200007cc),        //lbz $r0 = 31 (0x1f)[$r12];;
     _32(0x7100fa00),        //addw $r0 = $r0, -24 (0xffffffe8);;
     _32(0x240107cc),        //sb 31 (0x1f)[$r12] = $r0;;
     _32(0x200007cc),        //lbz $r0 = 31 (0x1f)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x200007cc),        //lbz $r0 = 31 (0x1f)[$r12];;
     _32(0x71000640),        //addw $r0 = $r0, 25 (0x19);;
     _32(0x240107cc),        //sb 31 (0x1f)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f401b3c0),        //compw.le $r0 = $r0, 15 (0xf);;
     _32(0x0c7ffb80),        //cb.wnez $r0? 1683c <f+0x1c>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _64(0x07fffffee130f80c),        //addd $r12 = $r12, -1056 (0xfffffffffffffbe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _64(0x18000001a601070c),        //sw 1052 (0x41c)[$r12] = $r0;;
     _32(0x1000000f),        //goto 168f0 <main+0x58>;;
     _64(0x18000001b400070c),        //lws $r0 = 1052 (0x41c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _64(0x00000001e104080c),        //addd $r1 = $r12, 1056 (0x420);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _64(0x1ffffffea605fe00),        //sw -1032 (0xfffffffffffffbf8)[$r0] = $r1;;
     _64(0x18000001b000070c),        //lwz $r0 = 1052 (0x41c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _64(0x18000001a601070c),        //sw 1052 (0x41c)[$r12] = $r0;;
     _64(0x18000001b000070c),        //lwz $r0 = 1052 (0x41c)[$r12];;
     _64(0x00000007f401b7c0),        //compw.le $r0 = $r0, 255 (0xff);;
     _32(0x0c7ffb80),        //cb.wnez $r0? 168b8 <main+0x20>;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x1fffffc6),        //call 16820 <f>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _64(0x18000001a601070c),        //sw 1052 (0x41c)[$r12] = $r0;;
     _32(0x1000001f),        //goto 16994 <main+0xfc>;;
     _64(0x18000001b400070c),        //lws $r0 = 1052 (0x41c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _64(0x00000001e104080c),        //addd $r1 = $r12, 1056 (0x420);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _64(0x1ffffffeb004fe00),        //lwz $r1 = -1032 (0xfffffffffffffbf8)[$r0];;
     _64(0x18000001b000070c),        //lwz $r0 = 1052 (0x41c)[$r12];;
     _64(0x00000000f401b1c0),        //compw.le $r0 = $r0, 7 (0x7);;
     _32(0x0c000200),        //cb.wnez $r0? 1696c <main+0xd4>;;
     _64(0x18000001b000070c),        //lwz $r0 = 1052 (0x41c)[$r12];;
     _64(0x00000007f501b5c0),        //compw.gt $r0 = $r0, 247 (0xf7);;
     _32(0x0c0000c0),        //cb.wnez $r0? 1696c <main+0xd4>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x10000002),        //goto 16970 <main+0xd8>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16980 <main+0xe8>;;
     _32(0x1800000d),        //call 169b0 <abort>;;
     _64(0x18000001b000070c),        //lwz $r0 = 1052 (0x41c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _64(0x18000001a601070c),        //sw 1052 (0x41c)[$r12] = $r0;;
     _64(0x18000001b000070c),        //lwz $r0 = 1052 (0x41c)[$r12];;
     _64(0x00000007f401b7c0),        //compw.le $r0 = $r0, 255 (0xff);;
     _32(0x0c7ff780),        //cb.wnez $r0? 1691c <main+0x84>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 169d0 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16dd0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18aa8 <_exit>
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
     _32(0x98000161),        //call 16f68 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16a0c <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18aa8 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100010011000; //0x16898
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100110110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100111010000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
