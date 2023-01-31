// executing pipeline 20031011_1.c.out.dumped test 
val k1_pipeline_20031011_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20031011_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x60000020),        //make $r0 = 32 (0x20);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x60000020),        //make $r0 = 32 (0x20);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x60000020),        //make $r0 = 32 (0x20);;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x3004050c),        //lwz $r1 = 20 (0x14)[$r12];;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3008070c),        //lwz $r2 = 28 (0x1c)[$r12];;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71011002),        //addw $r0 = $r2, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x73011001),        //maxw $r0 = $r1, $r0;;
     _32(0x2601030c),        //sw 12 (0xc)[$r12] = $r0;;
     _32(0x3000030c),        //lwz $r0 = 12 (0xc)[$r12];;
     _64(0x00000002f101b000),        //compw.eq $r0 = $r0, 64 (0x40);;
     _32(0x0c000080),        //cb.wnez $r0? 16888 <main+0x68>;;
     _32(0x18000033),        //call 16950 <abort>;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3008050c),        //lwz $r2 = 20 (0x14)[$r12];;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x71011002),        //addw $r0 = $r2, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x73011001),        //maxw $r0 = $r1, $r0;;
     _32(0x2601030c),        //sw 12 (0xc)[$r12] = $r0;;
     _32(0x3000030c),        //lwz $r0 = 12 (0xc)[$r12];;
     _64(0x00000002f101b000),        //compw.eq $r0 = $r0, 64 (0x40);;
     _32(0x0c000080),        //cb.wnez $r0? 168c4 <main+0xa4>;;
     _32(0x18000024),        //call 16950 <abort>;;
     _32(0x3004050c),        //lwz $r1 = 20 (0x14)[$r12];;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3008070c),        //lwz $r2 = 28 (0x1c)[$r12];;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71011002),        //addw $r0 = $r2, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x72011001),        //minw $r0 = $r1, $r0;;
     _32(0x2601030c),        //sw 12 (0xc)[$r12] = $r0;;
     _32(0x3000030c),        //lwz $r0 = 12 (0xc)[$r12];;
     _64(0x00000001f101b000),        //compw.eq $r0 = $r0, 32 (0x20);;
     _32(0x0c000080),        //cb.wnez $r0? 16900 <main+0xe0>;;
     _32(0x18000015),        //call 16950 <abort>;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3008050c),        //lwz $r2 = 20 (0x14)[$r12];;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x71011002),        //addw $r0 = $r2, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x72011001),        //minw $r0 = $r1, $r0;;
     _32(0x2601030c),        //sw 12 (0xc)[$r12] = $r0;;
     _32(0x3000030c),        //lwz $r0 = 12 (0xc)[$r12];;
     _64(0x00000001f101b000),        //compw.eq $r0 = $r0, 32 (0x20);;
     _32(0x0c000080),        //cb.wnez $r0? 1693c <main+0x11c>;;
     _32(0x18000006),        //call 16950 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16d28 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18858 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100101010000, num_instr, mI);
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
