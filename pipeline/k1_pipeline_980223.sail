// executing pipeline 980223.c.out.dumped test 
val k1_pipeline_980223: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_980223() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let bar: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2801040c),        //sq 16 (0x10)[$r12] = $r0r1;;
     _32(0x18000036),        //call 16908 <abort>;;
     _32(0x7f03f000)        //nop ;;
 |];

let foo: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2801080c),        //sq 32 (0x20)[$r12] = $r0r1;;
     _32(0x2809040c),        //sq 16 (0x10)[$r12] = $r2r3;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x3c000000),        //lq $r0r1 = 0 (0x0)[$r0];;
     _32(0x28010c0c),        //sq 48 (0x30)[$r12] = $r0r1;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x68001000),        //andd $r0 = $r0, 64 (0x40);;
     _32(0x08800340),        //cb.deqz $r0? 16894 <foo+0x5c>;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x3c000400),        //lq $r0r1 = 16 (0x10)[$r0];;
     _32(0x2801040c),        //sq 16 (0x10)[$r12] = $r0r1;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x3c000000),        //lq $r0r1 = 0 (0x0)[$r0];;
     _32(0x28010c0c),        //sq 48 (0x30)[$r12] = $r0r1;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x68001000),        //andd $r0 = $r0, 64 (0x40);;
     _32(0x08800100),        //cb.deqz $r0? 16894 <foo+0x5c>;;
     _32(0x3c00040c),        //lq $r0r1 = 16 (0x10)[$r12];;
     _32(0x1fffffe5),        //call 16820 <bar>;;
     _32(0x2801040c),        //sq 16 (0x10)[$r12] = $r0r1;;
     _32(0x3c00040c),        //lq $r0r1 = 16 (0x10)[$r12];;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _96(0x00000000800000f8e0000a00),        //make $r0 = 253992 (0x3e028);;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x60000040),        //make $r0 = 64 (0x40);;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x3c08080c),        //lq $r2r3 = 32 (0x20)[$r12];;
     _32(0x3c000c0c),        //lq $r0r1 = 48 (0x30)[$r12];;
     _32(0x1fffffd3),        //call 16838 <foo>;;
     _32(0x2801040c),        //sq 16 (0x10)[$r12] = $r0r1;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16ce0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18810 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100010101000; //0x168a8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000111000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100100001000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000168a8;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
