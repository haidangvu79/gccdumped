// executing pipeline pr44575.c.out.dumped test 
val k1_pipeline_pr44575: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr44575() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let check: list_I = 
 [|
     _32(0x6130d80c),        //addd $r12 = $r12, -160 (0xffffff60);;
     _32(0x2705120c),        //sd 72 (0x48)[$r12] = $r1;;
     _32(0x2809140c),        //sq 80 (0x50)[$r12] = $r2r3;;
     _32(0x2811180c),        //sq 96 (0x60)[$r12] = $r4r5;;
     _32(0x28191c0c),        //sq 112 (0x70)[$r12] = $r6r7;;
     _32(0x2821200c),        //sq 128 (0x80)[$r12] = $r8r9;;
     _32(0x2829240c),        //sq 144 (0x90)[$r12] = $r10r11;;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010c0c),        //sw 48 (0x30)[$r12] = $r0;;
     _32(0x6100120c),        //addd $r0 = $r12, 72 (0x48);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x26010b0c),        //sw 44 (0x2c)[$r12] = $r0;;
     _32(0x10000045),        //goto 16974 <check+0x154>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _32(0x71000080),        //addw $r0 = $r0, 2 (0x2);;
     _32(0x26010c0c),        //sw 48 (0x30)[$r12] = $r0;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x79023100),        //sllw $r0 = $r0, 4 (0x4);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x30040b0c),        //lwz $r1 = 44 (0x2c)[$r12];;
     _32(0x7a011001),        //orw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7100fb80),        //addw $r0 = $r0, -18 (0xffffffee);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f901b040),        //compw.gtu $r0 = $r0, 1 (0x1);;
     _32(0x0c000340),        //cb.wnez $r0? 168e4 <check+0xc4>;;
     _96(0x0000000080000117e0003800),        //make $r0 = 285920 (0x45ce0);;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61040400),        //addd $r1 = $r0, 16 (0x10);;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x2705080c),        //sd 32 (0x20)[$r12] = $r1;;
     _32(0x30000200),        //lwz $r0 = 8 (0x8)[$r0];;
     _32(0x26010a0c),        //sw 40 (0x28)[$r12] = $r0;;
     _32(0x1000000c),        //goto 16910 <check+0xf0>;;
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x08800400),        //cb.deqz $r0? 16954 <check+0x134>;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x30040200),        //lwz $r1 = 8 (0x8)[$r0];;
     _32(0x30000a0c),        //lwz $r0 = 40 (0x28)[$r12];;
     _32(0x72030001),        //fcompw.oeq $r0 = $r1, $r0;;
     _32(0x080002c0),        //cb.dnez $r0? 16954 <check+0x134>;;
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x08000240),        //cb.dnez $r0? 16988 <check+0x168>;;
     _32(0x30000b0c),        //lwz $r0 = 44 (0x2c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010b0c),        //sw 44 (0x2c)[$r12] = $r0;;
     _32(0x30000b0c),        //lwz $r0 = 44 (0x2c)[$r12];;
     _64(0x00000000f401b0c0),        //compw.le $r0 = $r0, 3 (0x3);;
     _32(0x0c7fee40),        //cb.wnez $r0? 16864 <check+0x44>;;
     _32(0x10000002),        //goto 1698c <check+0x16c>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130280c),        //addd $r12 = $r12, 160 (0xa0);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _64(0x0031cfe0e0048000),        //make $r1 = 3342828032 (0xc73f8200);;
     _32(0x26050800),        //sw 32 (0x20)[$r0] = $r1;;
     _96(0x0000000080000117e0043200),        //make $r1 = 285896 (0x45cc8);;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x380c0601),        //ld $r3 = 24 (0x18)[$r1];;
     _32(0x30040801),        //lwz $r1 = 32 (0x20)[$r1];;
     _32(0x6a100001),        //copyd $r4 = $r1;;
     _32(0x38040600),        //ld $r1 = 24 (0x18)[$r0];;
     _32(0x30000800),        //lwz $r0 = 32 (0x20)[$r0];;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffff8c),        //call 16820 <check>;;
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x08800080),        //cb.deqz $r0? 16a0c <main+0x74>;;
     _32(0x18000006),        //call 16a20 <abort>;;
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
     _32(0x980000f3),        //call 16df8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18928 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100110011000; //0x16998
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(check, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100110011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101000100000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016998;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
