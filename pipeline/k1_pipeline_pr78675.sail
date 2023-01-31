// executing pipeline pr78675.c.out.dumped test 
val k1_pipeline_pr78675: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr78675() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x10000016),        //goto 16880 <foo+0x60>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x08800140),        //cb.deqz $r0? 16850 <foo+0x30>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x088000c0),        //cb.deqz $r0? 16850 <foo+0x30>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x10000002),        //goto 16854 <foo+0x34>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x0a7ff9c0),        //cb.dlez $r0? 1682c <foo+0xc>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffdc),        //call 16820 <foo>;;
     _32(0x08800080),        //cb.deqz $r0? 168bc <main+0x1c>;;
     _32(0x18000034),        //call 16988 <abort>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffffd3),        //call 16820 <foo>;;
     _32(0x08800080),        //cb.deqz $r0? 168e0 <main+0x40>;;
     _32(0x1800002b),        //call 16988 <abort>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x60000019),        //make $r0 = 25 (0x19);;
     _32(0x1fffffca),        //call 16820 <foo>;;
     _32(0x08800080),        //cb.deqz $r0? 16904 <main+0x64>;;
     _32(0x18000022),        //call 16988 <abort>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x6004ffc0),        //make $r1 = -64 (0xffffffc0);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffc1),        //call 16820 <foo>;;
     _32(0x08800080),        //cb.deqz $r0? 16928 <main+0x88>;;
     _32(0x18000019),        //call 16988 <abort>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x6004ffc0),        //make $r1 = -64 (0xffffffc0);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffffb8),        //call 16820 <foo>;;
     _32(0x08800080),        //cb.deqz $r0? 1694c <main+0xac>;;
     _32(0x18000010),        //call 16988 <abort>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x6004ffc0),        //make $r1 = -64 (0xffffffc0);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x60000019),        //make $r0 = 25 (0x19);;
     _32(0x1fffffaf),        //call 16820 <foo>;;
     _32(0x08800080),        //cb.deqz $r0? 16970 <main+0xd0>;;
     _32(0x18000007),        //call 16988 <abort>;;
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
     _32(0x980000f3),        //call 16d60 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18890 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100010100000; //0x168a0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100110001000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000168a0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
