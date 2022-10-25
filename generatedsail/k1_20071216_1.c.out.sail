// executing 20071216_1.c.out.dumped test 
val k1_20071216_1.c.out.dumped: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20071216_1.c.out.dumped() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let bar: list_I = 
 [|
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let foo: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x1ffffff7),        //call 16820 <bar>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x07fffffce9010000),        //compd.gtu $r0 = $r0, -4096 (0xfffffffffffff000);;
     _32(0x08000100),        //cb.dnez $r0? 16870 <foo+0x38>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1000000b),        //goto 16898 <foo+0x60>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6101f680),        //compd.eq $r0 = $r0, -38 (0xffffffda);;
     _32(0x080000c0),        //cb.dnez $r0? 16884 <foo+0x4c>;;
     _32(0x6000fffe),        //make $r0 = -2 (0xfffffffe);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x6004001a),        //make $r1 = 26 (0x1a);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x1fffffdc),        //call 16838 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b680),        //compw.eq $r0 = $r0, 26 (0x1a);;
     _32(0x0c000080),        //cb.wnez $r0? 168e0 <main+0x38>;;
     _32(0x1800001d),        //call 16950 <abort>;;
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x6004ffd9),        //make $r1 = -39 (0xffffffd9);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x1fffffd1),        //call 16838 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x07fffffff101b7c0),        //compw.eq $r0 = $r0, 4294967295 (0xffffffff);;
     _32(0x0c000080),        //cb.wnez $r0? 1690c <main+0x64>;;
     _32(0x18000012),        //call 16950 <abort>;;
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x6004ffda),        //make $r1 = -38 (0xffffffda);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x1fffffc6),        //call 16838 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x07fffffef101b6c0),        //compw.eq $r0 = $r0, 4294967259 (0xffffffdb);;
     _32(0x0c000080),        //cb.wnez $r0? 16938 <main+0x90>;;
     _32(0x18000007),        //call 16950 <abort>;;
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
     _32(0x980000f3),        //call 16d28 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18858 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100010101000; //0x168a8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000111000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100101010000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
