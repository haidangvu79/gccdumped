// executing pipeline 20010224_1.c.out.dumped test 
val k1_pipeline_20010224_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20010224_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let ba_compute_psd: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x2501020c),        //sh 8 (0x8)[$r12] = $r0;;
     _32(0x60000004),        //make $r0 = 4 (0x4);;
     _32(0x2501058c),        //sh 22 (0x16)[$r12] = $r0;;
     _32(0x2c00020c),        //lhs $r0 = 8 (0x8)[$r12];;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2c00020c),        //lhs $r0 = 8 (0x8)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _96(0x00000000800000f8e0040200),        //make $r1 = 253960 (0x3e008);;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x2802f001),        //lhz.xs $r0 = $r0[$r1];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _96(0x00000000800000f8e0040600),        //make $r1 = 253976 (0x3e018);;
     _32(0x3400060c),        //lws $r0 = 24 (0x18)[$r12];;
     _32(0x280af001),        //lhz.xs $r2 = $r0[$r1];;
     _96(0x00000000800000f8e0040a00),        //make $r1 = 253992 (0x3e028);;
     _32(0x3400040c),        //lws $r0 = 16 (0x10)[$r12];;
     _32(0x250bf001),        //sh.xs $r0[$r1] = $r2;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000001a),        //goto 16908 <ba_compute_psd+0xe8>;;
     _32(0x3400040c),        //lws $r0 = 16 (0x10)[$r12];;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _96(0x00000000800000f8e1080a00),        //addd $r2 = $r0, 253992 (0x3e028);;
     _32(0x3400060c),        //lws $r0 = 24 (0x18)[$r12];;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _96(0x00000000800000f8e1000600),        //addd $r0 = $r0, 253976 (0x3e018);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x6a000002),        //copyd $r0 = $r2;;
     _32(0x18000019),        //call 16938 <logadd>;;
     _32(0x640bf000),        //zxhd $r2 = $r0;;
     _96(0x00000000800000f8e0040a00),        //make $r1 = 253992 (0x3e028);;
     _32(0x3400040c),        //lws $r0 = 16 (0x10)[$r12];;
     _32(0x250bf001),        //sh.xs $r0[$r1] = $r2;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x2c00058c),        //lhs $r0 = 22 (0x16)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x7201b001),        //compw.lt $r0 = $r1, $r0;;
     _32(0x0c7ff8c0),        //cb.wnez $r0? 168a4 <ba_compute_psd+0x84>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let logadd: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x6407f000),        //zxhd $r1 = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffa8),        //call 16820 <ba_compute_psd>;;
     _96(0x00000000800000f8e0000a00),        //make $r0 = 253992 (0x3e028);;
     _32(0x28000080),        //lhz $r0 = 2 (0x2)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _64(0x00000004f101b300),        //compw.eq $r0 = $r0, 140 (0x8c);;
     _32(0x0c000080),        //cb.wnez $r0? 169a8 <main+0x38>;;
     _32(0x18000007),        //call 169c0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
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
     _32(0x980000f3),        //call 16d98 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 188c8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100101110000; //0x16970
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(ba_compute_psd, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(logadd, 0b00010110100100111000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100101110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100111000000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016970;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
