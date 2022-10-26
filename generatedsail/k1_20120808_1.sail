// executing 20120808_1 test 
val k1_20120808_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20120808_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let main: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701020c),        //sd 8 (0x8)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _96(0x0000000080000117e0003400),        //make $r0 = 285904 (0x45cd0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _96(0x0000000080000106e1007000),        //addd $r0 = $r0, 268736 (0x419c0);;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x1000003a),        //goto 16964 <main+0x144>;;
     _32(0x600000ff),        //make $r0 = 255 (0xff);;
     _32(0x26010c0c),        //sw 48 (0x30)[$r12] = $r0;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x26010b0c),        //sw 44 (0x2c)[$r12] = $r0;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _64(0x00000000f101b640),        //compw.eq $r0 = $r0, 25 (0x19);;
     _32(0x0c000580),        //cb.wnez $r0? 16904 <main+0xe4>;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _64(0x00000000f501b640),        //compw.gt $r0 = $r0, 25 (0x19);;
     _32(0x0c000580),        //cb.wnez $r0? 16914 <main+0xf4>;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000180),        //cb.wnez $r0? 168e4 <main+0xc4>;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _64(0x00000000f101b080),        //compw.eq $r0 = $r0, 2 (0x2);;
     _32(0x0c000180),        //cb.wnez $r0? 168f4 <main+0xd4>;;
     _32(0x1000000d),        //goto 16914 <main+0xf4>;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _32(0x7c000080),        //xorw $r0 = $r0, 2 (0x2);;
     _32(0x26010c0c),        //sw 48 (0x30)[$r12] = $r0;;
     _32(0x1000000a),        //goto 16918 <main+0xf8>;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _32(0x7c000100),        //xorw $r0 = $r0, 4 (0x4);;
     _32(0x26010c0c),        //sw 48 (0x30)[$r12] = $r0;;
     _32(0x10000006),        //goto 16918 <main+0xf8>;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _32(0x7c000040),        //xorw $r0 = $r0, 1 (0x1);;
     _32(0x26010c0c),        //sw 48 (0x30)[$r12] = $r0;;
     _32(0x10000002),        //goto 16918 <main+0xf8>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x30000b0c),        //lwz $r0 = 44 (0x2c)[$r12];;
     _32(0x78043fc0),        //zxbd $r1 = $r0;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7a011001),        //orw $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x78043fc0),        //zxbd $r1 = $r0;;
     _32(0x34000d0c),        //lws $r0 = 52 (0x34)[$r12];;
     _32(0x6108100c),        //addd $r2 = $r12, 64 (0x40);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x2405f200),        //sb -56 (0xffffffc8)[$r0] = $r1;;
     _96(0x0000000080000117e0043200),        //make $r1 = 285896 (0x45cc8);;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _64(0x00000000f401b740),        //compw.le $r0 = $r0, 29 (0x1d);;
     _32(0x0c7ff100),        //cb.wnez $r0? 16880 <main+0x60>;;
     _32(0x2000020c),        //lbz $r0 = 8 (0x8)[$r12];;
     _64(0x00000007f001b7c0),        //compw.ne $r0 = $r0, 255 (0xff);;
     _32(0x0c000780),        //cb.wnez $r0? 169f8 <main+0x1d8>;;
     _32(0x2000024c),        //lbz $r0 = 9 (0x9)[$r12];;
     _64(0x00000007f001b740),        //compw.ne $r0 = $r0, 253 (0xfd);;
     _32(0x0c000680),        //cb.wnez $r0? 169f8 <main+0x1d8>;;
     _32(0x2000028c),        //lbz $r0 = 10 (0xa)[$r12];;
     _64(0x00000007f001b6c0),        //compw.ne $r0 = $r0, 251 (0xfb);;
     _32(0x0c000580),        //cb.wnez $r0? 169f8 <main+0x1d8>;;
     _32(0x200002cc),        //lbz $r0 = 11 (0xb)[$r12];;
     _64(0x00000007f001b7c0),        //compw.ne $r0 = $r0, 255 (0xff);;
     _32(0x0c000480),        //cb.wnez $r0? 169f8 <main+0x1d8>;;
     _32(0x2000030c),        //lbz $r0 = 12 (0xc)[$r12];;
     _64(0x00000007f001b7c0),        //compw.ne $r0 = $r0, 255 (0xff);;
     _32(0x0c000380),        //cb.wnez $r0? 169f8 <main+0x1d8>;;
     _32(0x2000084c),        //lbz $r0 = 33 (0x21)[$r12];;
     _64(0x00000007f001b780),        //compw.ne $r0 = $r0, 254 (0xfe);;
     _32(0x0c000280),        //cb.wnez $r0? 169f8 <main+0x1d8>;;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x0000000080000106e0047780),        //make $r1 = 268766 (0x419de);;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 169fc <main+0x1dc>;;
     _32(0x18000004),        //call 16a08 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 16a28 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16e28 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18b00 <_exit>
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
     _32(0x98000161),        //call 16fc0 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16a64 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18b00 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101000001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110101000101000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
