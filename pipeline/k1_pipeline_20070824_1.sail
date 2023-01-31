// executing pipeline 20070824_1.c.out.dumped test 
val k1_pipeline_20070824_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20070824_1() = {
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
     _32(0x2701040e),        //sd 16 (0x10)[$r14] = $r0;;
     _32(0x6100040e),        //addd $r0 = $r14, 16 (0x10);;
     _32(0x2701080e),        //sd 32 (0x20)[$r14] = $r0;;
     _32(0x10000004),        //goto 16854 <main+0x34>;;
     _32(0x3800080e),        //ld $r0 = 32 (0x20)[$r14];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x2701080e),        //sd 32 (0x20)[$r14] = $r0;;
     _32(0x3800080e),        //ld $r0 = 32 (0x20)[$r14];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x087ffec0),        //cb.dnez $r0? 16848 <main+0x28>;;
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x7b022140),        //srld $r0 = $r0, 5 (0x5);;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x2701060e),        //sd 24 (0x18)[$r14] = $r0;;
     _32(0x3800080e),        //ld $r0 = 32 (0x20)[$r14];;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x3800060e),        //ld $r0 = 24 (0x18)[$r14];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x3800060e),        //ld $r0 = 24 (0x18)[$r14];;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x26050200),        //sw 8 (0x8)[$r0] = $r1;;
     _32(0x3800080e),        //ld $r0 = 32 (0x20)[$r14];;
     _32(0x3804060e),        //ld $r1 = 24 (0x18)[$r14];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x3800040e),        //ld $r0 = 16 (0x10)[$r14];;
     _32(0x08000080),        //cb.dnez $r0? 168ac <main+0x8c>;;
     _32(0x18000008),        //call 168c8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x6130fa0e),        //addd $r12 = $r14, -24 (0xffffffe8);;
     _32(0x3840080c),        //ld $r16 = 32 (0x20)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838060c),        //ld $r14 = 24 (0x18)[$r12];;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16ca0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 187d0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100011001000, num_instr, mI);
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
