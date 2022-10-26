// executing 20010604_1 test 
val k1_20010604_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20010604_1() = {
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
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x26050c0c),        //sw 48 (0x30)[$r12] = $r1;;
     _32(0x26090a0c),        //sw 40 (0x28)[$r12] = $r2;;
     _32(0x7a000003),        //copyw $r0 = $r3;;
     _32(0x7a0c0004),        //copyw $r3 = $r4;;
     _32(0x7a080005),        //copyw $r2 = $r5;;
     _32(0x7a040006),        //copyw $r1 = $r6;;
     _32(0x2401080c),        //sb 32 (0x20)[$r12] = $r0;;
     _32(0x7a000003),        //copyw $r0 = $r3;;
     _32(0x2401060c),        //sb 24 (0x18)[$r12] = $r0;;
     _32(0x7a000002),        //copyw $r0 = $r2;;
     _32(0x2401040c),        //sb 16 (0x10)[$r12] = $r0;;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x2401020c),        //sb 8 (0x8)[$r12] = $r0;;
     _32(0x2400020c),        //lbs $r0 = 8 (0x8)[$r12];;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c000340),        //cb.wnez $r0? 168a4 <f+0x84>;;
     _32(0x2000080c),        //lbz $r0 = 32 (0x20)[$r12];;
     _32(0x7c000040),        //xorw $r0 = $r0, 1 (0x1);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x08000240),        //cb.dnez $r0? 168a4 <f+0x84>;;
     _32(0x2000060c),        //lbz $r0 = 24 (0x18)[$r12];;
     _32(0x7c000040),        //xorw $r0 = $r0, 1 (0x1);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x08000140),        //cb.dnez $r0? 168a4 <f+0x84>;;
     _32(0x2000040c),        //lbz $r0 = 16 (0x10)[$r12];;
     _32(0x7c000040),        //xorw $r0 = $r0, 1 (0x1);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 168a8 <f+0x88>;;
     _32(0x1800001d),        //call 16918 <abort>;;
     _32(0x30040e0c),        //lwz $r1 = 56 (0x38)[$r12];;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x30040a0c),        //lwz $r1 = 40 (0x28)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60180001),        //make $r6 = 1 (0x1);;
     _32(0x60140001),        //make $r5 = 1 (0x1);;
     _32(0x60100001),        //make $r4 = 1 (0x1);;
     _32(0x600c0001),        //make $r3 = 1 (0x1);;
     _32(0x6008fffd),        //make $r2 = -3 (0xfffffffd);;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffffc8),        //call 16820 <f>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16910 <main+0x38>;;
     _32(0x18000003),        //call 16918 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16938 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16d38 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18a10 <_exit>
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
     _32(0x98000161),        //call 16ed0 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16974 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18a10 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100011011000; //0x168d8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100011011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100100011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100100111000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
