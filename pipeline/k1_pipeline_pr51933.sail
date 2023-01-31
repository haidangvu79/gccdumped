// executing pipeline pr51933.c.out.dumped test 
val k1_pipeline_pr51933: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr51933() = {
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
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x26010c0c),        //sw 48 (0x30)[$r12] = $r0;;
     _32(0x27050a0c),        //sd 40 (0x28)[$r12] = $r1;;
     _32(0x2709080c),        //sd 32 (0x20)[$r12] = $r2;;
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x08000080),        //cb.dnez $r0? 16858 <bar+0x30>;;
     _32(0x1ffffff3),        //call 16820 <foo>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x10000026),        //goto 168f8 <bar+0xd0>;;
     _32(0x34000f0c),        //lws $r0 = 60 (0x3c)[$r12];;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x38040a0c),        //ld $r1 = 40 (0x28)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x25010e8c),        //sh 58 (0x3a)[$r12] = $r0;;
     _32(0x28000e8c),        //lhz $r0 = 58 (0x3a)[$r12];;
     _64(0x00000007f901b7c0),        //compw.gtu $r0 = $r0, 255 (0xff);;
     _32(0x0c000280),        //cb.wnez $r0? 168b0 <bar+0x88>;;
     _32(0x28000e8c),        //lhz $r0 = 58 (0x3a)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _96(0x0000000080000106e0047200),        //make $r1 = 268744 (0x419c8);;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x2002e001),        //lbz $r0 = $r0[$r1];;
     _32(0x78083fc0),        //zxbd $r2 = $r0;;
     _32(0x1000000b),        //goto 168d8 <bar+0xb0>;;
     _32(0x28000e8c),        //lhz $r0 = 58 (0x3a)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _96(0x0000000080000106e004b200),        //make $r1 = 269000 (0x41ac8);;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x2002e001),        //lbz $r0 = $r0[$r1];;
     _32(0x78083fc0),        //zxbd $r2 = $r0;;
     _32(0x34000f0c),        //lws $r0 = 60 (0x3c)[$r12];;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x7a040002),        //copyw $r1 = $r2;;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x30040f0c),        //lwz $r1 = 60 (0x3c)[$r12];;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _32(0x7201b001),        //compw.lt $r0 = $r1, $r0;;
     _32(0x0c7ff600),        //cb.wnez $r0? 16864 <bar+0x3c>;;
     _32(0x34000c0c),        //lws $r0 = 48 (0x30)[$r12];;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _96(0x03433b33815918d8e0009840),        //make $r0 = 7523094288207667809 (0x6867666564636261);;
     _32(0x2701020c),        //sd 8 (0x8)[$r12] = $r0;;
     _96(0x03837b73835b1adae0009a40),        //make $r0 = 8101815670912281193 (0x706f6e6d6c6b6a69);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x60000071),        //make $r0 = 113 (0x71);;
     _32(0x2501060c),        //sh 24 (0x18)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601170c),        //sw 92 (0x5c)[$r12] = $r0;;
     _32(0x10000014),        //goto 169bc <main+0x8c>;;
     _32(0x3000170c),        //lwz $r0 = 92 (0x5c)[$r12];;
     _32(0x78083fc0),        //zxbd $r2 = $r0;;
     _96(0x0000000080000106e0047200),        //make $r1 = 268744 (0x419c8);;
     _32(0x3400170c),        //lws $r0 = 92 (0x5c)[$r12];;
     _32(0x240be001),        //sb $r0[$r1] = $r2;;
     _32(0x3000170c),        //lwz $r0 = 92 (0x5c)[$r12];;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x78083fc0),        //zxbd $r2 = $r0;;
     _96(0x0000000080000106e004b200),        //make $r1 = 269000 (0x41ac8);;
     _32(0x3400170c),        //lws $r0 = 92 (0x5c)[$r12];;
     _32(0x240be001),        //sb $r0[$r1] = $r2;;
     _32(0x3000170c),        //lwz $r0 = 92 (0x5c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601170c),        //sw 92 (0x5c)[$r12] = $r0;;
     _32(0x3000170c),        //lwz $r0 = 92 (0x5c)[$r12];;
     _64(0x00000007f401b7c0),        //compw.le $r0 = $r0, 255 (0xff);;
     _32(0x0c7ffa80),        //cb.wnez $r0? 16970 <main+0x40>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601170c),        //sw 92 (0x5c)[$r12] = $r0;;
     _32(0x1000000e),        //goto 16a0c <main+0xdc>;;
     _32(0x3400170c),        //lws $r0 = 92 (0x5c)[$r12];;
     _32(0x6104180c),        //addd $r1 = $r12, 96 (0x60);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x2000ea00),        //lbz $r0 = -88 (0xffffffa8)[$r0];;
     _32(0x6407f000),        //zxhd $r1 = $r0;;
     _32(0x3400170c),        //lws $r0 = 92 (0x5c)[$r12];;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x6108180c),        //addd $r2 = $r12, 96 (0x60);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x2505f000),        //sh -64 (0xffffffc0)[$r0] = $r1;;
     _32(0x3000170c),        //lwz $r0 = 92 (0x5c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601170c),        //sw 92 (0x5c)[$r12] = $r0;;
     _32(0x3000170c),        //lwz $r0 = 92 (0x5c)[$r12];;
     _64(0x00000000f401b440),        //compw.le $r0 = $r0, 17 (0x11);;
     _32(0x0c7ffc00),        //cb.wnez $r0? 169d8 <main+0xa8>;;
     _32(0x28000a8c),        //lhz $r0 = 42 (0x2a)[$r12];;
     _64(0x00000001fa008000),        //orw $r0 = $r0, 1536 (0x600);;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x25010a8c),        //sh 42 (0x2a)[$r12] = $r0;;
     _32(0x28000b0c),        //lhz $r0 = 44 (0x2c)[$r12];;
     _64(0x00000001fa004000),        //orw $r0 = $r0, 1280 (0x500);;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x25010b0c),        //sh 44 (0x2c)[$r12] = $r0;;
     _32(0x28000d8c),        //lhz $r0 = 54 (0x36)[$r12];;
     _64(0x00000008fa000000),        //orw $r0 = $r0, 8192 (0x2000);;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x25010d8c),        //sh 54 (0x36)[$r12] = $r0;;
     _32(0x28000f8c),        //lhz $r0 = 62 (0x3e)[$r12];;
     _64(0x00000001fa004000),        //orw $r0 = $r0, 1280 (0x500);;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x25010f8c),        //sh 62 (0x3e)[$r12] = $r0;;
     _32(0x1fffff6d),        //call 16820 <foo>;;
     _32(0x6104120c),        //addd $r1 = $r12, 72 (0x48);;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x60000011),        //make $r0 = 17 (0x11);;
     _32(0x1fffff69),        //call 16828 <bar>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f001b440),        //compw.ne $r0 = $r0, 17 (0x11);;
     _32(0x0c000240),        //cb.wnez $r0? 16ab8 <main+0x188>;;
     _32(0x6100120c),        //addd $r0 = $r12, 72 (0x48);;
     _32(0x60080012),        //make $r2 = 18 (0x12);;
     _96(0x00000000800000fce004f000),        //make $r1 = 259008 (0x3f3c0);;
     _32(0x18000051),        //call 16bf0 <memcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16abc <main+0x18c>;;
     _32(0x18000006),        //call 16ad0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000115),        //call 16f30 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007df),        //call 18a60 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100110000; //0x16930
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100000101000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101011010000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016930;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
