// executing pr41935.c.out.dumped test 
val k1_pr41935.: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pr41935.() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x2849060c),        //sq 24 (0x18)[$r12] = $r18r19;;
     _32(0x28550a0c),        //so 40 (0x28)[$r12] = $r20r21r22r23;;
     _32(0x2861120c),        //sq 72 (0x48)[$r12] = $r24r25;;
     _32(0x26011a0c),        //sw 104 (0x68)[$r12] = $r0;;
     _32(0x2605180c),        //sw 96 (0x60)[$r12] = $r1;;
     _32(0x2609160c),        //sw 88 (0x58)[$r12] = $r2;;
     _32(0x300c1a0c),        //lwz $r3 = 104 (0x68)[$r12];;
     _32(0x6903f003),        //sxwd $r0 = $r3;;
     _32(0x6100ffc0),        //addd $r0 = $r0, -1 (0xffffffff);;
     _32(0x27011c0c),        //sd 112 (0x70)[$r12] = $r0;;
     _32(0x6903f003),        //sxwd $r0 = $r3;;
     _32(0x6a400000),        //copyd $r16 = $r0;;
     _32(0x60440000),        //make $r17 = 0 (0x0);;
     _32(0x7b022ed0),        //srld $r0 = $r16, 59 (0x3b);;
     _32(0x79662151),        //slld $r25 = $r17, 5 (0x5);;
     _32(0x7a650640),        //ord $r25 = $r0, $r25;;
     _32(0x79622150),        //slld $r24 = $r16, 5 (0x5);;
     _32(0x6903f003),        //sxwd $r0 = $r3;;
     _32(0x6a380000),        //copyd $r14 = $r0;;
     _32(0x603c0000),        //make $r15 = 0 (0x0);;
     _32(0x30401a0c),        //lwz $r16 = 104 (0x68)[$r12];;
     _32(0x6903f010),        //sxwd $r0 = $r16;;
     _32(0x6a280000),        //copyd $r10 = $r0;;
     _32(0x602c0000),        //make $r11 = 0 (0x0);;
     _32(0x5904128e),        //muludt $r0r1 = $r14, $r10;;
     _32(0x500402ce),        //maddd $r1 = $r14, $r11;;
     _32(0x5004028f),        //maddd $r1 = $r15, $r10;;
     _32(0x7b0a2ec0),        //srld $r2 = $r0, 59 (0x3b);;
     _32(0x795e2141),        //slld $r23 = $r1, 5 (0x5);;
     _32(0x7a5d05c2),        //ord $r23 = $r2, $r23;;
     _32(0x795a2140),        //slld $r22 = $r0, 5 (0x5);;
     _32(0x6903f010),        //sxwd $r0 = $r16;;
     _32(0x6100ffc0),        //addd $r0 = $r0, -1 (0xffffffff);;
     _32(0x27011e0c),        //sd 120 (0x78)[$r12] = $r0;;
     _32(0x6903f003),        //sxwd $r0 = $r3;;
     _32(0x6a200000),        //copyd $r8 = $r0;;
     _32(0x60240000),        //make $r9 = 0 (0x0);;
     _32(0x6903f010),        //sxwd $r0 = $r16;;
     _32(0x6a180000),        //copyd $r6 = $r0;;
     _32(0x601c0000),        //make $r7 = 0 (0x0);;
     _32(0x59041188),        //muludt $r0r1 = $r8, $r6;;
     _32(0x500401c8),        //maddd $r1 = $r8, $r7;;
     _32(0x50040189),        //maddd $r1 = $r9, $r6;;
     _32(0x7b0a2ec0),        //srld $r2 = $r0, 59 (0x3b);;
     _32(0x79562141),        //slld $r21 = $r1, 5 (0x5);;
     _32(0x7a550542),        //ord $r21 = $r2, $r21;;
     _32(0x79522140),        //slld $r20 = $r0, 5 (0x5);;
     _32(0x6907f003),        //sxwd $r1 = $r3;;
     _32(0x6903f010),        //sxwd $r0 = $r16;;
     _32(0x54001001),        //muld $r0 = $r1, $r0;;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x6a100000),        //copyd $r4 = $r0;;
     _32(0x60140000),        //make $r5 = 0 (0x0);;
     _32(0x7b022f44),        //srld $r0 = $r4, 61 (0x3d);;
     _32(0x794e20c5),        //slld $r19 = $r5, 3 (0x3);;
     _32(0x7a4d04c0),        //ord $r19 = $r0, $r19;;
     _32(0x794a20c4),        //slld $r18 = $r4, 3 (0x3);;
     _32(0x6907f003),        //sxwd $r1 = $r3;;
     _32(0x3400180c),        //lws $r0 = 96 (0x60)[$r12];;
     _32(0x54041001),        //muld $r1 = $r1, $r0;;
     _32(0x3400160c),        //lws $r0 = 88 (0x58)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x3838040c),        //ld $r14 = 16 (0x10)[$r12];;
     _32(0x3c48060c),        //lq $r18r19 = 24 (0x18)[$r12];;
     _32(0x3c540a0c),        //lo $r20r21r22r23 = 40 (0x28)[$r12];;
     _32(0x3c60120c),        //lq $r24r25 = 72 (0x48)[$r12];;
     _32(0x6130200c),        //addd $r12 = $r12, 128 (0x80);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60080003),        //make $r2 = 3 (0x3);;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1fffffb0),        //call 16820 <foo>;;
     _32(0x61010e00),        //compd.eq $r0 = $r0, 56 (0x38);;
     _32(0x08000080),        //cb.dnez $r0? 16970 <main+0x28>;;
     _32(0x1800000d),        //call 169a0 <abort>;;
     _32(0x60080005),        //make $r2 = 5 (0x5);;
     _32(0x60040005),        //make $r1 = 5 (0x5);;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1fffffa9),        //call 16820 <foo>;;
     _32(0x61011f00),        //compd.eq $r0 = $r0, 124 (0x7c);;
     _32(0x08000080),        //cb.dnez $r0? 1698c <main+0x44>;;
     _32(0x18000006),        //call 169a0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16d78 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 188a8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100101001000; //0x16948
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100101001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100110100000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
