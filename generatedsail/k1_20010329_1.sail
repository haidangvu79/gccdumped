// executing 20010329_1 test 
val k1_20010329_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20010329_1() = {
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
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _64(0x00200000e0000040),        //make $r0 = 2147483649 (0x80000001);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x0400000080000000e0000040),        //make $r0 = 9223372036854775809 (0x8000000000000001);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x001fffffe801ffc0),        //compd.leu $r0 = $r0, 2147483647 (0x7fffffff);;
     _32(0x080004c0),        //cb.dnez $r0? 168a0 <main+0x80>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x00200000e9010140),        //compd.gtu $r0 = $r0, 2147483653 (0x80000005);;
     _32(0x080003c0),        //cb.dnez $r0? 168a0 <main+0x80>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _96(0x03ffffff87ffffffe004ffc0),        //make $r1 = 9223372036854775807 (0x7fffffffffffffff);;
     _32(0x7801a040),        //compd.leu $r0 = $r0, $r1;;
     _32(0x08000240),        //cb.dnez $r0? 168a0 <main+0x80>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _96(0x0400000080000000e0040140),        //make $r1 = 9223372036854775813 (0x8000000000000005);;
     _32(0x7901a040),        //compd.gtu $r0 = $r0, $r1;;
     _32(0x080000c0),        //cb.dnez $r0? 168a0 <main+0x80>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000b),        //call 168c8 <exit>;;
     _32(0x18000002),        //call 168a8 <abort>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16cc8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 189a0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0xf838ffc0),        //zxwd $r14 = $r0
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x98000161),        //call 16e60 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16904 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 189a0 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100010101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100011001000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
