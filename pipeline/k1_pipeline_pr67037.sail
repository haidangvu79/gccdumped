// executing pipeline pr67037.c.out.dumped test 
val k1_pipeline_pr67037: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr67037() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let lstrcpynW: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2705020c),        //sd 8 (0x8)[$r12] = $r1;;
     _32(0x2609060c),        //sw 24 (0x18)[$r12] = $r2;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000000c),        //goto 16868 <lstrcpynW+0x48>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3804020c),        //ld $r1 = 8 (0x8)[$r12];;
     _32(0x61000081),        //addd $r0 = $r1, 2 (0x2);;
     _32(0x2701020c),        //sd 8 (0x8)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61080080),        //addd $r2 = $r0, 2 (0x2);;
     _32(0x2709040c),        //sd 16 (0x10)[$r12] = $r2;;
     _32(0x28040001),        //lhz $r1 = 0 (0x0)[$r1];;
     _32(0x25050000),        //sh 0 (0x0)[$r0] = $r1;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f801b040),        //compw.leu $r0 = $r0, 1 (0x1);;
     _32(0x0c000100),        //cb.wnez $r0? 16884 <lstrcpynW+0x64>;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x087ffbc0),        //cb.dnez $r0? 1683c <lstrcpynW+0x1c>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x0c800100),        //cb.weqz $r0? 16898 <lstrcpynW+0x78>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x25050000),        //sh 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let badfunc: list_I = 
 [|
     _64(0x07fffffae130b00c),        //addd $r12 = $r12, -5440 (0xffffffffffffeac0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2601100c),        //sw 64 (0x40)[$r12] = $r0;;
     _32(0x26050e0c),        //sw 56 (0x38)[$r12] = $r1;;
     _32(0x26090c0c),        //sw 48 (0x30)[$r12] = $r2;;
     _32(0x260d0a0c),        //sw 40 (0x28)[$r12] = $r3;;
     _32(0x2711080c),        //sd 32 (0x20)[$r12] = $r4;;
     _32(0x2615060c),        //sw 24 (0x18)[$r12] = $r5;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _64(0x18000005a6014f0c),        //sw 5436 (0x153c)[$r12] = $r0;;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x0fdc0000),        //icall $r0;;
     _32(0x088000c0),        //cb.deqz $r0? 168fc <badfunc+0x54>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000001f),        //goto 16974 <badfunc+0xcc>;;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x0fdc0000),        //icall $r0;;
     _64(0x18000005a7014c0c),        //sd 5424 (0x1530)[$r12] = $r0;;
     _64(0x18000005b8004c0c),        //ld $r0 = 5424 (0x1530)[$r12];;
     _32(0x08000480),        //cb.dnez $r0? 16968 <badfunc+0xc0>;;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x6100120c),        //addd $r0 = $r12, 72 (0x48);;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7a080000),        //copyw $r2 = $r0;;
     _96(0x00000000800000fce004f000),        //make $r1 = 259008 (0x3f3c0);;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x1fffffb3),        //call 16820 <lstrcpynW>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _64(0x18000005a6014f0c),        //sw 5436 (0x153c)[$r12] = $r0;;
     _32(0x10000002),        //goto 1696c <badfunc+0xc4>;;
     _32(0x7f03f000),        //nop ;;
     _64(0x18000005b0004f0c),        //lwz $r0 = 5436 (0x153c)[$r12];;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _64(0x00000005e130500c),        //addd $r12 = $r12, 5440 (0x1540);;
     _32(0x0fd00000)        //ret ;;
 |];

let f: list_I = 
 [|
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _96(0x000000008000005ae0046200),        //make $r1 = 92552 (0x16988);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _32(0x60140006),        //make $r5 = 6 (0x6);;
     _32(0x6a100000),        //copyd $r4 = $r0;;
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffb5),        //call 168a8 <badfunc>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b000),        //compw.eq $r0 = $r0, 0 (0x0);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100110010000; //0x16990
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(lstrcpynW, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(badfunc, 0b00010110100010101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100110001000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100110010000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016990;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
