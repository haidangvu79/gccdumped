// executing 20050218_1.c.out.dumped test 
val k1_20050218_1.c.out.dumped: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20050218_1.c.out.dumped() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x2739000c),        //sd 0 (0x0)[$r12] = $r14;;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2749020c),        //sd 8 (0x8)[$r12] = $r18;;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x2705080c),        //sd 32 (0x20)[$r12] = $r1;;
     _32(0x2709060c),        //sd 24 (0x18)[$r12] = $r2;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x1000002c),        //goto 16900 <foo+0xe0>;;
     _32(0x38040a0c),        //ld $r1 = 40 (0x28)[$r12];;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x71390001),        //addd $r14 = $r1, $r0;;
     _96(0x00000000800000f8e0040200),        //make $r1 = 253960 (0x3e008);;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x384af001),        //ld.xs $r18 = $r0[$r1];;
     _96(0x00000000800000f8e0040200),        //make $r1 = 253960 (0x3e008);;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x3802f001),        //ld.xs $r0 = $r0[$r1];;
     _32(0x18000198),        //call 16ee8 <strlen>;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x6a040012),        //copyd $r1 = $r18;;
     _32(0x6a00000e),        //copyd $r0 = $r14;;
     _32(0x180001ba),        //call 16f80 <strncmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x088000c0),        //cb.deqz $r0? 168ac <foo+0x8c>;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x1000001b),        //goto 16914 <foo+0xf4>;;
     _96(0x00000000800000f8e0040200),        //make $r1 = 253960 (0x3e008);;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x3802f001),        //ld.xs $r0 = $r0[$r1];;
     _32(0x1800018a),        //call 16ee8 <strlen>;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x088001c0),        //cb.deqz $r0? 168f4 <foo+0xd4>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x18000182),        //call 16ee8 <strlen>;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x7601a001),        //compd.ltu $r0 = $r1, $r0;;
     _32(0x087ff480),        //cb.dnez $r0? 16854 <foo+0x34>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3848020c),        //ld $r18 = 8 (0x8)[$r12];;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60080003),        //make $r2 = 3 (0x3);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _96(0x00000000800000fde0001800),        //make $r0 = 259168 (0x3f460);;
     _32(0x1fffffb4),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16960 <main+0x30>;;
     _32(0x18000007),        //call 16978 <abort>;;
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
     _32(0x980000f3),        //call 16d50 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x9800081f),        //call 18a08 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100110000; //0x16930
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100101111000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
