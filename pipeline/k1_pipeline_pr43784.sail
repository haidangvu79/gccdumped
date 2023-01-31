// executing pipeline pr43784.c.out.dumped test 
val k1_pipeline_pr43784: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr43784() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let rp: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x6a38000f),        //copyd $r14 = $r15;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x6a0c000e),        //copyd $r3 = $r14;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x60000100),        //make $r0 = 256 (0x100);;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x6a000003),        //copyd $r0 = $r3;;
     _32(0x1800009a),        //call 16ac0 <memcpy>;;
     _32(0x6a00000e),        //copyd $r0 = $r14;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838040c),        //ld $r14 = 16 (0x10)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let qp: list_I = 
 [|
     _32(0x6130b80c),        //addd $r12 = $r12, -288 (0xfffffee0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _96(0x00000000800000f8e0000400),        //make $r0 = 253968 (0x3e010);;
     _32(0x38380000),        //ld $r14 = 0 (0x0)[$r0];;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x6a3c0000),        //copyd $r15 = $r0;;
     _32(0x1fffffe0),        //call 16820 <rp>;;
     _32(0x6a0c000e),        //copyd $r3 = $r14;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x60040100),        //make $r1 = 256 (0x100);;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x6a000003),        //copyd $r0 = $r3;;
     _32(0x18000081),        //call 16ac0 <memcpy>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838040c),        //ld $r14 = 16 (0x10)[$r12];;
     _32(0x6130480c),        //addd $r12 = $r12, 288 (0x120);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000000c),        //goto 1691c <main+0x44>;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x78083fc0),        //zxbd $r2 = $r0;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x240be001),        //sb $r0[$r1] = $r2;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000007f401b7c0),        //compw.le $r0 = $r0, 255 (0xff);;
     _32(0x0c7ffc80),        //cb.wnez $r0? 168f0 <main+0x18>;;
     _32(0x1fffffd3),        //call 16878 <qp>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000000f),        //goto 16974 <main+0x9c>;;
     _96(0x00000000800000f8e0000400),        //make $r0 = 253968 (0x3e010);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x2002e001),        //lbz $r0 = $r0[$r1];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16968 <main+0x90>;;
     _32(0x1800000d),        //call 16998 <abort>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000007f401b7c0),        //compw.le $r0 = $r0, 255 (0xff);;
     _32(0x0c7ffbc0),        //cb.wnez $r0? 1693c <main+0x64>;;
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
     _32(0x98000169),        //call 16f48 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000833),        //call 18a78 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100011011000; //0x168d8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(rp, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(qp, 0b00010110100001111000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100011011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100110011000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000168d8;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
