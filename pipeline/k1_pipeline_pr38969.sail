// executing pipeline pr38969.c.out.dumped test 
val k1_pipeline_pr38969: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr38969() = {
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
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x7a080000),        //copyw $r2 = $r0;;
     _32(0x6103f001),        //insf $r0 = $r1, 31 (0x1f), 0 (0x0);;
     _32(0x7a040002),        //copyw $r1 = $r2;;
     _32(0x6303f801),        //insf $r0 = $r1, 63 (0x3f), 32 (0x20);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let bar: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x1ffffff1),        //call 16820 <foo>;;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _32(0x6703f800),        //extfz $r0 = $r0, 63 (0x3f), 32 (0x20);;
     _32(0x7a080000),        //copyw $r2 = $r0;;
     _32(0x6103f001),        //insf $r0 = $r1, 31 (0x1f), 0 (0x0);;
     _32(0x7a040002),        //copyw $r1 = $r2;;
     _32(0x6303f801),        //insf $r0 = $r1, 63 (0x3f), 32 (0x20);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _64(0x00104400e0000000),        //make $r0 = 1091567616 (0x41100000);;
     _32(0x26010c0c),        //sw 48 (0x30)[$r12] = $r0;;
     _64(0x00104400e0000000),        //make $r0 = 1091567616 (0x41100000);;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _32(0x26010c0c),        //sw 48 (0x30)[$r12] = $r0;;
     _64(0x00108a00e0000000),        //make $r0 = 1109917696 (0x42280000);;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x1fffffdf),        //call 16848 <bar>;;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x30000a0c),        //lwz $r0 = 40 (0x28)[$r12];;
     _32(0x2601090c),        //sw 36 (0x24)[$r12] = $r0;;
     _32(0x30000b0c),        //lwz $r0 = 44 (0x2c)[$r12];;
     _32(0x2601080c),        //sw 32 (0x20)[$r12] = $r0;;
     _32(0x30040e0c),        //lwz $r1 = 56 (0x38)[$r12];;
     _32(0x3000090c),        //lwz $r0 = 36 (0x24)[$r12];;
     _32(0x73030001),        //fcompw.une $r0 = $r1, $r0;;
     _32(0x78043fc0),        //zxbd $r1 = $r0;;
     _32(0x3000080c),        //lwz $r0 = 32 (0x20)[$r12];;
     _64(0x00108a00e0080000),        //make $r2 = 1109917696 (0x42280000);;
     _32(0x73030080),        //fcompw.une $r0 = $r0, $r2;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7a011001),        //orw $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16920 <main+0x98>;;
     _32(0x18000007),        //call 16938 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16d10 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18840 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100010001000; //0x16888
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100001001000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100100111000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016888;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
