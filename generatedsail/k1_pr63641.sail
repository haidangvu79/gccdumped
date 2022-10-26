// executing pr63641 test 
val k1_pr63641: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pr63641() = {
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
     _32(0x2401060c),        //sb 24 (0x18)[$r12] = $r0;;
     _32(0x2000060c),        //lbz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f901b200),        //compw.gtu $r0 = $r0, 8 (0x8);;
     _32(0x0c8005c0),        //cb.weqz $r0? 16890 <foo+0x70>;;
     _32(0x2000060c),        //lbz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f001b2c0),        //compw.ne $r0 = $r0, 11 (0xb);;
     _32(0x0c800540),        //cb.weqz $r0? 16898 <foo+0x78>;;
     _32(0x2000060c),        //lbz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f801b340),        //compw.leu $r0 = $r0, 13 (0xd);;
     _32(0x0c000140),        //cb.wnez $r0? 16868 <foo+0x48>;;
     _32(0x2000060c),        //lbz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f901b680),        //compw.gtu $r0 = $r0, 26 (0x1a);;
     _32(0x0c8003c0),        //cb.weqz $r0? 168a0 <foo+0x80>;;
     _32(0x2000060c),        //lbz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f801b6c0),        //compw.leu $r0 = $r0, 27 (0x1b);;
     _32(0x0c000140),        //cb.wnez $r0? 16888 <foo+0x68>;;
     _32(0x2000060c),        //lbz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f901b7c0),        //compw.gtu $r0 = $r0, 31 (0x1f);;
     _32(0x0c800240),        //cb.weqz $r0? 168a8 <foo+0x88>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000009),        //goto 168b0 <foo+0x90>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x10000006),        //goto 168ac <foo+0x8c>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x10000004),        //goto 168ac <foo+0x8c>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x10000002),        //goto 168ac <foo+0x8c>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let bar: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2401060c),        //sb 24 (0x18)[$r12] = $r0;;
     _32(0x2000060c),        //lbz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f901b200),        //compw.gtu $r0 = $r0, 8 (0x8);;
     _32(0x0c8005c0),        //cb.weqz $r0? 16928 <bar+0x70>;;
     _32(0x2000060c),        //lbz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f001b2c0),        //compw.ne $r0 = $r0, 11 (0xb);;
     _32(0x0c800540),        //cb.weqz $r0? 16930 <bar+0x78>;;
     _32(0x2000060c),        //lbz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f801b340),        //compw.leu $r0 = $r0, 13 (0xd);;
     _32(0x0c000140),        //cb.wnez $r0? 16900 <bar+0x48>;;
     _32(0x2000060c),        //lbz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f901b680),        //compw.gtu $r0 = $r0, 26 (0x1a);;
     _32(0x0c8003c0),        //cb.weqz $r0? 16938 <bar+0x80>;;
     _32(0x2000060c),        //lbz $r0 = 24 (0x18)[$r12];;
     _64(0x00000001f801b6c0),        //compw.leu $r0 = $r0, 59 (0x3b);;
     _32(0x0c000140),        //cb.wnez $r0? 16920 <bar+0x68>;;
     _32(0x2000060c),        //lbz $r0 = 24 (0x18)[$r12];;
     _64(0x00000001f901b7c0),        //compw.gtu $r0 = $r0, 63 (0x3f);;
     _32(0x0c800240),        //cb.weqz $r0? 16940 <bar+0x88>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000009),        //goto 16948 <bar+0x90>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x10000006),        //goto 16944 <bar+0x8c>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x10000004),        //goto 16944 <bar+0x8c>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x10000002),        //goto 16944 <bar+0x8c>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000019),        //goto 169c8 <main+0x78>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffffab),        //call 16820 <foo>;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f501b7c0),        //compw.gt $r0 = $r0, 31 (0x1f);;
     _32(0x0c000240),        //cb.wnez $r0? 169ac <main+0x5c>;;
     _96(0x00000000800000f8e0080200),        //make $r2 = 253960 (0x3e008);;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x2002e002),        //lbz $r0 = $r0[$r2];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x10000002),        //goto 169b0 <main+0x60>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x7101b040),        //compw.eq $r0 = $r0, $r1;;
     _32(0x0c000080),        //cb.wnez $r0? 169bc <main+0x6c>;;
     _32(0x1800002c),        //call 16a68 <abort>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000007f401b7c0),        //compw.le $r0 = $r0, 255 (0xff);;
     _32(0x0c7ff940),        //cb.wnez $r0? 16968 <main+0x18>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000019),        //goto 16a44 <main+0xf4>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffffb2),        //call 168b8 <bar>;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000001f501b7c0),        //compw.gt $r0 = $r0, 63 (0x3f);;
     _32(0x0c000240),        //cb.wnez $r0? 16a28 <main+0xd8>;;
     _96(0x00000000800000f8e0080a00),        //make $r2 = 253992 (0x3e028);;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x2002e002),        //lbz $r0 = $r0[$r2];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x10000002),        //goto 16a2c <main+0xdc>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x7101b040),        //compw.eq $r0 = $r0, $r1;;
     _32(0x0c000080),        //cb.wnez $r0? 16a38 <main+0xe8>;;
     _32(0x1800000d),        //call 16a68 <abort>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000007f401b7c0),        //compw.le $r0 = $r0, 255 (0xff);;
     _32(0x0c7ff940),        //cb.wnez $r0? 169e4 <main+0x94>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16e40 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18970 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100101010000; //0x16950
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100010111000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100101010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101001101000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
