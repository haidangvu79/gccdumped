// executing pipeline 961213_1 test 
val k1_pipeline_961213_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_961213_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let g: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2605060c),        //sw 24 (0x18)[$r12] = $r1;;
     _32(0x2709020c),        //sd 8 (0x8)[$r12] = $r2;;
     _32(0x260d000c),        //sw 0 (0x0)[$r12] = $r3;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000010),        //goto 16888 <g+0x68>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x3400000c),        //lws $r0 = 0 (0x0)[$r12];;
     _32(0x54001001),        //muld $r0 = $r1, $r0;;
     _32(0x3404070c),        //lws $r1 = 28 (0x1c)[$r12];;
     _32(0x79062081),        //slld $r1 = $r1, 2 (0x2);;
     _32(0x3808020c),        //ld $r2 = 8 (0x8)[$r12];;
     _32(0x71050042),        //addd $r1 = $r2, $r1;;
     _32(0x30040001),        //lwz $r1 = 0 (0x0)[$r1];;
     _32(0x71050040),        //addd $r1 = $r0, $r1;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7201b001),        //compw.lt $r0 = $r1, $r0;;
     _32(0x0c7ffb80),        //cb.wnez $r0? 1684c <g+0x2c>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x6000000a),        //make $r0 = 10 (0xa);;
     _32(0x26010a0c),        //sw 40 (0x28)[$r12] = $r0;;
     _32(0x6000000b),        //make $r0 = 11 (0xb);;
     _32(0x26010b0c),        //sw 44 (0x2c)[$r12] = $r0;;
     _32(0x6000000c),        //make $r0 = 12 (0xc);;
     _32(0x26010c0c),        //sw 48 (0x30)[$r12] = $r0;;
     _32(0x6000000d),        //make $r0 = 13 (0xd);;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x6000000e),        //make $r0 = 14 (0xe);;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x61040a0c),        //addd $r1 = $r12, 40 (0x28);;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x600c0010),        //make $r3 = 16 (0x10);;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _32(0x60040005),        //make $r1 = 5 (0x5);;
     _32(0x1fffffcc),        //call 16820 <g>;;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _64(0x000002afe1013780),        //compd.eq $r0 = $r0, 703710 (0xabcde);;
     _32(0x08000080),        //cb.dnez $r0? 1690c <main+0x64>;;
     _32(0x18000004),        //call 16918 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 16938 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16d38 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18a10 <_exit>
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
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(g, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100100011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100100111000, num_instr, mI);
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
