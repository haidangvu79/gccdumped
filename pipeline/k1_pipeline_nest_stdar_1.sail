// executing pipeline nest_stdar_1.c.out.dumped test 
val k1_pipeline_nest_stdar_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_nest_stdar_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let f_2125: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x27050a0c),        //sd 40 (0x28)[$r12] = $r1;;
     _32(0x28090c0c),        //sq 48 (0x30)[$r12] = $r2r3;;
     _32(0x2811100c),        //sq 64 (0x40)[$r12] = $r4r5;;
     _32(0x2819140c),        //sq 80 (0x50)[$r12] = $r6r7;;
     _32(0x2821180c),        //sq 96 (0x60)[$r12] = $r8r9;;
     _32(0x28291c0c),        //sq 112 (0x70)[$r12] = $r10r11;;
     _32(0x2601020c),        //sw 8 (0x8)[$r12] = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x2701000c),        //sd 0 (0x0)[$r12] = $r0;;
     _32(0x61000a0c),        //addd $r0 = $r12, 40 (0x28);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6130200c),        //addd $r12 = $r12, 128 (0x80);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _96(0x01ff800080000000e0040000),        //make $r1 = 4607182418800017408 (0x3ff0000000000000);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffffe1),        //call 16820 <f.2125>;;
     _96(0x01ff800080000000e0040000),        //make $r1 = 4607182418800017408 (0x3ff0000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 168b8 <main+0x48>;;
     _32(0x18000003),        //call 168c0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 168e0 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16ce0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 189b8 <_exit>
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
     _32(0x98000161),        //call 16e78 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 1691c <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 189b8 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100001110000; //0x16870
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f_2125, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100001110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100011000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100011100000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016870;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
