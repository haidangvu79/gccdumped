// executing 20000815_1.c.out.dumped test 
val k1_20000815_1.: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20000815_1.() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let invalidate_memory: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x2849060c),        //sq 24 (0x18)[$r12] = $r18r19;;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x27410a0c),        //sd 40 (0x28)[$r12] = $r16;;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x680330c0),        //extfs $r0 = $r0, 3 (0x3), 3 (0x3);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x68032080),        //extfs $r0 = $r0, 2 (0x2), 2 (0x2);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x60480000),        //make $r18 = 0 (0x0);;
     _32(0x1000001b),        //goto 168d8 <invalidate_memory+0xb8>;;
     _96(0x0000000080000106e0047000),        //make $r1 = 268736 (0x419c0);;
     _32(0x6903f012),        //sxwd $r0 = $r18;;
     _32(0x383af001),        //ld.xs $r14 = $r0[$r1];;
     _32(0x10000012),        //goto 168cc <invalidate_memory+0xac>;;
     _32(0x384c020e),        //ld $r19 = 8 (0x8)[$r14];;
     _32(0x2000100e),        //lbz $r0 = 64 (0x40)[$r14];;
     _32(0x08800380),        //cb.deqz $r0? 168c8 <invalidate_memory+0xa8>;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x0c000240),        //cb.wnez $r0? 168bc <invalidate_memory+0x9c>;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _32(0x0c8000c0),        //cb.weqz $r0? 168ac <invalidate_memory+0x8c>;;
     _32(0x2000104e),        //lbz $r0 = 65 (0x41)[$r14];;
     _32(0x08000140),        //cb.dnez $r0? 168bc <invalidate_memory+0x9c>;;
     _32(0x3800000e),        //ld $r0 = 0 (0x0)[$r14];;
     _32(0x18000016),        //call 16908 <cse_rtx_addr_varies_p>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800100),        //cb.deqz $r0? 168c8 <invalidate_memory+0xa8>;;
     _32(0x7a040012),        //copyw $r1 = $r18;;
     _32(0x6a00000e),        //copyd $r0 = $r14;;
     _32(0x18000017),        //call 16920 <remove_from_table>;;
     _32(0x6a380013),        //copyd $r14 = $r19;;
     _32(0x087ffbce),        //cb.dnez $r14? 16888 <invalidate_memory+0x68>;;
     _32(0x71000052),        //addw $r0 = $r18, 1 (0x1);;
     _32(0x7848ffc0),        //zxwd $r18 = $r0;;
     _64(0x00000000f401b792),        //compw.le $r0 = $r18, 30 (0x1e);;
     _32(0x0c7ff900),        //cb.wnez $r0? 16870 <invalidate_memory+0x50>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3838040c),        //ld $r14 = 16 (0x10)[$r12];;
     _32(0x3c48060c),        //lq $r18r19 = 24 (0x18)[$r12];;
     _32(0x38400a0c),        //ld $r16 = 40 (0x28)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let cse_rtx_addr_varies_p: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let remove_from_table: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x18000031)        //call 169f8 <abort>;;
 |];

let main: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x27050200),        //sd 8 (0x8)[$r0] = $r1;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x27050400),        //sd 16 (0x10)[$r0] = $r1;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x27050600),        //sd 24 (0x18)[$r0] = $r1;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x27050800),        //sd 32 (0x20)[$r0] = $r1;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x27050a00),        //sd 40 (0x28)[$r0] = $r1;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x27050c00),        //sd 48 (0x30)[$r0] = $r1;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x27050e00),        //sd 56 (0x38)[$r0] = $r1;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x27051000),        //sd 64 (0x40)[$r0] = $r1;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2401140c),        //sb 80 (0x50)[$r12] = $r0;;
     _96(0x0000000080000106e0047000),        //make $r1 = 268736 (0x419c0);;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _32(0x6100160c),        //addd $r0 = $r12, 88 (0x58);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x2000160c),        //lbz $r0 = 88 (0x58)[$r12];;
     _32(0x6004ffff),        //make $r1 = -1 (0xffffffff);;
     _32(0x60031041),        //insf $r0 = $r1, 1 (0x1), 1 (0x1);;
     _32(0x2401160c),        //sb 88 (0x58)[$r12] = $r0;;
     _32(0x2000160c),        //lbz $r0 = 88 (0x58)[$r12];;
     _32(0x6004ffff),        //make $r1 = -1 (0xffffffff);;
     _32(0x60032081),        //insf $r0 = $r1, 2 (0x2), 2 (0x2);;
     _32(0x2401160c),        //sb 88 (0x58)[$r12] = $r0;;
     _32(0x6100160c),        //addd $r0 = $r12, 88 (0x58);;
     _32(0x1fffff91),        //call 16820 <invalidate_memory>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16dd0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18900 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100111000; //0x16938
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(invalidate_memory, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(cse_rtx_addr_varies_p, 0b00010110100100001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(remove_from_table, 0b00010110100100100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100111111000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
