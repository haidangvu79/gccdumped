// executing pipeline longlong test 
val k1_pipeline_longlong: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_longlong() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let alpha_ep_extbl_i_eq_0: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _96(0x0000000080000117e0006200),        //make $r0 = 286088 (0x45d88);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x7b0226c0),        //srld $r0 = $r0, 27 (0x1b);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x780007c0),        //andw $r0 = $r0, 31 (0x1f);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _96(0x0000000080000117e0006200),        //make $r0 = 286088 (0x45d88);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7b023140),        //srlw $r0 = $r0, 5 (0x5);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x780007c0),        //andw $r0 = $r0, 31 (0x1f);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _96(0x0000000080000117e0006200),        //make $r0 = 286088 (0x45d88);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x780007c0),        //andw $r0 = $r0, 31 (0x1f);;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x38080000),        //ld $r2 = 0 (0x0)[$r0];;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x790230c0),        //sllw $r0 = $r0, 3 (0x3);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x78000e00),        //andw $r0 = $r0, 56 (0x38);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7b026001),        //srld $r0 = $r1, $r0;;
     _32(0x68003fc0),        //andd $r0 = $r0, 255 (0xff);;
     _32(0x2701020c),        //sd 8 (0x8)[$r12] = $r0;;
     _32(0x3000050c),        //lwz $r0 = 20 (0x14)[$r12];;
     _64(0x00000000f101b7c0),        //compw.eq $r0 = $r0, 31 (0x1f);;
     _32(0x0c000280),        //cb.wnez $r0? 16918 <alpha_ep_extbl_i_eq_0+0xf8>;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x3000050c),        //lwz $r0 = 20 (0x14)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3804020c),        //ld $r1 = 8 (0x8)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _64(0x00000c0ee0042080),        //make $r1 = 3160194 (0x303882);;
     _32(0x27052200),        //sd 136 (0x88)[$r0] = $r1;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _96(0x029a7a7a83125340e0040280),        //make $r1 = 6003104017374052362 (0x534f4f4c494d000a);;
     _32(0x27050400),        //sd 16 (0x10)[$r0] = $r1;;
     _96(0x0000000080000117e0006200),        //make $r0 = 286088 (0x45d88);;
     _64(0x00220000e0041080),        //make $r1 = 2281701442 (0x88000042);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x1fffffa8),        //call 16820 <alpha_ep_extbl_i_eq_0>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x61011340),        //compd.eq $r0 = $r0, 77 (0x4d);;
     _32(0x08000080),        //cb.dnez $r0? 169a0 <main+0x78>;;
     _32(0x18000003),        //call 169a8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 169c8 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16dc8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18aa0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
 |];

let adr_start:bits(addr_bits) = 0b00010110100100101000; //0x16928
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(alpha_ep_extbl_i_eq_0, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100110101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100111001000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016928;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
