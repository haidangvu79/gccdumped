// executing 20141022_1 test 
val k1_20141022_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20141022_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let f: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x7800fec0),        //andw $r0 = $r0, -5 (0xfffffffb);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _64(0x00000000f001b180),        //compw.ne $r0 = $r0, 6 (0x6);;
     _32(0x0c0000c0),        //cb.wnez $r0? 1684c <f+0x2c>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000002),        //goto 16850 <f+0x30>;;
     _32(0x6000000f),        //make $r0 = 15 (0xf);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c0000c0),        //cb.wnez $r0? 1686c <f+0x4c>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x10000002),        //goto 16870 <f+0x50>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffe4),        //call 16820 <f>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b3c0),        //compw.eq $r0 = $r0, 15 (0xf);;
     _32(0x0c000180),        //cb.wnez $r0? 168b8 <main+0x38>;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x180000c8),        //call 16bd0 <puts>;;
     _32(0x1800002d),        //call 16968 <abort>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffffd9),        //call 16820 <f>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800180),        //cb.deqz $r0? 168dc <main+0x5c>;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x180000bf),        //call 16bd0 <puts>;;
     _32(0x18000024),        //call 16968 <abort>;;
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x1fffffd0),        //call 16820 <f>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800180),        //cb.deqz $r0? 16900 <main+0x80>;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x180000b6),        //call 16bd0 <puts>;;
     _32(0x1800001b),        //call 16968 <abort>;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1fffffc7),        //call 16820 <f>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800180),        //cb.deqz $r0? 16924 <main+0xa4>;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x180000ad),        //call 16bd0 <puts>;;
     _32(0x18000012),        //call 16968 <abort>;;
     _32(0x6000000f),        //make $r0 = 15 (0xf);;
     _32(0x1fffffbe),        //call 16820 <f>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b3c0),        //compw.eq $r0 = $r0, 15 (0xf);;
     _32(0x0c000180),        //cb.wnez $r0? 16950 <main+0xd0>;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x180000a2),        //call 16bd0 <puts>;;
     _32(0x18000007),        //call 16968 <abort>;;
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
     _32(0x9800014b),        //call 16ea0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x9800113f),        //call 1ae78 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100010000000; //0x16880
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100101101000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
