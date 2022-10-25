// executing 20050713_1.c.out.dumped test 
val k1_20050713_1.: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20050713_1.() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo2: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x6110100c),        //addd $r4 = $r12, 64 (0x40);;
     _32(0x2801fc04),        //sq -16 (0xfffffff0)[$r4] = $r0r1;;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x2809f800),        //sq -32 (0xffffffe0)[$r0] = $r2r3;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _64(0x00000000f001b0c0),        //compw.ne $r0 = $r0, 3 (0x3);;
     _32(0x0c000240),        //cb.wnez $r0? 1686c <foo2+0x4c>;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _64(0x00000000f001b100),        //compw.ne $r0 = $r0, 4 (0x4);;
     _32(0x0c000140),        //cb.wnez $r0? 1686c <foo2+0x4c>;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _64(0x00000000f101b140),        //compw.eq $r0 = $r0, 5 (0x5);;
     _32(0x0c000080),        //cb.wnez $r0? 16870 <foo2+0x50>;;
     _32(0x1800009f),        //call 16ae8 <abort>;;
     _32(0x3000080c),        //lwz $r0 = 32 (0x20)[$r12];;
     _64(0x00000000f001b180),        //compw.ne $r0 = $r0, 6 (0x6);;
     _32(0x0c000240),        //cb.wnez $r0? 168a0 <foo2+0x80>;;
     _32(0x3000090c),        //lwz $r0 = 36 (0x24)[$r12];;
     _64(0x00000000f001b1c0),        //compw.ne $r0 = $r0, 7 (0x7);;
     _32(0x0c000140),        //cb.wnez $r0? 168a0 <foo2+0x80>;;
     _32(0x30000a0c),        //lwz $r0 = 40 (0x28)[$r12];;
     _64(0x00000000f101b200),        //compw.eq $r0 = $r0, 8 (0x8);;
     _32(0x0c000080),        //cb.wnez $r0? 168a4 <foo2+0x84>;;
     _32(0x18000092),        //call 16ae8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let foo3: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x6118100c),        //addd $r6 = $r12, 64 (0x40);;
     _32(0x2801fc06),        //sq -16 (0xfffffff0)[$r6] = $r0r1;;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x2809f800),        //sq -32 (0xffffffe0)[$r0] = $r2r3;;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x2811f400),        //sq -48 (0xffffffd0)[$r0] = $r4r5;;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x3c08f800),        //lq $r2r3 = -32 (0xffffffe0)[$r0];;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x3c00fc00),        //lq $r0r1 = -16 (0xfffffff0)[$r0];;
     _32(0x1fffffcd),        //call 16820 <foo2>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _64(0x00000000f001b240),        //compw.ne $r0 = $r0, 9 (0x9);;
     _32(0x0c000240),        //cb.wnez $r0? 16920 <foo3+0x68>;;
     _32(0x3000050c),        //lwz $r0 = 20 (0x14)[$r12];;
     _64(0x00000000f001b280),        //compw.ne $r0 = $r0, 10 (0xa);;
     _32(0x0c000140),        //cb.wnez $r0? 16920 <foo3+0x68>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f101b2c0),        //compw.eq $r0 = $r0, 11 (0xb);;
     _32(0x0c000080),        //cb.wnez $r0? 16924 <foo3+0x6c>;;
     _32(0x18000072),        //call 16ae8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let bar2: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x6110100c),        //addd $r4 = $r12, 64 (0x40);;
     _32(0x2801fc04),        //sq -16 (0xfffffff0)[$r4] = $r0r1;;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x2809f800),        //sq -32 (0xffffffe0)[$r0] = $r2r3;;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x3c08fc00),        //lq $r2r3 = -16 (0xfffffff0)[$r0];;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x3c00f800),        //lq $r0r1 = -32 (0xffffffe0)[$r0];;
     _32(0x1fffffaf),        //call 16820 <foo2>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let bar3: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x6118100c),        //addd $r6 = $r12, 64 (0x40);;
     _32(0x2801fc06),        //sq -16 (0xfffffff0)[$r6] = $r0r1;;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x2809f800),        //sq -32 (0xffffffe0)[$r0] = $r2r3;;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x2811f400),        //sq -48 (0xffffffd0)[$r0] = $r4r5;;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x3c10f400),        //lq $r4r5 = -48 (0xffffffd0)[$r0];;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x3c08fc00),        //lq $r2r3 = -16 (0xfffffff0)[$r0];;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x3c00f800),        //lq $r0r1 = -32 (0xffffffe0)[$r0];;
     _32(0x1fffffbf),        //call 168b8 <foo3>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let baz3: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x6118100c),        //addd $r6 = $r12, 64 (0x40);;
     _32(0x2801fc06),        //sq -16 (0xfffffff0)[$r6] = $r0r1;;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x2809f800),        //sq -32 (0xffffffe0)[$r0] = $r2r3;;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x2811f400),        //sq -48 (0xffffffd0)[$r0] = $r4r5;;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x3c10fc00),        //lq $r4r5 = -16 (0xfffffff0)[$r0];;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x3c08f400),        //lq $r2r3 = -48 (0xffffffd0)[$r0];;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x3c00f800),        //lq $r0r1 = -32 (0xffffffe0)[$r0];;
     _32(0x1fffffa9),        //call 168b8 <foo3>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x60000003),        //make $r0 = 3 (0x3);;
     _32(0x26010c0c),        //sw 48 (0x30)[$r12] = $r0;;
     _32(0x60000004),        //make $r0 = 4 (0x4);;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x2601080c),        //sw 32 (0x20)[$r12] = $r0;;
     _32(0x60000007),        //make $r0 = 7 (0x7);;
     _32(0x2601090c),        //sw 36 (0x24)[$r12] = $r0;;
     _32(0x60000008),        //make $r0 = 8 (0x8);;
     _32(0x26010a0c),        //sw 40 (0x28)[$r12] = $r0;;
     _32(0x60000009),        //make $r0 = 9 (0x9);;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x6000000a),        //make $r0 = 10 (0xa);;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x6000000b),        //make $r0 = 11 (0xb);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x3c08fc00),        //lq $r2r3 = -16 (0xfffffff0)[$r0];;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x3c00f800),        //lq $r0r1 = -32 (0xffffffe0)[$r0];;
     _32(0x1fffffa9),        //call 16938 <bar2>;;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x3c10f400),        //lq $r4r5 = -48 (0xffffffd0)[$r0];;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x3c08fc00),        //lq $r2r3 = -16 (0xfffffff0)[$r0];;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x3c00f800),        //lq $r0r1 = -32 (0xffffffe0)[$r0];;
     _32(0x1fffffb4),        //call 16980 <bar3>;;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x3c10f800),        //lq $r4r5 = -32 (0xffffffe0)[$r0];;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x3c08fc00),        //lq $r2r3 = -16 (0xfffffff0)[$r0];;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x3c00f400),        //lq $r0r1 = -48 (0xffffffd0)[$r0];;
     _32(0x1fffffc3),        //call 169d8 <baz3>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16ec0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 189f0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101000110000; //0x16a30
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo2, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo3, 0b00010110100010111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar2, 0b00010110100100111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar3, 0b00010110100110000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(baz3, 0b00010110100111011000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101000110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101011101000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
