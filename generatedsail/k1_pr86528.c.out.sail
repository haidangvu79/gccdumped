// executing pr86528.c.out.dumped test 
val k1_pr86528.c.out.dumped: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pr86528.c.out.dumped() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let test: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741080c),        //sd 32 (0x20)[$r12] = $r16;;
     _32(0x2739060c),        //sd 24 (0x18)[$r12] = $r14;;
     _32(0x6138060c),        //addd $r14 = $r12, 24 (0x18);;
     _32(0x2701060e),        //sd 24 (0x18)[$r14] = $r0;;
     _32(0x2705040e),        //sd 16 (0x10)[$r14] = $r1;;
     _32(0x3800040e),        //ld $r0 = 16 (0x10)[$r14];;
     _32(0x61000100),        //addd $r0 = $r0, 4 (0x4);;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x7b022140),        //srld $r0 = $r0, 5 (0x5);;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x75310300),        //sbfd $r12 = $r0, $r12;;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x7b022140),        //srld $r0 = $r0, 5 (0x5);;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x2701080e),        //sd 32 (0x20)[$r14] = $r0;;
     _32(0x3804080e),        //ld $r1 = 32 (0x20)[$r14];;
     _32(0x3800060e),        //ld $r0 = 24 (0x18)[$r14];;
     _32(0x6a0c0001),        //copyd $r3 = $r1;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x3800040e),        //ld $r0 = 16 (0x10)[$r14];;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x6a000003),        //copyd $r0 = $r3;;
     _32(0x1800007e),        //call 16a80 <memcpy>;;
     _32(0x3804080e),        //ld $r1 = 32 (0x20)[$r14];;
     _32(0x3800040e),        //ld $r0 = 16 (0x10)[$r14];;
     _32(0x71090001),        //addd $r2 = $r1, $r0;;
     _32(0x3800040e),        //ld $r0 = 16 (0x10)[$r14];;
     _32(0x6100ffc0),        //addd $r0 = $r0, -1 (0xffffffff);;
     _32(0x3804060e),        //ld $r1 = 24 (0x18)[$r14];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000001f101b3c0),        //compw.eq $r0 = $r0, 47 (0x2f);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _96(0x00000000800000fce100f800),        //addd $r0 = $r0, 259040 (0x3f3e0);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x6a000002),        //copyd $r0 = $r2;;
     _32(0x18000222),        //call 17160 <strcpy>;;
     _96(0x00000000800000fce004f000),        //make $r1 = 259008 (0x3f3c0);;
     _32(0x3800080e),        //ld $r0 = 32 (0x20)[$r14];;
     _32(0x180001ed),        //call 170a0 <strcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 168fc <test+0xdc>;;
     _32(0x18000018),        //call 16958 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130fa0e),        //addd $r12 = $r14, -24 (0xffffffe8);;
     _32(0x3840080c),        //ld $r16 = 32 (0x20)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838060c),        //ld $r14 = 24 (0x18)[$r12];;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _96(0x00000000800000fce000f400),        //make $r0 = 259024 (0x3f3d0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000009),        //make $r0 = 9 (0x9);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x1fffffb8),        //call 16820 <test>;;
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
     _32(0x98000169),        //call 16f08 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000885),        //call 18b80 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100011000; //0x16918
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100101011000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
