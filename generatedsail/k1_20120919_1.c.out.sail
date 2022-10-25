// executing 20120919_1.c.out.dumped test 
val k1_20120919_1.: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20120919_1.() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let init: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x08000100),        //cb.dnez $r0? 16840 <init+0x20>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _64(0x07fffff9e130f80c),        //addd $r12 = $r12, -6176 (0xffffffffffffe7e0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _64(0x18000006a601070c),        //sw 6172 (0x181c)[$r12] = $r0;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2601080c),        //sw 32 (0x20)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _64(0x18000006a601060c),        //sw 6168 (0x1818)[$r12] = $r0;;
     _32(0x61040a0c),        //addd $r1 = $r12, 40 (0x28);;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x1fffffe6),        //call 16820 <init>;;
     _32(0x10000041),        //goto 16990 <main+0x140>;;
     _64(0x18000006b000070c),        //lwz $r0 = 6172 (0x181c)[$r12];;
     _32(0x0c000e40),        //cb.wnez $r0? 1697c <main+0x12c>;;
     _96(0x00000000800000f8e0000800),        //make $r0 = 253984 (0x3e020);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _64(0x18000006b400070c),        //lws $r0 = 6172 (0x181c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x7c030001),        //fcompd.olt $r0 = $r1, $r0;;
     _32(0x08800640),        //cb.deqz $r0? 1692c <main+0xdc>;;
     _96(0x00000000800000f8e0000a00),        //make $r0 = 253992 (0x3e028);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _64(0x18000006b400070c),        //lws $r0 = 6172 (0x181c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x0e0003c0),        //cb.wlez $r0? 1692c <main+0xdc>;;
     _96(0x00000000800000f8e0000a00),        //make $r0 = 253992 (0x3e028);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _64(0x18000006b400070c),        //lws $r0 = 6172 (0x181c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x18000006b004060c),        //lwz $r1 = 6168 (0x1818)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _64(0x18000006a601060c),        //sw 6168 (0x1818)[$r12] = $r0;;
     _96(0x00000000800000f8e0000a00),        //make $r0 = 253992 (0x3e028);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _64(0x18000006b400070c),        //lws $r0 = 6172 (0x181c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x30080000),        //lwz $r2 = 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0000800),        //make $r0 = 253984 (0x3e020);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _64(0x18000006b400070c),        //lws $r0 = 6172 (0x181c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x6907f002),        //sxwd $r1 = $r2;;
     _32(0x44070001),        //floatd.rn $r1 = $r1, 0 (0x0);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _64(0x18000006b000070c),        //lwz $r0 = 6172 (0x181c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _64(0x18000006a601070c),        //sw 6172 (0x181c)[$r12] = $r0;;
     _32(0x3000080c),        //lwz $r0 = 32 (0x20)[$r12];;
     _64(0x18000006b004070c),        //lwz $r1 = 6172 (0x181c)[$r12];;
     _32(0x7201b001),        //compw.lt $r0 = $r1, $r0;;
     _32(0x0c7fef00),        //cb.wnez $r0? 16890 <main+0x40>;;
     _64(0x18000006b000060c),        //lwz $r0 = 6168 (0x1818)[$r12];;
     _64(0x024cb016f101b480),        //compw.eq $r0 = $r0, 1234567890 (0x499602d2);;
     _32(0x0c000080),        //cb.wnez $r0? 169bc <main+0x16c>;;
     _32(0x18000008),        //call 169d8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _64(0x00000006e130080c),        //addd $r12 = $r12, 6176 (0x1820);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16db0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 188e0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100001010000; //0x16850
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(init, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100001010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100111011000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
