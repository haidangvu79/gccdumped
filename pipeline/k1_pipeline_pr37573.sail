// executing pipeline pr37573.c.out.dumped test 
val k1_pipeline_pr37573: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr37573() = {
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
     _32(0x2701000c),        //sd 0 (0x0)[$r12] = $r0;;
     _32(0x3800000c),        //ld $r0 = 0 (0x0)[$r12];;
     _32(0x30000200),        //lwz $r0 = 8 (0x8)[$r0];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3800000c),        //ld $r0 = 0 (0x0)[$r12];;
     _32(0x26050200),        //sw 8 (0x8)[$r0] = $r1;;
     _32(0x3800000c),        //ld $r0 = 0 (0x0)[$r12];;
     _32(0x30000200),        //lwz $r0 = 8 (0x8)[$r0];;
     _32(0x08001240),        //cb.dnez $r0? 1696c <foo+0x14c>;;
     _32(0x3800000c),        //ld $r0 = 0 (0x0)[$r12];;
     _32(0x61000300),        //addd $r0 = $r0, 12 (0xc);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800000c),        //ld $r0 = 0 (0x0)[$r12];;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000003c),        //goto 1695c <foo+0x13c>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x3808040c),        //ld $r2 = 16 (0x10)[$r12];;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7c011001),        //xorw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x001ffffff800ff80),        //andw $r0 = $r0, 2147483646 (0x7ffffffe);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x3808040c),        //ld $r2 = 16 (0x10)[$r12];;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7c011001),        //xorw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7b023040),        //srlw $r0 = $r0, 1 (0x1);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x3808040c),        //ld $r2 = 16 (0x10)[$r12];;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x78000040),        //andw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x75000000),        //negw $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x07e6422cf80037c0),        //andw $r0 = $r0, -1727483681 (0xffffffff9908b0df);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7c011001),        //xorw $r0 = $r1, $r0;;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71006340),        //addw $r0 = $r0, 397 (0x18d);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x380c040c),        //ld $r3 = 16 (0x10)[$r12];;
     _32(0x71010003),        //addd $r0 = $r3, $r0;;
     _32(0x7c051042),        //xorw $r1 = $r2, $r1;;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000007f801b080),        //compw.leu $r0 = $r0, 226 (0xe2);;
     _32(0x0c7ff080),        //cb.wnez $r0? 16870 <foo+0x50>;;
     _32(0x3800000c),        //ld $r0 = 0 (0x0)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x61080100),        //addd $r2 = $r0, 4 (0x4);;
     _32(0x3804000c),        //ld $r1 = 0 (0x0)[$r12];;
     _32(0x27090001),        //sd 0 (0x0)[$r1] = $r2;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x2601030c),        //sw 12 (0xc)[$r12] = $r0;;
     _32(0x3000030c),        //lwz $r0 = 12 (0xc)[$r12];;
     _32(0x7b0232c0),        //srlw $r0 = $r0, 11 (0xb);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004030c),        //lwz $r1 = 12 (0xc)[$r12];;
     _32(0x7c011001),        //xorw $r0 = $r1, $r0;;
     _32(0x2601030c),        //sw 12 (0xc)[$r12] = $r0;;
     _32(0x3000030c),        //lwz $r0 = 12 (0xc)[$r12];;
     _32(0x790231c0),        //sllw $r0 = $r0, 7 (0x7);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x07e74b15f800a000),        //andw $r0 = $r0, -1658038656 (0xffffffff9d2c5680);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004030c),        //lwz $r1 = 12 (0xc)[$r12];;
     _32(0x7c011001),        //xorw $r0 = $r1, $r0;;
     _32(0x2601030c),        //sw 12 (0xc)[$r12] = $r0;;
     _32(0x3000030c),        //lwz $r0 = 12 (0xc)[$r12];;
     _32(0x790233c0),        //sllw $r0 = $r0, 15 (0xf);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x07fbf180f8000000),        //andw $r0 = $r0, -272236544 (0xffffffffefc60000);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004030c),        //lwz $r1 = 12 (0xc)[$r12];;
     _32(0x7c011001),        //xorw $r0 = $r1, $r0;;
     _32(0x2601030c),        //sw 12 (0xc)[$r12] = $r0;;
     _32(0x3000030c),        //lwz $r0 = 12 (0xc)[$r12];;
     _32(0x7b023480),        //srlw $r0 = $r0, 18 (0x12);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004030c),        //lwz $r1 = 12 (0xc)[$r12];;
     _32(0x7c011001),        //xorw $r0 = $r1, $r0;;
     _32(0x2601030c),        //sw 12 (0xc)[$r12] = $r0;;
     _32(0x3000030c),        //lwz $r0 = 12 (0xc)[$r12];;
     _32(0x7b023040),        //srlw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let bar: list_I = 
 [|
     _64(0x07fffffde130800c),        //addd $r12 = $r12, -2560 (0xfffffffffffff600);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x2609020c),        //sw 8 (0x8)[$r12] = $r2;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x61000300),        //addd $r0 = $r0, 12 (0xc);;
     _64(0x18000002a7017c0c),        //sd 2544 (0x9f0)[$r12] = $r0;;
     _64(0x18000002b8007c0c),        //ld $r0 = 2544 (0x9f0)[$r12];;
     _32(0x3004020c),        //lwz $r1 = 8 (0x8)[$r12];;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _64(0x18000002a6017f0c),        //sw 2556 (0x9fc)[$r12] = $r0;;
     _32(0x1000002a),        //goto 16b08 <bar+0xf0>;;
     _64(0x18000002b0007f0c),        //lwz $r0 = 2556 (0x9fc)[$r12];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _64(0x18000002b8047c0c),        //ld $r1 = 2544 (0x9f0)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7b023780),        //srlw $r0 = $r0, 30 (0x1e);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _64(0x18000002b0007f0c),        //lwz $r0 = 2556 (0x9fc)[$r12];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _64(0x18000002b8087c0c),        //ld $r2 = 2544 (0x9f0)[$r12];;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7c011001),        //xorw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x13603c4bdb003140),        //mulw $r0 = $r0, 1812433253 (0x6c078965);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _64(0x18000002b0007f0c),        //lwz $r0 = 2556 (0x9fc)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _64(0x18000002b8087c0c),        //ld $r2 = 2544 (0x9f0)[$r12];;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _64(0x18000002b0087f0c),        //lwz $r2 = 2556 (0x9fc)[$r12];;
     _32(0x71051042),        //addw $r1 = $r2, $r1;;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _64(0x18000002b0007f0c),        //lwz $r0 = 2556 (0x9fc)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _64(0x18000002a6017f0c),        //sw 2556 (0x9fc)[$r12] = $r0;;
     _64(0x18000002b0007f0c),        //lwz $r0 = 2556 (0x9fc)[$r12];;
     _64(0x00000013f801b3c0),        //compw.leu $r0 = $r0, 623 (0x26f);;
     _32(0x0c7ff4c0),        //cb.wnez $r0? 16a64 <bar+0x4c>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x26010a0c),        //sw 40 (0x28)[$r12] = $r0;;
     _32(0x1000000b),        //goto 16b50 <bar+0x138>;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x1fffff3d),        //call 16820 <foo>;;
     _32(0x78083fc0),        //zxbd $r2 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61040040),        //addd $r1 = $r0, 1 (0x1);;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x20040000),        //lbz $r1 = 0 (0x0)[$r0];;
     _32(0x7c051042),        //xorw $r1 = $r2, $r1;;
     _32(0x78043fc1),        //zxbd $r1 = $r1;;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x7104ffc0),        //addw $r1 = $r0, -1 (0xffffffff);;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x087ffcc0),        //cb.dnez $r0? 16b28 <bar+0x110>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _64(0x00000002e130800c),        //addd $r12 = $r12, 2560 (0xa00);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x60000017),        //make $r0 = 23 (0x17);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000028f1009780),        //addw $r0 = $r0, 41566 (0xa25e);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a080000),        //copyw $r2 = $r0;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x1fffff98),        //call 16a18 <bar>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _96(0x00000000800000f8e0040800),        //make $r1 = 253984 (0x3e020);;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x18000051),        //call 16d20 <memcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16bec <main+0x6c>;;
     _32(0x18000006),        //call 16c00 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000115),        //call 17060 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007df),        //call 18b90 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101110000000; //0x16b80
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110101000011000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101110000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110110000000000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016b80;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
