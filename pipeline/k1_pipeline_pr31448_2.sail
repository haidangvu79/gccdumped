// executing pipeline pr31448_2.c.out.dumped test 
val k1_pipeline_pr31448_2: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr31448_2() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let g: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _96(0x00000000800000fce004f000),        //make $r1 = 259008 (0x3f3c0);;
     _32(0x3400050c),        //lws $r0 = 20 (0x14)[$r12];;
     _32(0x3002f001),        //lwz.xs $r0 = $r0[$r1];;
     _32(0x79023200),        //sllw $r0 = $r0, 8 (0x8);;
     _32(0x7a023200),        //sraw $r0 = $r0, 8 (0x8);;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x30000001),        //lwz $r0 = 0 (0x0)[$r1];;
     _32(0x61037002),        //insf $r0 = $r2, 23 (0x17), 0 (0x0);;
     _32(0x26010001),        //sw 0 (0x0)[$r1] = $r0;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _96(0x00000000800000fce004f200),        //make $r1 = 259016 (0x3f3c8);;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x3802f001),        //ld.xs $r0 = $r0[$r1];;
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _32(0x38040001),        //ld $r1 = 0 (0x0)[$r1];;
     _32(0x79023200),        //sllw $r0 = $r0, 8 (0x8);;
     _32(0x7a023200),        //sraw $r0 = $r0, 8 (0x8);;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _32(0x30000001),        //lwz $r0 = 0 (0x0)[$r1];;
     _32(0x61037002),        //insf $r0 = $r2, 23 (0x17), 0 (0x0);;
     _32(0x26010001),        //sw 0 (0x0)[$r1] = $r0;;
     _96(0x00000000800000fce004f200),        //make $r1 = 259016 (0x3f3c8);;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x3802f001),        //ld.xs $r0 = $r0[$r1];;
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _32(0x38040001),        //ld $r1 = 0 (0x0)[$r1];;
     _32(0x79023200),        //sllw $r0 = $r0, 8 (0x8);;
     _32(0x7a023200),        //sraw $r0 = $r0, 8 (0x8);;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _32(0x38000001),        //ld $r0 = 0 (0x0)[$r1];;
     _32(0x6203f602),        //insf $r0 = $r2, 47 (0x2f), 24 (0x18);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _32(0x1fffffd4),        //call 16870 <f>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _64(0x00003fffe800ffc0),        //andd $r0 = $r0, 16777215 (0xffffff);;
     _64(0x00003fbfe101bf80),        //compd.eq $r0 = $r0, 16711422 (0xfefefe);;
     _32(0x08000080),        //cb.dnez $r0? 16950 <main+0x50>;;
     _32(0x18000015),        //call 169a0 <abort>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x000007ff87ffc000e8000000),        //andd $r0 = $r0, 281474959933440 (0xffffff000000);;
     _96(0x000007f787bf8000e0040000),        //make $r1 = 280371136561152 (0xfefefe000000);;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16988 <main+0x88>;;
     _32(0x18000007),        //call 169a0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
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
     _32(0x980000f3),        //call 16d78 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 188a8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100000000; //0x16900
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(g, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100001110000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100110100000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016900;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
