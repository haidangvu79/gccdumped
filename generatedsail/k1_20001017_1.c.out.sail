// executing 20001017_1.c.out.dumped test 
val k1_20001017_1.: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20001017_1.() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let bug: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x27011e0c),        //sd 120 (0x78)[$r12] = $r0;;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x26091a0c),        //sw 104 (0x68)[$r12] = $r2;;
     _32(0x260d180c),        //sw 96 (0x60)[$r12] = $r3;;
     _32(0x2611160c),        //sw 88 (0x58)[$r12] = $r4;;
     _32(0x2715140c),        //sd 80 (0x50)[$r12] = $r5;;
     _32(0x2719120c),        //sd 72 (0x48)[$r12] = $r6;;
     _32(0x261d100c),        //sw 64 (0x40)[$r12] = $r7;;
     _32(0x27210e0c),        //sd 56 (0x38)[$r12] = $r8;;
     _32(0x26250c0c),        //sw 48 (0x30)[$r12] = $r9;;
     _32(0x27290a0c),        //sd 40 (0x28)[$r12] = $r10;;
     _32(0x272d080c),        //sd 32 (0x20)[$r12] = $r11;;
     _32(0x24011c0c),        //sb 112 (0x70)[$r12] = $r0;;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x38001e0c),        //ld $r0 = 120 (0x78)[$r12];;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16874 <bug+0x54>;;
     _32(0x18000024),        //call 16900 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130200c),        //addd $r12 = $r12, 128 (0x80);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741080c),        //sd 32 (0x20)[$r12] = $r16;;
     _32(0x610c0a0c),        //addd $r3 = $r12, 40 (0x28);;
     _32(0x61080c0c),        //addd $r2 = $r12, 48 (0x30);;
     _32(0x61040e0c),        //addd $r1 = $r12, 56 (0x38);;
     _32(0x61000a0c),        //addd $r0 = $r12, 40 (0x28);;
     _32(0x60100008),        //make $r4 = 8 (0x8);;
     _32(0x2611000c),        //sw 0 (0x0)[$r12] = $r4;;
     _32(0x6a2c0003),        //copyd $r11 = $r3;;
     _96(0x0200e00080000000e0280000),        //make $r10 = 4619567317775286272 (0x401c000000000000);;
     _32(0x60240006),        //make $r9 = 6 (0x6);;
     _32(0x6a200002),        //copyd $r8 = $r2;;
     _32(0x601c0005),        //make $r7 = 5 (0x5);;
     _32(0x6a180001),        //copyd $r6 = $r1;;
     _96(0x0200800080000000e0140000),        //make $r5 = 4616189618054758400 (0x4010000000000000);;
     _32(0x60100003),        //make $r4 = 3 (0x3);;
     _32(0x600c0002),        //make $r3 = 2 (0x2);;
     _32(0x60080001),        //make $r2 = 1 (0x1);;
     _32(0x60040042),        //make $r1 = 66 (0x42);;
     _32(0x1fffffce),        //call 16820 <bug>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840080c),        //ld $r16 = 32 (0x20)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16cd8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18808 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100010001000; //0x16888
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bug, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100100000000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
