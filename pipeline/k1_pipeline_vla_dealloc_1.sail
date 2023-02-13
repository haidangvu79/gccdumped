// executing pipeline vla_dealloc_1.c.out.dumped test 
val k1_pipeline_vla_dealloc_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_vla_dealloc_1() = {
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
     _32(0x2741080c),        //sd 32 (0x20)[$r12] = $r16;;
     _32(0x2739060c),        //sd 24 (0x18)[$r12] = $r14;;
     _32(0x6138060c),        //addd $r14 = $r12, 24 (0x18);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601090e),        //sw 36 (0x24)[$r14] = $r0;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3004090e),        //lwz $r1 = 36 (0x24)[$r14];;
     _64(0x00041893e00074c0),        //make $r0 = 274877907 (0x10624dd3);;
     _32(0x58003001),        //mulwd $r0 = $r1, $r0;;
     _32(0x7b022800),        //srld $r0 = $r0, 32 (0x20);;
     _32(0x7a2a3180),        //sraw $r10 = $r0, 6 (0x6);;
     _32(0x7a0237c1),        //sraw $r0 = $r1, 31 (0x1f);;
     _32(0x75291280),        //sbfw $r10 = $r0, $r10;;
     _32(0x7a00000a),        //copyw $r0 = $r10;;
     _32(0x79023140),        //sllw $r0 = $r0, 5 (0x5);;
     _32(0x7501100a),        //sbfw $r0 = $r10, $r0;;
     _32(0x79023080),        //sllw $r0 = $r0, 2 (0x2);;
     _32(0x71011280),        //addw $r0 = $r0, $r10;;
     _32(0x790230c0),        //sllw $r0 = $r0, 3 (0x3);;
     _32(0x75011040),        //sbfw $r0 = $r0, $r1;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x6a2c0000),        //copyd $r11 = $r0;;
     _32(0x6903f001),        //sxwd $r0 = $r1;;
     _32(0x6100ffc0),        //addd $r0 = $r0, -1 (0xffffffff);;
     _32(0x2701060e),        //sd 24 (0x18)[$r14] = $r0;;
     _32(0x6903f001),        //sxwd $r0 = $r1;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0x7b022ec2),        //srld $r0 = $r2, 59 (0x3b);;
     _32(0x791e2143),        //slld $r7 = $r3, 5 (0x5);;
     _32(0x7a1d01c0),        //ord $r7 = $r0, $r7;;
     _32(0x791a2142),        //slld $r6 = $r2, 5 (0x5);;
     _32(0x6903f001),        //sxwd $r0 = $r1;;
     _32(0x6a100000),        //copyd $r4 = $r0;;
     _32(0x60140000),        //make $r5 = 0 (0x0);;
     _32(0x7b022ec4),        //srld $r0 = $r4, 59 (0x3b);;
     _32(0x79262145),        //slld $r9 = $r5, 5 (0x5);;
     _32(0x7a250240),        //ord $r9 = $r0, $r9;;
     _32(0x79222144),        //slld $r8 = $r4, 5 (0x5);;
     _32(0x6903f001),        //sxwd $r0 = $r1;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x610000c0),        //addd $r0 = $r0, 3 (0x3);;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x7b022140),        //srld $r0 = $r0, 5 (0x5);;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x75310300),        //sbfd $r12 = $r0, $r12;;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x610000c0),        //addd $r0 = $r0, 3 (0x3);;
     _32(0x7b022080),        //srld $r0 = $r0, 2 (0x2);;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x2701040e),        //sd 16 (0x10)[$r14] = $r0;;
     _32(0x3800040e),        //ld $r0 = 16 (0x10)[$r14];;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x3004090e),        //lwz $r1 = 36 (0x24)[$r14];;
     _64(0x00041893e00074c0),        //make $r0 = 274877907 (0x10624dd3);;
     _32(0x58003001),        //mulwd $r0 = $r1, $r0;;
     _32(0x7b022800),        //srld $r0 = $r0, 32 (0x20);;
     _32(0x7a2a3180),        //sraw $r10 = $r0, 6 (0x6);;
     _32(0x7a0237c1),        //sraw $r0 = $r1, 31 (0x1f);;
     _32(0x75291280),        //sbfw $r10 = $r0, $r10;;
     _32(0x7a00000a),        //copyw $r0 = $r10;;
     _32(0x79023140),        //sllw $r0 = $r0, 5 (0x5);;
     _32(0x7501100a),        //sbfw $r0 = $r10, $r0;;
     _32(0x79023080),        //sllw $r0 = $r0, 2 (0x2);;
     _32(0x71011280),        //addw $r0 = $r0, $r10;;
     _32(0x790230c0),        //sllw $r0 = $r0, 3 (0x3);;
     _32(0x75011040),        //sbfw $r0 = $r0, $r1;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3800040e),        //ld $r0 = 16 (0x10)[$r14];;
     _32(0x6907f001),        //sxwd $r1 = $r1;;
     _32(0x60280002),        //make $r10 = 2 (0x2);;
     _32(0x262bf040),        //sw.xs $r1[$r0] = $r10;;
     _96(0x0000000080000117e0042600),        //make $r1 = 285848 (0x45c98);;
     _32(0x3800040e),        //ld $r0 = 16 (0x10)[$r14];;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _32(0x3000090e),        //lwz $r0 = 36 (0x24)[$r14];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601090e),        //sw 36 (0x24)[$r14] = $r0;;
     _32(0x3000090e),        //lwz $r0 = 36 (0x24)[$r14];;
     _64(0x00007a11f501b7c0),        //compw.gt $r0 = $r0, 999999 (0xf423f);;
     _32(0x0c0000c0),        //cb.wnez $r0? 16998 <main+0x178>;;
     _32(0x6a30000b),        //copyd $r12 = $r11;;
     _32(0x17ffffab),        //goto 16840 <main+0x20>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x6a30000b),        //copyd $r12 = $r11;;
     _32(0x6130fa0e),        //addd $r12 = $r14, -24 (0xffffffe8);;
     _32(0x3840080c),        //ld $r16 = 32 (0x20)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838060c),        //ld $r14 = 24 (0x18)[$r12];;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
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
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
