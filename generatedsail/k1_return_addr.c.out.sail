// executing return_addr.c.out.dumped test 
val k1_return_addr.c.out.dumped: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_return_addr.c.out.dumped() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let get_max_2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let get_max_3: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x7701a001),        //compd.geu $r0 = $r1, $r0;;
     _32(0x08000100),        //cb.dnez $r0? 16860 <get_max_3+0x28>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x10000003),        //goto 16868 <get_max_3+0x30>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let get_min_2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6100ffc0),        //addd $r0 = $r0, -1 (0xffffffff);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let get_min_3: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x7701a001),        //compd.geu $r0 = $r1, $r0;;
     _32(0x08000100),        //cb.dnez $r0? 168b0 <get_min_3+0x28>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6100ffc0),        //addd $r0 = $r0, -1 (0xffffffff);;
     _32(0x10000003),        //goto 168b8 <get_min_3+0x30>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x6100ffc0),        //addd $r0 = $r0, -1 (0xffffffff);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let test_max_2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x6100020c),        //addd $r0 = $r12, 8 (0x8);;
     _32(0x1fffffd4),        //call 16820 <get_max_2>;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x6100020c),        //addd $r0 = $r12, 8 (0x8);;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x77010001),        //maxud $r0 = $r1, $r0;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test_max_3: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x6104080c),        //addd $r1 = $r12, 32 (0x20);;
     _32(0x61000a0c),        //addd $r0 = $r12, 40 (0x28);;
     _32(0x1fffffc9),        //call 16838 <get_max_3>;;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x61000a0c),        //addd $r0 = $r12, 40 (0x28);;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x7701a001),        //compd.geu $r0 = $r1, $r0;;
     _32(0x08000140),        //cb.dnez $r0? 1693c <test_max_3+0x3c>;;
     _32(0x61000a0c),        //addd $r0 = $r12, 40 (0x28);;
     _32(0x6104080c),        //addd $r1 = $r12, 32 (0x20);;
     _32(0x77010040),        //maxud $r0 = $r0, $r1;;
     _32(0x10000002),        //goto 16940 <test_max_3+0x40>;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let test_min_2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x6100020c),        //addd $r0 = $r12, 8 (0x8);;
     _32(0x1fffffc2),        //call 16870 <get_min_2>;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x6100020c),        //addd $r0 = $r12, 8 (0x8);;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x76010001),        //minud $r0 = $r1, $r0;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test_min_3: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x6104080c),        //addd $r1 = $r12, 32 (0x20);;
     _32(0x61000a0c),        //addd $r0 = $r12, 40 (0x28);;
     _32(0x1fffffb7),        //call 16888 <get_min_3>;;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x61000a0c),        //addd $r0 = $r12, 40 (0x28);;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x7801a001),        //compd.leu $r0 = $r1, $r0;;
     _32(0x08000140),        //cb.dnez $r0? 169d4 <test_min_3+0x3c>;;
     _32(0x61000a0c),        //addd $r0 = $r12, 40 (0x28);;
     _32(0x6104080c),        //addd $r1 = $r12, 32 (0x20);;
     _32(0x76010040),        //minud $r0 = $r0, $r1;;
     _32(0x10000002),        //goto 169d8 <test_min_3+0x40>;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let test_min_3_phi: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x61000a0c),        //addd $r0 = $r12, 40 (0x28);;
     _32(0x2701160c),        //sd 88 (0x58)[$r12] = $r0;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x2701140c),        //sd 80 (0x50)[$r12] = $r0;;
     _32(0x6104080c),        //addd $r1 = $r12, 32 (0x20);;
     _32(0x61000a0c),        //addd $r0 = $r12, 40 (0x28);;
     _32(0x1fffff9c),        //call 16888 <get_min_3>;;
     _32(0x2701120c),        //sd 72 (0x48)[$r12] = $r0;;
     _32(0x6104080c),        //addd $r1 = $r12, 32 (0x20);;
     _32(0x61000a0c),        //addd $r0 = $r12, 40 (0x28);;
     _32(0x1fffff98),        //call 16888 <get_min_3>;;
     _32(0x2701100c),        //sd 64 (0x40)[$r12] = $r0;;
     _32(0x3804160c),        //ld $r1 = 88 (0x58)[$r12];;
     _32(0x3800120c),        //ld $r0 = 72 (0x48)[$r12];;
     _32(0x76010001),        //minud $r0 = $r1, $r0;;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x3804140c),        //ld $r1 = 80 (0x50)[$r12];;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x76010001),        //minud $r0 = $r1, $r0;;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x38100c0c),        //ld $r4 = 48 (0x30)[$r12];;
     _32(0x380c0e0c),        //ld $r3 = 56 (0x38)[$r12];;
     _32(0x3808100c),        //ld $r2 = 64 (0x40)[$r12];;
     _32(0x3804120c),        //ld $r1 = 72 (0x48)[$r12];;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x180000a7),        //call 16d08 <printf>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c0000c0),        //cb.wnez $r0? 16a88 <test_min_3_phi+0x98>;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x10000002),        //goto 16a8c <test_min_3_phi+0x9c>;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1fffff85),        //call 168c0 <test_max_2>;;
     _32(0x08000280),        //cb.dnez $r0? 16ad8 <main+0x38>;;
     _96(0x00000000800000fce008f400),        //make $r2 = 259024 (0x3f3d0);;
     _32(0x60040073),        //make $r1 = 115 (0x73);;
     _96(0x00000000800000fce000fa00),        //make $r0 = 259048 (0x3f3e8);;
     _32(0x1800008e),        //call 16d08 <printf>;;
     _32(0x18000033),        //call 16ba0 <abort>;;
     _32(0x1fffff8a),        //call 16900 <test_max_3>;;
     _32(0x08000280),        //cb.dnez $r0? 16b04 <main+0x64>;;
     _96(0x00000000800000fde0080400),        //make $r2 = 259088 (0x3f410);;
     _32(0x60040074),        //make $r1 = 116 (0x74);;
     _96(0x00000000800000fce000fa00),        //make $r0 = 259048 (0x3f3e8);;
     _32(0x18000083),        //call 16d08 <printf>;;
     _32(0x18000028),        //call 16ba0 <abort>;;
     _32(0x1fffff95),        //call 16958 <test_min_2>;;
     _32(0x08000280),        //cb.dnez $r0? 16b30 <main+0x90>;;
     _96(0x00000000800000fde0080a00),        //make $r2 = 259112 (0x3f428);;
     _32(0x60040076),        //make $r1 = 118 (0x76);;
     _96(0x00000000800000fce000fa00),        //make $r0 = 259048 (0x3f3e8);;
     _32(0x18000078),        //call 16d08 <printf>;;
     _32(0x1800001d),        //call 16ba0 <abort>;;
     _32(0x1fffff9a),        //call 16998 <test_min_3>;;
     _32(0x08000280),        //cb.dnez $r0? 16b5c <main+0xbc>;;
     _96(0x00000000800000fde0081000),        //make $r2 = 259136 (0x3f440);;
     _32(0x60040077),        //make $r1 = 119 (0x77);;
     _96(0x00000000800000fce000fa00),        //make $r0 = 259048 (0x3f3e8);;
     _32(0x1800006d),        //call 16d08 <printf>;;
     _32(0x18000012),        //call 16ba0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffa4),        //call 169f0 <test_min_3_phi>;;
     _32(0x08000280),        //cb.dnez $r0? 16b8c <main+0xec>;;
     _96(0x00000000800000fde0081600),        //make $r2 = 259160 (0x3f458);;
     _32(0x60040079),        //make $r1 = 121 (0x79);;
     _96(0x00000000800000fce000fa00),        //make $r0 = 259048 (0x3f3e8);;
     _32(0x18000061),        //call 16d08 <printf>;;
     _32(0x18000006),        //call 16ba0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x9800011b),        //call 17018 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98002bc7),        //call 21ad0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101010100000; //0x16aa0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(get_max_2, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(get_max_3, 0b00010110100000111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(get_min_2, 0b00010110100001110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(get_min_3, 0b00010110100010001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test_max_2, 0b00010110100011000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test_max_3, 0b00010110100100000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test_min_2, 0b00010110100101011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test_min_3, 0b00010110100110011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test_min_3_phi, 0b00010110100111110000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101010100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101110100000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
