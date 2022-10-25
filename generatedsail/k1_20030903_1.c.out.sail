// executing 20030903_1.c.out.dumped test 
val k1_20030903_1.c.out.dumped: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20030903_1.c.out.dumped() = {
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
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f105b100),        //compw.eq $r1 = $r0, 4 (0x4);;
     _32(0x0c000681),        //cb.wnez $r1? 168b0 <main+0x90>;;
     _64(0x00000000f905b100),        //compw.gtu $r1 = $r0, 4 (0x4);;
     _32(0x0c000681),        //cb.wnez $r1? 168bc <main+0x9c>;;
     _64(0x00000000f105b0c0),        //compw.eq $r1 = $r0, 3 (0x3);;
     _32(0x0c000441),        //cb.wnez $r1? 168a4 <main+0x84>;;
     _64(0x00000000f905b0c0),        //compw.gtu $r1 = $r0, 3 (0x3);;
     _32(0x0c000501),        //cb.wnez $r1? 168bc <main+0x9c>;;
     _64(0x00000000f105b040),        //compw.eq $r1 = $r0, 1 (0x1);;
     _32(0x0c000141),        //cb.wnez $r1? 1688c <main+0x6c>;;
     _64(0x00000000f101b080),        //compw.eq $r0 = $r0, 2 (0x2);;
     _32(0x0c000140),        //cb.wnez $r0? 16898 <main+0x78>;;
     _32(0x1000000d),        //goto 168bc <main+0x9c>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x18000010),        //call 168d0 <y>;;
     _32(0x1000000a),        //goto 168bc <main+0x9c>;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x1800000d),        //call 168d0 <y>;;
     _32(0x10000007),        //goto 168bc <main+0x9c>;;
     _32(0x60000003),        //make $r0 = 3 (0x3);;
     _32(0x1800000a),        //call 168d0 <y>;;
     _32(0x10000004),        //goto 168bc <main+0x9c>;;
     _32(0x60000004),        //make $r0 = 4 (0x4);;
     _32(0x18000007),        //call 168d0 <y>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let y: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x18000002),        //call 168e8 <abort>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16cc0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 187f0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(y, 0b00010110100011010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100011101000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
