// executing 930123_1 test 
val k1_930123_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_930123_1() = {
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
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x60000063),        //make $r0 = 99 (0x63);;
     _32(0x2501020c),        //sh 8 (0x8)[$r12] = $r0;;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _32(0x1ffffff2),        //call 16820 <f>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x08000140),        //cb.dnez $r0? 16874 <main+0x34>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x60040061),        //make $r1 = 97 (0x61);;
     _32(0x10000004),        //goto 16880 <main+0x40>;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x60040062),        //make $r1 = 98 (0x62);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3400060c),        //lws $r0 = 24 (0x18)[$r12];;
     _32(0x6108080c),        //addd $r2 = $r12, 32 (0x20);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x2405fa00),        //sb -24 (0xffffffe8)[$r0] = $r1;;
     _32(0x3400060c),        //lws $r0 = 24 (0x18)[$r12];;
     _32(0x6104080c),        //addd $r1 = $r12, 32 (0x20);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x2000fa00),        //lbz $r0 = -24 (0xffffffe8)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000003f101b040),        //compw.eq $r0 = $r0, 97 (0x61);;
     _32(0x0c000080),        //cb.wnez $r0? 168bc <main+0x7c>;;
     _32(0x18000004),        //call 168c8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 168e8 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16ce8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 189c0 <_exit>
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
     _32(0x98000161),        //call 16e80 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16924 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 189c0 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100001000000; //0x16840
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100001000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100011001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100011101000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
