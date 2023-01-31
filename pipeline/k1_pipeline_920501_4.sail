// executing pipeline 920501_4 test 
val k1_pipeline_920501_4: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_920501_4() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let x: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000f8e0040200),        //make $r1 = 253960 (0x3e008);;
     _32(0x3400060c),        //lws $r0 = 24 (0x18)[$r12];;
     _32(0x3802f001),        //ld.xs $r0 = $r0[$r1];;
     _32(0x7f03f000),        //nop ;;
     _32(0x0fd80000),        //igoto $r0;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x10000004),        //goto 16858 <x+0x38>;;
     _32(0x60000003),        //make $r0 = 3 (0x3);;
     _32(0x10000002),        //goto 16858 <x+0x38>;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffec),        //call 16820 <x>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f001b080),        //compw.ne $r0 = $r0, 2 (0x2);;
     _32(0x0c000340),        //cb.wnez $r0? 168b4 <main+0x54>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffffe6),        //call 16820 <x>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f001b0c0),        //compw.ne $r0 = $r0, 3 (0x3);;
     _32(0x0c0001c0),        //cb.wnez $r0? 168b4 <main+0x54>;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x1fffffe0),        //call 16820 <x>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b140),        //compw.eq $r0 = $r0, 5 (0x5);;
     _32(0x0c000080),        //cb.wnez $r0? 168b8 <main+0x58>;;
     _32(0x18000003),        //call 168c0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 168e0 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16ce0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 189b8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
 |];

let adr_start:bits(addr_bits) = 0b00010110100001100000; //0x16860
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(x, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100001100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100011000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100011100000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016860;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
