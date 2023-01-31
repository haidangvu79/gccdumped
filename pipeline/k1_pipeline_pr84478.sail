// executing pipeline pr84478.c.out.dumped test 
val k1_pipeline_pr84478: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr84478() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let makestring: list_I = 
 [|
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x0fd00000)        //ret ;;
 |];

let loadpoolstrings: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010b0c),        //sw 44 (0x2c)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010a0c),        //sw 40 (0x28)[$r12] = $r0;;
     _32(0x10000028),        //goto 168f0 <loadpoolstrings+0xc8>;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x1800032e),        //call 17510 <strlen>;;
     _32(0x2601090c),        //sw 36 (0x24)[$r12] = $r0;;
     _32(0x30040b0c),        //lwz $r1 = 44 (0x2c)[$r12];;
     _32(0x3000090c),        //lwz $r0 = 36 (0x24)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x26010b0c),        //sw 44 (0x2c)[$r12] = $r0;;
     _32(0x34000b0c),        //lws $r0 = 44 (0x2c)[$r12];;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x7501a001),        //compd.gt $r0 = $r1, $r0;;
     _32(0x080005c0),        //cb.dnez $r0? 168d8 <loadpoolstrings+0xb0>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000027),        //goto 16920 <loadpoolstrings+0xf8>;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x61040040),        //addd $r1 = $r0, 1 (0x1);;
     _32(0x27050e0c),        //sd 56 (0x38)[$r12] = $r1;;
     _32(0x20100000),        //lbz $r4 = 0 (0x0)[$r0];;
     _96(0x0000000080000124e000a400),        //make $r0 = 299664 (0x49290);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x0000000080000124e000a200),        //make $r0 = 299656 (0x49288);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x61080040),        //addd $r2 = $r0, 1 (0x1);;
     _96(0x0000000080000124e00ca200),        //make $r3 = 299656 (0x49288);;
     _32(0x27090003),        //sd 0 (0x0)[$r3] = $r2;;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x78043fc4),        //zxbd $r1 = $r4;;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _32(0x3000090c),        //lwz $r0 = 36 (0x24)[$r12];;
     _32(0x7104ffc0),        //addw $r1 = $r0, -1 (0xffffffff);;
     _32(0x2605090c),        //sw 36 (0x24)[$r12] = $r1;;
     _32(0x0efffa40),        //cb.wgtz $r0? 16888 <loadpoolstrings+0x60>;;
     _32(0x1fffffce),        //call 16820 <makestring>;;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x30000a0c),        //lwz $r0 = 40 (0x28)[$r12];;
     _32(0x71040040),        //addw $r1 = $r0, 1 (0x1);;
     _32(0x26050a0c),        //sw 40 (0x28)[$r12] = $r1;;
     _96(0x00000000800000f8e0040200),        //make $r1 = 253960 (0x3e008);;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x3802f001),        //ld.xs $r0 = $r0[$r1];;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x087ff3c0),        //cb.dnez $r0? 16854 <loadpoolstrings+0x2c>;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x60000fa0),        //make $r0 = 4000 (0xfa0);;
     _32(0x1800005c),        //call 16ab0 <malloc>;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x0000000080000124e000a400),        //make $r0 = 299664 (0x49290);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000124e000a400),        //make $r0 = 299664 (0x49290);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x080000c0),        //cb.dnez $r0? 16974 <main+0x44>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000000b),        //goto 1699c <main+0x6c>;;
     _32(0x60000fa0),        //make $r0 = 4000 (0xfa0);;
     _32(0x1fffffac),        //call 16828 <loadpoolstrings>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _96(0x0000000080000124e000a400),        //make $r0 = 299664 (0x49290);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x1800004d),        //call 16ac8 <free>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100110000; //0x16930
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(makestring, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(loadpoolstrings, 0b00010110100000101000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100110000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016930;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
