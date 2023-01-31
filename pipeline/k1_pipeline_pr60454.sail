// executing pipeline pr60454.c.out.dumped test 
val k1_pipeline_pr60454: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr60454() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let fake_swap32: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x79023600),        //sllw $r0 = $r0, 24 (0x18);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x79023200),        //sllw $r0 = $r0, 8 (0x8);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00003fc0f8000000),        //andw $r0 = $r0, 16711680 (0xff0000);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a011001),        //orw $r0 = $r1, $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x79023200),        //sllw $r0 = $r0, 8 (0x8);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a011001),        //orw $r0 = $r1, $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x0000003ff800c000),        //andw $r0 = $r0, 65280 (0xff00);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a011001),        //orw $r0 = $r1, $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7b023600),        //srlw $r0 = $r0, 24 (0x18);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a011001),        //orw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _64(0x00048d15e0009e00),        //make $r0 = 305419896 (0x12345678);;
     _32(0x1fffffd9),        //call 16820 <fake_swap32>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x03c2b3f0f101b480),        //compw.eq $r0 = $r0, 2018934290 (0x78567e12);;
     _32(0x0c000080),        //cb.wnez $r0? 168d4 <main+0x2c>;;
     _32(0x18000006),        //call 168e8 <abort>;;
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
     _32(0x980000f3),        //call 16cc0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 187f0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100010101000; //0x168a8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fake_swap32, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100011101000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000168a8;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
