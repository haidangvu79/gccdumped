// executing pipeline 20001026_1.c.out.dumped test 
val k1_pipeline_20001026_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20001026_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let real_value_from_int_cst: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x2701100c),        //sd 64 (0x40)[$r12] = $r0;;
     _32(0x27050e0c),        //sd 56 (0x38)[$r12] = $r1;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26011f0c),        //sw 124 (0x7c)[$r12] = $r0;;
     _32(0x1000000a),        //goto 1685c <real_value_from_int_cst+0x3c>;;
     _32(0x34001f0c),        //lws $r0 = 124 (0x7c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104200c),        //addd $r1 = $r12, 128 (0x80);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x6004ffff),        //make $r1 = -1 (0xffffffff);;
     _32(0x2705f200),        //sd -56 (0xffffffc8)[$r0] = $r1;;
     _32(0x30001f0c),        //lwz $r0 = 124 (0x7c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26011f0c),        //sw 124 (0x7c)[$r12] = $r0;;
     _32(0x30001f0c),        //lwz $r0 = 124 (0x7c)[$r12];;
     _64(0x00000000f801b080),        //compw.leu $r0 = $r0, 2 (0x2);;
     _32(0x0c7ffd00),        //cb.wnez $r0? 16838 <real_value_from_int_cst+0x18>;;
     _32(0x3800120c),        //ld $r0 = 72 (0x48)[$r12];;
     _32(0x2701180c),        //sd 96 (0x60)[$r12] = $r0;;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _32(0x27011a0c),        //sd 104 (0x68)[$r12] = $r0;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x27011c0c),        //sd 112 (0x70)[$r12] = $r0;;
     _32(0x3800180c),        //ld $r0 = 96 (0x60)[$r12];;
     _32(0x38041a0c),        //ld $r1 = 104 (0x68)[$r12];;
     _32(0x38081c0c),        //ld $r2 = 112 (0x70)[$r12];;
     _32(0x6130200c),        //addd $r12 = $r12, 128 (0x80);;
     _32(0x0fd00000)        //ret ;;
 |];

let build_real_from_int_cst_1: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2739000c),        //sd 0 (0x0)[$r12] = $r14;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x38080000),        //ld $r2 = 0 (0x0)[$r0];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _32(0x3838060c),        //ld $r14 = 24 (0x18)[$r12];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x6a000002),        //copyd $r0 = $r2;;
     _32(0x1fffffd4),        //call 16820 <real_value_from_int_cst>;;
     _32(0x6a0c0000),        //copyd $r3 = $r0;;
     _32(0x6a000002),        //copyd $r0 = $r2;;
     _32(0x270d040e),        //sd 16 (0x10)[$r14] = $r3;;
     _32(0x2705060e),        //sd 24 (0x18)[$r14] = $r1;;
     _32(0x2701080e),        //sd 32 (0x20)[$r14] = $r0;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
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
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x1fffffd7),        //call 16898 <build_real_from_int_cst_1>;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x08000080),        //cb.dnez $r0? 1694c <main+0x4c>;;
     _32(0x18000006),        //call 16960 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16d38 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18868 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100000000; //0x16900
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(real_value_from_int_cst, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(build_real_from_int_cst_1, 0b00010110100010011000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100101100000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016900;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
