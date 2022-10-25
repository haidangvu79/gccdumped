// executing 20010910_1.c.out.dumped test 
val k1_20010910_1.: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20010910_1.() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let epic_init_ring: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000016),        //goto 16888 <epic_init_ring+0x68>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000180),        //addw $r0 = $r0, 6 (0x6);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x7804ffc2),        //zxwd $r1 = $r2;;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050200),        //sw 8 (0x8)[$r0] = $r1;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f401b100),        //compw.le $r0 = $r0, 4 (0x4);;
     _32(0x0c7ffa00),        //cb.wnez $r0? 16834 <epic_init_ring+0x14>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x6100ff00),        //addd $r0 = $r0, -4 (0xfffffffc);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x6004000a),        //make $r1 = 10 (0xa);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601170c),        //sw 92 (0x5c)[$r12] = $r0;;
     _32(0x10000010),        //goto 1691c <main+0x54>;;
     _32(0x3400170c),        //lws $r0 = 92 (0x5c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x6104180c),        //addd $r1 = $r12, 96 (0x60);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x2605f000),        //sw -64 (0xffffffc0)[$r0] = $r1;;
     _32(0x3400170c),        //lws $r0 = 92 (0x5c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x6104180c),        //addd $r1 = $r12, 96 (0x60);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x60040005),        //make $r1 = 5 (0x5);;
     _32(0x2605f800),        //sw -32 (0xffffffe0)[$r0] = $r1;;
     _32(0x3000170c),        //lwz $r0 = 92 (0x5c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601170c),        //sw 92 (0x5c)[$r12] = $r0;;
     _32(0x3000170c),        //lwz $r0 = 92 (0x5c)[$r12];;
     _64(0x00000000f401b100),        //compw.le $r0 = $r0, 4 (0x4);;
     _32(0x0c7ffb80),        //cb.wnez $r0? 168e0 <main+0x18>;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x61000e0c),        //addd $r0 = $r12, 56 (0x38);;
     _32(0x1fffffba),        //call 16820 <epic_init_ring>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601170c),        //sw 92 (0x5c)[$r12] = $r0;;
     _32(0x10000019),        //goto 169a8 <main+0xe0>;;
     _32(0x3400170c),        //lws $r0 = 92 (0x5c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x6104180c),        //addd $r1 = $r12, 96 (0x60);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3004f000),        //lwz $r1 = -64 (0xffffffc0)[$r0];;
     _96(0x00000000800000f8e0080200),        //make $r2 = 253960 (0x3e008);;
     _32(0x3400170c),        //lws $r0 = 92 (0x5c)[$r12];;
     _32(0x3002f002),        //lwz.xs $r0 = $r0[$r2];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16980 <main+0xb8>;;
     _32(0x18000015),        //call 169d0 <abort>;;
     _32(0x3400170c),        //lws $r0 = 92 (0x5c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x6104180c),        //addd $r1 = $r12, 96 (0x60);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3000f800),        //lwz $r0 = -32 (0xffffffe0)[$r0];;
     _32(0x08800080),        //cb.deqz $r0? 1699c <main+0xd4>;;
     _32(0x1800000e),        //call 169d0 <abort>;;
     _32(0x3000170c),        //lwz $r0 = 92 (0x5c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601170c),        //sw 92 (0x5c)[$r12] = $r0;;
     _32(0x3000170c),        //lwz $r0 = 92 (0x5c)[$r12];;
     _64(0x00000000f401b100),        //compw.le $r0 = $r0, 4 (0x4);;
     _32(0x0c7ff940),        //cb.wnez $r0? 16948 <main+0x80>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16da8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 188d8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100011001000; //0x168c8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(epic_init_ring, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100011001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100111010000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
