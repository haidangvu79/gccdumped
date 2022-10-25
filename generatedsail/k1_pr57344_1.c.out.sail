// executing pr57344_1.c.out.dumped test 
val k1_pr57344_1.: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pr57344_1.() = {
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
     _32(0x18000042),        //call 16948 <abort>;;
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
     _64(0x00000001f800ffc0),        //andw $r0 = $r0, 2047 (0x7ff);;
     _64(0x07ffe74efa000000),        //orw $r0 = $r0, -6473728 (0xffffffffff9d3800);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2000070c),        //lbz $r0 = 28 (0x1c)[$r12];;
     _32(0x7a000040),        //orw $r0 = $r0, 1 (0x1);;
     _32(0x2401070c),        //sb 28 (0x1c)[$r12] = $r0;;
     _96(0x0000000080000117e0042400),        //make $r1 = 285840 (0x45c90);;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x27010201),        //sd 8 (0x8)[$r1] = $r0;;
     _32(0x1000001f),        //goto 16920 <main+0xc8>;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x20040240),        //lbz $r1 = 9 (0x9)[$r0];;
     _32(0x7b0630c1),        //srlw $r1 = $r1, 3 (0x3);;
     _32(0x78043fc1),        //zxbd $r1 = $r1;;
     _32(0x20080280),        //lbz $r2 = 10 (0xa)[$r0];;
     _32(0x790a2142),        //slld $r2 = $r2, 5 (0x5);;
     _32(0x7a050042),        //ord $r1 = $r2, $r1;;
     _32(0x200802c0),        //lbz $r2 = 11 (0xb)[$r0];;
     _32(0x790a2342),        //slld $r2 = $r2, 13 (0xd);;
     _32(0x7a050042),        //ord $r1 = $r2, $r1;;
     _32(0x20000300),        //lbz $r0 = 12 (0xc)[$r0];;
     _32(0x68000040),        //andd $r0 = $r0, 1 (0x1);;
     _32(0x79022540),        //slld $r0 = $r0, 21 (0x15);;
     _32(0x7a010040),        //ord $r0 = $r0, $r1;;
     _32(0x79022a80),        //slld $r0 = $r0, 42 (0x2a);;
     _32(0x7a022a80),        //srad $r0 = $r0, 42 (0x2a);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffffcb),        //call 16820 <foo>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x0e7ff780),        //cb.wlez $r0? 168a8 <main+0x50>;;
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
     _32(0x980000f3),        //call 16d20 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18850 <_exit>
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
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100101001000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
