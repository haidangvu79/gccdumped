// executing pr37780.c.out.dumped test 
val k1_pr37780.: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pr37780.() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let fooctz: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0c800140),        //cb.weqz $r0? 16840 <fooctz+0x20>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x73023000),        //ctzw $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x10000002),        //goto 16844 <fooctz+0x24>;;
     _32(0x60000020),        //make $r0 = 32 (0x20);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let fooctz2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0c800140),        //cb.weqz $r0? 16870 <fooctz2+0x20>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x73023000),        //ctzw $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x10000002),        //goto 16874 <fooctz2+0x24>;;
     _32(0x60000020),        //make $r0 = 32 (0x20);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let fooctz3: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0c800180),        //cb.weqz $r0? 168a4 <fooctz3+0x24>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x73023000),        //ctzw $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x10000002),        //goto 168a8 <fooctz3+0x28>;;
     _32(0x60000020),        //make $r0 = 32 (0x20);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let fooclz: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0c800140),        //cb.weqz $r0? 168d0 <fooclz+0x20>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x70023000),        //clzw $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x10000002),        //goto 168d4 <fooclz+0x24>;;
     _32(0x60000020),        //make $r0 = 32 (0x20);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let fooclz2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0c800140),        //cb.weqz $r0? 16900 <fooclz2+0x20>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x70023000),        //clzw $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x10000002),        //goto 16904 <fooclz2+0x24>;;
     _32(0x60000020),        //make $r0 = 32 (0x20);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let fooclz3: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0c800180),        //cb.weqz $r0? 16934 <fooclz3+0x24>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x70023000),        //clzw $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x10000002),        //goto 16938 <fooclz3+0x28>;;
     _32(0x60000020),        //make $r0 = 32 (0x20);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffb4),        //call 16820 <fooctz>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000001f001b000),        //compw.ne $r0 = $r0, 32 (0x20);;
     _32(0x0c0007c0),        //cb.wnez $r0? 169dc <main+0x9c>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffba),        //call 16850 <fooctz2>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000001f001b000),        //compw.ne $r0 = $r0, 32 (0x20);;
     _32(0x0c000640),        //cb.wnez $r0? 169dc <main+0x9c>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffc0),        //call 16880 <fooctz3>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000001f001b000),        //compw.ne $r0 = $r0, 32 (0x20);;
     _32(0x0c0004c0),        //cb.wnez $r0? 169dc <main+0x9c>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffc6),        //call 168b0 <fooclz>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000001f001b000),        //compw.ne $r0 = $r0, 32 (0x20);;
     _32(0x0c000340),        //cb.wnez $r0? 169dc <main+0x9c>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffcc),        //call 168e0 <fooclz2>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000001f001b000),        //compw.ne $r0 = $r0, 32 (0x20);;
     _32(0x0c0001c0),        //cb.wnez $r0? 169dc <main+0x9c>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffd2),        //call 16910 <fooclz3>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000001f101b000),        //compw.eq $r0 = $r0, 32 (0x20);;
     _32(0x0c000080),        //cb.wnez $r0? 169e0 <main+0xa0>;;
     _32(0x18000007),        //call 169f8 <abort>;;
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
     _32(0x980000f3),        //call 16dd0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18900 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100101000000; //0x16940
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fooctz, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fooctz2, 0b00010110100001010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fooctz3, 0b00010110100010000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fooclz, 0b00010110100010110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fooclz2, 0b00010110100011100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fooclz3, 0b00010110100100010000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100101000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100111111000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
