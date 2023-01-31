// executing pipeline 950426_2 test 
val k1_pipeline_950426_2: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_950426_2() = {
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
     _64(0x07e00000e000003f),        //make $r0 = -2147483648 (0xffffffff80000000);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x240105cc),        //sb 23 (0x17)[$r12] = $r0;;
     _32(0x240005cc),        //lbs $r0 = 23 (0x17)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x7a026001),        //srad $r0 = $r1, $r0;;
     _64(0x07f00000e1010000),        //compd.eq $r0 = $r0, -1073741824 (0xffffffffc0000000);;
     _32(0x08000080),        //cb.dnez $r0? 16860 <main+0x40>;;
     _32(0x18000013),        //call 168a8 <abort>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _96(0x0089705f8209b5a5e0042cc0),        //make $r1 = 1237940039285380275 (0x112e0be826d694b3);;
     _32(0x580c1040),        //muldt $r2r3 = $r0, $r1;;
     _32(0x6a040003),        //copyd $r1 = $r3;;
     _32(0x7a0626c1),        //srad $r1 = $r1, 27 (0x1b);;
     _32(0x7a022fc0),        //srad $r0 = $r0, 63 (0x3f);;
     _32(0x75010001),        //sbfd $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x7a026001),        //srad $r0 = $r1, $r0;;
     _64(0x07f00000e1010000),        //compd.eq $r0 = $r0, -1073741824 (0xffffffffc0000000);;
     _32(0x08000080),        //cb.dnez $r0? 168a0 <main+0x80>;;
     _32(0x18000003),        //call 168a8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 168c8 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16cc8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 189a0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100010101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100011001000, num_instr, mI);
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
