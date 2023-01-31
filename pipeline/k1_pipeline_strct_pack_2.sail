// executing pipeline strct_pack_2 test 
val k1_pipeline_strct_pack_2: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_strct_pack_2() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let main: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x25010f8c),        //sh 62 (0x3e)[$r12] = $r0;;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x2c000f8c),        //lhs $r0 = 62 (0x3e)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x38040c0c),        //ld $r1 = 48 (0x30)[$r12];;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x61040a0c),        //addd $r1 = $r12, 40 (0x28);;
     _32(0x27050080),        //sd 2 (0x2)[$r0] = $r1;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000002),        //call 16868 <exit>;;
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
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100001101000, num_instr, mI);
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
