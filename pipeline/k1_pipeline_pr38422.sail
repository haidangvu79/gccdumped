// executing pipeline pr38422 test 
val k1_pipeline_pr38422: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr38422() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo: list_I = 
 [|
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x6903d000),        //extfs $r0 = $r0, 29 (0x1d), 0 (0x0);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x000ffffff800ffc0),        //andw $r0 = $r0, 1073741823 (0x3fffffff);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _64(0x000ffffff800ffc0),        //andw $r0 = $r0, 1073741823 (0x3fffffff);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x79023080),        //sllw $r0 = $r0, 2 (0x2);;
     _32(0x7a023080),        //sraw $r0 = $r0, 2 (0x2);;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _32(0x30000001),        //lwz $r0 = 0 (0x0)[$r1];;
     _32(0x6103d002),        //insf $r0 = $r2, 29 (0x1d), 0 (0x0);;
     _32(0x26010001),        //sw 0 (0x0)[$r1] = $r0;;
     _32(0x7f03f000),        //nop ;;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _32(0x30000001),        //lwz $r0 = 0 (0x0)[$r1];;
     _32(0x60080018),        //make $r2 = 24 (0x18);;
     _32(0x6103d002),        //insf $r0 = $r2, 29 (0x1d), 0 (0x0);;
     _32(0x26010001),        //sw 0 (0x0)[$r1] = $r0;;
     _32(0x1fffffde),        //call 16820 <foo>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x000ffffff800ffc0),        //andw $r0 = $r0, 1073741823 (0x3fffffff);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000001f101b400),        //compw.eq $r0 = $r0, 48 (0x30);;
     _32(0x0c000080),        //cb.wnez $r0? 168d8 <main+0x58>;;
     _32(0x18000007),        //call 168f0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16cc8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 187f8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100010000000; //0x16880
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100011110000, num_instr, mI);
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
