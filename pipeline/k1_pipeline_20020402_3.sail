// executing pipeline 20020402_3.c.out.dumped test 
val k1_pipeline_20020402_3: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20020402_3() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let blockvector_for_pc_sect: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x2849060c),        //sq 24 (0x18)[$r12] = $r18r19;;
     _32(0x27510a0c),        //sd 40 (0x28)[$r12] = $r20;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x27050c0c),        //sd 48 (0x30)[$r12] = $r1;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x38480200),        //ld $r18 = 8 (0x8)[$r0];;
     _32(0x60380000),        //make $r14 = 0 (0x0);;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x30500000),        //lwz $r20 = 0 (0x0)[$r0];;
     _32(0x10000016),        //goto 168b0 <blockvector_for_pc_sect+0x90>;;
     _32(0x7501150e),        //sbfw $r0 = $r14, $r20;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a023040),        //sraw $r0 = $r0, 1 (0x1);;
     _32(0x784cffc0),        //zxwd $r19 = $r0;;
     _32(0x710114ce),        //addw $r0 = $r14, $r19;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x38480200),        //ld $r18 = 8 (0x8)[$r0];;
     _32(0x38000012),        //ld $r0 = 0 (0x0)[$r18];;
     _32(0x7601a002),        //compd.ltu $r0 = $r2, $r0;;
     _32(0x08000100),        //cb.dnez $r0? 168a8 <blockvector_for_pc_sect+0x88>;;
     _32(0x710114ce),        //addw $r0 = $r14, $r19;;
     _32(0x7838ffc0),        //zxwd $r14 = $r0;;
     _32(0x10000003),        //goto 168b0 <blockvector_for_pc_sect+0x90>;;
     _32(0x710114ce),        //addw $r0 = $r14, $r19;;
     _32(0x7850ffc0),        //zxwd $r20 = $r0;;
     _32(0x7501150e),        //sbfw $r0 = $r14, $r20;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f501b040),        //compw.gt $r0 = $r0, 1 (0x1);;
     _32(0x0c7ff9c0),        //cb.wnez $r0? 1685c <blockvector_for_pc_sect+0x3c>;;
     _32(0x1000000d),        //goto 168f8 <blockvector_for_pc_sect+0xd8>;;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x6903f00e),        //sxwd $r0 = $r14;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x38480200),        //ld $r18 = 8 (0x8)[$r0];;
     _32(0x38000212),        //ld $r0 = 8 (0x8)[$r18];;
     _32(0x7701a002),        //compd.geu $r0 = $r2, $r0;;
     _32(0x080000c0),        //cb.dnez $r0? 168f0 <blockvector_for_pc_sect+0xd0>;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x10000005),        //goto 16900 <blockvector_for_pc_sect+0xe0>;;
     _32(0x7100ffce),        //addw $r0 = $r14, -1 (0xffffffff);;
     _32(0x7838ffc0),        //zxwd $r14 = $r0;;
     _32(0x0dfffd0e),        //cb.wgez $r14? 168c8 <blockvector_for_pc_sect+0xa8>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3838040c),        //ld $r14 = 16 (0x10)[$r12];;
     _32(0x3c48060c),        //lq $r18r19 = 24 (0x18)[$r12];;
     _32(0x38500a0c),        //ld $r20 = 40 (0x28)[$r12];;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130d80c),        //addd $r12 = $r12, -160 (0xffffff60);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701180c),        //sd 96 (0x60)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x27011a0c),        //sd 104 (0x68)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x27011c0c),        //sd 112 (0x70)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x27011e0c),        //sd 120 (0x78)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701200c),        //sd 128 (0x80)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701220c),        //sd 136 (0x88)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701240c),        //sd 144 (0x90)[$r12] = $r0;;
     _64(0x00000040e0000000),        //make $r0 = 65536 (0x10000);;
     _32(0x27011a0c),        //sd 104 (0x68)[$r12] = $r0;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2401200c),        //sb 128 (0x80)[$r12] = $r0;;
     _32(0x60000014),        //make $r0 = 20 (0x14);;
     _32(0x2601210c),        //sw 132 (0x84)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701100c),        //sd 64 (0x40)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701120c),        //sd 72 (0x48)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701140c),        //sd 80 (0x50)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701160c),        //sd 88 (0x58)[$r12] = $r0;;
     _64(0x00000040e0000000),        //make $r0 = 65536 (0x10000);;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _64(0x00000080e0000000),        //make $r0 = 131072 (0x20000);;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2401120c),        //sb 72 (0x48)[$r12] = $r0;;
     _32(0x60000014),        //make $r0 = 20 (0x14);;
     _32(0x2601130c),        //sw 76 (0x4c)[$r12] = $r0;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x6100180c),        //addd $r0 = $r12, 96 (0x60);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x61000a0c),        //addd $r0 = $r12, 40 (0x28);;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _32(0x2701020c),        //sd 8 (0x8)[$r12] = $r0;;
     _32(0x6100020c),        //addd $r0 = $r12, 8 (0x8);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x60000500),        //make $r0 = 1280 (0x500);;
     _32(0x1fffff87),        //call 16820 <blockvector_for_pc_sect>;;
     _32(0x2701260c),        //sd 152 (0x98)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130280c),        //addd $r12 = $r12, 160 (0xa0);;
     _32(0x0fd00000)        //ret ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100011000; //0x16918
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(blockvector_for_pc_sect, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100011000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016918;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
