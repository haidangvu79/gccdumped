// executing 20020510_1.c.out.dumped test 
val k1_20020510_1.: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20020510_1.() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let testc: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x2401060c),        //sb 24 (0x18)[$r12] = $r0;;
     _32(0x2000060c),        //lbz $r0 = 24 (0x18)[$r12];;
     _32(0x0c8001c0),        //cb.weqz $r0? 16854 <testc+0x34>;;
     _32(0x2000060c),        //lbz $r0 = 24 (0x18)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x0d000100),        //cb.wltz $r0? 16854 <testc+0x34>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x0c000140),        //cb.wnez $r0? 16860 <testc+0x40>;;
     _32(0x18000094),        //call 16aa0 <abort>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x0c800080),        //cb.weqz $r0? 16860 <testc+0x40>;;
     _32(0x18000091),        //call 16aa0 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let tests: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x2501060c),        //sh 24 (0x18)[$r12] = $r0;;
     _32(0x2800060c),        //lhz $r0 = 24 (0x18)[$r12];;
     _32(0x0c8001c0),        //cb.weqz $r0? 168ac <tests+0x34>;;
     _32(0x2800060c),        //lhz $r0 = 24 (0x18)[$r12];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x0d000100),        //cb.wltz $r0? 168ac <tests+0x34>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x0c000140),        //cb.wnez $r0? 168b8 <tests+0x40>;;
     _32(0x1800007e),        //call 16aa0 <abort>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x0c800080),        //cb.weqz $r0? 168b8 <tests+0x40>;;
     _32(0x1800007b),        //call 16aa0 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let testi: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0c800180),        //cb.weqz $r0? 16900 <testi+0x30>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0d000100),        //cb.wltz $r0? 16900 <testi+0x30>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x0c000140),        //cb.wnez $r0? 1690c <testi+0x3c>;;
     _32(0x18000069),        //call 16aa0 <abort>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x0c800080),        //cb.weqz $r0? 1690c <testi+0x3c>;;
     _32(0x18000066),        //call 16aa0 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let testl: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x08800180),        //cb.deqz $r0? 16950 <testl+0x30>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x09000100),        //cb.dltz $r0? 16950 <testl+0x30>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x0c000140),        //cb.wnez $r0? 1695c <testl+0x3c>;;
     _32(0x18000055),        //call 16aa0 <abort>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x0c800080),        //cb.weqz $r0? 1695c <testl+0x3c>;;
     _32(0x18000052),        //call 16aa0 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffa7),        //call 16820 <testc>;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffffa4),        //call 16820 <testc>;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x6000007f),        //make $r0 = 127 (0x7f);;
     _32(0x1fffffa1),        //call 16820 <testc>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x60000080),        //make $r0 = 128 (0x80);;
     _32(0x1fffff9e),        //call 16820 <testc>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x600000ff),        //make $r0 = 255 (0xff);;
     _32(0x1fffff9b),        //call 16820 <testc>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffae),        //call 16878 <tests>;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffffab),        //call 16878 <tests>;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x60007fff),        //make $r0 = 32767 (0x7fff);;
     _32(0x1fffffa8),        //call 16878 <tests>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _64(0x00000020e0000000),        //make $r0 = 32768 (0x8000);;
     _32(0x1fffffa4),        //call 16878 <tests>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _64(0x0000003fe000ffc0),        //make $r0 = 65535 (0xffff);;
     _32(0x1fffffa0),        //call 16878 <tests>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffb3),        //call 168d0 <testi>;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffffb0),        //call 168d0 <testi>;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _64(0x001fffffe000ffc0),        //make $r0 = 2147483647 (0x7fffffff);;
     _32(0x1fffffac),        //call 168d0 <testi>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _64(0x07e00000e000003f),        //make $r0 = -2147483648 (0xffffffff80000000);;
     _32(0x1fffffa8),        //call 168d0 <testi>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1fffffa5),        //call 168d0 <testi>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffb6),        //call 16920 <testl>;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffffb3),        //call 16920 <testl>;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _96(0x03ffffff87ffffffe000ffc0),        //make $r0 = 9223372036854775807 (0x7fffffffffffffff);;
     _32(0x1fffffae),        //call 16920 <testl>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _96(0x0400000080000000e0000000),        //make $r0 = 9223372036854775808 (0x8000000000000000);;
     _32(0x1fffffa9),        //call 16920 <testl>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1fffffa6),        //call 16920 <testl>;;
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
     _32(0x980000f3),        //call 16e78 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 189a8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100101110000; //0x16970
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(testc, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(tests, 0b00010110100001111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(testi, 0b00010110100011010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(testl, 0b00010110100100100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100101110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101010100000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
