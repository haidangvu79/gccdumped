// executing pipeline 20010409_1.c.out.dumped test 
val k1_pipeline_20010409_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20010409_1() = {
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
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x2609020c),        //sw 8 (0x8)[$r12] = $r2;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61000100),        //addd $r0 = $r0, 4 (0x4);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _32(0x3004020c),        //lwz $r1 = 8 (0x8)[$r12];;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x71011040),        //addw $r0 = $r0, $r1;;
     _32(0x790230c0),        //sllw $r0 = $r0, 3 (0x3);;
     _32(0x71011040),        //addw $r0 = $r0, $r1;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71011002),        //addw $r0 = $r2, $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let bar: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x26050c0c),        //sw 48 (0x30)[$r12] = $r1;;
     _32(0x26090a0c),        //sw 40 (0x28)[$r12] = $r2;;
     _32(0x270d080c),        //sd 32 (0x20)[$r12] = $r3;;
     _32(0x2611060c),        //sw 24 (0x18)[$r12] = $r4;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _32(0x0c800080),        //cb.weqz $r0? 168b4 <bar+0x2c>;;
     _32(0x1800007e),        //call 16aa8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000084),        //call 16ac8 <exit>;;
     _32(0x7f03f000)        //nop ;;
 |];

let test: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x2739060c),        //sd 24 (0x18)[$r12] = $r14;;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x27410a0c),        //sd 40 (0x28)[$r12] = $r16;;
     _32(0x2749080c),        //sd 32 (0x20)[$r12] = $r18;;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x27050c0c),        //sd 48 (0x30)[$r12] = $r1;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x30000200),        //lwz $r0 = 8 (0x8)[$r0];;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x600800c8),        //make $r2 = 200 (0xc8);;
     _96(0x00000000800000fce004f000),        //make $r1 = 259008 (0x3f3c0);;
     _32(0x1fffffc1),        //call 16820 <foo>;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x088000c0),        //cb.deqz $r0? 1693c <test+0x7c>;;
     _32(0x60480000),        //make $r18 = 0 (0x0);;
     _32(0x10000003),        //goto 16944 <test+0x84>;;
     _64(0x00000040e0480000),        //make $r18 = 65536 (0x10000);;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x180001c6),        //call 17060 <strlen>;;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x30000200),        //lwz $r0 = 8 (0x8)[$r0];;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x71390001),        //addd $r14 = $r1, $r0;;
     _32(0x601000c9),        //make $r4 = 201 (0xc9);;
     _96(0x00000000800000fce00cf000),        //make $r3 = 259008 (0x3f3c0);;
     _32(0x7a040012),        //copyw $r1 = $r18;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x1fffffbd),        //call 16888 <bar>;;
     _32(0x2701000e),        //sd 0 (0x0)[$r14] = $r0;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x30000200),        //lwz $r0 = 8 (0x8)[$r0];;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _32(0x71040041),        //addw $r1 = $r1, 1 (0x1);;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x08800400),        //cb.deqz $r0? 16a20 <test+0x160>;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x30000200),        //lwz $r0 = 8 (0x8)[$r0];;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38040c0c),        //ld $r1 = 48 (0x30)[$r12];;
     _32(0x30040001),        //lwz $r1 = 0 (0x0)[$r1];;
     _32(0x26050100),        //sw 4 (0x4)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3838060c),        //ld $r14 = 24 (0x18)[$r12];;
     _32(0x38400a0c),        //ld $r16 = 40 (0x28)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3848080c),        //ld $r18 = 32 (0x20)[$r12];;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050200),        //sw 8 (0x8)[$r0] = $r1;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _96(0x0000000080000117e0042800),        //make $r1 = 285856 (0x45ca0);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _96(0x00000000800000fce000f200),        //make $r0 = 259016 (0x3f3c8);;
     _32(0x1fffff8d),        //call 168c0 <test>;;
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
     _32(0x98000105),        //call 16ec8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x9800085f),        //call 18c38 <_exit>
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
     _32(0x98000187),        //call 170f8 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f400),        //make $r0 = 259024 (0x3f3d0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16b04 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x9800084d),        //call 18c38 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101001000000; //0x16a40
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100010001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test, 0b00010110100011000000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101001000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101010101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110101011001000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016a40;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
