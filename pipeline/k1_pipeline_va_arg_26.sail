// executing pipeline va_arg_26 test 
val k1_pipeline_va_arg_26: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_va_arg_26() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let f: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x2819140c),        //sq 80 (0x50)[$r12] = $r6r7;;
     _32(0x2821180c),        //sq 96 (0x60)[$r12] = $r8r9;;
     _32(0x28291c0c),        //sq 112 (0x70)[$r12] = $r10r11;;
     _32(0x26010a0c),        //sw 40 (0x28)[$r12] = $r0;;
     _32(0x2605080c),        //sw 32 (0x20)[$r12] = $r1;;
     _32(0x2609060c),        //sw 24 (0x18)[$r12] = $r2;;
     _32(0x260d040c),        //sw 16 (0x10)[$r12] = $r3;;
     _32(0x2611020c),        //sw 8 (0x8)[$r12] = $r4;;
     _32(0x2615000c),        //sw 0 (0x0)[$r12] = $r5;;
     _32(0x6100140c),        //addd $r0 = $r12, 80 (0x50);;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x27050c0c),        //sd 48 (0x30)[$r12] = $r1;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x6130200c),        //addd $r12 = $r12, 128 (0x80);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x0200e00080000000e0180000),        //make $r6 = 4619567317775286272 (0x401c000000000000);;
     _64(0x00103000e0140000),        //make $r5 = 1086324736 (0x40c00000);;
     _64(0x00102800e0100000),        //make $r4 = 1084227584 (0x40a00000);;
     _64(0x00102000e00c0000),        //make $r3 = 1082130432 (0x40800000);;
     _64(0x00101000e0080000),        //make $r2 = 1077936128 (0x40400000);;
     _64(0x00100000e0040000),        //make $r1 = 1073741824 (0x40000000);;
     _64(0x000fe000e0000000),        //make $r0 = 1065353216 (0x3f800000);;
     _32(0x1fffffda),        //call 16820 <f>;;
     _96(0x0200e00080000000e0040000),        //make $r1 = 4619567317775286272 (0x401c000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 168d4 <main+0x64>;;
     _32(0x18000004),        //call 168e0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 16900 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16d00 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 189d8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
 |];

let adr_start:bits(addr_bits) = 0b00010110100001110000; //0x16870
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100001110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100011100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100100000000, num_instr, mI);
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
