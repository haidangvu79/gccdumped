// executing pipeline regstack_1.c.out.dumped test 
val k1_pipeline_regstack_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_regstack_1() = {
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
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0000400),        //make $r0 = 253968 (0x3e010);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x50067001),        //faddd $r1 = $r1, $r0;;
     _96(0x00000000800000f8e0000600),        //make $r0 = 253976 (0x3e018);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x58017001),        //fmuld $r0 = $r1, $r0;;
     _96(0x0000000080000117e0042c00),        //make $r1 = 285872 (0x45cb0);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0000400),        //make $r0 = 253968 (0x3e010);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x54067040),        //fsbfd $r1 = $r0, $r1;;
     _96(0x00000000800000f8e0000400),        //make $r0 = 253968 (0x3e010);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x54027040),        //fsbfd $r0 = $r0, $r1;;
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0000400),        //make $r0 = 253968 (0x3e010);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x50067001),        //faddd $r1 = $r1, $r0;;
     _96(0x00000000800000f8e0000400),        //make $r0 = 253968 (0x3e010);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x50027001),        //faddd $r0 = $r1, $r0;;
     _96(0x0000000080000117e0042a00),        //make $r1 = 285864 (0x45ca8);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0000400),        //make $r0 = 253968 (0x3e010);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x54067040),        //fsbfd $r1 = $r0, $r1;;
     _96(0x00000000800000f8e0000800),        //make $r0 = 253984 (0x3e020);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x58017001),        //fmuld $r0 = $r1, $r0;;
     _96(0x0000000080000117e0042400),        //make $r1 = 285840 (0x45c90);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x0000000080000117e0002c00),        //make $r0 = 285872 (0x45cb0);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x0000000080000117e0002a00),        //make $r0 = 285864 (0x45ca8);;
     _32(0x38080000),        //ld $r2 = 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0000400),        //make $r0 = 253968 (0x3e010);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x50027002),        //faddd $r0 = $r2, $r0;;
     _32(0x54027040),        //fsbfd $r0 = $r0, $r1;;
     _96(0x0000000080000117e0042c00),        //make $r1 = 285872 (0x45cb0);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0000800),        //make $r0 = 253984 (0x3e020);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x58017001),        //fmuld $r0 = $r1, $r0;;
     _96(0x0000000080000117e0042800),        //make $r1 = 285856 (0x45ca0);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x0000000080000117e0002a00),        //make $r0 = 285864 (0x45ca8);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0000600),        //make $r0 = 253976 (0x3e018);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x58017001),        //fmuld $r0 = $r1, $r0;;
     _96(0x0000000080000117e0042600),        //make $r1 = 285848 (0x45c98);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x54027040),        //fsbfd $r0 = $r0, $r1;;
     _96(0x0000000080000117e0042400),        //make $r1 = 285840 (0x45c90);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x00000000800000f8e0000400),        //make $r0 = 253968 (0x3e010);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x54067040),        //fsbfd $r1 = $r0, $r1;;
     _96(0x0000000080000117e0002800),        //make $r0 = 285856 (0x45ca0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x50027001),        //faddd $r0 = $r1, $r0;;
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x0000000080000117e0002a00),        //make $r0 = 285864 (0x45ca8);;
     _32(0x38080000),        //ld $r2 = 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0000400),        //make $r0 = 253968 (0x3e010);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x500a7002),        //faddd $r2 = $r2, $r0;;
     _96(0x00000000800000f8e0000400),        //make $r0 = 253968 (0x3e010);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x50027002),        //faddd $r0 = $r2, $r0;;
     _32(0x54027040),        //fsbfd $r0 = $r0, $r1;;
     _96(0x0000000080000117e0042a00),        //make $r1 = 285864 (0x45ca8);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x00000000800000f8e0000600),        //make $r0 = 253976 (0x3e018);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0000400),        //make $r0 = 253968 (0x3e010);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x50067001),        //faddd $r1 = $r1, $r0;;
     _96(0x00000000800000f8e0000800),        //make $r0 = 253984 (0x3e020);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x58017001),        //fmuld $r0 = $r1, $r0;;
     _96(0x0000000080000117e0042800),        //make $r1 = 285856 (0x45ca0);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x00000000800000f8e0000600),        //make $r0 = 253976 (0x3e018);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0000800),        //make $r0 = 253984 (0x3e020);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x58017001),        //fmuld $r0 = $r1, $r0;;
     _96(0x00000000800000f8e0040800),        //make $r1 = 253984 (0x3e020);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x0000000080000117e0002800),        //make $r0 = 285856 (0x45ca0);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0000600),        //make $r0 = 253976 (0x3e018);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x54027040),        //fsbfd $r0 = $r0, $r1;;
     _96(0x0000000080000117e0042800),        //make $r1 = 285856 (0x45ca0);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x00000000800000f8e0000800),        //make $r0 = 253984 (0x3e020);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x01ff000080000000e0040000),        //make $r1 = 4602678819172646912 (0x3fe0000000000000);;
     _32(0x54027001),        //fsbfd $r0 = $r1, $r0;;
     _96(0x00000000800000f8e0040800),        //make $r1 = 253984 (0x3e020);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x0000000080000117e0002a00),        //make $r0 = 285864 (0x45ca8);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x0202880080000000e0040000),        //make $r1 = 4634485491540951040 (0x4051000000000000);;
     _32(0x7b030040),        //fcompd.une $r0 = $r0, $r1;;
     _32(0x08001000),        //cb.dnez $r0? 16cd4 <main+0x4b4>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x0202440080000000e0040000),        //make $r1 = 4632092954238910464 (0x4048800000000000);;
     _32(0x7b030040),        //fcompd.une $r0 = $r0, $r1;;
     _32(0x08000dc0),        //cb.dnez $r0? 16cd4 <main+0x4b4>;;
     _96(0x0000000080000117e0002c00),        //make $r0 = 285872 (0x45cb0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x0202680080000000e0040000),        //make $r1 = 4633359591634108416 (0x404d000000000000);;
     _32(0x7b030040),        //fcompd.une $r0 = $r0, $r1;;
     _32(0x08000b80),        //cb.dnez $r0? 16cd4 <main+0x4b4>;;
     _96(0x00000000800000f8e0000800),        //make $r0 = 253984 (0x3e020);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x02033a8080000000e0040000),        //make $r1 = 4640765901958807552 (0x4067500000000000);;
     _32(0x7b030040),        //fcompd.une $r0 = $r0, $r1;;
     _32(0x08000940),        //cb.dnez $r0? 16cd4 <main+0x4b4>;;
     _96(0x0000000080000117e0002800),        //make $r0 = 285856 (0x45ca0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x0203410080000000e0040000),        //make $r1 = 4640994600377384960 (0x4068200000000000);;
     _32(0x7b030040),        //fcompd.une $r0 = $r0, $r1;;
     _32(0x08000700),        //cb.dnez $r0? 16cd4 <main+0x4b4>;;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x02029a0080000000e0040000),        //make $r1 = 4635118810238550016 (0x4053400000000000);;
     _32(0x7b030040),        //fcompd.une $r0 = $r0, $r1;;
     _32(0x080004c0),        //cb.dnez $r0? 16cd4 <main+0x4b4>;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x0202820080000000e0040000),        //make $r1 = 4634274385308418048 (0x4050400000000000);;
     _32(0x7b030040),        //fcompd.une $r0 = $r0, $r1;;
     _32(0x08000280),        //cb.dnez $r0? 16cd4 <main+0x4b4>;;
     _96(0x00000000800000f8e0000600),        //make $r0 = 253976 (0x3e018);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x0201300080000000e0040000),        //make $r1 = 4622382067542392832 (0x4026000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16cd8 <main+0x4b8>;;
     _32(0x18000003),        //call 16ce0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16d00 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 17100 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18dd8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0xf838ffc0),        //zxwd $r14 = $r0
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x98000161),        //call 17298 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16d3c <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18dd8 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110110011100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110110100000000, num_instr, mI);
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
