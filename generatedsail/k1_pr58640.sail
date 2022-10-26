// executing pr58640 test 
val k1_pr58640: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pr58640() = {
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
     _96(0x0000000080000117e0002a00),        //make $r0 = 285864 (0x45ca8);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000005d),        //goto 169b4 <foo+0x194>;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x08801040),        //cb.deqz $r0? 16958 <foo+0x138>;;
     _96(0x0000000080000117e0002800),        //make $r0 = 285856 (0x45ca0);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x10000033),        //goto 16938 <foo+0x118>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000020),        //goto 168f8 <foo+0xd8>;;
     _96(0x0000000080000117e0002c00),        //make $r0 = 285872 (0x45cb0);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x10000010),        //goto 168d0 <foo+0xb0>;;
     _96(0x0000000080000117e0042a00),        //make $r1 = 285864 (0x45ca8);;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x26010001),        //sw 0 (0x0)[$r1] = $r0;;
     _96(0x0000000080000117e0002c00),        //make $r0 = 285872 (0x45cb0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000117e0002c00),        //make $r0 = 285872 (0x45cb0);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0002c00),        //make $r0 = 285872 (0x45cb0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x0e7ffb40),        //cb.wlez $r0? 16894 <foo+0x74>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x0c000240),        //cb.wnez $r0? 1690c <foo+0xec>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f401b080),        //compw.le $r0 = $r0, 2 (0x2);;
     _32(0x0c7ff780),        //cb.wnez $r0? 1687c <foo+0x5c>;;
     _32(0x10000002),        //goto 16910 <foo+0xf0>;;
     _32(0x7f03f000),        //nop ;;
     _96(0x0000000080000117e0002800),        //make $r0 = 285856 (0x45ca0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000117e0002800),        //make $r0 = 285856 (0x45ca0);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0002800),        //make $r0 = 285856 (0x45ca0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000000f401b0c0),        //compw.le $r0 = $r0, 3 (0x3);;
     _32(0x0c7ff200),        //cb.wnez $r0? 16870 <foo+0x50>;;
     _32(0x1000000e),        //goto 1698c <foo+0x16c>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x0c800300),        //cb.weqz $r0? 1698c <foo+0x16c>;;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x10000003),        //goto 16994 <foo+0x174>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000000e),        //goto 169c8 <foo+0x1a8>;;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x0e7fea00),        //cb.wlez $r0? 16844 <foo+0x24>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f401b080),        //compw.le $r0 = $r0, 2 (0x2);;
     _32(0x0c7ffd40),        //cb.wnez $r0? 16994 <foo+0x174>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1fffff91),        //call 16820 <foo>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000001)        //call 169e8 <exit>;;
 |];

let exit_: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0xf838ffc0),        //zxwd $r14 = $r0
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x9800004d),        //call 16b30 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16a24 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x980002e5),        //call 175b8 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100111010000; //0x169d0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100111010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100111101000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
