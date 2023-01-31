// executing pipeline pr77718.c.out.dumped test 
val k1_pipeline_pr77718: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr77718() = {
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
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60080006),        //make $r2 = 6 (0x6);;
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x18000090),        //call 16a88 <memcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let bar: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60080006),        //make $r2 = 6 (0x6);;
     _96(0x00000000800000fce004f000),        //make $r1 = 259008 (0x3f3c0);;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x18000080),        //call 16a88 <memcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _96(0x030b0b0b80585858e0045840),        //make $r1 = 7016996765293437281 (0x6161616161616161);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _96(0x030b0b0b80585858e0045840),        //make $r1 = 7016996765293437281 (0x6161616161616161);;
     _32(0x27050200),        //sd 8 (0x8)[$r0] = $r1;;
     _96(0x030b0b0b80585858e0045840),        //make $r1 = 7016996765293437281 (0x6161616161616161);;
     _32(0x27050400),        //sd 16 (0x10)[$r0] = $r1;;
     _96(0x030b0b0b80585858e0045840),        //make $r1 = 7016996765293437281 (0x6161616161616161);;
     _32(0x27050600),        //sd 24 (0x18)[$r0] = $r1;;
     _96(0x030b0b0b80585858e0045840),        //make $r1 = 7016996765293437281 (0x6161616161616161);;
     _32(0x27050800),        //sd 32 (0x20)[$r0] = $r1;;
     _96(0x030b0b0b80585858e0045840),        //make $r1 = 7016996765293437281 (0x6161616161616161);;
     _32(0x27050a00),        //sd 40 (0x28)[$r0] = $r1;;
     _96(0x030b0b0b80585858e0045840),        //make $r1 = 7016996765293437281 (0x6161616161616161);;
     _32(0x27050c00),        //sd 48 (0x30)[$r0] = $r1;;
     _96(0x030b0b0b80585858e0045840),        //make $r1 = 7016996765293437281 (0x6161616161616161);;
     _32(0x27050e00),        //sd 56 (0x38)[$r0] = $r1;;
     _32(0x1fffffba),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x0d000100),        //cb.wltz $r0? 16950 <main+0xb0>;;
     _32(0x1fffffc7),        //call 16860 <bar>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x0d000080),        //cb.wltz $r0? 16954 <main+0xb4>;;
     _32(0x18000006),        //call 16968 <abort>;;
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
     _32(0x98000115),        //call 16dc8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007df),        //call 188f8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100010100000; //0x168a0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100001100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100101101000, num_instr, mI);
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
