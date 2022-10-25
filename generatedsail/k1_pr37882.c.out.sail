// executing pr37882.c.out.dumped test 
val k1_pr37882.c.out.dumped: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pr37882.c.out.dumped() = {
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
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _32(0x20000001),        //lbz $r0 = 0 (0x0)[$r1];;
     _32(0x60080004),        //make $r2 = 4 (0x4);;
     _32(0x60032002),        //insf $r0 = $r2, 2 (0x2), 0 (0x0);;
     _32(0x24010001),        //sb 0 (0x0)[$r1] = $r0;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x780001c0),        //andw $r0 = $r0, 7 (0x7);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x088002c0),        //cb.deqz $r0? 1688c <main+0x6c>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x64032000),        //extfz $r0 = $r0, 2 (0x2), 0 (0x0);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _64(0x00000000f901b0c0),        //compw.gtu $r0 = $r0, 3 (0x3);;
     _32(0x0c000080),        //cb.wnez $r0? 1688c <main+0x6c>;;
     _32(0x18000006),        //call 168a0 <abort>;;
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
     _32(0x980000f3),        //call 16c78 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 187a8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100010100000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
