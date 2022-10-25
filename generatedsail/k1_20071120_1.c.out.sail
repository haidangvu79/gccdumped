// executing 20071120_1.c.out.dumped test 
val k1_20071120_1.c.out.dumped: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20071120_1.c.out.dumped() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let vec_assert_fail: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x18000091)        //call 16a70 <abort>;;
 |];

let VEC_deferred_access_base_last: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x08800100),        //cb.deqz $r0? 16854 <VEC_deferred_access_base_last+0x24>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x08000080),        //cb.dnez $r0? 16858 <VEC_deferred_access_base_last+0x28>;;
     _32(0x1ffffff3),        //call 16820 <vec_assert_fail>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x79022100),        //slld $r0 = $r0, 4 (0x4);;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let VEC_deferred_access_base_pop: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x08000080),        //cb.dnez $r0? 168a8 <VEC_deferred_access_base_pop+0x20>;;
     _32(0x1fffffdf),        //call 16820 <vec_assert_fail>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let perform_access_checks: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x18000062),        //call 16a70 <abort>;;
     _32(0x7f03f000)        //nop ;;
 |];

let pop_to_parent_deferring_access_checks: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _96(0x0000000080000106e0006200),        //make $r0 = 268680 (0x41988);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x08800300),        //cb.deqz $r0? 1693c <pop_to_parent_deferring_access_checks+0x4c>;;
     _96(0x0000000080000106e0006200),        //make $r0 = 268680 (0x41988);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000106e0006200),        //make $r0 = 268680 (0x41988);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x1000002d),        //goto 169ec <pop_to_parent_deferring_access_checks+0xfc>;;
     _96(0x0000000080000106e0006000),        //make $r0 = 268672 (0x41980);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x08800180),        //cb.deqz $r0? 16964 <pop_to_parent_deferring_access_checks+0x74>;;
     _96(0x0000000080000106e0006000),        //make $r0 = 268672 (0x41980);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x10000002),        //goto 16968 <pop_to_parent_deferring_access_checks+0x78>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffb2),        //call 16830 <VEC_deferred_access_base_last>;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x0000000080000106e0006000),        //make $r0 = 268672 (0x41980);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x08800180),        //cb.deqz $r0? 1699c <pop_to_parent_deferring_access_checks+0xac>;;
     _96(0x0000000080000106e0006000),        //make $r0 = 268672 (0x41980);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x10000002),        //goto 169a0 <pop_to_parent_deferring_access_checks+0xb0>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffba),        //call 16888 <VEC_deferred_access_base_pop>;;
     _96(0x0000000080000106e0006000),        //make $r0 = 268672 (0x41980);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x08800180),        //cb.deqz $r0? 169cc <pop_to_parent_deferring_access_checks+0xdc>;;
     _96(0x0000000080000106e0006000),        //make $r0 = 268672 (0x41980);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x10000002),        //goto 169d0 <pop_to_parent_deferring_access_checks+0xe0>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff98),        //call 16830 <VEC_deferred_access_base_last>;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x30000200),        //lwz $r0 = 8 (0x8)[$r0];;
     _32(0x080000c0),        //cb.dnez $r0? 169ec <pop_to_parent_deferring_access_checks+0xfc>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x1fffffbc),        //call 168d8 <perform_access_checks>;;
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
     _32(0x60000098),        //make $r0 = 152 (0x98);;
     _32(0x18000060),        //call 16b90 <malloc>;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x0000000080000106e0006000),        //make $r0 = 268672 (0x41980);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000106e0006000),        //make $r0 = 268672 (0x41980);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000106e0006000),        //make $r0 = 268672 (0x41980);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x26050400),        //sw 16 (0x10)[$r0] = $r1;;
     _32(0x1fffffa6),        //call 168f0 <pop_to_parent_deferring_access_checks>;;
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
     _32(0x9800038b),        //call 178a8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007c9),        //call 189a8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101000000000; //0x16a00
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(vec_assert_fail, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(VEC_deferred_access_base_last, 0b00010110100000110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(VEC_deferred_access_base_pop, 0b00010110100010001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(perform_access_checks, 0b00010110100011011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(pop_to_parent_deferring_access_checks, 0b00010110100011110000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101000000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101001110000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
