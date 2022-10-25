// executing pr84524.c.out.dumped test 
val k1_pr84524.c.out.dumped: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pr84524.c.out.dumped() = {
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
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2501078c),        //sh 30 (0x1e)[$r12] = $r0;;
     _32(0x10000027),        //goto 168cc <foo+0xac>;;
     _32(0x2800078c),        //lhz $r0 = 30 (0x1e)[$r12];;
     _32(0x79023200),        //sllw $r0 = $r0, 8 (0x8);;
     _32(0x2501070c),        //sh 28 (0x1c)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x240106cc),        //sb 27 (0x1b)[$r12] = $r0;;
     _32(0x10000014),        //goto 16898 <foo+0x78>;;
     _32(0x2800070c),        //lhz $r0 = 28 (0x1c)[$r12];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x0d8002c0),        //cb.wgez $r0? 16880 <foo+0x60>;;
     _32(0x2800070c),        //lhz $r0 = 28 (0x1c)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _64(0x00000004fc000840),        //xorw $r0 = $r0, 4129 (0x1021);;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x2501070c),        //sh 28 (0x1c)[$r12] = $r0;;
     _32(0x10000004),        //goto 1688c <foo+0x6c>;;
     _32(0x2800070c),        //lhz $r0 = 28 (0x1c)[$r12];;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x2501070c),        //sh 28 (0x1c)[$r12] = $r0;;
     _32(0x200006cc),        //lbz $r0 = 27 (0x1b)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x240106cc),        //sb 27 (0x1b)[$r12] = $r0;;
     _32(0x200006cc),        //lbz $r0 = 27 (0x1b)[$r12];;
     _64(0x00000000f801b1c0),        //compw.leu $r0 = $r0, 7 (0x7);;
     _32(0x0c7ffa80),        //cb.wnez $r0? 1684c <foo+0x2c>;;
     _32(0x2800078c),        //lhz $r0 = 30 (0x1e)[$r12];;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x2804070c),        //lhz $r1 = 28 (0x1c)[$r12];;
     _32(0x25050000),        //sh 0 (0x0)[$r0] = $r1;;
     _32(0x2800078c),        //lhz $r0 = 30 (0x1e)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2501078c),        //sh 30 (0x1e)[$r12] = $r0;;
     _32(0x2800078c),        //lhz $r0 = 30 (0x1e)[$r12];;
     _64(0x00000007f801b7c0),        //compw.leu $r0 = $r0, 255 (0xff);;
     _32(0x0c7ff5c0),        //cb.wnez $r0? 16834 <foo+0x14>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _64(0x07ffffffe130780c),        //addd $r12 = $r12, -544 (0xfffffffffffffde0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _32(0x1fffffc7),        //call 16820 <foo>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000a601870c),        //sw 540 (0x21c)[$r12] = $r0;;
     _32(0x10000040),        //goto 16a14 <main+0x124>;;
     _64(0x18000000b000870c),        //lwz $r0 = 540 (0x21c)[$r12];;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x79023200),        //sllw $r0 = $r0, 8 (0x8);;
     _64(0x18000000a501868c),        //sh 538 (0x21a)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000a601850c),        //sw 532 (0x214)[$r12] = $r0;;
     _32(0x1000001f),        //goto 169b8 <main+0xc8>;;
     _64(0x18000000a800868c),        //lhz $r0 = 538 (0x21a)[$r12];;
     _64(0x18000000a501868c),        //sh 538 (0x21a)[$r12] = $r0;;
     _64(0x18000000a800868c),        //lhz $r0 = 538 (0x21a)[$r12];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x0d800340),        //cb.wgez $r0? 16990 <main+0xa0>;;
     _64(0x18000000a800868c),        //lhz $r0 = 538 (0x21a)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _64(0x00000004fc000840),        //xorw $r0 = $r0, 4129 (0x1021);;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _64(0x18000000a501868c),        //sh 538 (0x21a)[$r12] = $r0;;
     _32(0x10000006),        //goto 169a4 <main+0xb4>;;
     _64(0x18000000a800868c),        //lhz $r0 = 538 (0x21a)[$r12];;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _64(0x18000000a501868c),        //sh 538 (0x21a)[$r12] = $r0;;
     _64(0x18000000b000850c),        //lwz $r0 = 532 (0x214)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _64(0x18000000a601850c),        //sw 532 (0x214)[$r12] = $r0;;
     _64(0x18000000b000850c),        //lwz $r0 = 532 (0x214)[$r12];;
     _64(0x00000000f401b1c0),        //compw.le $r0 = $r0, 7 (0x7);;
     _32(0x0c7ff780),        //cb.wnez $r0? 16940 <main+0x50>;;
     _64(0x18000000b400870c),        //lws $r0 = 540 (0x21c)[$r12];;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _64(0x00000000e104880c),        //addd $r1 = $r12, 544 (0x220);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _64(0x1fffffffa8007c00),        //lhz $r0 = -528 (0xfffffffffffffdf0)[$r0];;
     _64(0x18000000a804868c),        //lhz $r1 = 538 (0x21a)[$r12];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16a00 <main+0x110>;;
     _32(0x18000011),        //call 16a40 <abort>;;
     _64(0x18000000b000870c),        //lwz $r0 = 540 (0x21c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _64(0x18000000a601870c),        //sw 540 (0x21c)[$r12] = $r0;;
     _64(0x18000000b000870c),        //lwz $r0 = 540 (0x21c)[$r12];;
     _64(0x00000007f401b7c0),        //compw.le $r0 = $r0, 255 (0xff);;
     _32(0x0c7fef40),        //cb.wnez $r0? 16918 <main+0x28>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _64(0x00000000e130880c),        //addd $r12 = $r12, 544 (0x220);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16e18 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18948 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100011110000; //0x168f0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100011110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101001000000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
