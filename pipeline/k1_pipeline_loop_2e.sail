// executing pipeline loop_2e.c.out.dumped test 
val k1_pipeline_loop_2e: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_loop_2e() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let f: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2705020c),        //sd 8 (0x8)[$r12] = $r1;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000000c),        //goto 16864 <f+0x44>;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x79062080),        //slld $r1 = $r0, 2 (0x2);;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x61080200),        //addd $r2 = $r0, 8 (0x8);;
     _32(0x2709020c),        //sd 8 (0x8)[$r12] = $r2;;
     _32(0x3808040c),        //ld $r2 = 16 (0x10)[$r12];;
     _32(0x71050042),        //addd $r1 = $r2, $r1;;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000001f401b1c0),        //compw.le $r0 = $r0, 39 (0x27);;
     _32(0x0c7ffc80),        //cb.wnez $r0? 16838 <f+0x18>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130a80c),        //addd $r12 = $r12, -352 (0xfffffea0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _96(0x03ffffff87ffffffe000ffc0),        //make $r0 = 9223372036854775807 (0x7fffffffffffffff);;
     _32(0x2701560c),        //sd 344 (0x158)[$r12] = $r0;;
     _32(0x3800560c),        //ld $r0 = 344 (0x158)[$r12];;
     _32(0x6800f800),        //andd $r0 = $r0, -32 (0xffffffe0);;
     _32(0x2701560c),        //sd 344 (0x158)[$r12] = $r0;;
     _32(0x3800560c),        //ld $r0 = 344 (0x158)[$r12];;
     _32(0x2701540c),        //sd 336 (0x150)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701520c),        //sd 328 (0x148)[$r12] = $r0;;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x3800540c),        //ld $r0 = 336 (0x150)[$r12];;
     _32(0x1fffffd5),        //call 16820 <f>;;
     _32(0x3804520c),        //ld $r1 = 328 (0x148)[$r12];;
     _32(0x3800540c),        //ld $r0 = 336 (0x150)[$r12];;
     _32(0x61002700),        //addd $r0 = $r0, 156 (0x9c);;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 168e8 <main+0x60>;;
     _32(0x18000007),        //call 16900 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130580c),        //addd $r12 = $r12, 352 (0x160);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16cd8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18808 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100010001000; //0x16888
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100100000000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016888;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
