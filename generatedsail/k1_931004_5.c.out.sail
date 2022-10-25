// executing 931004_5.c.out.dumped test 
val k1_931004_5.: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_931004_5.() = {
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
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x26050c0c),        //sw 48 (0x30)[$r12] = $r1;;
     _32(0x26090a0c),        //sw 40 (0x28)[$r12] = $r2;;
     _32(0x260d080c),        //sw 32 (0x20)[$r12] = $r3;;
     _32(0x2711060c),        //sd 24 (0x18)[$r12] = $r4;;
     _32(0x28000c0c),        //lhz $r0 = 48 (0x30)[$r12];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _64(0x00000000f101b280),        //compw.eq $r0 = $r0, 10 (0xa);;
     _32(0x0c000080),        //cb.wnez $r0? 16858 <f+0x38>;;
     _32(0x18000041),        //call 16958 <abort>;;
     _32(0x28000c8c),        //lhz $r0 = 50 (0x32)[$r12];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _64(0x00000000f101b500),        //compw.eq $r0 = $r0, 20 (0x14);;
     _32(0x0c000080),        //cb.wnez $r0? 16870 <f+0x50>;;
     _32(0x1800003b),        //call 16958 <abort>;;
     _32(0x28000a0c),        //lhz $r0 = 40 (0x28)[$r12];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _64(0x00000000f101b2c0),        //compw.eq $r0 = $r0, 11 (0xb);;
     _32(0x0c000080),        //cb.wnez $r0? 16888 <f+0x68>;;
     _32(0x18000035),        //call 16958 <abort>;;
     _32(0x28000a8c),        //lhz $r0 = 42 (0x2a)[$r12];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _64(0x00000000f101b540),        //compw.eq $r0 = $r0, 21 (0x15);;
     _32(0x0c000080),        //cb.wnez $r0? 168a0 <f+0x80>;;
     _32(0x1800002f),        //call 16958 <abort>;;
     _32(0x2800080c),        //lhz $r0 = 32 (0x20)[$r12];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _64(0x00000000f101b300),        //compw.eq $r0 = $r0, 12 (0xc);;
     _32(0x0c000080),        //cb.wnez $r0? 168b8 <f+0x98>;;
     _32(0x18000029),        //call 16958 <abort>;;
     _32(0x2800088c),        //lhz $r0 = 34 (0x22)[$r12];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _64(0x00000000f101b580),        //compw.eq $r0 = $r0, 22 (0x16);;
     _32(0x0c000080),        //cb.wnez $r0? 168d0 <f+0xb0>;;
     _32(0x18000023),        //call 16958 <abort>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61011ec0),        //compd.eq $r0 = $r0, 123 (0x7b);;
     _32(0x08000080),        //cb.dnez $r0? 168e0 <f+0xc0>;;
     _32(0x1800001f),        //call 16958 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x6000000a),        //make $r0 = 10 (0xa);;
     _32(0x2501040c),        //sh 16 (0x10)[$r12] = $r0;;
     _32(0x6000000b),        //make $r0 = 11 (0xb);;
     _32(0x2501050c),        //sh 20 (0x14)[$r12] = $r0;;
     _32(0x6000000c),        //make $r0 = 12 (0xc);;
     _32(0x2501060c),        //sh 24 (0x18)[$r12] = $r0;;
     _32(0x60000014),        //make $r0 = 20 (0x14);;
     _32(0x2501048c),        //sh 18 (0x12)[$r12] = $r0;;
     _32(0x60000015),        //make $r0 = 21 (0x15);;
     _32(0x2501058c),        //sh 22 (0x16)[$r12] = $r0;;
     _32(0x60000016),        //make $r0 = 22 (0x16);;
     _32(0x2501068c),        //sh 26 (0x1a)[$r12] = $r0;;
     _32(0x6010007b),        //make $r4 = 123 (0x7b);;
     _32(0x300c060c),        //lwz $r3 = 24 (0x18)[$r12];;
     _32(0x3008050c),        //lwz $r2 = 20 (0x14)[$r12];;
     _32(0x3004040c),        //lwz $r1 = 16 (0x10)[$r12];;
     _32(0x60000003),        //make $r0 = 3 (0x3);;
     _32(0x1fffffb6),        //call 16820 <f>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 16978 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16d78 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18a50 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0xf838ffc0),        //zxwd $r14 = $r0
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x98000161),        //call 16f10 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 169b4 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18a50 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100011111000; //0x168f8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100011111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100101011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit, 0b00010110100101111000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
