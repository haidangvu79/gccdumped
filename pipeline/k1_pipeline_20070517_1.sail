// executing pipeline 20070517_1.c.out.dumped test 
val k1_pipeline_20070517_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20070517_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let get_kind: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let some_call: list_I = 
 [|
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x0fd00000)        //ret ;;
 |];

let example: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x1ffffff1),        //call 16820 <get_kind>;;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f101b240),        //compw.eq $r0 = $r0, 9 (0x9);;
     _32(0x0c000240),        //cb.wnez $r0? 16894 <example+0x4c>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f101b280),        //compw.eq $r0 = $r0, 10 (0xa);;
     _32(0x0c000140),        //cb.wnez $r0? 16894 <example+0x4c>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f001b140),        //compw.ne $r0 = $r0, 5 (0x5);;
     _32(0x0c000400),        //cb.wnez $r0? 168d0 <example+0x88>;;
     _32(0x1fffffeb),        //call 16840 <some_call>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000340),        //cb.dnez $r0? 168d0 <example+0x88>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f101b240),        //compw.eq $r0 = $r0, 9 (0x9);;
     _32(0x0c000140),        //cb.wnez $r0? 168c0 <example+0x78>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f001b280),        //compw.ne $r0 = $r0, 10 (0xa);;
     _32(0x0c000100),        //cb.wnez $r0? 168cc <example+0x84>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x10000002),        //goto 168d0 <example+0x88>;;
     _32(0x18000011),        //call 16910 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x6000000a),        //make $r0 = 10 (0xa);;
     _32(0x1fffffd4),        //call 16848 <example>;;
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
     _32(0x980000f3),        //call 16ce8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18818 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100011101000; //0x168e8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(get_kind, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(some_call, 0b00010110100001000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(example, 0b00010110100001001000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100011101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100100010000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000168e8;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
