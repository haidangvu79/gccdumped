// executing pipeline 20030408_1.c.out.dumped test 
val k1_pipeline_20030408_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20030408_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let test1: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _96(0x02423a32815110d0e0009040),        //make $r0 = 5208208757389214273 (0x4847464544434241);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2000040c),        //lbz $r0 = 16 (0x10)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000002f001b040),        //compw.ne $r0 = $r0, 65 (0x41);;
     _32(0x0c000900),        //cb.wnez $r0? 168e4 <test1+0xc4>;;
     _32(0x2000044c),        //lbz $r0 = 17 (0x11)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000002f001b080),        //compw.ne $r0 = $r0, 66 (0x42);;
     _32(0x0c0007c0),        //cb.wnez $r0? 168e4 <test1+0xc4>;;
     _32(0x2000048c),        //lbz $r0 = 18 (0x12)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000002f001b0c0),        //compw.ne $r0 = $r0, 67 (0x43);;
     _32(0x0c000680),        //cb.wnez $r0? 168e4 <test1+0xc4>;;
     _32(0x200004cc),        //lbz $r0 = 19 (0x13)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000002f001b100),        //compw.ne $r0 = $r0, 68 (0x44);;
     _32(0x0c000540),        //cb.wnez $r0? 168e4 <test1+0xc4>;;
     _32(0x2000050c),        //lbz $r0 = 20 (0x14)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000002f001b140),        //compw.ne $r0 = $r0, 69 (0x45);;
     _32(0x0c000400),        //cb.wnez $r0? 168e4 <test1+0xc4>;;
     _32(0x2000054c),        //lbz $r0 = 21 (0x15)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000002f001b180),        //compw.ne $r0 = $r0, 70 (0x46);;
     _32(0x0c0002c0),        //cb.wnez $r0? 168e4 <test1+0xc4>;;
     _32(0x2000058c),        //lbz $r0 = 22 (0x16)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000002f001b1c0),        //compw.ne $r0 = $r0, 71 (0x47);;
     _32(0x0c000180),        //cb.wnez $r0? 168e4 <test1+0xc4>;;
     _32(0x200005cc),        //lbz $r0 = 23 (0x17)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000002f101b200),        //compw.eq $r0 = $r0, 72 (0x48);;
     _32(0x0c000080),        //cb.wnez $r0? 168e8 <test1+0xc8>;;
     _32(0x180000c5),        //call 16bf8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test2: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _64(0x015110d0e0009042),        //make $r0 = 297498001985 (0x4544434241);;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x25010e0c),        //sh 56 (0x38)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x28000e0c),        //lhz $r0 = 56 (0x38)[$r12];;
     _32(0x25010a0c),        //sh 40 (0x28)[$r12] = $r0;;
     _32(0x2000080c),        //lbz $r0 = 32 (0x20)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000002f001b040),        //compw.ne $r0 = $r0, 65 (0x41);;
     _32(0x0c0007c0),        //cb.wnez $r0? 169bc <test2+0xbc>;;
     _32(0x2000084c),        //lbz $r0 = 33 (0x21)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000002f001b080),        //compw.ne $r0 = $r0, 66 (0x42);;
     _32(0x0c000680),        //cb.wnez $r0? 169bc <test2+0xbc>;;
     _32(0x2000088c),        //lbz $r0 = 34 (0x22)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000002f001b0c0),        //compw.ne $r0 = $r0, 67 (0x43);;
     _32(0x0c000540),        //cb.wnez $r0? 169bc <test2+0xbc>;;
     _32(0x200008cc),        //lbz $r0 = 35 (0x23)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000002f001b100),        //compw.ne $r0 = $r0, 68 (0x44);;
     _32(0x0c000400),        //cb.wnez $r0? 169bc <test2+0xbc>;;
     _32(0x2000090c),        //lbz $r0 = 36 (0x24)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000002f001b140),        //compw.ne $r0 = $r0, 69 (0x45);;
     _32(0x0c0002c0),        //cb.wnez $r0? 169bc <test2+0xbc>;;
     _32(0x2000094c),        //lbz $r0 = 37 (0x25)[$r12];;
     _32(0x08000240),        //cb.dnez $r0? 169bc <test2+0xbc>;;
     _32(0x2000098c),        //lbz $r0 = 38 (0x26)[$r12];;
     _32(0x080001c0),        //cb.dnez $r0? 169bc <test2+0xbc>;;
     _32(0x200009cc),        //lbz $r0 = 39 (0x27)[$r12];;
     _32(0x08000140),        //cb.dnez $r0? 169bc <test2+0xbc>;;
     _32(0x20000a0c),        //lbz $r0 = 40 (0x28)[$r12];;
     _32(0x080000c0),        //cb.dnez $r0? 169bc <test2+0xbc>;;
     _32(0x20000a4c),        //lbz $r0 = 41 (0x29)[$r12];;
     _32(0x08800080),        //cb.deqz $r0? 169c0 <test2+0xc0>;;
     _32(0x1800008f),        //call 16bf8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test3: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x25010e0c),        //sh 56 (0x38)[$r12] = $r0;;
     _32(0x60000041),        //make $r0 = 65 (0x41);;
     _32(0x24010c0c),        //sb 48 (0x30)[$r12] = $r0;;
     _32(0x60000043),        //make $r0 = 67 (0x43);;
     _32(0x24010c8c),        //sb 50 (0x32)[$r12] = $r0;;
     _32(0x60000045),        //make $r0 = 69 (0x45);;
     _32(0x24010d0c),        //sb 52 (0x34)[$r12] = $r0;;
     _32(0x60000047),        //make $r0 = 71 (0x47);;
     _32(0x24010d8c),        //sb 54 (0x36)[$r12] = $r0;;
     _32(0x60000049),        //make $r0 = 73 (0x49);;
     _32(0x24010e0c),        //sb 56 (0x38)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x28000e0c),        //lhz $r0 = 56 (0x38)[$r12];;
     _32(0x25010a0c),        //sh 40 (0x28)[$r12] = $r0;;
     _32(0x2000080c),        //lbz $r0 = 32 (0x20)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000002f001b040),        //compw.ne $r0 = $r0, 65 (0x41);;
     _32(0x0c0007c0),        //cb.wnez $r0? 16ab8 <test3+0xe0>;;
     _32(0x2000084c),        //lbz $r0 = 33 (0x21)[$r12];;
     _32(0x08000740),        //cb.dnez $r0? 16ab8 <test3+0xe0>;;
     _32(0x2000088c),        //lbz $r0 = 34 (0x22)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000002f001b0c0),        //compw.ne $r0 = $r0, 67 (0x43);;
     _32(0x0c000600),        //cb.wnez $r0? 16ab8 <test3+0xe0>;;
     _32(0x200008cc),        //lbz $r0 = 35 (0x23)[$r12];;
     _32(0x08000580),        //cb.dnez $r0? 16ab8 <test3+0xe0>;;
     _32(0x2000090c),        //lbz $r0 = 36 (0x24)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000002f001b140),        //compw.ne $r0 = $r0, 69 (0x45);;
     _32(0x0c000440),        //cb.wnez $r0? 16ab8 <test3+0xe0>;;
     _32(0x2000094c),        //lbz $r0 = 37 (0x25)[$r12];;
     _32(0x080003c0),        //cb.dnez $r0? 16ab8 <test3+0xe0>;;
     _32(0x2000098c),        //lbz $r0 = 38 (0x26)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000002f001b1c0),        //compw.ne $r0 = $r0, 71 (0x47);;
     _32(0x0c000280),        //cb.wnez $r0? 16ab8 <test3+0xe0>;;
     _32(0x200009cc),        //lbz $r0 = 39 (0x27)[$r12];;
     _32(0x08000200),        //cb.dnez $r0? 16ab8 <test3+0xe0>;;
     _32(0x20000a0c),        //lbz $r0 = 40 (0x28)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000002f001b240),        //compw.ne $r0 = $r0, 73 (0x49);;
     _32(0x0c0000c0),        //cb.wnez $r0? 16ab8 <test3+0xe0>;;
     _32(0x20000a4c),        //lbz $r0 = 41 (0x29)[$r12];;
     _32(0x08800080),        //cb.deqz $r0? 16abc <test3+0xe4>;;
     _32(0x18000050),        //call 16bf8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let test4: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x25010e0c),        //sh 56 (0x38)[$r12] = $r0;;
     _32(0x60000042),        //make $r0 = 66 (0x42);;
     _32(0x24010c4c),        //sb 49 (0x31)[$r12] = $r0;;
     _32(0x60000044),        //make $r0 = 68 (0x44);;
     _32(0x24010ccc),        //sb 51 (0x33)[$r12] = $r0;;
     _32(0x60000046),        //make $r0 = 70 (0x46);;
     _32(0x24010d4c),        //sb 53 (0x35)[$r12] = $r0;;
     _32(0x60000048),        //make $r0 = 72 (0x48);;
     _32(0x24010dcc),        //sb 55 (0x37)[$r12] = $r0;;
     _32(0x6000004a),        //make $r0 = 74 (0x4a);;
     _32(0x24010e4c),        //sb 57 (0x39)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x28000e0c),        //lhz $r0 = 56 (0x38)[$r12];;
     _32(0x25010a0c),        //sh 40 (0x28)[$r12] = $r0;;
     _32(0x2000080c),        //lbz $r0 = 32 (0x20)[$r12];;
     _32(0x08000880),        //cb.dnez $r0? 16bb0 <test4+0xe0>;;
     _32(0x2000084c),        //lbz $r0 = 33 (0x21)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000002f001b080),        //compw.ne $r0 = $r0, 66 (0x42);;
     _32(0x0c000740),        //cb.wnez $r0? 16bb0 <test4+0xe0>;;
     _32(0x2000088c),        //lbz $r0 = 34 (0x22)[$r12];;
     _32(0x080006c0),        //cb.dnez $r0? 16bb0 <test4+0xe0>;;
     _32(0x200008cc),        //lbz $r0 = 35 (0x23)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000002f001b100),        //compw.ne $r0 = $r0, 68 (0x44);;
     _32(0x0c000580),        //cb.wnez $r0? 16bb0 <test4+0xe0>;;
     _32(0x2000090c),        //lbz $r0 = 36 (0x24)[$r12];;
     _32(0x08000500),        //cb.dnez $r0? 16bb0 <test4+0xe0>;;
     _32(0x2000094c),        //lbz $r0 = 37 (0x25)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000002f001b180),        //compw.ne $r0 = $r0, 70 (0x46);;
     _32(0x0c0003c0),        //cb.wnez $r0? 16bb0 <test4+0xe0>;;
     _32(0x2000098c),        //lbz $r0 = 38 (0x26)[$r12];;
     _32(0x08000340),        //cb.dnez $r0? 16bb0 <test4+0xe0>;;
     _32(0x200009cc),        //lbz $r0 = 39 (0x27)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000002f001b200),        //compw.ne $r0 = $r0, 72 (0x48);;
     _32(0x0c000200),        //cb.wnez $r0? 16bb0 <test4+0xe0>;;
     _32(0x20000a0c),        //lbz $r0 = 40 (0x28)[$r12];;
     _32(0x08000180),        //cb.dnez $r0? 16bb0 <test4+0xe0>;;
     _32(0x20000a4c),        //lbz $r0 = 41 (0x29)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000002f101b280),        //compw.eq $r0 = $r0, 74 (0x4a);;
     _32(0x0c000080),        //cb.wnez $r0? 16bb4 <test4+0xe4>;;
     _32(0x18000012),        //call 16bf8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1fffff13),        //call 16820 <test1>;;
     _32(0x1fffff4a),        //call 16900 <test2>;;
     _32(0x1fffff7f),        //call 169d8 <test3>;;
     _32(0x1fffffbc),        //call 16ad0 <test4>;;
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
     _32(0x980000f3),        //call 16fd0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18b00 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101111001000; //0x16bc8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test1, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test2, 0b00010110100100000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test3, 0b00010110100111011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test4, 0b00010110101011010000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101111001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101111111000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016bc8;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
