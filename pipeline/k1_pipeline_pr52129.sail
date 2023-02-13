// executing pipeline pr52129.c.out.dumped test 
val k1_pipeline_pr52129: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr52129() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x6a040002),        //copyd $r1 = $r2;;
     _32(0x28010a0c),        //sq 40 (0x28)[$r12] = $r0r1;;
     _32(0x270d080c),        //sd 32 (0x20)[$r12] = $r3;;
     _32(0x2711060c),        //sd 24 (0x18)[$r12] = $r4;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _96(0x0000000080000117e0042280),        //make $r1 = 285834 (0x45c8a);;
     _32(0x7001a040),        //compd.ne $r0 = $r0, $r1;;
     _32(0x080005c0),        //cb.dnez $r0? 168b4 <foo+0x94>;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _96(0x0000000080000117e0043340),        //make $r1 = 285901 (0x45ccd);;
     _32(0x7001a040),        //compd.ne $r0 = $r0, $r1;;
     _32(0x08000440),        //cb.dnez $r0? 168b4 <foo+0x94>;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _64(0x00000000f001b6c0),        //compw.ne $r0 = $r0, 27 (0x1b);;
     _32(0x0c000340),        //cb.wnez $r0? 168b4 <foo+0x94>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _96(0x0000000080000117e0042640),        //make $r1 = 285849 (0x45c99);;
     _32(0x7001a040),        //compd.ne $r0 = $r0, $r1;;
     _32(0x080001c0),        //cb.dnez $r0? 168b4 <foo+0x94>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _96(0x0000000080000117e0043640),        //make $r1 = 285913 (0x45cd9);;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 168b8 <foo+0x98>;;
     _32(0x18000045),        //call 169c8 <abort>;;
     _32(0x6000001d),        //make $r0 = 29 (0x1d);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let bar: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x27050c0c),        //sd 48 (0x30)[$r12] = $r1;;
     _32(0x27090a0c),        //sd 40 (0x28)[$r12] = $r2;;
     _32(0x6a000003),        //copyd $r0 = $r3;;
     _32(0x6a040004),        //copyd $r1 = $r4;;
     _32(0x2801060c),        //sq 24 (0x18)[$r12] = $r0r1;;
     _32(0x2615040c),        //sw 16 (0x10)[$r12] = $r5;;
     _32(0x2719020c),        //sd 8 (0x8)[$r12] = $r6;;
     _32(0x3400040c),        //lws $r0 = 16 (0x10)[$r12];;
     _32(0x3804020c),        //ld $r1 = 8 (0x8)[$r12];;
     _32(0x71090001),        //addd $r2 = $r1, $r0;;
     _32(0x3400040c),        //lws $r0 = 16 (0x10)[$r12];;
     _32(0x61001000),        //addd $r0 = $r0, 64 (0x40);;
     _32(0x3804020c),        //ld $r1 = 8 (0x8)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x6a100000),        //copyd $r4 = $r0;;
     _32(0x6a0c0002),        //copyd $r3 = $r2;;
     _32(0x3c00060c),        //lq $r0r1 = 24 (0x18)[$r12];;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x1fffffbc),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _96(0x0000000080000117e0003340),        //make $r0 = 285901 (0x45ccd);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x6000001b),        //make $r0 = 27 (0x1b);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _96(0x0000000080000117e0182200),        //make $r6 = 285832 (0x45c88);;
     _32(0x60140011),        //make $r5 = 17 (0x11);;
     _32(0x3c00040c),        //lq $r0r1 = 16 (0x10)[$r12];;
     _32(0x6a0c0000),        //copyd $r3 = $r0;;
     _32(0x6a100001),        //copyd $r4 = $r1;;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _96(0x0000000080000117e0002280),        //make $r0 = 285834 (0x45c8a);;
     _32(0x1fffffcd),        //call 168d0 <bar>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b740),        //compw.eq $r0 = $r0, 29 (0x1d);;
     _32(0x0c000080),        //cb.wnez $r0? 169b4 <main+0x6c>;;
     _32(0x18000006),        //call 169c8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16da0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 188d0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100101001000; //0x16948
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100011010000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100101001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100111001000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016948;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
