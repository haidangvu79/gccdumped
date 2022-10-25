// executing pr45034.c.out.dumped test 
val k1_pr45034.c.out.dumped: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pr45034.c.out.dumped() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let fixnum_neg: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x2709020c),        //sd 8 (0x8)[$r12] = $r2;;
     _32(0x2401060c),        //sb 24 (0x18)[$r12] = $r0;;
     _32(0x2000060c),        //lbz $r0 = 24 (0x18)[$r12];;
     _32(0x240107cc),        //sb 31 (0x1f)[$r12] = $r0;;
     _32(0x200007cc),        //lbz $r0 = 31 (0x1f)[$r12];;
     _32(0x75000000),        //negw $r0 = $r0;;
     _32(0x2401078c),        //sb 30 (0x1e)[$r12] = $r0;;
     _32(0x2004078c),        //lbz $r1 = 30 (0x1e)[$r12];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _32(0x2400060c),        //lbs $r0 = 24 (0x18)[$r12];;
     _64(0x07fffffcf101b000),        //compw.eq $r0 = $r0, 4294967168 (0xffffff80);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let foo: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x2609020c),        //sw 8 (0x8)[$r12] = $r2;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _64(0x07fffffcf201b000),        //compw.lt $r0 = $r0, 4294967168 (0xffffff80);;
     _32(0x0c000140),        //cb.wnez $r0? 168b0 <foo+0x38>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _64(0x00000003f401b7c0),        //compw.le $r0 = $r0, 127 (0x7f);;
     _32(0x0c000080),        //cb.wnez $r0? 168b4 <foo+0x3c>;;
     _32(0x18000046),        //call 169c8 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let test_neg: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x6000ff80),        //make $r0 = -128 (0xffffff80);;
     _32(0x240107cc),        //sb 31 (0x1f)[$r12] = $r0;;
     _32(0x240007cc),        //lbs $r0 = 31 (0x1f)[$r12];;
     _32(0x780cffc0),        //zxwd $r3 = $r0;;
     _32(0x6104020c),        //addd $r1 = $r12, 8 (0x8);;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x7a000003),        //copyw $r0 = $r3;;
     _32(0x1fffffc8),        //call 16820 <fixnum_neg>;;
     _32(0x240007cc),        //lbs $r0 = 31 (0x1f)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x2004040c),        //lbz $r1 = 16 (0x10)[$r12];;
     _32(0x68077001),        //sxbd $r1 = $r1;;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0x3008020c),        //lwz $r2 = 8 (0x8)[$r12];;
     _32(0x1fffffd7),        //call 16878 <foo>;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x08800140),        //cb.deqz $r0? 16938 <test_neg+0x70>;;
     _32(0x240007cc),        //lbs $r0 = 31 (0x1f)[$r12];;
     _64(0x07fffffcf001b000),        //compw.ne $r0 = $r0, 4294967168 (0xffffff80);;
     _32(0x0c0001c0),        //cb.wnez $r0? 16950 <test_neg+0x88>;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x08000200),        //cb.dnez $r0? 1695c <test_neg+0x94>;;
     _32(0x240007cc),        //lbs $r0 = 31 (0x1f)[$r12];;
     _64(0x07fffffcf001b000),        //compw.ne $r0 = $r0, 4294967168 (0xffffff80);;
     _32(0x0c000100),        //cb.wnez $r0? 1695c <test_neg+0x94>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x240007cc),        //lbs $r0 = 31 (0x1f)[$r12];;
     _64(0x00000003f001b7c0),        //compw.ne $r0 = $r0, 127 (0x7f);;
     _32(0x0c800180),        //cb.weqz $r0? 16980 <test_neg+0xb8>;;
     _32(0x200007cc),        //lbz $r0 = 31 (0x1f)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x240107cc),        //sb 31 (0x1f)[$r12] = $r0;;
     _32(0x17ffffda),        //goto 168e4 <test_neg+0x1c>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1fffffc9),        //call 168c8 <test_neg>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 169b4 <main+0x1c>;;
     _32(0x18000006),        //call 169c8 <abort>;;
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
     _32(0x980000f3),        //call 16da0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 188d0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100110011000; //0x16998
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fixnum_neg, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100001111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test_neg, 0b00010110100011001000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100110011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100111001000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
