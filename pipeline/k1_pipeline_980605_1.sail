// executing pipeline 980605_1.c.out.dumped test 
val k1_pipeline_980605_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_980605_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let f2: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x2701020c),        //sd 8 (0x8)[$r12] = $r0;;
     _32(0x1800003c),        //call 16920 <getval>;;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x1800003a),        //call 16920 <getval>;;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x18000038),        //call 16920 <getval>;;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x18000036),        //call 16920 <getval>;;
     _32(0x26010c0c),        //sw 48 (0x30)[$r12] = $r0;;
     _32(0x18000034),        //call 16920 <getval>;;
     _32(0x26010b0c),        //sw 44 (0x2c)[$r12] = $r0;;
     _32(0x18000032),        //call 16920 <getval>;;
     _32(0x26010a0c),        //sw 40 (0x28)[$r12] = $r0;;
     _32(0x18000030),        //call 16920 <getval>;;
     _32(0x2601090c),        //sw 36 (0x24)[$r12] = $r0;;
     _32(0x1800002e),        //call 16920 <getval>;;
     _32(0x2601080c),        //sw 32 (0x20)[$r12] = $r0;;
     _32(0x1800002c),        //call 16920 <getval>;;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1800002a),        //call 16920 <getval>;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x47033000),        //fixedud.rz $r0 = $r0, 0 (0x0);;
     _32(0x2501058c),        //sh 22 (0x16)[$r12] = $r0;;
     _32(0x30040f0c),        //lwz $r1 = 60 (0x3c)[$r12];;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x30040d0c),        //lwz $r1 = 52 (0x34)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x30040c0c),        //lwz $r1 = 48 (0x30)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x30040b0c),        //lwz $r1 = 44 (0x2c)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x30040a0c),        //lwz $r1 = 40 (0x28)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004090c),        //lwz $r1 = 36 (0x24)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004080c),        //lwz $r1 = 32 (0x20)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x2800058c),        //lhz $r0 = 22 (0x16)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let getval: list_I = 
 [|
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71040040),        //addw $r1 = $r0, 1 (0x1);;
     _32(0x7808ffc1),        //zxwd $r2 = $r1;;
     _96(0x00000000800000f8e0040200),        //make $r1 = 253960 (0x3e008);;
     _32(0x26090001),        //sw 0 (0x0)[$r1] = $r2;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let f: list_I = 
 [|
     _64(0x07ffff9ee130480c),        //addd $r12 = $r12, -100064 (0xfffffffffffe7920);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x1fffffee),        //call 16920 <getval>;;
     _64(0x18000061a601b70c),        //sw 100060 (0x186dc)[$r12] = $r0;;
     _32(0x1fffffeb),        //call 16920 <getval>;;
     _64(0x18000061a601b60c),        //sw 100056 (0x186d8)[$r12] = $r0;;
     _32(0x1fffffe8),        //call 16920 <getval>;;
     _64(0x18000061a601b50c),        //sw 100052 (0x186d4)[$r12] = $r0;;
     _32(0x1fffffe5),        //call 16920 <getval>;;
     _64(0x18000061a601b40c),        //sw 100048 (0x186d0)[$r12] = $r0;;
     _32(0x1fffffe2),        //call 16920 <getval>;;
     _64(0x18000061a601b30c),        //sw 100044 (0x186cc)[$r12] = $r0;;
     _32(0x1fffffdf),        //call 16920 <getval>;;
     _64(0x18000061a601b20c),        //sw 100040 (0x186c8)[$r12] = $r0;;
     _32(0x1fffffdc),        //call 16920 <getval>;;
     _64(0x18000061a601b10c),        //sw 100036 (0x186c4)[$r12] = $r0;;
     _32(0x1fffffd9),        //call 16920 <getval>;;
     _64(0x18000061a601b00c),        //sw 100032 (0x186c0)[$r12] = $r0;;
     _32(0x1fffffd6),        //call 16920 <getval>;;
     _64(0x18000061a601af0c),        //sw 100028 (0x186bc)[$r12] = $r0;;
     _32(0x1fffffd3),        //call 16920 <getval>;;
     _64(0x18000061a601ae0c),        //sw 100024 (0x186b8)[$r12] = $r0;;
     _96(0x0201880080000000e0000000),        //make $r0 = 4625478292286210048 (0x4031000000000000);;
     _32(0x1fffff8d),        //call 16820 <f2>;;
     _64(0x18000061a601ad0c),        //sw 100020 (0x186b4)[$r12] = $r0;;
     _64(0x18000061b004b70c),        //lwz $r1 = 100060 (0x186dc)[$r12];;
     _64(0x18000061b000b60c),        //lwz $r0 = 100056 (0x186d8)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x18000061b004b50c),        //lwz $r1 = 100052 (0x186d4)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x18000061b004b40c),        //lwz $r1 = 100048 (0x186d0)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x18000061b004b30c),        //lwz $r1 = 100044 (0x186cc)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x18000061b004b20c),        //lwz $r1 = 100040 (0x186c8)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x18000061b004b10c),        //lwz $r1 = 100036 (0x186c4)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x18000061b004b00c),        //lwz $r1 = 100032 (0x186c0)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x18000061b004af0c),        //lwz $r1 = 100028 (0x186bc)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x18000061b004ae0c),        //lwz $r1 = 100024 (0x186b8)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x18000061b004ad0c),        //lwz $r1 = 100020 (0x186b4)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a080000),        //copyw $r2 = $r0;;
     _96(0x00000000800000fce004f000),        //make $r1 = 259008 (0x3f3c0);;
     _96(0x0000000080000117e0003000),        //make $r0 = 285888 (0x45cc0);;
     _32(0x180001cb),        //call 171e8 <sprintf>;;
     _64(0x18000061b004b70c),        //lwz $r1 = 100060 (0x186dc)[$r12];;
     _64(0x18000061b000b60c),        //lwz $r0 = 100056 (0x186d8)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x18000061b004b50c),        //lwz $r1 = 100052 (0x186d4)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x18000061b004b40c),        //lwz $r1 = 100048 (0x186d0)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x18000061b004b30c),        //lwz $r1 = 100044 (0x186cc)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x18000061b004b20c),        //lwz $r1 = 100040 (0x186c8)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x18000061b004b10c),        //lwz $r1 = 100036 (0x186c4)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x18000061b004b00c),        //lwz $r1 = 100032 (0x186c0)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x18000061b004af0c),        //lwz $r1 = 100028 (0x186bc)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x18000061b004ae0c),        //lwz $r1 = 100024 (0x186b8)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x18000061b004ad0c),        //lwz $r1 = 100020 (0x186b4)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000007f101b0c0),        //compw.eq $r0 = $r0, 227 (0xe3);;
     _32(0x0c000080),        //cb.wnez $r0? 16b78 <f+0x220>;;
     _32(0x1800000d),        //call 16ba8 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _64(0x00000061e130b80c),        //addd $r12 = $r12, 100064 (0x186e0);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1fffff6f),        //call 16958 <f>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16bc8 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16fc8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980023ad),        //call 1fa70 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0xf838ffc0),        //zxwd $r14 = $r0
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x98000adb),        //call 19748 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f200),        //make $r0 = 259016 (0x3f3c8);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16c04 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x9800239b),        //call 1fa70 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101110010000; //0x16b90
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f2, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(getval, 0b00010110100100100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100101011000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101110010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101110101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110101111001000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016b90;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
