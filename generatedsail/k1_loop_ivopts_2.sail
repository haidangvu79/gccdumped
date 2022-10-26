// executing loop_ivopts_2 test 
val k1_loop_ivopts_2: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_loop_ivopts_2() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let check: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000027),        //goto 168d4 <check+0xb4>;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000007f401b7c0),        //compw.le $r0 = $r0, 255 (0xff);;
     _32(0x0c000140),        //cb.wnez $r0? 16870 <check+0x50>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000008f401b5c0),        //compw.le $r0 = $r0, 279 (0x117);;
     _32(0x0c0000c0),        //cb.wnez $r0? 16878 <check+0x58>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x10000002),        //goto 1687c <check+0x5c>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x710001c0),        //addw $r0 = $r0, 7 (0x7);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3008070c),        //lwz $r2 = 28 (0x1c)[$r12];;
     _64(0x00000004f409b3c2),        //compw.le $r2 = $r2, 143 (0x8f);;
     _32(0x0c0001c2),        //cb.wnez $r2? 168ac <check+0x8c>;;
     _32(0x3008070c),        //lwz $r2 = 28 (0x1c)[$r12];;
     _64(0x00000007f509b7c2),        //compw.gt $r2 = $r2, 255 (0xff);;
     _32(0x0c0000c2),        //cb.wnez $r2? 168ac <check+0x8c>;;
     _32(0x60080001),        //make $r2 = 1 (0x1);;
     _32(0x10000002),        //goto 168b0 <check+0x90>;;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x71011002),        //addw $r0 = $r2, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 168c8 <check+0xa8>;;
     _32(0x1800006f),        //call 16a80 <abort>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000008f401b7c0),        //compw.le $r0 = $r0, 287 (0x11f);;
     _32(0x0c7ff5c0),        //cb.wnez $r0? 1683c <check+0x1c>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _64(0x07fffffee130d80c),        //addd $r12 = $r12, -1184 (0xfffffffffffffb60);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _64(0x18000001a601270c),        //sw 1180 (0x49c)[$r12] = $r0;;
     _32(0x1000000f),        //goto 16958 <main+0x58>;;
     _64(0x18000001b400270c),        //lws $r0 = 1180 (0x49c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _64(0x00000001e104280c),        //addd $r1 = $r12, 1184 (0x4a0);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x60040008),        //make $r1 = 8 (0x8);;
     _64(0x1ffffffea605de00),        //sw -1160 (0xfffffffffffffb78)[$r0] = $r1;;
     _64(0x18000001b000270c),        //lwz $r0 = 1180 (0x49c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _64(0x18000001a601270c),        //sw 1180 (0x49c)[$r12] = $r0;;
     _64(0x18000001b000270c),        //lwz $r0 = 1180 (0x49c)[$r12];;
     _64(0x00000004f401b3c0),        //compw.le $r0 = $r0, 143 (0x8f);;
     _32(0x0c7ffb80),        //cb.wnez $r0? 16920 <main+0x20>;;
     _32(0x1000000f),        //goto 169a8 <main+0xa8>;;
     _64(0x18000001b400270c),        //lws $r0 = 1180 (0x49c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _64(0x00000001e104280c),        //addd $r1 = $r12, 1184 (0x4a0);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x60040009),        //make $r1 = 9 (0x9);;
     _64(0x1ffffffea605de00),        //sw -1160 (0xfffffffffffffb78)[$r0] = $r1;;
     _64(0x18000001b000270c),        //lwz $r0 = 1180 (0x49c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _64(0x18000001a601270c),        //sw 1180 (0x49c)[$r12] = $r0;;
     _64(0x18000001b000270c),        //lwz $r0 = 1180 (0x49c)[$r12];;
     _64(0x00000007f401b7c0),        //compw.le $r0 = $r0, 255 (0xff);;
     _32(0x0c7ffb80),        //cb.wnez $r0? 16970 <main+0x70>;;
     _32(0x1000000f),        //goto 169f8 <main+0xf8>;;
     _64(0x18000001b400270c),        //lws $r0 = 1180 (0x49c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _64(0x00000001e104280c),        //addd $r1 = $r12, 1184 (0x4a0);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x60040007),        //make $r1 = 7 (0x7);;
     _64(0x1ffffffea605de00),        //sw -1160 (0xfffffffffffffb78)[$r0] = $r1;;
     _64(0x18000001b000270c),        //lwz $r0 = 1180 (0x49c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _64(0x18000001a601270c),        //sw 1180 (0x49c)[$r12] = $r0;;
     _64(0x18000001b000270c),        //lwz $r0 = 1180 (0x49c)[$r12];;
     _64(0x00000008f401b5c0),        //compw.le $r0 = $r0, 279 (0x117);;
     _32(0x0c7ffb80),        //cb.wnez $r0? 169c0 <main+0xc0>;;
     _32(0x1000000f),        //goto 16a48 <main+0x148>;;
     _64(0x18000001b400270c),        //lws $r0 = 1180 (0x49c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _64(0x00000001e104280c),        //addd $r1 = $r12, 1184 (0x4a0);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x60040008),        //make $r1 = 8 (0x8);;
     _64(0x1ffffffea605de00),        //sw -1160 (0xfffffffffffffb78)[$r0] = $r1;;
     _64(0x18000001b000270c),        //lwz $r0 = 1180 (0x49c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _64(0x18000001a601270c),        //sw 1180 (0x49c)[$r12] = $r0;;
     _64(0x18000001b000270c),        //lwz $r0 = 1180 (0x49c)[$r12];;
     _64(0x00000008f401b7c0),        //compw.le $r0 = $r0, 287 (0x11f);;
     _32(0x0c7ffb80),        //cb.wnez $r0? 16a10 <main+0x110>;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x1fffff70),        //call 16820 <check>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _64(0x00000001e130280c),        //addd $r12 = $r12, 1184 (0x4a0);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16e58 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18988 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100000000; //0x16900
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(check, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101010000000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
