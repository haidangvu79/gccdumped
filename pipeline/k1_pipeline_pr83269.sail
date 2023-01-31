// executing pipeline pr83269.c.out.dumped test 
val k1_pipeline_pr83269: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr83269() = {
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
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2401040c),        //sb 16 (0x10)[$r12] = $r0;;
     _64(0x00200000e0000000),        //make $r0 = 2147483648 (0x80000000);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2000040c),        //lbz $r0 = 16 (0x10)[$r12];;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x790237c0),        //sllw $r0 = $r0, 31 (0x1f);;
     _32(0x75011001),        //sbfw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x75011040),        //sbfw $r0 = $r0, $r1;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x75000000),        //negw $r0 = $r0;;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x3000050c),        //lwz $r0 = 20 (0x14)[$r12];;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16894 <main+0x74>;;
     _32(0x18000006),        //call 168a8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16c80 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 187b0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100010101000, num_instr, mI);
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
