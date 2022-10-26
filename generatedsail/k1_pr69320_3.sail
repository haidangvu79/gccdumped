// executing pr69320_3 test 
val k1_pr69320_3: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pr69320_3() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x0000000080000117e0004200),        //make $r0 = 285960 (0x45d08);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x25050000),        //sh 0 (0x0)[$r0] = $r1;;
     _32(0x10000025),        //goto 168d4 <main+0xb4>;;
     _96(0x0000000080000117e0004200),        //make $r0 = 285960 (0x45d08);;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71000180),        //addw $r0 = $r0, 6 (0x6);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _96(0x00000000800000f8e0040200),        //make $r1 = 253960 (0x3e008);;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x3006f001),        //lwz.xs $r1 = $r0[$r1];;
     _96(0x00000000800000f8e0002a00),        //make $r0 = 254120 (0x3e0a8);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000000f001b000),        //compw.ne $r0 = $r0, 0 (0x0);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7001b001),        //compw.ne $r0 = $r1, $r0;;
     _32(0x0c8005c0),        //cb.weqz $r0? 168f8 <main+0xd8>;;
     _96(0x0000000080000117e0004200),        //make $r0 = 285960 (0x45d08);;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x6407f000),        //zxhd $r1 = $r0;;
     _96(0x0000000080000117e0004200),        //make $r0 = 285960 (0x45d08);;
     _32(0x25050000),        //sh 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0004200),        //make $r0 = 285960 (0x45d08);;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _64(0x00000000f401b0c0),        //compw.le $r0 = $r0, 3 (0x3);;
     _32(0x0c7ff540),        //cb.wnez $r0? 16844 <main+0x24>;;
     _32(0x10000002),        //goto 168fc <main+0xdc>;;
     _32(0x7f03f000),        //nop ;;
     _96(0x0000000080000117e0004200),        //make $r0 = 285960 (0x45d08);;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _64(0x00000000f101b100),        //compw.eq $r0 = $r0, 4 (0x4);;
     _32(0x0c000080),        //cb.wnez $r0? 16920 <main+0x100>;;
     _32(0x18000003),        //call 16928 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16948 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16d48 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18a20 <_exit>
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
     _32(0x98000161),        //call 16ee0 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fde0001000),        //make $r0 = 259136 (0x3f440);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16984 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18a20 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100100101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100101001000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
