// executing 20000818_1 test 
val k1_20000818_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20000818_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x18000005),        //call 16840 <yylex>;;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000044),        //call 16948 <exit>;;
     _32(0x7f03f000)        //nop ;;
 |];

let yylex: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x18000017),        //call 168a8 <input>;;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x18000016),        //call 168b0 <ISALNUM>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x088001c0),        //cb.deqz $r0? 1687c <yylex+0x3c>;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _32(0x1800002f),        //call 16930 <obstack_1grow>;;
     _32(0x17fffff5),        //goto 1684c <yylex+0xc>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000002f101b7c0),        //compw.eq $r0 = $r0, 95 (0x5f);;
     _32(0x0c800080),        //cb.weqz $r0? 16890 <yylex+0x50>;;
     _32(0x17fffff0),        //goto 1684c <yylex+0xc>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let input: list_I = 
 [|
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x0fd00000)        //ret ;;
 |];

let ISALNUM: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000002f401b000),        //compw.le $r0 = $r0, 64 (0x40);;
     _32(0x0c000140),        //cb.wnez $r0? 168d8 <ISALNUM+0x28>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000002f401b680),        //compw.le $r0 = $r0, 90 (0x5a);;
     _32(0x0c000440),        //cb.wnez $r0? 16918 <ISALNUM+0x68>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000003f401b000),        //compw.le $r0 = $r0, 96 (0x60);;
     _32(0x0c000140),        //cb.wnez $r0? 168f8 <ISALNUM+0x48>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000003f401b680),        //compw.le $r0 = $r0, 122 (0x7a);;
     _32(0x0c000240),        //cb.wnez $r0? 16918 <ISALNUM+0x68>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000001f401b3c0),        //compw.le $r0 = $r0, 47 (0x2f);;
     _32(0x0c0001c0),        //cb.wnez $r0? 16920 <ISALNUM+0x70>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000001f501b400),        //compw.gt $r0 = $r0, 48 (0x30);;
     _32(0x0c0000c0),        //cb.wnez $r0? 16920 <ISALNUM+0x70>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x10000002),        //goto 16924 <ISALNUM+0x74>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let obstack_1grow: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let exit_: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0xf838ffc0),        //zxwd $r14 = $r0
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x9800004d),        //call 16a90 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16984 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x980002e5),        //call 17518 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(yylex, 0b00010110100001000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(input, 0b00010110100010101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(ISALNUM, 0b00010110100010110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(obstack_1grow, 0b00010110100100110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100101001000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
