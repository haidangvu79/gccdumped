// executing pipeline pr79737_1.c.out.dumped test 
val k1_pipeline_pr79737_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr79737_1() = {
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
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x10000010),        //goto 16878 <foo+0x58>;;
     _96(0x0000000080000117e0003600),        //make $r0 = 285912 (0x45cd8);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000000f401b140),        //compw.le $r0 = $r0, 5 (0x5);;
     _32(0x0c7ffac0),        //cb.wnez $r0? 1683c <foo+0x1c>;;
     _32(0x10000040),        //goto 16994 <foo+0x174>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x60040005),        //make $r1 = 5 (0x5);;
     _32(0x61031001),        //insf $r0 = $r1, 17 (0x11), 0 (0x0);;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x61032481),        //insf $r0 = $r1, 18 (0x12), 18 (0x12);;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x6004fffb),        //make $r1 = -5 (0xfffffffb);;
     _32(0x6203a4c1),        //insf $r0 = $r1, 42 (0x2a), 19 (0x13);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3000050c),        //lwz $r0 = 20 (0x14)[$r12];;
     _32(0x60040009),        //make $r1 = 9 (0x9);;
     _32(0x610392c1),        //insf $r0 = $r1, 25 (0x19), 11 (0xb);;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _96(0x001fffff87ffffffe800ffc0),        //andd $r0 = $r0, 288230376151711743 (0x3ffffffffffffff);;
     _96(0x00a0000080000000ea000000),        //ord $r0 = $r0, 1441151880758558720 (0x1400000000000000);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2000060c),        //lbz $r0 = 24 (0x18)[$r12];;
     _32(0x78000000),        //andw $r0 = $r0, 0 (0x0);;
     _32(0x2401060c),        //sb 24 (0x18)[$r12] = $r0;;
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x2004060c),        //lbz $r1 = 24 (0x18)[$r12];;
     _32(0x24050200),        //sb 8 (0x8)[$r0] = $r1;;
     _96(0x0000000080000117e0003400),        //make $r0 = 285904 (0x45cd0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x08800200),        //cb.deqz $r0? 16950 <foo+0x130>;;
     _96(0x0000000080000117e0003800),        //make $r0 = 285920 (0x45ce0);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x2004060c),        //lbz $r1 = 24 (0x18)[$r12];;
     _32(0x24050200),        //sb 8 (0x8)[$r0] = $r1;;
     _96(0x0000000080000106e0047000),        //make $r1 = 268736 (0x419c0);;
     _32(0x30000101),        //lwz $r0 = 4 (0x4)[$r1];;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x610392c2),        //insf $r0 = $r2, 25 (0x19), 11 (0xb);;
     _32(0x26010101),        //sw 4 (0x4)[$r1] = $r0;;
     _96(0x0000000080000117e0003600),        //make $r0 = 285912 (0x45cd8);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000117e0003600),        //make $r0 = 285912 (0x45cd8);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0003600),        //make $r0 = 285912 (0x45cd8);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000000f401b080),        //compw.le $r0 = $r0, 2 (0x2);;
     _32(0x0c7feec0),        //cb.wnez $r0? 16898 <foo+0x78>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1fffff95),        //call 16820 <foo>;;
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _32(0x690392c0),        //extfs $r0 = $r0, 25 (0x19), 11 (0xb);;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 169f0 <main+0x30>;;
     _32(0x18000007),        //call 16a08 <abort>;;
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
     _32(0x980000f3),        //call 16de0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18910 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100111000000; //0x169c0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100111000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101000001000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000169c0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
