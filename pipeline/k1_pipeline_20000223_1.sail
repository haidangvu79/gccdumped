// executing pipeline 20000223_1.c.out.dumped test 
val k1_pipeline_20000223_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20000223_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let check: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x75000000),        //negw $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004040c),        //lwz $r1 = 16 (0x10)[$r12];;
     _32(0x78011001),        //andw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004040c),        //lwz $r1 = 16 (0x10)[$r12];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 1685c <check+0x3c>;;
     _32(0x1800005e),        //call 169d0 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x1fffffe5),        //call 16820 <check>;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _96(0x00000000800000fce000f200),        //make $r0 = 259016 (0x3f3c8);;
     _32(0x1fffffe0),        //call 16820 <check>;;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _96(0x00000000800000fce000f400),        //make $r0 = 259024 (0x3f3d0);;
     _32(0x1fffffdb),        //call 16820 <check>;;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _96(0x00000000800000fce000f800),        //make $r0 = 259040 (0x3f3e0);;
     _32(0x1fffffd6),        //call 16820 <check>;;
     _32(0x60040004),        //make $r1 = 4 (0x4);;
     _96(0x00000000800000fce000fc00),        //make $r0 = 259056 (0x3f3f0);;
     _32(0x1fffffd1),        //call 16820 <check>;;
     _32(0x60040004),        //make $r1 = 4 (0x4);;
     _96(0x00000000800000fde0000000),        //make $r0 = 259072 (0x3f400);;
     _32(0x1fffffcc),        //call 16820 <check>;;
     _32(0x60040008),        //make $r1 = 8 (0x8);;
     _96(0x00000000800000fde0000400),        //make $r0 = 259088 (0x3f410);;
     _32(0x1fffffc7),        //call 16820 <check>;;
     _32(0x60040008),        //make $r1 = 8 (0x8);;
     _96(0x00000000800000fde0000800),        //make $r0 = 259104 (0x3f420);;
     _32(0x1fffffc2),        //call 16820 <check>;;
     _32(0x60040008),        //make $r1 = 8 (0x8);;
     _96(0x00000000800000fde0000c00),        //make $r0 = 259120 (0x3f430);;
     _32(0x1fffffbd),        //call 16820 <check>;;
     _32(0x60040008),        //make $r1 = 8 (0x8);;
     _96(0x00000000800000fde0001200),        //make $r0 = 259144 (0x3f448);;
     _32(0x1fffffb8),        //call 16820 <check>;;
     _32(0x60040004),        //make $r1 = 4 (0x4);;
     _96(0x00000000800000fde0001800),        //make $r0 = 259168 (0x3f460);;
     _32(0x1fffffb3),        //call 16820 <check>;;
     _32(0x60040008),        //make $r1 = 8 (0x8);;
     _96(0x00000000800000fde0001a00),        //make $r0 = 259176 (0x3f468);;
     _32(0x1fffffae),        //call 16820 <check>;;
     _32(0x60040008),        //make $r1 = 8 (0x8);;
     _96(0x00000000800000fde0001c00),        //make $r0 = 259184 (0x3f470);;
     _32(0x1fffffa9),        //call 16820 <check>;;
     _32(0x60040008),        //make $r1 = 8 (0x8);;
     _96(0x00000000800000fde0002000),        //make $r0 = 259200 (0x3f480);;
     _32(0x1fffffa4),        //call 16820 <check>;;
     _32(0x60040008),        //make $r1 = 8 (0x8);;
     _96(0x00000000800000fde0002200),        //make $r0 = 259208 (0x3f488);;
     _32(0x1fffff9f),        //call 16820 <check>;;
     _32(0x60040008),        //make $r1 = 8 (0x8);;
     _96(0x00000000800000fde0002600),        //make $r0 = 259224 (0x3f498);;
     _32(0x1fffff9a),        //call 16820 <check>;;
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
     _32(0x980000f3),        //call 16da8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 188d8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100001110000; //0x16870
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(check, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100001110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100111010000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016870;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
