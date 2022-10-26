// executing cmpsf_1 test 
val k1_cmpsf_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_cmpsf_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let feq: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x73030001),        //fcompw.une $r0 = $r1, $r0;;
     _32(0x080000c0),        //cb.dnez $r0? 16844 <feq+0x24>;;
     _32(0x6000000d),        //make $r0 = 13 (0xd);;
     _32(0x10000002),        //goto 16848 <feq+0x28>;;
     _32(0x6000008c),        //make $r0 = 140 (0x8c);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let fne: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x72030001),        //fcompw.oeq $r0 = $r1, $r0;;
     _32(0x080000c0),        //cb.dnez $r0? 16874 <fne+0x24>;;
     _32(0x6000000d),        //make $r0 = 13 (0xd);;
     _32(0x10000002),        //goto 16878 <fne+0x28>;;
     _32(0x6000008c),        //make $r0 = 140 (0x8c);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let flt: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x74030001),        //fcompw.olt $r0 = $r1, $r0;;
     _32(0x088000c0),        //cb.deqz $r0? 168a4 <flt+0x24>;;
     _32(0x6000000d),        //make $r0 = 13 (0xd);;
     _32(0x10000002),        //goto 168a8 <flt+0x28>;;
     _32(0x6000008c),        //make $r0 = 140 (0x8c);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let fge: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x76030001),        //fcompw.oge $r0 = $r1, $r0;;
     _32(0x088000c0),        //cb.deqz $r0? 168d4 <fge+0x24>;;
     _32(0x6000000d),        //make $r0 = 13 (0xd);;
     _32(0x10000002),        //goto 168d8 <fge+0x28>;;
     _32(0x6000008c),        //make $r0 = 140 (0x8c);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let fgt: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x3004040c),        //lwz $r1 = 16 (0x10)[$r12];;
     _32(0x74030001),        //fcompw.olt $r0 = $r1, $r0;;
     _32(0x088000c0),        //cb.deqz $r0? 16904 <fgt+0x24>;;
     _32(0x6000000d),        //make $r0 = 13 (0xd);;
     _32(0x10000002),        //goto 16908 <fgt+0x28>;;
     _32(0x6000008c),        //make $r0 = 140 (0x8c);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let fle: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x3004040c),        //lwz $r1 = 16 (0x10)[$r12];;
     _32(0x76030001),        //fcompw.oge $r0 = $r1, $r0;;
     _32(0x088000c0),        //cb.deqz $r0? 16934 <fle+0x24>;;
     _32(0x6000000d),        //make $r0 = 13 (0xd);;
     _32(0x10000002),        //goto 16938 <fle+0x28>;;
     _32(0x6000008c),        //make $r0 = 140 (0x8c);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _96(0x00000000800000f8e0000a00),        //make $r0 = 253992 (0x3e028);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000005c),        //goto 16ad4 <main+0x194>;;
     _96(0x00000000800000f8e0040200),        //make $r1 = 253960 (0x3e008);;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x3002f001),        //lwz.xs $r0 = $r0[$r1];;
     _32(0x2601030c),        //sw 12 (0xc)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x1000004c),        //goto 16ab8 <main+0x178>;;
     _96(0x00000000800000f8e0040200),        //make $r1 = 253960 (0x3e008);;
     _32(0x3400060c),        //lws $r0 = 24 (0x18)[$r12];;
     _32(0x3002f001),        //lwz.xs $r0 = $r0[$r1];;
     _32(0x2601020c),        //sw 8 (0x8)[$r12] = $r0;;
     _32(0x3004020c),        //lwz $r1 = 8 (0x8)[$r12];;
     _32(0x3000030c),        //lwz $r0 = 12 (0xc)[$r12];;
     _32(0x1fffff9d),        //call 16820 <feq>;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61080100),        //addd $r2 = $r0, 4 (0x4);;
     _32(0x2709040c),        //sd 16 (0x10)[$r12] = $r2;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 169d0 <main+0x90>;;
     _32(0x18000049),        //call 16af0 <abort>;;
     _32(0x3004020c),        //lwz $r1 = 8 (0x8)[$r12];;
     _32(0x3000030c),        //lwz $r0 = 12 (0xc)[$r12];;
     _32(0x1fffff9e),        //call 16850 <fne>;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61080100),        //addd $r2 = $r0, 4 (0x4);;
     _32(0x2709040c),        //sd 16 (0x10)[$r12] = $r2;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 169fc <main+0xbc>;;
     _32(0x1800003e),        //call 16af0 <abort>;;
     _32(0x3004020c),        //lwz $r1 = 8 (0x8)[$r12];;
     _32(0x3000030c),        //lwz $r0 = 12 (0xc)[$r12];;
     _32(0x1fffff9f),        //call 16880 <flt>;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61080100),        //addd $r2 = $r0, 4 (0x4);;
     _32(0x2709040c),        //sd 16 (0x10)[$r12] = $r2;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16a28 <main+0xe8>;;
     _32(0x18000033),        //call 16af0 <abort>;;
     _32(0x3004020c),        //lwz $r1 = 8 (0x8)[$r12];;
     _32(0x3000030c),        //lwz $r0 = 12 (0xc)[$r12];;
     _32(0x1fffffa0),        //call 168b0 <fge>;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61080100),        //addd $r2 = $r0, 4 (0x4);;
     _32(0x2709040c),        //sd 16 (0x10)[$r12] = $r2;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16a54 <main+0x114>;;
     _32(0x18000028),        //call 16af0 <abort>;;
     _32(0x3004020c),        //lwz $r1 = 8 (0x8)[$r12];;
     _32(0x3000030c),        //lwz $r0 = 12 (0xc)[$r12];;
     _32(0x1fffffa1),        //call 168e0 <fgt>;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61080100),        //addd $r2 = $r0, 4 (0x4);;
     _32(0x2709040c),        //sd 16 (0x10)[$r12] = $r2;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16a80 <main+0x140>;;
     _32(0x1800001d),        //call 16af0 <abort>;;
     _32(0x3004020c),        //lwz $r1 = 8 (0x8)[$r12];;
     _32(0x3000030c),        //lwz $r0 = 12 (0xc)[$r12];;
     _32(0x1fffffa2),        //call 16910 <fle>;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61080100),        //addd $r2 = $r0, 4 (0x4);;
     _32(0x2709040c),        //sd 16 (0x10)[$r12] = $r2;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16aac <main+0x16c>;;
     _32(0x18000012),        //call 16af0 <abort>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f401b1c0),        //compw.le $r0 = $r0, 7 (0x7);;
     _32(0x0c7fec80),        //cb.wnez $r0? 1698c <main+0x4c>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f401b1c0),        //compw.le $r0 = $r0, 7 (0x7);;
     _32(0x0c7fe880),        //cb.wnez $r0? 16968 <main+0x28>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 16b10 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16f10 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18be8 <_exit>
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
     _32(0x98000161),        //call 170a8 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fee0007000),        //make $r0 = 260544 (0x3f9c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16b4c <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18be8 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100101000000; //0x16940
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(feq, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fne, 0b00010110100001010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(flt, 0b00010110100010000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fge, 0b00010110100010110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fgt, 0b00010110100011100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fle, 0b00010110100100010000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100101000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101011110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit, 0b00010110101100010000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
