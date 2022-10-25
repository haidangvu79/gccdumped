// executing pr57344_2.c.out.dumped test 
val k1_pr57344_2.c.out.dumped: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pr57344_2.c.out.dumped() = {
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
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x07ffff9df101b1c0),        //compw.eq $r0 = $r0, 4294964135 (0xfffff3a7);;
     _32(0x0c000080),        //cb.wnez $r0? 16844 <foo+0x24>;;
     _32(0x18000046),        //call 16958 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x0001fffff800ffc0),        //andw $r0 = $r0, 134217727 (0x7ffffff);;
     _64(0x000e0000fa000000),        //orw $r0 = $r0, 939524096 (0x38000000);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2800070c),        //lhz $r0 = 28 (0x1c)[$r12];;
     _32(0x78000000),        //andw $r0 = $r0, 0 (0x0);;
     _32(0x7a00e740),        //orw $r0 = $r0, -99 (0xffffff9d);;
     _32(0x2501070c),        //sh 28 (0x1c)[$r12] = $r0;;
     _32(0x2000078c),        //lbz $r0 = 30 (0x1e)[$r12];;
     _32(0x7a000040),        //orw $r0 = $r0, 1 (0x1);;
     _32(0x2401078c),        //sb 30 (0x1e)[$r12] = $r0;;
     _96(0x0000000080000117e0042400),        //make $r1 = 285840 (0x45c90);;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x27010201),        //sd 8 (0x8)[$r1] = $r0;;
     _32(0x1000001f),        //goto 16930 <main+0xd8>;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x200402c0),        //lbz $r1 = 11 (0xb)[$r0];;
     _32(0x7b0630c1),        //srlw $r1 = $r1, 3 (0x3);;
     _32(0x78043fc1),        //zxbd $r1 = $r1;;
     _32(0x20080300),        //lbz $r2 = 12 (0xc)[$r0];;
     _32(0x790a2142),        //slld $r2 = $r2, 5 (0x5);;
     _32(0x7a050042),        //ord $r1 = $r2, $r1;;
     _32(0x20080340),        //lbz $r2 = 13 (0xd)[$r0];;
     _32(0x790a2342),        //slld $r2 = $r2, 13 (0xd);;
     _32(0x7a050042),        //ord $r1 = $r2, $r1;;
     _32(0x20000380),        //lbz $r0 = 14 (0xe)[$r0];;
     _32(0x68000040),        //andd $r0 = $r0, 1 (0x1);;
     _32(0x79022540),        //slld $r0 = $r0, 21 (0x15);;
     _32(0x7a010040),        //ord $r0 = $r0, $r1;;
     _32(0x79022a80),        //slld $r0 = $r0, 42 (0x2a);;
     _32(0x7a022a80),        //srad $r0 = $r0, 42 (0x2a);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffffc7),        //call 16820 <foo>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x0e7ff780),        //cb.wlez $r0? 168b8 <main+0x60>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16d30 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18860 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100001011000; //0x16858
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100001011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100101011000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
