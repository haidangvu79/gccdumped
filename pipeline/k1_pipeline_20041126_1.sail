// executing pipeline 20041126_1.c.out.dumped test 
val k1_pipeline_20041126_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20041126_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let check: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000000b),        //goto 16864 <check+0x44>;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x08800080),        //cb.deqz $r0? 16858 <check+0x38>;;
     _32(0x18000055),        //call 169a8 <abort>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f401b100),        //compw.le $r0 = $r0, 4 (0x4);;
     _32(0x0c7ffcc0),        //cb.wnez $r0? 1683c <check+0x1c>;;
     _32(0x1000000f),        //goto 168b0 <check+0x90>;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 168a4 <check+0x84>;;
     _32(0x18000042),        //call 169a8 <abort>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f401b240),        //compw.le $r0 = $r0, 9 (0x9);;
     _32(0x0c7ffbc0),        //cb.wnez $r0? 16878 <check+0x58>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x60000003),        //make $r0 = 3 (0x3);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x60000004),        //make $r0 = 4 (0x4);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x2601080c),        //sw 32 (0x20)[$r12] = $r0;;
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x2601090c),        //sw 36 (0x24)[$r12] = $r0;;
     _32(0x60000007),        //make $r0 = 7 (0x7);;
     _32(0x26010a0c),        //sw 40 (0x28)[$r12] = $r0;;
     _32(0x60000008),        //make $r0 = 8 (0x8);;
     _32(0x26010b0c),        //sw 44 (0x2c)[$r12] = $r0;;
     _32(0x60000009),        //make $r0 = 9 (0x9);;
     _32(0x26010c0c),        //sw 48 (0x30)[$r12] = $r0;;
     _32(0x6000000a),        //make $r0 = 10 (0xa);;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x6000fffb),        //make $r0 = -5 (0xfffffffb);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x10000011),        //goto 16980 <main+0xa8>;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x7100fd80),        //addw $r0 = $r0, -10 (0xfffffff6);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x74000000),        //absw $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7100fd40),        //addw $r0 = $r0, -11 (0xfffffff5);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x6104100c),        //addd $r1 = $r12, 64 (0x40);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x2605f400),        //sw -48 (0xffffffd0)[$r0] = $r1;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x0d7ffbc0),        //cb.wltz $r0? 16940 <main+0x68>;;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _32(0x1fffffa5),        //call 16820 <check>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
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
     _32(0x980000f3),        //call 16d80 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 188b0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100011011000; //0x168d8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(check, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100011011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100110101000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000168d8;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
