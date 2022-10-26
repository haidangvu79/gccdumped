// executing ipa_sra_2 test 
val k1_ipa_sra_2: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_ipa_sra_2() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0c800180),        //cb.weqz $r0? 16848 <foo+0x28>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _64(0x18000f42b0003f00),        //lwz $r0 = 3999996 (0x3d08fc)[$r0];;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000004),        //goto 16854 <foo+0x34>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x2705020c),        //sd 8 (0x8)[$r12] = $r1;;
     _32(0x60040028),        //make $r1 = 40 (0x28);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x18000011),        //call 168c0 <calloc>;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _64(0x0000003ef501b400),        //compw.gt $r0 = $r0, 2000 (0x7d0);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x1fffffe1),        //call 16820 <foo>;;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x18000086),        //call 16ac0 <free>;;
     _32(0x3000050c),        //lwz $r0 = 20 (0x14)[$r12];;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let calloc: list_I = 
 [|
     _32(0xea0c0000),        //copyd $r3 = $r0
     _32(0xea080001),        //copyd $r2 = $r1
     _96(0x10000000900000f8e0001000),        //make $r0 = 254016 (0x3e040);;
     _32(0x90000003),        //goto 168e0 <_calloc_r>
     _32(0xea040003),        //copyd $r1 = $r3
     _32(0x38000000)        //ld $r0 = 0 (0x0)[$r0];;
 |];

let _calloc_r: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0xd4041081),        //muld $r1 = $r1, $r2
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x9800007a),        //call 16ad8 <_malloc_r>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x88800340),        //cb.deqz $r0? 1692c <_calloc_r+0x4c>
     _32(0x6a380000),        //copyd $r14 = $r0;;
     _32(0x3808fe00),        //ld $r2 = -8 (0xfffffff8)[$r0];;
     _32(0x6808ff02),        //andd $r2 = $r2, -4 (0xfffffffc);;
     _32(0x6108fe02),        //addd $r2 = $r2, -8 (0xfffffff8);;
     _32(0x69051202),        //compd.gtu $r1 = $r2, 72 (0x48);;
     _32(0x080006c1),        //cb.dnez $r1? 1697c <_calloc_r+0x9c>;;
     _32(0x680509c2),        //compd.leu $r1 = $r2, 39 (0x27);;
     _32(0x088002c1),        //cb.deqz $r1? 16944 <_calloc_r+0x64>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x27050200),        //sd 8 (0x8)[$r0] = $r1;;
     _32(0x27050400),        //sd 16 (0x10)[$r0] = $r1;;
     _32(0xea00000e),        //copyd $r0 = $r14
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3838040c),        //ld $r14 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0xe9010dc2),        //compd.gtu $r0 = $r2, 55 (0x37)
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x2705000e),        //sd 0 (0x0)[$r14] = $r1;;
     _32(0x888004c0),        //cb.deqz $r0? 1699c <_calloc_r+0xbc>
     _32(0x2705020e),        //sd 8 (0x8)[$r14] = $r1;;
     _32(0xe1091202),        //compd.eq $r2 = $r2, 72 (0x48)
     _32(0xe100080e),        //addd $r0 = $r14, 32 (0x20)
     _32(0x2705040e),        //sd 16 (0x10)[$r14] = $r1;;
     _32(0x2705060e),        //sd 24 (0x18)[$r14] = $r1;;
     _32(0x08fffb42),        //cb.deqz $r2? 1691c <_calloc_r+0x3c>;;
     _32(0xe1000c0e),        //addd $r0 = $r14, 48 (0x30)
     _32(0x2705080e),        //sd 32 (0x20)[$r14] = $r1;;
     _32(0x97ffffea),        //goto 1691c <_calloc_r+0x3c>
     _32(0x27050a0e),        //sd 40 (0x28)[$r14] = $r1;;
     _32(0x980002bd),        //call 17470 <memset>
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0xea00000e),        //copyd $r0 = $r14
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3838040c),        //ld $r14 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0x97ffffe0),        //goto 1691c <_calloc_r+0x3c>
     _32(0x6100040e),        //addd $r0 = $r14, 16 (0x10);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100001100000; //0x16860
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100001100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(calloc, 0b00010110100011000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(_calloc_r, 0b00010110100011100000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
