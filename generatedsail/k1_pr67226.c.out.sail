// executing pr67226.c.out.dumped test 
val k1_pr67226.c.out.dumped: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pr67226.c.out.dumped() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let assemblez_1: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x2705080c),        //sd 32 (0x20)[$r12] = $r1;;
     _32(0x27090a0c),        //sd 40 (0x28)[$r12] = $r2;;
     _32(0x270d0c0c),        //sd 48 (0x30)[$r12] = $r3;;
     _32(0x3004080c),        //lwz $r1 = 32 (0x20)[$r12];;
     _96(0x0000000080000117e0002800),        //make $r0 = 285856 (0x45ca0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 1685c <assemblez_1+0x3c>;;
     _32(0x18000064),        //call 169e8 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let t0: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x27050c0c),        //sd 48 (0x30)[$r12] = $r1;;
     _32(0x27090e0c),        //sd 56 (0x38)[$r12] = $r2;;
     _32(0x270d040c),        //sd 16 (0x10)[$r12] = $r3;;
     _32(0x2711060c),        //sd 24 (0x18)[$r12] = $r4;;
     _32(0x2715080c),        //sd 32 (0x20)[$r12] = $r5;;
     _32(0x30000b0c),        //lwz $r0 = 44 (0x2c)[$r12];;
     _32(0x080001c0),        //cb.dnez $r0? 168b4 <t0+0x44>;;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x3808060c),        //ld $r2 = 24 (0x18)[$r12];;
     _32(0x380c080c),        //ld $r3 = 32 (0x20)[$r12];;
     _32(0x60000020),        //make $r0 = 32 (0x20);;
     _32(0x1fffffdd),        //call 16820 <assemblez_1>;;
     _32(0x10000002),        //goto 168b8 <t0+0x48>;;
     _32(0x1800004d),        //call 169e8 <abort>;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050100),        //sw 4 (0x4)[$r0] = $r1;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _32(0x26050200),        //sw 8 (0x8)[$r0] = $r1;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x60040003),        //make $r1 = 3 (0x3);;
     _32(0x26050300),        //sw 12 (0xc)[$r0] = $r1;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x60040004),        //make $r1 = 4 (0x4);;
     _32(0x26050400),        //sw 16 (0x10)[$r0] = $r1;;
     _96(0x0000000080000117e0002800),        //make $r0 = 285856 (0x45ca0);;
     _32(0x60040005),        //make $r1 = 5 (0x5);;
     _32(0x26050100),        //sw 4 (0x4)[$r0] = $r1;;
     _96(0x0000000080000117e0002800),        //make $r0 = 285856 (0x45ca0);;
     _32(0x60040006),        //make $r1 = 6 (0x6);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0002800),        //make $r0 = 285856 (0x45ca0);;
     _32(0x60040007),        //make $r1 = 7 (0x7);;
     _32(0x26050200),        //sw 8 (0x8)[$r0] = $r1;;
     _96(0x0000000080000117e0002800),        //make $r0 = 285856 (0x45ca0);;
     _32(0x60040008),        //make $r1 = 8 (0x8);;
     _32(0x26050300),        //sw 12 (0xc)[$r0] = $r1;;
     _96(0x0000000080000117e0002800),        //make $r0 = 285856 (0x45ca0);;
     _32(0x60040009),        //make $r1 = 9 (0x9);;
     _32(0x26050400),        //sw 16 (0x10)[$r0] = $r1;;
     _96(0x0000000080000117e0002800),        //make $r0 = 285856 (0x45ca0);;
     _96(0x0000000080000117e0082200),        //make $r2 = 285832 (0x45c88);;
     _32(0x380c0000),        //ld $r3 = 0 (0x0)[$r0];;
     _32(0x38100200),        //ld $r4 = 8 (0x8)[$r0];;
     _32(0x30000400),        //lwz $r0 = 16 (0x10)[$r0];;
     _32(0x6a140000),        //copyd $r5 = $r0;;
     _32(0x3c000002),        //lq $r0r1 = 0 (0x0)[$r2];;
     _32(0x30080402),        //lwz $r2 = 16 (0x10)[$r2];;
     _32(0x1fffffa9),        //call 16870 <t0>;;
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
     _32(0x980000f3),        //call 16dc0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 188f0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100011001000; //0x168c8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(assemblez_1, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(t0, 0b00010110100001110000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100011001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100111101000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
