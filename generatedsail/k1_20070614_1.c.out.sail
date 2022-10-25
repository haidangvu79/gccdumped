// executing 20070614_1.c.out.dumped test 
val k1_20070614_1.c.out.dumped: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20070614_1.c.out.dumped() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x27050a0c),        //sd 40 (0x28)[$r12] = $r1;;
     _32(0x2709060c),        //sd 24 (0x18)[$r12] = $r2;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _32(0x38080e0c),        //ld $r2 = 56 (0x38)[$r12];;
     _32(0x7b070042),        //fcompd.une $r1 = $r2, $r1;;
     _32(0x78043fc1),        //zxbd $r1 = $r1;;
     _32(0x38080c0c),        //ld $r2 = 48 (0x30)[$r12];;
     _32(0x7b030002),        //fcompd.une $r0 = $r2, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7a011001),        //orw $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16898 <foo+0x78>;;
     _32(0x18000043),        //call 169a0 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let bar: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _32(0x6a0c0001),        //copyd $r3 = $r1;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x6a000003),        //copyd $r0 = $r3;;
     _32(0x6a040002),        //copyd $r1 = $r2;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let baz: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000016),        //goto 16954 <baz+0x6c>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x48030000),        //floatw.rn $r0 = $r0, 0 (0x0);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x5e067040),        //fmulw $r1 = $r0, $r1;;
     _32(0x78073001),        //fwidenlwd $r1 = $r1;;
     _32(0x78033000),        //fwidenlwd $r0 = $r0;;
     _32(0x6a0c0001),        //copyd $r3 = $r1;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x6a000003),        //copyd $r0 = $r3;;
     _32(0x6a040002),        //copyd $r1 = $r2;;
     _32(0x1fffffe2),        //call 168b0 <bar>;;
     _32(0x6a100000),        //copyd $r4 = $r0;;
     _32(0x6a0c0001),        //copyd $r3 = $r1;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x6a000004),        //copyd $r0 = $r4;;
     _32(0x6a040003),        //copyd $r1 = $r3;;
     _32(0x1fffffb7),        //call 16820 <foo>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f401b140),        //compw.le $r0 = $r0, 5 (0x5);;
     _32(0x0c7ffa00),        //cb.wnez $r0? 16900 <baz+0x18>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1fffffd9),        //call 168e8 <baz>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16d78 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 188a8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100101111000; //0x16978
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100010110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(baz, 0b00010110100011101000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100101111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100110100000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
