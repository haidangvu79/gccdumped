// executing pr46909_2.c.out.dumped test 
val k1_pr46909_2.c.out.dumped: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pr46909_2.c.out.dumped() = {
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
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0c800140),        //cb.weqz $r0? 16840 <foo+0x20>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f001b340),        //compw.ne $r0 = $r0, 13 (0xd);;
     _32(0x0c000240),        //cb.wnez $r0? 16860 <foo+0x40>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f101b140),        //compw.eq $r0 = $r0, 5 (0x5);;
     _32(0x0c000140),        //cb.wnez $r0? 16860 <foo+0x40>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f001b500),        //compw.ne $r0 = $r0, 20 (0x14);;
     _32(0x0c0000c0),        //cb.wnez $r0? 16868 <foo+0x48>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x10000003),        //goto 16870 <foo+0x50>;;
     _64(0x003fffffe000ffc0),        //make $r0 = 4294967295 (0xffffffff);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x6000fff6),        //make $r0 = -10 (0xfffffff6);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000019),        //goto 168f0 <main+0x78>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x1fffffe3),        //call 16820 <foo>;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x0c000100),        //cb.wnez $r0? 168b0 <main+0x38>;;
     _64(0x003fffffe008ffc0),        //make $r2 = 4294967295 (0xffffffff);;
     _32(0x10000002),        //goto 168b4 <main+0x3c>;;
     _32(0x60080001),        //make $r2 = 1 (0x1);;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f001b340),        //compw.ne $r0 = $r0, 13 (0xd);;
     _32(0x0c0000c0),        //cb.wnez $r0? 168cc <main+0x54>;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x10000002),        //goto 168d0 <main+0x58>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x75011080),        //sbfw $r0 = $r0, $r2;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 168e4 <main+0x6c>;;
     _32(0x1800000e),        //call 16918 <abort>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f401b740),        //compw.le $r0 = $r0, 29 (0x1d);;
     _32(0x0c7ff940),        //cb.wnez $r0? 16890 <main+0x18>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
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
     _32(0x980000f3),        //call 16cf0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18820 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100001111000; //0x16878
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100001111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100100011000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
