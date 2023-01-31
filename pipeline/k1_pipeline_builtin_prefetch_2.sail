// executing pipeline builtin_prefetch_2 test 
val k1_pipeline_builtin_prefetch_2: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_builtin_prefetch_2() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let simple_global: list_I = 
 [|
     _96(0x0000000080000117e000f600),        //make $r0 = 286680 (0x45fd8);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0000400),        //make $r0 = 253968 (0x3e010);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x7f03f000),        //nop ;;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let simple_file: list_I = 
 [|
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0000600),        //make $r0 = 253976 (0x3e018);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x0000000080000106e000d400),        //make $r0 = 269136 (0x41b50);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x7f03f000),        //nop ;;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let simple_static_local: list_I = 
 [|
     _96(0x0000000080000106e000d600),        //make $r0 = 269144 (0x41b58);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0000a00),        //make $r0 = 253992 (0x3e028);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x0000000080000107e0003a00),        //make $r0 = 269544 (0x41ce8);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x7f03f000),        //nop ;;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let simple_local: list_I = 
 [|
     _32(0x6130980c),        //addd $r12 = $r12, -416 (0xfffffe60);;
     _32(0x6100020c),        //addd $r0 = $r12, 8 (0x8);;
     _32(0x2701660c),        //sd 408 (0x198)[$r12] = $r0;;
     _32(0x6100020c),        //addd $r0 = $r12, 8 (0x8);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3800660c),        //ld $r0 = 408 (0x198)[$r12];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130680c),        //addd $r12 = $r12, 416 (0x1a0);;
     _32(0x0fd00000)        //ret ;;
 |];

let simple_arg: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x2609020c),        //sw 8 (0x8)[$r12] = $r2;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x6100020c),        //addd $r0 = $r12, 8 (0x8);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let expr_global: list_I = 
 [|
     _96(0x0000000080000118e0005a00),        //make $r0 = 287080 (0x46168);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0000800),        //make $r0 = 253984 (0x3e020);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x0000000080000118e0005b00),        //make $r0 = 287084 (0x4616c);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0000800),        //make $r0 = 253984 (0x3e020);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x61000100),        //addd $r0 = $r0, 4 (0x4);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x0000000080000118e0005c00),        //make $r0 = 287088 (0x46170);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0000800),        //make $r0 = 253984 (0x3e020);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x0000000080000118e0005a00),        //make $r0 = 287080 (0x46168);;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0000800),        //make $r0 = 253984 (0x3e020);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x0000000080000118e0005a00),        //make $r0 = 287080 (0x46168);;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0000800),        //make $r0 = 253984 (0x3e020);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x0000000080000117e000f600),        //make $r0 = 286680 (0x45fd8);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x0000000080000117e000f800),        //make $r0 = 286688 (0x45fe0);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x61000300),        //addd $r0 = $r0, 12 (0xc);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x0000000080000117e000f900),        //make $r0 = 286692 (0x45fe4);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0000400),        //make $r0 = 253968 (0x3e010);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _96(0x0000000080000117e100f600),        //addd $r0 = $r0, 286680 (0x45fd8);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x61000500),        //addd $r0 = $r0, 20 (0x14);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0000400),        //make $r0 = 253968 (0x3e010);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x7f03f000),        //nop ;;
     _32(0x0fd00000)        //ret ;;
 |];

let expr_local: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x2701160c),        //sd 88 (0x58)[$r12] = $r0;;
     _32(0x6100020c),        //addd $r0 = $r12, 8 (0x8);;
     _32(0x2701140c),        //sd 80 (0x50)[$r12] = $r0;;
     _32(0x60000004),        //make $r0 = 4 (0x4);;
     _32(0x2601130c),        //sw 76 (0x4c)[$r12] = $r0;;
     _32(0x6100020c),        //addd $r0 = $r12, 8 (0x8);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x6100020c),        //addd $r0 = $r12, 8 (0x8);;
     _32(0x61000100),        //addd $r0 = $r0, 4 (0x4);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _32(0x61000100),        //addd $r0 = $r0, 4 (0x4);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x6100020c),        //addd $r0 = $r12, 8 (0x8);;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x61000300),        //addd $r0 = $r0, 12 (0xc);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x61000300),        //addd $r0 = $r0, 12 (0xc);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3400130c),        //lws $r0 = 76 (0x4c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x6104080c),        //addd $r1 = $r12, 32 (0x20);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x61000500),        //addd $r0 = $r0, 20 (0x14);;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3400130c),        //lws $r0 = 76 (0x4c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x3804160c),        //ld $r1 = 88 (0x58)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1fffff09),        //call 16820 <simple_global>;;
     _32(0x1fffff18),        //call 16860 <simple_file>;;
     _32(0x1fffff27),        //call 168a0 <simple_static_local>;;
     _32(0x1fffff36),        //call 168e0 <simple_local>;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0040400),        //make $r1 = 253968 (0x3e010);;
     _32(0x30040001),        //lwz $r1 = 0 (0x0)[$r1];;
     _32(0x7a080001),        //copyw $r2 = $r1;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x0000000080000117e000f600),        //make $r0 = 286680 (0x45fd8);;
     _32(0x1fffff34),        //call 16910 <simple_arg>;;
     _96(0x0000000080000118e0005a00),        //make $r0 = 287080 (0x46168);;
     _96(0x0000000080000118e0045a00),        //make $r1 = 287080 (0x46168);;
     _32(0x27050400),        //sd 16 (0x10)[$r0] = $r1;;
     _32(0x1fffff3a),        //call 16948 <expr_global>;;
     _32(0x1fffffa3),        //call 16af0 <expr_local>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000001)        //call 16c70 <exit>;;
 |];

let exit_: list_I = 
 [|
 |];

let adr_start:bits(addr_bits) = 0b00010110101111110000; //0x16bf0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(simple_global, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(simple_file, 0b00010110100001100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(simple_static_local, 0b00010110100010100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(simple_local, 0b00010110100011100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(simple_arg, 0b00010110100100010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(expr_global, 0b00010110100101001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(expr_local, 0b00010110101011110000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101111110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110110001110000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016bf0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
