// executing pipeline pr79121.c.out.dumped test 
val k1_pipeline_pr79121: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr79121() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let f1: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3400060c),        //lws $r0 = 24 (0x18)[$r12];;
     _32(0x79022100),        //slld $r0 = $r0, 4 (0x4);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x79022100),        //slld $r0 = $r0, 4 (0x4);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f3: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x79022100),        //slld $r0 = $r0, 4 (0x4);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f4: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3400060c),        //lws $r0 = 24 (0x18)[$r12];;
     _32(0x79022100),        //slld $r0 = $r0, 4 (0x4);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _64(0x07fc0000e000003f),        //make $r0 = -268435456 (0xfffffffff0000000);;
     _32(0x1fffffe3),        //call 16820 <f1>;;
     _64(0x07c00000e1010000),        //compd.eq $r0 = $r0, -4294967296 (0xffffffff00000000);;
     _32(0x08000080),        //cb.dnez $r0? 168a8 <main+0x28>;;
     _32(0x1800001b),        //call 16910 <abort>;;
     _64(0x07fc0000e000003f),        //make $r0 = -268435456 (0xfffffffff0000000);;
     _32(0x1fffffe2),        //call 16838 <f2>;;
     _64(0x03c00000e1010000),        //compd.eq $r0 = $r0, 64424509440 (0xf00000000);;
     _32(0x08000080),        //cb.dnez $r0? 168c4 <main+0x44>;;
     _32(0x18000014),        //call 16910 <abort>;;
     _64(0x07fc0000e000003f),        //make $r0 = -268435456 (0xfffffffff0000000);;
     _32(0x1fffffe1),        //call 16850 <f3>;;
     _64(0x03c00000e1010000),        //compd.eq $r0 = $r0, 64424509440 (0xf00000000);;
     _32(0x08000080),        //cb.dnez $r0? 168e0 <main+0x60>;;
     _32(0x1800000d),        //call 16910 <abort>;;
     _64(0x07fc0000e000003f),        //make $r0 = -268435456 (0xfffffffff0000000);;
     _32(0x1fffffe0),        //call 16868 <f4>;;
     _64(0x07c00000e1010000),        //compd.eq $r0 = $r0, -4294967296 (0xffffffff00000000);;
     _32(0x08000080),        //cb.dnez $r0? 168fc <main+0x7c>;;
     _32(0x18000006),        //call 16910 <abort>;;
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
     _32(0x980000f3),        //call 16ce8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18818 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100010000000; //0x16880
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f1, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f2, 0b00010110100000111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f3, 0b00010110100001010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f4, 0b00010110100001101000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100100010000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016880;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
