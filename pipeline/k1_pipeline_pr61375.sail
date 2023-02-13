// executing pipeline pr61375.c.out.dumped test 
val k1_pipeline_pr61375: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr61375() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let uint128_central_bitsi_ior: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x2801080c),        //sq 32 (0x20)[$r12] = $r0r1;;
     _32(0x2709060c),        //sd 24 (0x18)[$r12] = $r2;;
     _96(0x07f8000080000000e0000000),        //make $r0 = 18374686479671623680 (0xff00000000000000);;
     _32(0x600400ff),        //make $r1 = 255 (0xff);;
     _32(0x28010c0c),        //sq 48 (0x30)[$r12] = $r0r1;;
     _32(0x3c000c0c),        //lq $r0r1 = 48 (0x30)[$r12];;
     _32(0x3808080c),        //ld $r2 = 32 (0x20)[$r12];;
     _32(0x78110002),        //andd $r4 = $r2, $r0;;
     _32(0x38080a0c),        //ld $r2 = 40 (0x28)[$r12];;
     _32(0x78150042),        //andd $r5 = $r2, $r1;;
     _32(0x79022205),        //slld $r0 = $r5, 8 (0x8);;
     _32(0x7b1a2e04),        //srld $r6 = $r4, 56 (0x38);;
     _32(0x7a190180),        //ord $r6 = $r0, $r6;;
     _32(0x7b1e2e05),        //srld $r7 = $r5, 56 (0x38);;
     _32(0x6a040006),        //copyd $r1 = $r6;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x7a010001),        //ord $r0 = $r1, $r0;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x26010a0c),        //sw 40 (0x28)[$r12] = $r0;;
     _32(0x2705080c),        //sd 32 (0x20)[$r12] = $r1;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x28010c0c),        //sq 48 (0x30)[$r12] = $r0r1;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x790e2000),        //slld $r3 = $r0, 0 (0x0);;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x28090c0c),        //sq 48 (0x30)[$r12] = $r2r3;;
     _32(0x3c000c0c),        //lq $r0r1 = 48 (0x30)[$r12];;
     _32(0x60080002),        //make $r2 = 2 (0x2);;
     _32(0x1fffffdc),        //call 16820 <uint128_central_bitsi_ior>;;
     _32(0x61014080),        //compd.eq $r0 = $r0, 258 (0x102);;
     _32(0x08000080),        //cb.dnez $r0? 168c0 <main+0x48>;;
     _32(0x18000007),        //call 168d8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16cb0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 187e0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100001111000; //0x16878
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(uint128_central_bitsi_ior, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100001111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100011011000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016878;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
