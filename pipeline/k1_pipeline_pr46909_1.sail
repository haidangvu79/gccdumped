// executing pipeline pr46909_1.c.out.dumped test 
val k1_pipeline_pr46909_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr46909_1() = {
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
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f101b100),        //compw.eq $r0 = $r0, 4 (0x4);;
     _32(0x0c000140),        //cb.wnez $r0? 16848 <foo+0x28>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f001b180),        //compw.ne $r0 = $r0, 6 (0x6);;
     _32(0x0c000240),        //cb.wnez $r0? 16868 <foo+0x48>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f101b080),        //compw.eq $r0 = $r0, 2 (0x2);;
     _32(0x0c000140),        //cb.wnez $r0? 16868 <foo+0x48>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f001b180),        //compw.ne $r0 = $r0, 6 (0x6);;
     _32(0x0c0000c0),        //cb.wnez $r0? 16870 <foo+0x50>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x10000003),        //goto 16878 <foo+0x58>;;
     _64(0x003fffffe000ffc0),        //make $r0 = 4294967295 (0xffffffff);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x6000fff6),        //make $r0 = -10 (0xfffffff6);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000012),        //goto 168dc <main+0x5c>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x1fffffe1),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _64(0x00000000f005b101),        //compw.ne $r1 = $r1, 4 (0x4);;
     _32(0x0c000101),        //cb.wnez $r1? 168c0 <main+0x40>;;
     _64(0x003fffffe004ffc0),        //make $r1 = 4294967295 (0xffffffff);;
     _32(0x10000002),        //goto 168c4 <main+0x44>;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 168d0 <main+0x50>;;
     _32(0x1800000d),        //call 16900 <abort>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f401b240),        //compw.le $r0 = $r0, 9 (0x9);;
     _32(0x0c7ffb00),        //cb.wnez $r0? 16898 <main+0x18>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
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

let adr_start:bits(addr_bits) = 0b00010110100010000000; //0x16880
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100100000000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016880;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
