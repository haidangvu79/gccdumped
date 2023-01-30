// executing pipeline 20020201_1 test 
val k1_pipeline_20020201_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20020201_1() = {
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
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _96(0x0555555582aaaaaae004aac0),        //make $r1 = 12297829382473034411 (0xaaaaaaaaaaaaaaab);;
     _32(0x59041040),        //muludt $r0r1 = $r0, $r1;;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x7b022080),        //srld $r0 = $r0, 2 (0x2);;
     _32(0x240107cc),        //sb 31 (0x1f)[$r12] = $r0;;
     _32(0x200007cc),        //lbz $r0 = 31 (0x1f)[$r12];;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 1686c <main+0x4c>;;
     _32(0x180000a8),        //call 16b08 <abort>;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x20040000),        //lbz $r1 = 0 (0x0)[$r0];;
     _96(0x0555555582aaaaaae000aac0),        //make $r0 = 12297829382473034411 (0xaaaaaaaaaaaaaaab);;
     _32(0x590c1001),        //muludt $r2r3 = $r1, $r0;;
     _32(0x6a000003),        //copyd $r0 = $r3;;
     _32(0x7b0a2080),        //srld $r2 = $r0, 2 (0x2);;
     _32(0x6a000002),        //copyd $r0 = $r2;;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x71010080),        //addd $r0 = $r0, $r2;;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x75010040),        //sbfd $r0 = $r0, $r1;;
     _32(0x240107cc),        //sb 31 (0x1f)[$r12] = $r0;;
     _32(0x200007cc),        //lbz $r0 = 31 (0x1f)[$r12];;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 168c0 <main+0xa0>;;
     _32(0x18000093),        //call 16b08 <abort>;;
     _96(0x00000000800000f8e0000400),        //make $r0 = 253968 (0x3e010);;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _96(0x0555555582aaaaaae004aac0),        //make $r1 = 12297829382473034411 (0xaaaaaaaaaaaaaaab);;
     _32(0x59041040),        //muludt $r0r1 = $r0, $r1;;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x7b022080),        //srld $r0 = $r0, 2 (0x2);;
     _32(0x2501070c),        //sh 28 (0x1c)[$r12] = $r0;;
     _32(0x2800070c),        //lhz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f101b080),        //compw.eq $r0 = $r0, 2 (0x2);;
     _32(0x0c000080),        //cb.wnez $r0? 16900 <main+0xe0>;;
     _32(0x18000083),        //call 16b08 <abort>;;
     _96(0x00000000800000f8e0000400),        //make $r0 = 253968 (0x3e010);;
     _32(0x28040000),        //lhz $r1 = 0 (0x0)[$r0];;
     _96(0x0555555582aaaaaae000aac0),        //make $r0 = 12297829382473034411 (0xaaaaaaaaaaaaaaab);;
     _32(0x590c1001),        //muludt $r2r3 = $r1, $r0;;
     _32(0x6a000003),        //copyd $r0 = $r3;;
     _32(0x7b0a2080),        //srld $r2 = $r0, 2 (0x2);;
     _32(0x6a000002),        //copyd $r0 = $r2;;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x71010080),        //addd $r0 = $r0, $r2;;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x75010040),        //sbfd $r0 = $r0, $r1;;
     _32(0x2501070c),        //sh 28 (0x1c)[$r12] = $r0;;
     _32(0x2800070c),        //lhz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f101b080),        //compw.eq $r0 = $r0, 2 (0x2);;
     _32(0x0c000080),        //cb.wnez $r0? 16954 <main+0x134>;;
     _32(0x1800006e),        //call 16b08 <abort>;;
     _96(0x00000000800000f8e0000600),        //make $r0 = 253976 (0x3e018);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _96(0x0555555582aaaaaae004aac0),        //make $r1 = 12297829382473034411 (0xaaaaaaaaaaaaaaab);;
     _32(0x59041040),        //muludt $r0r1 = $r0, $r1;;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x7b022080),        //srld $r0 = $r0, 2 (0x2);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f101b0c0),        //compw.eq $r0 = $r0, 3 (0x3);;
     _32(0x0c000080),        //cb.wnez $r0? 16994 <main+0x174>;;
     _32(0x1800005e),        //call 16b08 <abort>;;
     _96(0x00000000800000f8e0000600),        //make $r0 = 253976 (0x3e018);;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _96(0x0555555582aaaaaae000aac0),        //make $r0 = 12297829382473034411 (0xaaaaaaaaaaaaaaab);;
     _32(0x590c1001),        //muludt $r2r3 = $r1, $r0;;
     _32(0x6a000003),        //copyd $r0 = $r3;;
     _32(0x7b0a2080),        //srld $r2 = $r0, 2 (0x2);;
     _32(0x6a000002),        //copyd $r0 = $r2;;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x71010080),        //addd $r0 = $r0, $r2;;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x75010040),        //sbfd $r0 = $r0, $r1;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f101b0c0),        //compw.eq $r0 = $r0, 3 (0x3);;
     _32(0x0c000080),        //cb.wnez $r0? 169e8 <main+0x1c8>;;
     _32(0x18000049),        //call 16b08 <abort>;;
     _96(0x00000000800000f8e0000800),        //make $r0 = 253984 (0x3e020);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x0555555582aaaaaae004aac0),        //make $r1 = 12297829382473034411 (0xaaaaaaaaaaaaaaab);;
     _32(0x59041040),        //muludt $r0r1 = $r0, $r1;;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x7b022080),        //srld $r0 = $r0, 2 (0x2);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61010100),        //compd.eq $r0 = $r0, 4 (0x4);;
     _32(0x08000080),        //cb.dnez $r0? 16a24 <main+0x204>;;
     _32(0x1800003a),        //call 16b08 <abort>;;
     _96(0x00000000800000f8e0000800),        //make $r0 = 253984 (0x3e020);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x0555555582aaaaaae000aac0),        //make $r0 = 12297829382473034411 (0xaaaaaaaaaaaaaaab);;
     _32(0x590c1001),        //muludt $r2r3 = $r1, $r0;;
     _32(0x6a000003),        //copyd $r0 = $r3;;
     _32(0x7b0a2080),        //srld $r2 = $r0, 2 (0x2);;
     _32(0x6a000002),        //copyd $r0 = $r2;;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x71010080),        //addd $r0 = $r0, $r2;;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x75010040),        //sbfd $r0 = $r0, $r1;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61010100),        //compd.eq $r0 = $r0, 4 (0x4);;
     _32(0x08000080),        //cb.dnez $r0? 16a74 <main+0x254>;;
     _32(0x18000026),        //call 16b08 <abort>;;
     _96(0x00000000800000f8e0000a00),        //make $r0 = 253992 (0x3e028);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x0555555582aaaaaae004aac0),        //make $r1 = 12297829382473034411 (0xaaaaaaaaaaaaaaab);;
     _32(0x59041040),        //muludt $r0r1 = $r0, $r1;;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x7b022080),        //srld $r0 = $r0, 2 (0x2);;
     _32(0x2701020c),        //sd 8 (0x8)[$r12] = $r0;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x61010140),        //compd.eq $r0 = $r0, 5 (0x5);;
     _32(0x08000080),        //cb.dnez $r0? 16ab0 <main+0x290>;;
     _32(0x18000017),        //call 16b08 <abort>;;
     _96(0x00000000800000f8e0000a00),        //make $r0 = 253992 (0x3e028);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x0555555582aaaaaae000aac0),        //make $r0 = 12297829382473034411 (0xaaaaaaaaaaaaaaab);;
     _32(0x590c1001),        //muludt $r2r3 = $r1, $r0;;
     _32(0x6a000003),        //copyd $r0 = $r3;;
     _32(0x7b0a2080),        //srld $r2 = $r0, 2 (0x2);;
     _32(0x6a000002),        //copyd $r0 = $r2;;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x71010080),        //addd $r0 = $r0, $r2;;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x75010040),        //sbfd $r0 = $r0, $r1;;
     _32(0x2701020c),        //sd 8 (0x8)[$r12] = $r0;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x61010140),        //compd.eq $r0 = $r0, 5 (0x5);;
     _32(0x08000080),        //cb.dnez $r0? 16b00 <main+0x2e0>;;
     _32(0x18000003),        //call 16b08 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16b28 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16f28 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18c00 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0xf838ffc0),        //zxwd $r14 = $r0
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x98000161),        //call 170c0 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16b64 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18c00 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101100001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit, 0b00010110101100101000, num_instr, mI);
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
