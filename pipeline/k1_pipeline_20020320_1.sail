// executing pipeline 20020320_1.c.out.dumped test 
val k1_pipeline_20020320_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20020320_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let main: list_I = 
 [|
     _32(0x6130d80c),        //addd $r12 = $r12, -160 (0xffffff60);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x2601270c),        //sw 156 (0x9c)[$r12] = $r0;;
     _32(0x3004270c),        //lwz $r1 = 156 (0x9c)[$r12];;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2601260c),        //sw 152 (0x98)[$r12] = $r0;;
     _32(0x3000260c),        //lwz $r0 = 152 (0x98)[$r12];;
     _32(0x75011040),        //sbfw $r0 = $r0, $r1;;
     _32(0x2601250c),        //sw 148 (0x94)[$r12] = $r0;;
     _32(0x3000250c),        //lwz $r0 = 148 (0x94)[$r12];;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16860 <main+0x40>;;
     _32(0x18000025),        //call 168f0 <abort>;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x2701100c),        //sd 64 (0x40)[$r12] = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x2701120c),        //sd 72 (0x48)[$r12] = $r0;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x2701140c),        //sd 80 (0x50)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x2701160c),        //sd 88 (0x58)[$r12] = $r0;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x2701180c),        //sd 96 (0x60)[$r12] = $r0;;
     _32(0x3004100c),        //lwz $r1 = 64 (0x40)[$r12];;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x27011a0c),        //sd 104 (0x68)[$r12] = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x27011c0c),        //sd 112 (0x70)[$r12] = $r0;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x27011e0c),        //sd 120 (0x78)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x2701200c),        //sd 128 (0x80)[$r12] = $r0;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x2701220c),        //sd 136 (0x88)[$r12] = $r0;;
     _32(0x30001a0c),        //lwz $r0 = 104 (0x68)[$r12];;
     _32(0x75011040),        //sbfw $r0 = $r0, $r1;;
     _32(0x2601250c),        //sw 148 (0x94)[$r12] = $r0;;
     _32(0x3000250c),        //lwz $r0 = 148 (0x94)[$r12];;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 168e4 <main+0xc4>;;
     _32(0x18000004),        //call 168f0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 16910 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16d10 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 189e8 <_exit>
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
     _32(0x98000161),        //call 16ea8 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 1694c <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 189e8 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100011110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100100010000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016820;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
