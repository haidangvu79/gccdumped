// executing 20041218_2 test 
val k1_20041218_2: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20041218_2() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let test: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2739020c),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x6907f000),        //sxwd $r1 = $r0;;
     _32(0x6a180001),        //copyd $r6 = $r1;;
     _32(0x601c0000),        //make $r7 = 0 (0x0);;
     _32(0x7b062f46),        //srld $r1 = $r6, 61 (0x3d);;
     _32(0x793e20c7),        //slld $r15 = $r7, 3 (0x3);;
     _32(0x7a3d03c1),        //ord $r15 = $r1, $r15;;
     _32(0x793a20c6),        //slld $r14 = $r6, 3 (0x3);;
     _32(0x6907f000),        //sxwd $r1 = $r0;;
     _32(0x6104ffc1),        //addd $r1 = $r1, -1 (0xffffffff);;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x6907f000),        //sxwd $r1 = $r0;;
     _32(0x6a100001),        //copyd $r4 = $r1;;
     _32(0x60140000),        //make $r5 = 0 (0x0);;
     _32(0x7b062f44),        //srld $r1 = $r4, 61 (0x3d);;
     _32(0x792e20c5),        //slld $r11 = $r5, 3 (0x3);;
     _32(0x7a2d02c1),        //ord $r11 = $r1, $r11;;
     _32(0x792a20c4),        //slld $r10 = $r4, 3 (0x3);;
     _32(0x6907f000),        //sxwd $r1 = $r0;;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0x7b062f42),        //srld $r1 = $r2, 61 (0x3d);;
     _32(0x792620c3),        //slld $r9 = $r3, 3 (0x3);;
     _32(0x7a250241),        //ord $r9 = $r1, $r9;;
     _32(0x792220c2),        //slld $r8 = $r2, 3 (0x3);;
     _32(0x3004040c),        //lwz $r1 = 16 (0x10)[$r12];;
     _32(0x71040041),        //addw $r1 = $r1, 1 (0x1);;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x6000007b),        //make $r0 = 123 (0x7b);;
     _32(0x1fffffd8),        //call 16820 <test>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000003f101b6c0),        //compw.eq $r0 = $r0, 123 (0x7b);;
     _32(0x0c000080),        //cb.wnez $r0? 168d8 <main+0x28>;;
     _32(0x18000007),        //call 168f0 <abort>;;
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
     _32(0x980000f3),        //call 16cc8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 187f8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100010110000; //0x168b0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100011110000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
