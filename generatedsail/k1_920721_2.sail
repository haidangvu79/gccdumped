// executing 920721_2 test 
val k1_920721_2: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_920721_2() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let f: list_I = 
 [|
     _32(0x7f03f000),        //nop ;;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741080c),        //sd 32 (0x20)[$r12] = $r16;;
     _32(0x2739060c),        //sd 24 (0x18)[$r12] = $r14;;
     _32(0x6138060c),        //addd $r14 = $r12, 24 (0x18);;
     _32(0x60200002),        //make $r8 = 2 (0x2);;
     _32(0x2621090e),        //sw 36 (0x24)[$r14] = $r8;;
     _32(0x3024090e),        //lwz $r9 = 36 (0x24)[$r14];;
     _32(0x6923f009),        //sxwd $r8 = $r9;;
     _32(0x6120ffc8),        //addd $r8 = $r8, -1 (0xffffffff);;
     _32(0x2721060e),        //sd 24 (0x18)[$r14] = $r8;;
     _32(0x6923f009),        //sxwd $r8 = $r9;;
     _32(0x6a080008),        //copyd $r2 = $r8;;
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0x7b222e82),        //srld $r8 = $r2, 58 (0x3a);;
     _32(0x791e2183),        //slld $r7 = $r3, 6 (0x6);;
     _32(0x7a1d01c8),        //ord $r7 = $r8, $r7;;
     _32(0x791a2182),        //slld $r6 = $r2, 6 (0x6);;
     _32(0x690bf009),        //sxwd $r2 = $r9;;
     _32(0x6a000002),        //copyd $r0 = $r2;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x7b0a2e80),        //srld $r2 = $r0, 58 (0x3a);;
     _32(0x79162181),        //slld $r5 = $r1, 6 (0x6);;
     _32(0x7a150142),        //ord $r5 = $r2, $r5;;
     _32(0x79122180),        //slld $r4 = $r0, 6 (0x6);;
     _32(0x6903f009),        //sxwd $r0 = $r9;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x610001c0),        //addd $r0 = $r0, 7 (0x7);;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x7b022140),        //srld $r0 = $r0, 5 (0x5);;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x75310300),        //sbfd $r12 = $r0, $r12;;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x610001c0),        //addd $r0 = $r0, 7 (0x7);;
     _32(0x7b0220c0),        //srld $r0 = $r0, 3 (0x3);;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x2701040e),        //sd 16 (0x10)[$r14] = $r0;;
     _32(0x1fffffd9),        //call 16820 <f>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000001)        //call 168c8 <exit>;;
 |];

let exit_: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0xf838ffc0),        //zxwd $r14 = $r0
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x9800004d),        //call 16a10 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16904 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x980002e5),        //call 17498 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100000101000; //0x16828
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100011001000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
