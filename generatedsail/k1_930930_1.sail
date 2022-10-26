// executing 930930_1 test 
val k1_930930_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_930930_1() = {
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
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x27050a0c),        //sd 40 (0x28)[$r12] = $r1;;
     _32(0x2709080c),        //sd 32 (0x20)[$r12] = $r2;;
     _32(0x270d060c),        //sd 24 (0x18)[$r12] = $r3;;
     _32(0x2711040c),        //sd 16 (0x10)[$r12] = $r4;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x7701a001),        //compd.geu $r0 = $r1, $r0;;
     _32(0x08800600),        //cb.deqz $r0? 168b4 <f+0x94>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x7801a040),        //compd.leu $r0 = $r0, $r1;;
     _32(0x08000380),        //cb.dnez $r0? 168a4 <f+0x84>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x7901a040),        //compd.gtu $r0 = $r0, $r1;;
     _32(0x08000200),        //cb.dnez $r0? 168a4 <f+0x84>;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x6100fe00),        //addd $r0 = $r0, -8 (0xfffffff8);;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6100fe00),        //addd $r0 = $r0, -8 (0xfffffff8);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x17ffffe6),        //goto 16848 <f+0x28>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 168cc <f+0xac>;;
     _32(0x18000024),        //call 16958 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x0000000080000117e0042400),        //make $r1 = 285840 (0x45c90);;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _64(0x18000000a705c600),        //sd 792 (0x318)[$r0] = $r1;;
     _96(0x0000000080000117e000ec00),        //make $r0 = 286640 (0x45fb0);;
     _96(0x0000000080000117e0043000),        //make $r1 = 285888 (0x45cc0);;
     _96(0x0000000080000117e0083400),        //make $r2 = 285904 (0x45cd0);;
     _96(0x0000000080000117e00cea00),        //make $r3 = 286632 (0x45fa8);;
     _96(0x0000000080000117e010ea00),        //make $r4 = 286632 (0x45fa8);;
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

let exit_: list_I = 
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

let adr_start:bits(addr_bits) = 0b00010110100011100000; //0x168e0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100011100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100101011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100101111000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
