// executing pipeline 20050224_1.c.out.dumped test 
val k1_pipeline_20050224_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20050224_1() = {
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
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x2609020c),        //sw 8 (0x8)[$r12] = $r2;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000007f001b540),        //compw.ne $r0 = $r0, 245 (0xf5);;
     _32(0x0c000240),        //cb.wnez $r0? 16868 <foo+0x48>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _64(0x00000001f001b100),        //compw.ne $r0 = $r0, 36 (0x24);;
     _32(0x0c000140),        //cb.wnez $r0? 16868 <foo+0x48>;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _64(0x0000000df101b700),        //compw.eq $r0 = $r0, 444 (0x1bc);;
     _32(0x0c000080),        //cb.wnez $r0? 1686c <foo+0x4c>;;
     _32(0x18000050),        //call 169a8 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601030c),        //sw 12 (0xc)[$r12] = $r0;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x1000002c),        //goto 16968 <main+0xe8>;;
     _96(0x00000000800000f8e0000600),        //make $r0 = 253976 (0x3e018);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x7701a001),        //compd.geu $r0 = $r1, $r0;;
     _32(0x08000140),        //cb.dnez $r0? 168e8 <main+0x68>;;
     _32(0x3000050c),        //lwz $r0 = 20 (0x14)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x1000001d),        //goto 16958 <main+0xd8>;;
     _96(0x00000000800000f8e0000800),        //make $r0 = 253984 (0x3e020);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x7601a001),        //compd.ltu $r0 = $r1, $r0;;
     _32(0x08000300),        //cb.dnez $r0? 16930 <main+0xb0>;;
     _96(0x00000000800000f8e0000a00),        //make $r0 = 253992 (0x3e028);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x7701a001),        //compd.geu $r0 = $r1, $r0;;
     _32(0x08000140),        //cb.dnez $r0? 16930 <main+0xb0>;;
     _32(0x3000030c),        //lwz $r0 = 12 (0xc)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601030c),        //sw 12 (0xc)[$r12] = $r0;;
     _32(0x1000000b),        //goto 16958 <main+0xd8>;;
     _96(0x00000000800000f8e0000c00),        //make $r0 = 254000 (0x3e030);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x7701a001),        //compd.geu $r0 = $r1, $r0;;
     _32(0x08000100),        //cb.dnez $r0? 16958 <main+0xd8>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x00000004e1000000),        //addd $r0 = $r0, 4096 (0x1000);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000f8e0000400),        //make $r0 = 253968 (0x3e010);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x7601a001),        //compd.ltu $r0 = $r1, $r0;;
     _32(0x087ff3c0),        //cb.dnez $r0? 168bc <main+0x3c>;;
     _32(0x3008050c),        //lwz $r2 = 20 (0x14)[$r12];;
     _32(0x3004030c),        //lwz $r1 = 12 (0xc)[$r12];;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x1fffffa4),        //call 16820 <foo>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16d80 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 188b0 <_exit>
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
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100110101000, num_instr, mI);
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
