// executing pipeline pr58365.c.out.dumped test 
val k1_pipeline_pr58365: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr58365() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo: list_I = 
 [|
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x0fd00000)        //ret ;;
 |];

let bar: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1ffffff7),        //call 16820 <foo>;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x088002c0),        //cb.deqz $r0? 16878 <bar+0x40>;;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x2705120c),        //sd 72 (0x48)[$r12] = $r1;;
     _32(0x38040200),        //ld $r1 = 8 (0x8)[$r0];;
     _32(0x2705140c),        //sd 80 (0x50)[$r12] = $r1;;
     _32(0x30000400),        //lwz $r0 = 16 (0x10)[$r0];;
     _32(0x2601160c),        //sw 88 (0x58)[$r12] = $r0;;
     _32(0x1000000a),        //goto 1689c <bar+0x64>;;
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x2705120c),        //sd 72 (0x48)[$r12] = $r1;;
     _32(0x38040200),        //ld $r1 = 8 (0x8)[$r0];;
     _32(0x2705140c),        //sd 80 (0x50)[$r12] = $r1;;
     _32(0x30000400),        //lwz $r0 = 16 (0x10)[$r0];;
     _32(0x2601160c),        //sw 88 (0x58)[$r12] = $r0;;
     _32(0x3800120c),        //ld $r0 = 72 (0x48)[$r12];;
     _32(0x3804140c),        //ld $r1 = 80 (0x50)[$r12];;
     _32(0x3008160c),        //lwz $r2 = 88 (0x58)[$r12];;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1fffffdd),        //call 16838 <bar>;;
     _32(0x6a0c0000),        //copyd $r3 = $r0;;
     _96(0x0000000080000106e0007600),        //make $r0 = 268760 (0x419d8);;
     _32(0x270d0000),        //sd 0 (0x0)[$r0] = $r3;;
     _32(0x27050200),        //sd 8 (0x8)[$r0] = $r1;;
     _32(0x30040400),        //lwz $r1 = 16 (0x10)[$r0];;
     _32(0x6107f002),        //insf $r1 = $r2, 31 (0x1f), 0 (0x0);;
     _32(0x26050400),        //sw 16 (0x10)[$r0] = $r1;;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x26050100),        //sw 4 (0x4)[$r0] = $r1;;
     _96(0x0000000080000106e0007600),        //make $r0 = 268760 (0x419d8);;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _32(0x08800080),        //cb.deqz $r0? 16918 <main+0x60>;;
     _32(0x18000007),        //call 16930 <abort>;;
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
     _32(0x980000f3),        //call 16d08 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18838 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100010111000; //0x168b8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100000111000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100100110000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000168b8;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
