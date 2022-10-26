// executing 990811_1 test 
val k1_990811_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_990811_1() = {
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
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f101b080),        //compw.eq $r0 = $r0, 2 (0x2);;
     _32(0x0c000540),        //cb.wnez $r0? 16894 <foo+0x74>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f501b080),        //compw.gt $r0 = $r0, 2 (0x2);;
     _32(0x0c000580),        //cb.wnez $r0? 168a8 <foo+0x88>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0c800180),        //cb.weqz $r0? 16870 <foo+0x50>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000180),        //cb.wnez $r0? 16880 <foo+0x60>;;
     _32(0x1000000f),        //goto 168a8 <foo+0x88>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1000000c),        //goto 168ac <foo+0x8c>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x10000007),        //goto 168ac <foo+0x8c>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x10000002),        //goto 168ac <foo+0x8c>;;
     _32(0x18000044),        //call 169b8 <abort>;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2701120c),        //sd 72 (0x48)[$r12] = $r0;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x2601140c),        //sw 80 (0x50)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601170c),        //sw 92 (0x5c)[$r12] = $r0;;
     _32(0x10000011),        //goto 16928 <main+0x68>;;
     _32(0x3000170c),        //lwz $r0 = 92 (0x5c)[$r12];;
     _32(0x6407f000),        //zxhd $r1 = $r0;;
     _32(0x3400170c),        //lws $r0 = 92 (0x5c)[$r12];;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x6108180c),        //addd $r2 = $r12, 96 (0x60);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x2505f400),        //sh -48 (0xffffffd0)[$r0] = $r1;;
     _32(0x3000170c),        //lwz $r0 = 92 (0x5c)[$r12];;
     _32(0x78043fc0),        //zxbd $r1 = $r0;;
     _32(0x3400170c),        //lws $r0 = 92 (0x5c)[$r12];;
     _32(0x6108180c),        //addd $r2 = $r12, 96 (0x60);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x2405f000),        //sb -64 (0xffffffc0)[$r0] = $r1;;
     _32(0x3000170c),        //lwz $r0 = 92 (0x5c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601170c),        //sw 92 (0x5c)[$r12] = $r0;;
     _32(0x3000170c),        //lwz $r0 = 92 (0x5c)[$r12];;
     _64(0x00000000f401b240),        //compw.le $r0 = $r0, 9 (0x9);;
     _32(0x0c7ffb40),        //cb.wnez $r0? 168e8 <main+0x28>;;
     _32(0x6100120c),        //addd $r0 = $r12, 72 (0x48);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffb7),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 1695c <main+0x9c>;;
     _32(0x18000018),        //call 169b8 <abort>;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x610000c0),        //addd $r0 = $r0, 3 (0x3);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffffad),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b0c0),        //compw.eq $r0 = $r0, 3 (0x3);;
     _32(0x0c000080),        //cb.wnez $r0? 16984 <main+0xc4>;;
     _32(0x1800000e),        //call 169b8 <abort>;;
     _32(0x61000c0c),        //addd $r0 = $r12, 48 (0x30);;
     _32(0x61000180),        //addd $r0 = $r0, 6 (0x6);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x1fffffa3),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b0c0),        //compw.eq $r0 = $r0, 3 (0x3);;
     _32(0x0c000080),        //cb.wnez $r0? 169ac <main+0xec>;;
     _32(0x18000004),        //call 169b8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 169d8 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16dd8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18ab0 <_exit>
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
     _32(0x98000161),        //call 16f70 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16a14 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18ab0 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100011000000; //0x168c0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100011000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100110111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100111011000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
