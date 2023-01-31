// executing pipeline 20040309_1.c.out.dumped test 
val k1_pipeline_20040309_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20040309_1() = {
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
     _32(0x2501060c),        //sh 24 (0x18)[$r12] = $r0;;
     _32(0x2800060c),        //lhz $r0 = 24 (0x18)[$r12];;
     _64(0x00000020f7000000),        //maxuw $r0 = $r0, 32768 (0x8000);;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _64(0x07ffffe0f1000000),        //addw $r0 = $r0, -32768 (0xffffffffffff8000);;
     _32(0x2501078c),        //sh 30 (0x1e)[$r12] = $r0;;
     _32(0x2800078c),        //lhz $r0 = 30 (0x1e)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffee),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16878 <main+0x20>;;
     _32(0x18000021),        //call 168f8 <abort>;;
     _32(0x60007fff),        //make $r0 = 32767 (0x7fff);;
     _32(0x1fffffe9),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 1688c <main+0x34>;;
     _32(0x1800001c),        //call 168f8 <abort>;;
     _64(0x00000020e0000000),        //make $r0 = 32768 (0x8000);;
     _32(0x1fffffe3),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 168a4 <main+0x4c>;;
     _32(0x18000016),        //call 168f8 <abort>;;
     _64(0x00000020e0000040),        //make $r0 = 32769 (0x8001);;
     _32(0x1fffffdd),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 168c4 <main+0x6c>;;
     _32(0x1800000e),        //call 168f8 <abort>;;
     _64(0x0000003fe000ffc0),        //make $r0 = 65535 (0xffff);;
     _32(0x1fffffd5),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x000003fff101b7c0),        //compw.eq $r0 = $r0, 32767 (0x7fff);;
     _32(0x0c000080),        //cb.wnez $r0? 168e4 <main+0x8c>;;
     _32(0x18000006),        //call 168f8 <abort>;;
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
     _32(0x980000f3),        //call 16cd0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18800 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100001011000; //0x16858
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100001011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100011111000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016858;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
