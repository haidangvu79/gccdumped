// executing 20050502_1.c.out.dumped test 
val k1_20050502_1.c.out.dumped: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20050502_1.c.out.dumped() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let bar: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x61080040),        //addd $r2 = $r0, 1 (0x1);;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x27090001),        //sd 0 (0x0)[$r1] = $r2;;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let baz: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000002f001b000),        //compw.ne $r0 = $r0, 64 (0x40);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let foo: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x27050a0c),        //sd 40 (0x28)[$r12] = $r1;;
     _32(0x7a000002),        //copyw $r0 = $r2;;
     _32(0x7a040003),        //copyw $r1 = $r3;;
     _32(0x2401080c),        //sb 32 (0x20)[$r12] = $r0;;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x2401060c),        //sb 24 (0x18)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x1fffffdf),        //call 16820 <bar>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x24010fcc),        //sb 63 (0x3f)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _32(0x71040040),        //addw $r1 = $r0, 1 (0x1);;
     _32(0x26050e0c),        //sw 56 (0x38)[$r12] = $r1;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x38040a0c),        //ld $r1 = 40 (0x28)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x20040fcc),        //lbz $r1 = 63 (0x3f)[$r12];;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x1fffffd1),        //call 16820 <bar>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x24010fcc),        //sb 63 (0x3f)[$r12] = $r0;;
     _32(0x2000080c),        //lbz $r0 = 32 (0x20)[$r12];;
     _32(0x0c800140),        //cb.weqz $r0? 16900 <foo+0x88>;;
     _32(0x24000fcc),        //lbs $r0 = 63 (0x3f)[$r12];;
     _64(0x00000001f001b1c0),        //compw.ne $r0 = $r0, 39 (0x27);;
     _32(0x0c800540),        //cb.weqz $r0? 16950 <foo+0xd8>;;
     _32(0x2000060c),        //lbz $r0 = 24 (0x18)[$r12];;
     _32(0x0c800140),        //cb.weqz $r0? 16918 <foo+0xa0>;;
     _32(0x24000fcc),        //lbs $r0 = 63 (0x3f)[$r12];;
     _64(0x00000001f001b080),        //compw.ne $r0 = $r0, 34 (0x22);;
     _32(0x0c800440),        //cb.weqz $r0? 16958 <foo+0xe0>;;
     _32(0x2000080c),        //lbz $r0 = 32 (0x20)[$r12];;
     _32(0x7c000040),        //xorw $r0 = $r0, 1 (0x1);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x08fff940),        //cb.deqz $r0? 168b8 <foo+0x40>;;
     _32(0x2000060c),        //lbz $r0 = 24 (0x18)[$r12];;
     _32(0x7c000040),        //xorw $r0 = $r0, 1 (0x1);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x08fff840),        //cb.deqz $r0? 168b8 <foo+0x40>;;
     _32(0x24000fcc),        //lbs $r0 = 63 (0x3f)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffffc4),        //call 16850 <baz>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800180),        //cb.deqz $r0? 16960 <foo+0xe8>;;
     _32(0x17ffffdb),        //goto 168b8 <foo+0x40>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x10000004),        //goto 16964 <foo+0xec>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x10000002),        //goto 16964 <foo+0xec>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x34000e0c),        //lws $r0 = 56 (0x38)[$r12];;
     _32(0x38040a0c),        //ld $r1 = 40 (0x28)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x6104080c),        //addd $r1 = $r12, 32 (0x20);;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0x60080001),        //make $r2 = 1 (0x1);;
     _32(0x1fffffaf),        //call 16878 <foo>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _96(0x00000000800000fce004f400),        //make $r1 = 259024 (0x3f3d0);;
     _32(0x180001cc),        //call 17100 <strcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000200),        //cb.dnez $r0? 169f8 <main+0x68>;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _96(0x00000000800000fce004f600),        //make $r1 = 259032 (0x3f3d8);;
     _32(0x180001c5),        //call 17100 <strcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 169fc <main+0x6c>;;
     _32(0x18000066),        //call 16b90 <abort>;;
     _96(0x00000000800000fce000f800),        //make $r0 = 259040 (0x3f3e0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x6104080c),        //addd $r1 = $r12, 32 (0x20);;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x600c0001),        //make $r3 = 1 (0x1);;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x1fffff97),        //call 16878 <foo>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _96(0x00000000800000fce004fc00),        //make $r1 = 259056 (0x3f3f0);;
     _32(0x180001b4),        //call 17100 <strcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000200),        //cb.dnez $r0? 16a58 <main+0xc8>;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _96(0x00000000800000fce004fe00),        //make $r1 = 259064 (0x3f3f8);;
     _32(0x180001ad),        //call 17100 <strcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16a5c <main+0xcc>;;
     _32(0x1800004e),        //call 16b90 <abort>;;
     _96(0x00000000800000fde0000000),        //make $r0 = 259072 (0x3f400);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x6104080c),        //addd $r1 = $r12, 32 (0x20);;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x600c0001),        //make $r3 = 1 (0x1);;
     _32(0x60080001),        //make $r2 = 1 (0x1);;
     _32(0x1fffff7f),        //call 16878 <foo>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _96(0x00000000800000fde0040400),        //make $r1 = 259088 (0x3f410);;
     _32(0x1800019c),        //call 17100 <strcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000200),        //cb.dnez $r0? 16ab8 <main+0x128>;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _96(0x00000000800000fde0040600),        //make $r1 = 259096 (0x3f418);;
     _32(0x18000195),        //call 17100 <strcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16abc <main+0x12c>;;
     _32(0x18000036),        //call 16b90 <abort>;;
     _96(0x00000000800000fde0000800),        //make $r0 = 259104 (0x3f420);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x6104080c),        //addd $r1 = $r12, 32 (0x20);;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x600c0001),        //make $r3 = 1 (0x1);;
     _32(0x60080001),        //make $r2 = 1 (0x1);;
     _32(0x1fffff67),        //call 16878 <foo>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _96(0x00000000800000fde0040c00),        //make $r1 = 259120 (0x3f430);;
     _32(0x18000184),        //call 17100 <strcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000200),        //cb.dnez $r0? 16b18 <main+0x188>;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _96(0x00000000800000fde0040e00),        //make $r1 = 259128 (0x3f438);;
     _32(0x1800017d),        //call 17100 <strcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16b1c <main+0x18c>;;
     _32(0x1800001e),        //call 16b90 <abort>;;
     _96(0x00000000800000fde0001000),        //make $r0 = 259136 (0x3f440);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x6104080c),        //addd $r1 = $r12, 32 (0x20);;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x1fffff4f),        //call 16878 <foo>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _96(0x00000000800000fde0041400),        //make $r1 = 259152 (0x3f450);;
     _32(0x1800016c),        //call 17100 <strcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000200),        //cb.dnez $r0? 16b78 <main+0x1e8>;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _96(0x00000000800000fde0041600),        //make $r1 = 259160 (0x3f458);;
     _32(0x18000165),        //call 17100 <strcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16b7c <main+0x1ec>;;
     _32(0x18000006),        //call 16b90 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16f68 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007ed),        //call 18b58 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100110010000; //0x16990
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(baz, 0b00010110100001010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100001111000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100110010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101110010000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
