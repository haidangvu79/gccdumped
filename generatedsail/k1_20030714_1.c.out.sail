// executing 20030714_1.c.out.dumped test 
val k1_20030714_1.: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20030714_1.() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let RenderBox_setStyle: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2705020c),        //sd 8 (0x8)[$r12] = $r1;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x30000600),        //lwz $r0 = 24 (0x18)[$r0];;
     _32(0x65034500),        //extfz $r0 = $r0, 20 (0x14), 20 (0x14);;
     _32(0x24010dcc),        //sb 55 (0x37)[$r12] = $r0;;
     _32(0x20000dcc),        //lbz $r0 = 55 (0x37)[$r12];;
     _32(0x24010d8c),        //sb 54 (0x36)[$r12] = $r0;;
     _32(0x3804020c),        //ld $r1 = 8 (0x8)[$r12];;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x18000053),        //call 169a8 <RenderObject_setStyle>;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x65032440),        //extfz $r0 = $r0, 18 (0x12), 17 (0x11);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x26010c0c),        //sw 48 (0x30)[$r12] = $r0;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _32(0x7100ff80),        //addw $r0 = $r0, -2 (0xfffffffe);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f901b040),        //compw.gtu $r0 = $r0, 1 (0x1);;
     _32(0x0c000240),        //cb.wnez $r0? 168ac <RenderBox_setStyle+0x8c>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x24010bcc),        //sb 47 (0x2f)[$r12] = $r0;;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x28000681),        //lhz $r0 = 26 (0x1a)[$r1];;
     _32(0x20080bcc),        //lbz $r2 = 47 (0x2f)[$r12];;
     _32(0x60034102),        //insf $r0 = $r2, 4 (0x4), 4 (0x4);;
     _32(0x25010681),        //sh 26 (0x1a)[$r1] = $r0;;
     _32(0x1000003b),        //goto 16994 <RenderBox_setStyle+0x174>;;
     _32(0x20000d8c),        //lbz $r0 = 54 (0x36)[$r12];;
     _32(0x0c800280),        //cb.weqz $r0? 168d8 <RenderBox_setStyle+0xb8>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x24010b8c),        //sb 46 (0x2e)[$r12] = $r0;;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x28000681),        //lhz $r0 = 26 (0x1a)[$r1];;
     _32(0x20080b8c),        //lbz $r2 = 46 (0x2e)[$r12];;
     _32(0x60034102),        //insf $r0 = $r2, 4 (0x4), 4 (0x4);;
     _32(0x25010681),        //sh 26 (0x1a)[$r1] = $r0;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x1800003b),        //call 169c0 <removeFromSpecialObjects>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x24010b4c),        //sb 45 (0x2d)[$r12] = $r0;;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x28000681),        //lhz $r0 = 26 (0x1a)[$r1];;
     _32(0x20080b4c),        //lbz $r2 = 45 (0x2d)[$r12];;
     _32(0x60034102),        //insf $r0 = $r2, 4 (0x4), 4 (0x4);;
     _32(0x25010681),        //sh 26 (0x1a)[$r1] = $r0;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x650344c0),        //extfz $r0 = $r0, 20 (0x14), 19 (0x13);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x26010a0c),        //sw 40 (0x28)[$r12] = $r0;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x38040800),        //ld $r1 = 32 (0x20)[$r0];;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7c000040),        //xorw $r0 = $r0, 1 (0x1);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x088002c0),        //cb.deqz $r0? 16950 <RenderBox_setStyle+0x130>;;
     _32(0x30000a0c),        //lwz $r0 = 40 (0x28)[$r12];;
     _32(0x0c800240),        //cb.weqz $r0? 16950 <RenderBox_setStyle+0x130>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x240109cc),        //sb 39 (0x27)[$r12] = $r0;;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x28000681),        //lhz $r0 = 26 (0x1a)[$r1];;
     _32(0x200809cc),        //lbz $r2 = 39 (0x27)[$r12];;
     _32(0x600330c2),        //insf $r0 = $r2, 3 (0x3), 3 (0x3);;
     _32(0x25010681),        //sh 26 (0x1a)[$r1] = $r0;;
     _32(0x10000012),        //goto 16994 <RenderBox_setStyle+0x174>;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x65032440),        //extfz $r0 = $r0, 18 (0x12), 17 (0x11);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x2601080c),        //sw 32 (0x20)[$r12] = $r0;;
     _32(0x3000080c),        //lwz $r0 = 32 (0x20)[$r12];;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c000240),        //cb.wnez $r0? 16994 <RenderBox_setStyle+0x174>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x240107cc),        //sb 31 (0x1f)[$r12] = $r0;;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x28000681),        //lhz $r0 = 26 (0x1a)[$r1];;
     _32(0x200807cc),        //lbz $r2 = 31 (0x1f)[$r12];;
     _32(0x60036182),        //insf $r0 = $r2, 6 (0x6), 6 (0x6);;
     _32(0x25010681),        //sh 26 (0x1a)[$r1] = $r0;;
     _32(0x10000001),        //goto 16994 <RenderBox_setStyle+0x174>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let RenderObject_setStyle: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let removeFromSpecialObjects: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let RenderBox_isTableCell: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _96(0x0000000080000117e0042400),        //make $r1 = 285840 (0x45c90);;
     _32(0x28000681),        //lhz $r0 = 26 (0x1a)[$r1];;
     _32(0x60036182),        //insf $r0 = $r2, 6 (0x6), 6 (0x6);;
     _32(0x25010681),        //sh 26 (0x1a)[$r1] = $r0;;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _96(0x0000000080000117e0042400),        //make $r1 = 285840 (0x45c90);;
     _32(0x28000681),        //lhz $r0 = 26 (0x1a)[$r1];;
     _32(0x60034102),        //insf $r0 = $r2, 4 (0x4), 4 (0x4);;
     _32(0x25010681),        //sh 26 (0x1a)[$r1] = $r0;;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _96(0x0000000080000117e0042400),        //make $r1 = 285840 (0x45c90);;
     _32(0x28000681),        //lhz $r0 = 26 (0x1a)[$r1];;
     _32(0x600330c2),        //insf $r0 = $r2, 3 (0x3), 3 (0x3);;
     _32(0x25010681),        //sh 26 (0x1a)[$r1] = $r0;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _96(0x000000008000005ae0047600),        //make $r1 = 92632 (0x169d8);;
     _32(0x27050800),        //sd 32 (0x20)[$r0] = $r1;;
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _32(0x30000001),        //lwz $r0 = 0 (0x0)[$r1];;
     _32(0x60080003),        //make $r2 = 3 (0x3);;
     _32(0x61032442),        //insf $r0 = $r2, 18 (0x12), 17 (0x11);;
     _32(0x26010001),        //sw 0 (0x0)[$r1] = $r0;;
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _32(0x30000001),        //lwz $r0 = 0 (0x0)[$r1];;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x610344c2),        //insf $r0 = $r2, 20 (0x14), 19 (0x13);;
     _32(0x26010001),        //sw 0 (0x0)[$r1] = $r0;;
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x1fffff59),        //call 16820 <RenderBox_setStyle>;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x30000600),        //lwz $r0 = 24 (0x18)[$r0];;
     _32(0x65034500),        //extfz $r0 = $r0, 20 (0x14), 20 (0x14);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x7101b040),        //compw.eq $r0 = $r0, $r1;;
     _32(0x0c000080),        //cb.wnez $r0? 16ae8 <main+0xf8>;;
     _32(0x18000017),        //call 16b40 <abort>;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x30000600),        //lwz $r0 = 24 (0x18)[$r0];;
     _32(0x65036580),        //extfz $r0 = $r0, 22 (0x16), 22 (0x16);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x7101b040),        //compw.eq $r0 = $r0, $r1;;
     _32(0x0c000080),        //cb.wnez $r0? 16b10 <main+0x120>;;
     _32(0x1800000d),        //call 16b40 <abort>;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x30000600),        //lwz $r0 = 24 (0x18)[$r0];;
     _32(0x650334c0),        //extfz $r0 = $r0, 19 (0x13), 19 (0x13);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x7101b040),        //compw.eq $r0 = $r0, $r1;;
     _32(0x0c000080),        //cb.wnez $r0? 16b38 <main+0x148>;;
     _32(0x18000003),        //call 16b40 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16b60 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16f60 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18c38 <_exit>
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
     _32(0x98000161),        //call 170f8 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f400),        //make $r0 = 259024 (0x3f3d0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16b9c <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18c38 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100111110000; //0x169f0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(RenderBox_setStyle, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(RenderObject_setStyle, 0b00010110100110101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(removeFromSpecialObjects, 0b00010110100111000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(RenderBox_isTableCell, 0b00010110100111011000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100111110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101101000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit, 0b00010110101101100000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
