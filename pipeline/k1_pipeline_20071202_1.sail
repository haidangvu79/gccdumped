// executing pipeline 20071202_1.c.out.dumped test 
val k1_pipeline_20071202_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20071202_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x2701020c),        //sd 8 (0x8)[$r12] = $r0;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x300c0100),        //lwz $r3 = 4 (0x4)[$r0];;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x30080000),        //lwz $r2 = 0 (0x0)[$r0];;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x38040800),        //ld $r1 = 32 (0x20)[$r0];;
     _32(0x2705160c),        //sd 88 (0x58)[$r12] = $r1;;
     _32(0x38040a00),        //ld $r1 = 40 (0x28)[$r0];;
     _32(0x2705180c),        //sd 96 (0x60)[$r12] = $r1;;
     _32(0x38040c00),        //ld $r1 = 48 (0x30)[$r0];;
     _32(0x27051a0c),        //sd 104 (0x68)[$r12] = $r1;;
     _32(0x38040e00),        //ld $r1 = 56 (0x38)[$r0];;
     _32(0x27051c0c),        //sd 112 (0x70)[$r12] = $r1;;
     _32(0x30001000),        //lwz $r0 = 64 (0x40)[$r0];;
     _32(0x26011e0c),        //sw 120 (0x78)[$r12] = $r0;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x7a040003),        //copyw $r1 = $r3;;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x7a040002),        //copyw $r1 = $r2;;
     _32(0x26050100),        //sw 4 (0x4)[$r0] = $r1;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050200),        //sw 8 (0x8)[$r0] = $r1;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050300),        //sw 12 (0xc)[$r0] = $r1;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050400),        //sw 16 (0x10)[$r0] = $r1;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050500),        //sw 20 (0x14)[$r0] = $r1;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050600),        //sw 24 (0x18)[$r0] = $r1;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050700),        //sw 28 (0x1c)[$r0] = $r1;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x3804160c),        //ld $r1 = 88 (0x58)[$r12];;
     _32(0x27050800),        //sd 32 (0x20)[$r0] = $r1;;
     _32(0x3804180c),        //ld $r1 = 96 (0x60)[$r12];;
     _32(0x27050a00),        //sd 40 (0x28)[$r0] = $r1;;
     _32(0x38041a0c),        //ld $r1 = 104 (0x68)[$r12];;
     _32(0x27050c00),        //sd 48 (0x30)[$r0] = $r1;;
     _32(0x38041c0c),        //ld $r1 = 112 (0x70)[$r12];;
     _32(0x27050e00),        //sd 56 (0x38)[$r0] = $r1;;
     _32(0x30041e0c),        //lwz $r1 = 120 (0x78)[$r12];;
     _32(0x26051000),        //sw 64 (0x40)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130200c),        //addd $r12 = $r12, 128 (0x80);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x6000000c),        //make $r0 = 12 (0xc);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2601080c),        //sw 32 (0x20)[$r12] = $r0;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x2601090c),        //sw 36 (0x24)[$r12] = $r0;;
     _32(0x60000003),        //make $r0 = 3 (0x3);;
     _32(0x26010a0c),        //sw 40 (0x28)[$r12] = $r0;;
     _32(0x60000004),        //make $r0 = 4 (0x4);;
     _32(0x26010b0c),        //sw 44 (0x2c)[$r12] = $r0;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x26010c0c),        //sw 48 (0x30)[$r12] = $r0;;
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x60000007),        //make $r0 = 7 (0x7);;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x60000008),        //make $r0 = 8 (0x8);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x60000009),        //make $r0 = 9 (0x9);;
     _32(0x2601100c),        //sw 64 (0x40)[$r12] = $r0;;
     _32(0x6000000a),        //make $r0 = 10 (0xa);;
     _32(0x2601110c),        //sw 68 (0x44)[$r12] = $r0;;
     _32(0x6000000b),        //make $r0 = 11 (0xb);;
     _32(0x2601120c),        //sw 72 (0x48)[$r12] = $r0;;
     _32(0x6000000c),        //make $r0 = 12 (0xc);;
     _32(0x2601130c),        //sw 76 (0x4c)[$r12] = $r0;;
     _32(0x6000000d),        //make $r0 = 13 (0xd);;
     _32(0x2601140c),        //sw 80 (0x50)[$r12] = $r0;;
     _32(0x6000000e),        //make $r0 = 14 (0xe);;
     _32(0x2601150c),        //sw 84 (0x54)[$r12] = $r0;;
     _32(0x6000000f),        //make $r0 = 15 (0xf);;
     _32(0x2601160c),        //sw 88 (0x58)[$r12] = $r0;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x1fffffa2),        //call 16820 <foo>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f001b300),        //compw.ne $r0 = $r0, 12 (0xc);;
     _32(0x0c000440),        //cb.wnez $r0? 169ec <main+0xec>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f001b180),        //compw.ne $r0 = $r0, 6 (0x6);;
     _32(0x0c000340),        //cb.wnez $r0? 169ec <main+0xec>;;
     _32(0x3000080c),        //lwz $r0 = 32 (0x20)[$r12];;
     _32(0x080002c0),        //cb.dnez $r0? 169ec <main+0xec>;;
     _32(0x3000090c),        //lwz $r0 = 36 (0x24)[$r12];;
     _32(0x08000240),        //cb.dnez $r0? 169ec <main+0xec>;;
     _32(0x30000a0c),        //lwz $r0 = 40 (0x28)[$r12];;
     _32(0x080001c0),        //cb.dnez $r0? 169ec <main+0xec>;;
     _32(0x30000b0c),        //lwz $r0 = 44 (0x2c)[$r12];;
     _32(0x08000140),        //cb.dnez $r0? 169ec <main+0xec>;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _32(0x080000c0),        //cb.dnez $r0? 169ec <main+0xec>;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _32(0x08800080),        //cb.deqz $r0? 169f0 <main+0xf0>;;
     _32(0x1800002b),        //call 16a98 <abort>;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _64(0x00000000f001b1c0),        //compw.ne $r0 = $r0, 7 (0x7);;
     _32(0x0c000840),        //cb.wnez $r0? 16a80 <main+0x180>;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _64(0x00000000f001b200),        //compw.ne $r0 = $r0, 8 (0x8);;
     _32(0x0c000740),        //cb.wnez $r0? 16a80 <main+0x180>;;
     _32(0x3000100c),        //lwz $r0 = 64 (0x40)[$r12];;
     _64(0x00000000f001b240),        //compw.ne $r0 = $r0, 9 (0x9);;
     _32(0x0c000640),        //cb.wnez $r0? 16a80 <main+0x180>;;
     _32(0x3000110c),        //lwz $r0 = 68 (0x44)[$r12];;
     _64(0x00000000f001b280),        //compw.ne $r0 = $r0, 10 (0xa);;
     _32(0x0c000540),        //cb.wnez $r0? 16a80 <main+0x180>;;
     _32(0x3000120c),        //lwz $r0 = 72 (0x48)[$r12];;
     _64(0x00000000f001b2c0),        //compw.ne $r0 = $r0, 11 (0xb);;
     _32(0x0c000440),        //cb.wnez $r0? 16a80 <main+0x180>;;
     _32(0x3000130c),        //lwz $r0 = 76 (0x4c)[$r12];;
     _64(0x00000000f001b300),        //compw.ne $r0 = $r0, 12 (0xc);;
     _32(0x0c000340),        //cb.wnez $r0? 16a80 <main+0x180>;;
     _32(0x3000140c),        //lwz $r0 = 80 (0x50)[$r12];;
     _64(0x00000000f001b340),        //compw.ne $r0 = $r0, 13 (0xd);;
     _32(0x0c000240),        //cb.wnez $r0? 16a80 <main+0x180>;;
     _32(0x3000150c),        //lwz $r0 = 84 (0x54)[$r12];;
     _64(0x00000000f001b380),        //compw.ne $r0 = $r0, 14 (0xe);;
     _32(0x0c000140),        //cb.wnez $r0? 16a80 <main+0x180>;;
     _32(0x3000160c),        //lwz $r0 = 88 (0x58)[$r12];;
     _64(0x00000000f101b3c0),        //compw.eq $r0 = $r0, 15 (0xf);;
     _32(0x0c000080),        //cb.wnez $r0? 16a84 <main+0x184>;;
     _32(0x18000006),        //call 16a98 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16e70 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 189a0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100000000; //0x16900
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101010011000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016900;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
