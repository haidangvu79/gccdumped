// executing 920721_4.c.out.dumped test 
val k1_920721_4.: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_920721_4.() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let do_switch_2131: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f901b180),        //compw.gtu $r0 = $r0, 6 (0x6);;
     _32(0x0c000800),        //cb.wnez $r0? 168bc <do_switch.2131+0x9c>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _96(0x00000000800000fce100f000),        //addd $r0 = $r0, 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x0fd80000),        //igoto $r0;;
     _96(0x000000008000005ae0004000),        //make $r0 = 92416 (0x16900);;
     _32(0x10000018),        //goto 168c8 <do_switch.2131+0xa8>;;
     _96(0x000000008000005ae0004200),        //make $r0 = 92424 (0x16908);;
     _32(0x10000014),        //goto 168c8 <do_switch.2131+0xa8>;;
     _96(0x000000008000005ae0004400),        //make $r0 = 92432 (0x16910);;
     _32(0x10000010),        //goto 168c8 <do_switch.2131+0xa8>;;
     _96(0x000000008000005ae0004600),        //make $r0 = 92440 (0x16918);;
     _32(0x1000000c),        //goto 168c8 <do_switch.2131+0xa8>;;
     _96(0x000000008000005ae0004800),        //make $r0 = 92448 (0x16920);;
     _32(0x10000008),        //goto 168c8 <do_switch.2131+0xa8>;;
     _96(0x000000008000005ae0004a00),        //make $r0 = 92456 (0x16928);;
     _32(0x10000004),        //goto 168c8 <do_switch.2131+0xa8>;;
     _96(0x000000008000005ae0004c00),        //make $r0 = 92464 (0x16930);;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let try: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x1fffffcb),        //call 16820 <do_switch.2131>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x0fd80000),        //igoto $r0;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1000000d),        //goto 16938 <try+0x68>;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x1000000b),        //goto 16938 <try+0x68>;;
     _32(0x60000003),        //make $r0 = 3 (0x3);;
     _32(0x10000009),        //goto 16938 <try+0x68>;;
     _32(0x60000004),        //make $r0 = 4 (0x4);;
     _32(0x10000007),        //goto 16938 <try+0x68>;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x10000005),        //goto 16938 <try+0x68>;;
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x10000003),        //goto 16938 <try+0x68>;;
     _64(0x003fffffe000ffc0),        //make $r0 = 4294967295 (0xffffffff);;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000000b),        //goto 16988 <main+0x40>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x1fffffdb),        //call 168d0 <try>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 1697c <main+0x34>;;
     _32(0x1800000a),        //call 169a0 <abort>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f401b180),        //compw.le $r0 = $r0, 6 (0x6);;
     _32(0x0c7ffcc0),        //cb.wnez $r0? 16960 <main+0x18>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 169c0 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16dc0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18a98 <_exit>
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
     _32(0x98000161),        //call 16f58 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000fe00),        //make $r0 = 259064 (0x3f3f8);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 169fc <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18a98 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100101001000; //0x16948
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(do_switch_2131, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(try, 0b00010110100011010000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100101001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100110100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit, 0b00010110100111000000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
