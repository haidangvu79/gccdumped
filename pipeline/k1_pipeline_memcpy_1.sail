// executing pipeline memcpy_1.c.out.dumped test 
val k1_pipeline_memcpy_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_memcpy_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let copy: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x2609020c),        //sw 8 (0x8)[$r12] = $r2;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x18000146),        //call 16d60 <memcpy>;;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _64(0x07fffeffe130f80c),        //addd $r12 = $r12, -262176 (0xfffffffffffbffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _64(0x18000100a601070c),        //sw 262172 (0x4001c)[$r12] = $r0;;
     _32(0x10000018),        //goto 168dc <main+0x7c>;;
     _64(0x18000100b000070c),        //lwz $r0 = 262172 (0x4001c)[$r12];;
     _32(0x78043fc0),        //zxbd $r1 = $r0;;
     _64(0x18000100b000070c),        //lwz $r0 = 262172 (0x4001c)[$r12];;
     _64(0x00000100e108080c),        //addd $r2 = $r12, 262176 (0x40020);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _64(0x1fffff7fa405fe00),        //sb -131080 (0xfffffffffffdfff8)[$r0] = $r1;;
     _64(0x18000100b000070c),        //lwz $r0 = 262172 (0x4001c)[$r12];;
     _64(0x00000100e104080c),        //addd $r1 = $r12, 262176 (0x40020);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _64(0x1ffffeffa405fe00),        //sb -262152 (0xfffffffffffbfff8)[$r0] = $r1;;
     _64(0x18000100b000070c),        //lwz $r0 = 262172 (0x4001c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _64(0x18000100a601070c),        //sw 262172 (0x4001c)[$r12] = $r0;;
     _64(0x18000100b000070c),        //lwz $r0 = 262172 (0x4001c)[$r12];;
     _64(0x00000ffff801b7c0),        //compw.leu $r0 = $r0, 131071 (0x1ffff);;
     _32(0x0c7ff940),        //cb.wnez $r0? 16880 <main+0x20>;;
     _64(0x00000080e104060c),        //addd $r1 = $r12, 131096 (0x20018);;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x60080400),        //make $r2 = 1024 (0x400);;
     _32(0x18000118),        //call 16d60 <memcpy>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _64(0x18000100a601070c),        //sw 262172 (0x4001c)[$r12] = $r0;;
     _32(0x10000013),        //goto 1695c <main+0xfc>;;
     _64(0x18000100b000070c),        //lwz $r0 = 262172 (0x4001c)[$r12];;
     _64(0x00000100e104080c),        //addd $r1 = $r12, 262176 (0x40020);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _64(0x1ffffeffa004fe00),        //lbz $r1 = -262152 (0xfffffffffffbfff8)[$r0];;
     _64(0x18000100b000070c),        //lwz $r0 = 262172 (0x4001c)[$r12];;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16948 <main+0xe8>;;
     _32(0x180000ad),        //call 16bf8 <abort>;;
     _64(0x18000100b000070c),        //lwz $r0 = 262172 (0x4001c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _64(0x18000100a601070c),        //sw 262172 (0x4001c)[$r12] = $r0;;
     _64(0x18000100b000070c),        //lwz $r0 = 262172 (0x4001c)[$r12];;
     _64(0x0000001ff801b7c0),        //compw.leu $r0 = $r0, 1023 (0x3ff);;
     _32(0x0c7ffa80),        //cb.wnez $r0? 16914 <main+0xb4>;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x60080400),        //make $r2 = 1024 (0x400);;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x1800016d),        //call 16f30 <memset>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _64(0x18000100a601070c),        //sw 262172 (0x4001c)[$r12] = $r0;;
     _32(0x10000011),        //goto 169d0 <main+0x170>;;
     _64(0x18000100b000070c),        //lwz $r0 = 262172 (0x4001c)[$r12];;
     _64(0x00000100e104080c),        //addd $r1 = $r12, 262176 (0x40020);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _64(0x1ffffeffa000fe00),        //lbz $r0 = -262152 (0xfffffffffffbfff8)[$r0];;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 169bc <main+0x15c>;;
     _32(0x18000090),        //call 16bf8 <abort>;;
     _64(0x18000100b000070c),        //lwz $r0 = 262172 (0x4001c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _64(0x18000100a601070c),        //sw 262172 (0x4001c)[$r12] = $r0;;
     _64(0x18000100b000070c),        //lwz $r0 = 262172 (0x4001c)[$r12];;
     _64(0x0000001ff801b7c0),        //compw.leu $r0 = $r0, 1023 (0x3ff);;
     _32(0x0c7ffb00),        //cb.wnez $r0? 16990 <main+0x130>;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _64(0x00000080e104060c),        //addd $r1 = $r12, 131096 (0x20018);;
     _64(0x00000080e0080000),        //make $r2 = 131072 (0x20000);;
     _32(0x180000da),        //call 16d60 <memcpy>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _64(0x18000100a601070c),        //sw 262172 (0x4001c)[$r12] = $r0;;
     _32(0x10000013),        //goto 16a54 <main+0x1f4>;;
     _64(0x18000100b000070c),        //lwz $r0 = 262172 (0x4001c)[$r12];;
     _64(0x00000100e104080c),        //addd $r1 = $r12, 262176 (0x40020);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _64(0x1ffffeffa004fe00),        //lbz $r1 = -262152 (0xfffffffffffbfff8)[$r0];;
     _64(0x18000100b000070c),        //lwz $r0 = 262172 (0x4001c)[$r12];;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16a40 <main+0x1e0>;;
     _32(0x1800006f),        //call 16bf8 <abort>;;
     _64(0x18000100b000070c),        //lwz $r0 = 262172 (0x4001c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _64(0x18000100a601070c),        //sw 262172 (0x4001c)[$r12] = $r0;;
     _64(0x18000100b000070c),        //lwz $r0 = 262172 (0x4001c)[$r12];;
     _64(0x00000ffff801b7c0),        //compw.leu $r0 = $r0, 131071 (0x1ffff);;
     _32(0x0c7ffa80),        //cb.wnez $r0? 16a0c <main+0x1ac>;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _64(0x00000080e0080000),        //make $r2 = 131072 (0x20000);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x1800012e),        //call 16f30 <memset>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _64(0x18000100a601070c),        //sw 262172 (0x4001c)[$r12] = $r0;;
     _32(0x1000000f),        //goto 16ac4 <main+0x264>;;
     _64(0x18000100b000070c),        //lwz $r0 = 262172 (0x4001c)[$r12];;
     _64(0x00000100e104080c),        //addd $r1 = $r12, 262176 (0x40020);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _64(0x1ffffeffa000fe00),        //lbz $r0 = -262152 (0xfffffffffffbfff8)[$r0];;
     _32(0x08800080),        //cb.deqz $r0? 16ab0 <main+0x250>;;
     _32(0x18000053),        //call 16bf8 <abort>;;
     _64(0x18000100b000070c),        //lwz $r0 = 262172 (0x4001c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _64(0x18000100a601070c),        //sw 262172 (0x4001c)[$r12] = $r0;;
     _64(0x18000100b000070c),        //lwz $r0 = 262172 (0x4001c)[$r12];;
     _64(0x00000ffff801b7c0),        //compw.leu $r0 = $r0, 131071 (0x1ffff);;
     _32(0x0c7ffb80),        //cb.wnez $r0? 16a8c <main+0x22c>;;
     _64(0x00000080e104060c),        //addd $r1 = $r12, 131096 (0x20018);;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x60080400),        //make $r2 = 1024 (0x400);;
     _32(0x1fffff4e),        //call 16820 <copy>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _64(0x18000100a601070c),        //sw 262172 (0x4001c)[$r12] = $r0;;
     _32(0x10000013),        //goto 16b44 <main+0x2e4>;;
     _64(0x18000100b000070c),        //lwz $r0 = 262172 (0x4001c)[$r12];;
     _64(0x00000100e104080c),        //addd $r1 = $r12, 262176 (0x40020);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _64(0x1ffffeffa004fe00),        //lbz $r1 = -262152 (0xfffffffffffbfff8)[$r0];;
     _64(0x18000100b000070c),        //lwz $r0 = 262172 (0x4001c)[$r12];;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16b30 <main+0x2d0>;;
     _32(0x18000033),        //call 16bf8 <abort>;;
     _64(0x18000100b000070c),        //lwz $r0 = 262172 (0x4001c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _64(0x18000100a601070c),        //sw 262172 (0x4001c)[$r12] = $r0;;
     _64(0x18000100b000070c),        //lwz $r0 = 262172 (0x4001c)[$r12];;
     _64(0x0000001ff801b7c0),        //compw.leu $r0 = $r0, 1023 (0x3ff);;
     _32(0x0c7ffa80),        //cb.wnez $r0? 16afc <main+0x29c>;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _64(0x00000080e0080000),        //make $r2 = 131072 (0x20000);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x180000f2),        //call 16f30 <memset>;;
     _64(0x00000080e104060c),        //addd $r1 = $r12, 131096 (0x20018);;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _64(0x00000080e0080000),        //make $r2 = 131072 (0x20000);;
     _32(0x1fffff28),        //call 16820 <copy>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _64(0x18000100a601070c),        //sw 262172 (0x4001c)[$r12] = $r0;;
     _32(0x10000013),        //goto 16bdc <main+0x37c>;;
     _64(0x18000100b000070c),        //lwz $r0 = 262172 (0x4001c)[$r12];;
     _64(0x00000100e104080c),        //addd $r1 = $r12, 262176 (0x40020);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _64(0x1ffffeffa004fe00),        //lbz $r1 = -262152 (0xfffffffffffbfff8)[$r0];;
     _64(0x18000100b000070c),        //lwz $r0 = 262172 (0x4001c)[$r12];;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16bc8 <main+0x368>;;
     _32(0x1800000d),        //call 16bf8 <abort>;;
     _64(0x18000100b000070c),        //lwz $r0 = 262172 (0x4001c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _64(0x18000100a601070c),        //sw 262172 (0x4001c)[$r12] = $r0;;
     _64(0x18000100b000070c),        //lwz $r0 = 262172 (0x4001c)[$r12];;
     _64(0x00000ffff801b7c0),        //compw.leu $r0 = $r0, 131071 (0x1ffff);;
     _32(0x0c7ffa80),        //cb.wnez $r0? 16b94 <main+0x334>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16c18 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980001ed),        //call 173b8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000921),        //call 19090 <_exit>
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
     _32(0x98000249),        //call 17550 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16c54 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x9800090f),        //call 19090 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100001100000; //0x16860
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(copy, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100001100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101111111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110110000011000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016860;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
