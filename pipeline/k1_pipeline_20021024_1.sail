// executing pipeline 20021024_1 test 
val k1_pipeline_20021024_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20021024_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo: list_I = 
 [|
     _32(0x7f03f000),        //nop ;;
     _32(0x0fd00000)        //ret ;;
 |];

let bar: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x2705020c),        //sd 8 (0x8)[$r12] = $r1;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x7b0235c0),        //srlw $r0 = $r0, 23 (0x17);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x7b023240),        //srlw $r0 = $r0, 9 (0x9);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x78007fc0),        //andw $r0 = $r0, 511 (0x1ff);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x78007fc0),        //andw $r0 = $r0, 511 (0x1ff);;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _96(0x0000000080000117e000a200),        //make $r0 = 286344 (0x45e88);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x3804020c),        //ld $r1 = 8 (0x8)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x3808020c),        //ld $r2 = 8 (0x8)[$r12];;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _96(0x0000000080000117e004a400),        //make $r1 = 286352 (0x45e90);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x0000000080000117e000a200),        //make $r0 = 286344 (0x45e88);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x1fffffd3),        //call 16820 <foo>;;
     _32(0x3000050c),        //lwz $r0 = 20 (0x14)[$r12];;
     _32(0x0c000080),        //cb.wnez $r0? 168e4 <bar+0xbc>;;
     _32(0x17ffffd7),        //goto 1683c <bar+0x14>;;
     _32(0x3000050c),        //lwz $r0 = 20 (0x14)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x3804020c),        //ld $r1 = 8 (0x8)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
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
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _96(0x0000000080000117e004a200),        //make $r1 = 286344 (0x45e88);;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x6004002f),        //make $r1 = 47 (0x2f);;
     _32(0x27050800),        //sd 32 (0x20)[$r0] = $r1;;
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x6004000b),        //make $r1 = 11 (0xb);;
     _32(0x27051000),        //sd 64 (0x40)[$r0] = $r1;;
     _96(0x0000000080000106e0047000),        //make $r1 = 268736 (0x419c0);;
     _64(0x00010002e00003c0),        //make $r0 = 67110927 (0x400080f);;
     _32(0x1fffffaf),        //call 16828 <bar>;;
     _96(0x0000000080000117e000a400),        //make $r0 = 286352 (0x45e90);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x61010e80),        //compd.eq $r0 = $r0, 58 (0x3a);;
     _32(0x08000080),        //cb.dnez $r0? 1698c <main+0x7c>;;
     _32(0x18000004),        //call 16998 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 169b8 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16db8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18a90 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
 |];

let adr_start:bits(addr_bits) = 0b00010110100100010000; //0x16910
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100000101000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100110011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100110111000, num_instr, mI);
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
