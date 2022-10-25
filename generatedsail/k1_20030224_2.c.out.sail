// executing 20030224_2.c.out.dumped test 
val k1_20030224_2.c.out.dumped: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20030224_2.c.out.dumped() = {
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
     _32(0x60001985),        //make $r0 = 6533 (0x1985);;
     _32(0x2501060c),        //sh 24 (0x18)[$r12] = $r0;;
     _32(0x60002003),        //make $r0 = 8195 (0x2003);;
     _32(0x2501068c),        //sh 26 (0x1a)[$r12] = $r0;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x2800060c),        //lhz $r0 = 24 (0x18)[$r12];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _64(0x000000ccf101b140),        //compw.eq $r0 = $r0, 6533 (0x1985);;
     _32(0x0c000080),        //cb.wnez $r0? 1686c <main+0x4c>;;
     _32(0x1800000c),        //call 16898 <abort>;;
     _32(0x2800068c),        //lhz $r0 = 26 (0x1a)[$r12];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _64(0x00000100f101b0c0),        //compw.eq $r0 = $r0, 8195 (0x2003);;
     _32(0x0c000080),        //cb.wnez $r0? 16884 <main+0x64>;;
     _32(0x18000006),        //call 16898 <abort>;;
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
     _32(0x980000f3),        //call 16c70 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 187a0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100010011000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
