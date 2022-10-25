// executing bf_sign_2.c.out.dumped test 
val k1_bf_sign_2.: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_bf_sign_2.() = {
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
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x64032000),        //extfz $r0 = $r0, 2 (0x2), 0 (0x0);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _64(0x00000000f801b040),        //compw.leu $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16854 <main+0x34>;;
     _32(0x18000034),        //call 16920 <abort>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x6a0310c0),        //extfs $r0 = $r0, 33 (0x21), 3 (0x3);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f401b040),        //compw.le $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 1687c <main+0x5c>;;
     _32(0x1800002a),        //call 16920 <abort>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x30000200),        //lwz $r0 = 8 (0x8)[$r0];;
     _64(0x00000000f401b040),        //compw.le $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 1689c <main+0x7c>;;
     _32(0x18000022),        //call 16920 <abort>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x30000700),        //lwz $r0 = 28 (0x1c)[$r0];;
     _32(0x650310c0),        //extfz $r0 = $r0, 17 (0x11), 3 (0x3);;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _64(0x00000000f801b040),        //compw.leu $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 168c4 <main+0xa4>;;
     _32(0x18000018),        //call 16920 <abort>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x30000300),        //lwz $r0 = 12 (0xc)[$r0];;
     _32(0x6503e000),        //extfz $r0 = $r0, 30 (0x1e), 0 (0x0);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f801b040),        //compw.leu $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 168ec <main+0xcc>;;
     _32(0x1800000e),        //call 16920 <abort>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x30000500),        //lwz $r0 = 20 (0x14)[$r0];;
     _32(0x64032000),        //extfz $r0 = $r0, 2 (0x2), 0 (0x0);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _64(0x00000000f801b040),        //compw.leu $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16914 <main+0xf4>;;
     _32(0x18000004),        //call 16920 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 16940 <exit>;;
     _32(0x00000000)        //errop ;;
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

let exit: list_I = 
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
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit, 0b00010110100101000000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
