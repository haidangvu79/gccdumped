// executing pipeline pr65215_3.c.out.dumped test 
val k1_pipeline_pr65215_3: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr65215_3() = {
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
     _32(0x7b023600),        //srlw $r0 = $r0, 24 (0x18);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7b023200),        //srlw $r0 = $r0, 8 (0x8);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x0000003ff800c000),        //andw $r0 = $r0, 65280 (0xff00);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a011001),        //orw $r0 = $r1, $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x79023200),        //sllw $r0 = $r0, 8 (0x8);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00003fc0f8000000),        //andw $r0 = $r0, 16711680 (0xff0000);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a011001),        //orw $r0 = $r1, $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x79023600),        //sllw $r0 = $r0, 24 (0x18);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a011001),        //orw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let bar: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x2701020c),        //sd 8 (0x8)[$r12] = $r0;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x65037000),        //extfz $r0 = $r0, 23 (0x17), 0 (0x0);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x79023200),        //sllw $r0 = $r0, 8 (0x8);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x200000c0),        //lbz $r0 = 3 (0x3)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a011001),        //orw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffffd5),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _32(0x1fffffd0),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x79062800),        //slld $r1 = $r0, 32 (0x20);;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x7a010001),        //ord $r0 = $r1, $r0;;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _64(0x000037abe0046f80),        //make $r1 = 14593470 (0xdeadbe);;
     _32(0x61037001),        //insf $r0 = $r1, 23 (0x17), 0 (0x0);;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x6000ffef),        //make $r0 = -17 (0xffffffef);;
     _32(0x240104cc),        //sb 19 (0x13)[$r12] = $r0;;
     _64(0x07ffbb6fe000aa3f),        //make $r0 = -17973592 (0xfffffffffeedbea8);;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _32(0x1fffffd2),        //call 16890 <bar>;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x7b022800),        //srld $r0 = $r0, 32 (0x20);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffffb1),        //call 16820 <foo>;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3000050c),        //lwz $r0 = 20 (0x14)[$r12];;
     _32(0x7001b001),        //compw.ne $r0 = $r1, $r0;;
     _32(0x0c000580),        //cb.wnez $r0? 169c4 <main+0xb4>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffffaa),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7b023200),        //srlw $r0 = $r0, 8 (0x8);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004040c),        //lwz $r1 = 16 (0x10)[$r12];;
     _32(0x65077001),        //extfz $r1 = $r1, 23 (0x17), 0 (0x0);;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0x7001b040),        //compw.ne $r0 = $r0, $r1;;
     _32(0x0c0002c0),        //cb.wnez $r0? 169c4 <main+0xb4>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffff9f),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x200004cc),        //lbz $r0 = 19 (0x13)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 169c8 <main+0xb8>;;
     _32(0x18000007),        //call 169e0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
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
     _32(0x980000f3),        //call 16db8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 188e8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100010000; //0x16910
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100010010000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100111100000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016910;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
