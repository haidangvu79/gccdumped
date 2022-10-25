// executing 20050929_1.c.out.dumped test 
val k1_20050929_1.c.out.dumped: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20050929_1.c.out.dumped() = {
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
     _96(0x00000000800000f8e0000c00),        //make $r0 = 254000 (0x3e030);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c000280),        //cb.wnez $r0? 16874 <main+0x54>;;
     _96(0x00000000800000f8e0000c00),        //make $r0 = 254000 (0x3e030);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _64(0x00000000f101b080),        //compw.eq $r0 = $r0, 2 (0x2);;
     _32(0x0c000080),        //cb.wnez $r0? 16878 <main+0x58>;;
     _32(0x1800002b),        //call 16920 <abort>;;
     _96(0x00000000800000f8e0000c00),        //make $r0 = 254000 (0x3e030);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000000f001b0c0),        //compw.ne $r0 = $r0, 3 (0x3);;
     _32(0x0c000280),        //cb.wnez $r0? 168c0 <main+0xa0>;;
     _96(0x00000000800000f8e0000c00),        //make $r0 = 254000 (0x3e030);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _64(0x00000000f101b100),        //compw.eq $r0 = $r0, 4 (0x4);;
     _32(0x0c000080),        //cb.wnez $r0? 168c4 <main+0xa4>;;
     _32(0x18000018),        //call 16920 <abort>;;
     _96(0x00000000800000f8e0000c00),        //make $r0 = 254000 (0x3e030);;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000000f001b140),        //compw.ne $r0 = $r0, 5 (0x5);;
     _32(0x0c000240),        //cb.wnez $r0? 16904 <main+0xe4>;;
     _96(0x00000000800000f8e0000c00),        //make $r0 = 254000 (0x3e030);;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _64(0x00000000f101b180),        //compw.eq $r0 = $r0, 6 (0x6);;
     _32(0x0c000080),        //cb.wnez $r0? 16908 <main+0xe8>;;
     _32(0x18000007),        //call 16920 <abort>;;
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
     _32(0x980000f3),        //call 16cf8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18828 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100100100000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
