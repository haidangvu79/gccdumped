// executing pipeline pr68381.c.out.dumped test 
val k1_pipeline_pr68381: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr68381() = {
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
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x2501040c),        //sh 16 (0x10)[$r12] = $r0;;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x2501020c),        //sh 8 (0x8)[$r12] = $r0;;
     _32(0x2800040c),        //lhz $r0 = 16 (0x10)[$r12];;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x2800020c),        //lhz $r0 = 8 (0x8)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x6907f001),        //sxwd $r1 = $r1;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x54001001),        //muld $r0 = $r1, $r0;;
     _32(0x6907f000),        //sxwd $r1 = $r0;;
     _32(0x7105a040),        //compd.eq $r1 = $r0, $r1;;
     _32(0x08000081),        //cb.dnez $r1? 16868 <foo+0x48>;;
     _32(0x60080001),        //make $r2 = 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x7800ffc2),        //zxwd $r0 = $r2;;
     _32(0x78000040),        //andw $r0 = $r0, 1 (0x1);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16884 <foo+0x64>;;
     _32(0x18000022),        //call 16908 <abort>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x6407f001),        //zxhd $r1 = $r1;;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0x1fffffd5),        //call 16820 <foo>;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3008070c),        //lwz $r2 = 28 (0x1c)[$r12];;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x5b003002),        //mulw $r0 = $r2, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 168f0 <main+0x58>;;
     _32(0x18000007),        //call 16908 <abort>;;
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
     _32(0x980000f3),        //call 16ce0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18810 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100010011000; //0x16898
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100100001000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016898;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
