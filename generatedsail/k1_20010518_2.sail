// executing 20010518_2 test 
val k1_20010518_2: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20010518_2() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let main: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x61000a0c),        //addd $r0 = $r12, 40 (0x28);;
     _32(0x2701160c),        //sd 88 (0x58)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701100c),        //sd 64 (0x40)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701120c),        //sd 72 (0x48)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601140c),        //sw 80 (0x50)[$r12] = $r0;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2501100c),        //sh 64 (0x40)[$r12] = $r0;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x2701108c),        //sd 66 (0x42)[$r12] = $r0;;
     _32(0x60000003),        //make $r0 = 3 (0x3);;
     _32(0x2501128c),        //sh 74 (0x4a)[$r12] = $r0;;
     _32(0x60000004),        //make $r0 = 4 (0x4);;
     _32(0x2501130c),        //sh 76 (0x4c)[$r12] = $r0;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x3804100c),        //ld $r1 = 64 (0x40)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x3804120c),        //ld $r1 = 72 (0x48)[$r12];;
     _32(0x27050200),        //sd 8 (0x8)[$r0] = $r1;;
     _32(0x3004140c),        //lwz $r1 = 80 (0x50)[$r12];;
     _32(0x26050400),        //sw 16 (0x10)[$r0] = $r1;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x60040063),        //make $r1 = 99 (0x63);;
     _32(0x24050480),        //sb 18 (0x12)[$r0] = $r1;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c000680),        //cb.wnez $r0? 16914 <main+0xf4>;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x38000080),        //ld $r0 = 2 (0x2)[$r0];;
     _32(0x60010080),        //compd.ne $r0 = $r0, 2 (0x2);;
     _32(0x08000580),        //cb.dnez $r0? 16914 <main+0xf4>;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x28000280),        //lhz $r0 = 10 (0xa)[$r0];;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _64(0x00000000f001b0c0),        //compw.ne $r0 = $r0, 3 (0x3);;
     _32(0x0c0003c0),        //cb.wnez $r0? 16914 <main+0xf4>;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x28000300),        //lhz $r0 = 12 (0xc)[$r0];;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _64(0x00000000f001b100),        //compw.ne $r0 = $r0, 4 (0x4);;
     _32(0x0c000200),        //cb.wnez $r0? 16914 <main+0xf4>;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x20000480),        //lbz $r0 = 18 (0x12)[$r0];;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000003f101b0c0),        //compw.eq $r0 = $r0, 99 (0x63);;
     _32(0x0c000080),        //cb.wnez $r0? 16918 <main+0xf8>;;
     _32(0x18000003),        //call 16920 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16940 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16d40 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18a18 <_exit>
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
     _32(0x98000161),        //call 16ed8 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 1697c <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18a18 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100100100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100101000000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
