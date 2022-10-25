// executing 991014_1.c.out.dumped test 
val k1_991014_1.c.out.dumped: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_991014_1.c.out.dumped() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let union_size: list_I = 
 [|
     _96(0x01ffffff87ffffffe000c000),        //make $r0 = 4611686018427387648 (0x3fffffffffffff00);;
     _32(0x0fd00000)        //ret ;;
 |];

let struct_size: list_I = 
 [|
     _96(0x03ffffff87ffffffe0008400),        //make $r0 = 9223372036854775312 (0x7ffffffffffffe10);;
     _32(0x0fd00000)        //ret ;;
 |];

let struct_a_offset: list_I = 
 [|
     _96(0x03ffffff87ffffffe0008000),        //make $r0 = 9223372036854775296 (0x7ffffffffffffe00);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1ffffff1),        //call 16820 <union_size>;;
     _96(0x01ffffff87ffffffe004c000),        //make $r1 = 4611686018427387648 (0x3fffffffffffff00);;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16878 <main+0x28>;;
     _32(0x18000015),        //call 168c8 <abort>;;
     _32(0x1fffffee),        //call 16830 <struct_size>;;
     _96(0x03ffffff87ffffffe0048400),        //make $r1 = 9223372036854775312 (0x7ffffffffffffe10);;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16894 <main+0x44>;;
     _32(0x1800000e),        //call 168c8 <abort>;;
     _32(0x1fffffeb),        //call 16840 <struct_a_offset>;;
     _96(0x03ffffff87ffffffe0047fc0),        //make $r1 = 9223372036854775295 (0x7ffffffffffffdff);;
     _32(0x7901a040),        //compd.gtu $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 168b0 <main+0x60>;;
     _32(0x18000007),        //call 168c8 <abort>;;
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
     _32(0x980000f3),        //call 16ca0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 187d0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100001010000; //0x16850
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(union_size, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(struct_size, 0b00010110100000110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(struct_a_offset, 0b00010110100001000000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100001010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100011001000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
