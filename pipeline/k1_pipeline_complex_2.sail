// executing pipeline complex_2 test 
val k1_pipeline_complex_2: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_complex_2() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let f: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x2709000c),        //sd 0 (0x0)[$r12] = $r2;;
     _32(0x270d020c),        //sd 8 (0x8)[$r12] = $r3;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x3800000c),        //ld $r0 = 0 (0x0)[$r12];;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x50027001),        //faddd $r0 = $r1, $r0;;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x38040c0c),        //ld $r1 = 48 (0x30)[$r12];;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x50027001),        //faddd $r0 = $r1, $r0;;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x6a0c0001),        //copyd $r3 = $r1;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x6a000003),        //copyd $r0 = $r3;;
     _32(0x6a040002),        //copyd $r1 = $r2;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x38040a0c),        //ld $r1 = 40 (0x28)[$r12];;
     _32(0x2705140c),        //sd 80 (0x50)[$r12] = $r1;;
     _32(0x2701160c),        //sd 88 (0x58)[$r12] = $r0;;
     _96(0x0600000080000000e0000000),        //make $r0 = 13835058055282163712 (0xc000000000000000);;
     _32(0x2701100c),        //sd 64 (0x40)[$r12] = $r0;;
     _96(0x0200000080000000e0000000),        //make $r0 = 4611686018427387904 (0x4000000000000000);;
     _32(0x2701120c),        //sd 72 (0x48)[$r12] = $r0;;
     _32(0x3808100c),        //ld $r2 = 64 (0x40)[$r12];;
     _32(0x380c120c),        //ld $r3 = 72 (0x48)[$r12];;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _32(0x3804160c),        //ld $r1 = 88 (0x58)[$r12];;
     _32(0x1fffffc1),        //call 16820 <f>;;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x27050e0c),        //sd 56 (0x38)[$r12] = $r1;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _96(0x01ff800080000000e0040000),        //make $r1 = 4607182418800017408 (0x3ff0000000000000);;
     _32(0x7b030040),        //fcompd.une $r0 = $r0, $r1;;
     _32(0x78043fc0),        //zxbd $r1 = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _96(0x01ff800080000000e0080000),        //make $r2 = 4607182418800017408 (0x3ff0000000000000);;
     _32(0x7b030080),        //fcompd.une $r0 = $r0, $r2;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7a011001),        //orw $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16980 <main+0xd8>;;
     _32(0x18000015),        //call 169d0 <abort>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _96(0x05ff800080000000e0040000),        //make $r1 = 13830554455654793216 (0xbff0000000000000);;
     _32(0x7b030040),        //fcompd.une $r0 = $r0, $r1;;
     _32(0x78043fc0),        //zxbd $r1 = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _96(0x0200400080000000e0080000),        //make $r2 = 4613937818241073152 (0x4008000000000000);;
     _32(0x7b030080),        //fcompd.une $r0 = $r0, $r2;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7a011001),        //orw $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 169c8 <main+0x120>;;
     _32(0x18000003),        //call 169d0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 169f0 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16df0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18ac8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
 |];

let adr_start:bits(addr_bits) = 0b00010110100010101000; //0x168a8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100111010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100111110000, num_instr, mI);
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
