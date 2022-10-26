// executing pr20527_1 test 
val k1_pr20527_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pr20527_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let f: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x2705080c),        //sd 32 (0x20)[$r12] = $r1;;
     _32(0x2709060c),        //sd 24 (0x18)[$r12] = $r2;;
     _32(0x270d040c),        //sd 16 (0x10)[$r12] = $r3;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x1000001a),        //goto 168ac <f+0x8c>;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x3808080c),        //ld $r2 = 32 (0x20)[$r12];;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x75010040),        //sbfd $r0 = $r0, $r1;;
     _32(0x38040c0c),        //ld $r1 = 48 (0x30)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x38040a0c),        //ld $r1 = 40 (0x28)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x38040c0c),        //ld $r1 = 48 (0x30)[$r12];;
     _32(0x6104ffc1),        //addd $r1 = $r1, -1 (0xffffffff);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x7401a001),        //compd.le $r0 = $r1, $r0;;
     _32(0x087ff900),        //cb.dnez $r0? 16848 <f+0x28>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x6100020c),        //addd $r0 = $r12, 8 (0x8);;
     _32(0x600c0002),        //make $r3 = 2 (0x2);;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _96(0x00000000800000f8e0040200),        //make $r1 = 253960 (0x3e008);;
     _32(0x1fffffcb),        //call 16820 <f>;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x600100c0),        //compd.ne $r0 = $r0, 3 (0x3);;
     _32(0x080001c0),        //cb.dnez $r0? 1691c <main+0x4c>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x60010240),        //compd.ne $r0 = $r0, 9 (0x9);;
     _32(0x08000100),        //cb.dnez $r0? 1691c <main+0x4c>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61010540),        //compd.eq $r0 = $r0, 21 (0x15);;
     _32(0x08000080),        //cb.dnez $r0? 16920 <main+0x50>;;
     _32(0x18000003),        //call 16928 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16948 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16d48 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18a20 <_exit>
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
     _32(0x98000161),        //call 16ee0 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16984 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18a20 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100011010000; //0x168d0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100011010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100100101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100101001000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
