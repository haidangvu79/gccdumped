// executing pipeline pr80421.c.out.dumped test 
val k1_pipeline_pr80421: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr80421() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let baz: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000002f001b500),        //compw.ne $r0 = $r0, 84 (0x54);;
     _32(0x0c000080),        //cb.wnez $r0? 16850 <baz+0x30>;;
     _32(0x180000e9),        //call 16bf0 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130200c),        //addd $r12 = $r12, 128 (0x80);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let foo: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2401060c),        //sb 24 (0x18)[$r12] = $r0;;
     _32(0x2400060c),        //lbs $r0 = 24 (0x18)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x1fffffe4),        //call 16820 <baz>;;
     _32(0x2400060c),        //lbs $r0 = 24 (0x18)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000002f105b100),        //compw.eq $r1 = $r0, 68 (0x44);;
     _32(0x0c000581),        //cb.wnez $r1? 168fc <foo+0x94>;;
     _64(0x00000002f101b240),        //compw.eq $r0 = $r0, 73 (0x49);;
     _32(0x0c000640),        //cb.wnez $r0? 16914 <foo+0xac>;;
     _96(0x00000000800000fce000f200),        //make $r0 = 259016 (0x3f3c8);;
     _32(0x1fffffd8),        //call 16820 <baz>;;
     _32(0x2400060c),        //lbs $r0 = 24 (0x18)[$r12];;
     _64(0x00000002f101b100),        //compw.eq $r0 = $r0, 68 (0x44);;
     _32(0x0c000140),        //cb.wnez $r0? 168e4 <foo+0x7c>;;
     _32(0x2400060c),        //lbs $r0 = 24 (0x18)[$r12];;
     _64(0x00000002f001b240),        //compw.ne $r0 = $r0, 73 (0x49);;
     _32(0x0c000140),        //cb.wnez $r0? 168f4 <foo+0x8c>;;
     _96(0x00000000800000fce000f600),        //make $r0 = 259032 (0x3f3d8);;
     _32(0x1fffffcc),        //call 16820 <baz>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000000c),        //goto 16928 <foo+0xc0>;;
     _96(0x00000000800000fce000fe00),        //make $r0 = 259064 (0x3f3f8);;
     _32(0x1fffffc6),        //call 16820 <baz>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000006),        //goto 16928 <foo+0xc0>;;
     _96(0x00000000800000fde0000200),        //make $r0 = 259080 (0x3f408);;
     _32(0x1fffffc0),        //call 16820 <baz>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let bar: list_I = 
 [|
     _32(0x6130880c),        //addd $r12 = $r12, -480 (0xfffffe20);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x2601700c),        //sw 448 (0x1c0)[$r12] = $r0;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x26016f0c),        //sw 444 (0x1bc)[$r12] = $r0;;
     _96(0x00000000800000fde0040600),        //make $r1 = 259096 (0x3f418);;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _32(0x6a0c0001),        //copyd $r3 = $r1;;
     _32(0x600401a4),        //make $r1 = 420 (0x1a4);;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _32(0x6a040003),        //copyd $r1 = $r3;;
     _32(0x180000e7),        //call 16d10 <memcpy>;;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _32(0x61006180),        //addd $r0 = $r0, 390 (0x186);;
     _32(0x2701760c),        //sd 472 (0x1d8)[$r12] = $r0;;
     _32(0x6000001a),        //make $r0 = 26 (0x1a);;
     _32(0x2601750c),        //sw 468 (0x1d4)[$r12] = $r0;;
     _32(0x60000019),        //make $r0 = 25 (0x19);;
     _32(0x2601740c),        //sw 464 (0x1d0)[$r12] = $r0;;
     _32(0x6000004d),        //make $r0 = 77 (0x4d);;
     _32(0x2401718c),        //sb 454 (0x1c6)[$r12] = $r0;;
     _32(0x2000718c),        //lbz $r0 = 454 (0x1c6)[$r12];;
     _32(0x240171cc),        //sb 455 (0x1c7)[$r12] = $r0;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x2601720c),        //sw 456 (0x1c8)[$r12] = $r0;;
     _32(0x1000007a),        //goto 16b94 <bar+0x25c>;;
     _32(0x3004750c),        //lwz $r1 = 468 (0x1d4)[$r12];;
     _32(0x3000700c),        //lwz $r0 = 448 (0x1c0)[$r12];;
     _32(0x75011040),        //sbfw $r0 = $r0, $r1;;
     _32(0x26016e0c),        //sw 440 (0x1b8)[$r12] = $r0;;
     _32(0x30006e0c),        //lwz $r0 = 440 (0x1b8)[$r12];;
     _32(0x73000000),        //maxw $r0 = $r0, 0 (0x0);;
     _32(0x26016e0c),        //sw 440 (0x1b8)[$r12] = $r0;;
     _32(0x3004740c),        //lwz $r1 = 464 (0x1d0)[$r12];;
     _32(0x30006e0c),        //lwz $r0 = 440 (0x1b8)[$r12];;
     _32(0x75011040),        //sbfw $r0 = $r0, $r1;;
     _32(0x26016e0c),        //sw 440 (0x1b8)[$r12] = $r0;;
     _32(0x30046e0c),        //lwz $r1 = 440 (0x1b8)[$r12];;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x71011040),        //addw $r0 = $r0, $r1;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004720c),        //lwz $r1 = 456 (0x1c8)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x26016d0c),        //sw 436 (0x1b4)[$r12] = $r0;;
     _32(0x34006d0c),        //lws $r0 = 436 (0x1b4)[$r12];;
     _32(0x3804760c),        //ld $r1 = 472 (0x1d8)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f905b140),        //compw.gtu $r1 = $r0, 5 (0x5);;
     _32(0x0c001401),        //cb.wnez $r1? 16b5c <bar+0x224>;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _96(0x00000000800000fde1007000),        //addd $r0 = $r0, 259520 (0x3f5c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x0fd80000),        //igoto $r0;;
     _32(0x3000750c),        //lwz $r0 = 468 (0x1d4)[$r12];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x2601750c),        //sw 468 (0x1d4)[$r12] = $r0;;
     _32(0x3000740c),        //lwz $r0 = 464 (0x1d0)[$r12];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x2601740c),        //sw 464 (0x1d0)[$r12] = $r0;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x2601720c),        //sw 456 (0x1c8)[$r12] = $r0;;
     _32(0x30046f0c),        //lwz $r1 = 444 (0x1bc)[$r12];;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x71011040),        //addw $r0 = $r0, $r1;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x65000000),        //negd $r0 = $r0;;
     _32(0x3804760c),        //ld $r1 = 472 (0x1d8)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x2701760c),        //sd 472 (0x1d8)[$r12] = $r0;;
     _32(0x6000004d),        //make $r0 = 77 (0x4d);;
     _32(0x240171cc),        //sb 455 (0x1c7)[$r12] = $r0;;
     _32(0x10000035),        //goto 16b5c <bar+0x224>;;
     _32(0x3000750c),        //lwz $r0 = 468 (0x1d4)[$r12];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x2601750c),        //sw 468 (0x1d4)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601720c),        //sw 456 (0x1c8)[$r12] = $r0;;
     _32(0x30046f0c),        //lwz $r1 = 444 (0x1bc)[$r12];;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x71011040),        //addw $r0 = $r0, $r1;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x65000000),        //negd $r0 = $r0;;
     _32(0x3804760c),        //ld $r1 = 472 (0x1d8)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x2701760c),        //sd 472 (0x1d8)[$r12] = $r0;;
     _32(0x60000049),        //make $r0 = 73 (0x49);;
     _32(0x240171cc),        //sb 455 (0x1c7)[$r12] = $r0;;
     _32(0x10000023),        //goto 16b5c <bar+0x224>;;
     _32(0x3000750c),        //lwz $r0 = 468 (0x1d4)[$r12];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x2601750c),        //sw 468 (0x1d4)[$r12] = $r0;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x2601720c),        //sw 456 (0x1c8)[$r12] = $r0;;
     _32(0x30046f0c),        //lwz $r1 = 444 (0x1bc)[$r12];;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x71011040),        //addw $r0 = $r0, $r1;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x65000000),        //negd $r0 = $r0;;
     _32(0x3804760c),        //ld $r1 = 472 (0x1d8)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x2701760c),        //sd 472 (0x1d8)[$r12] = $r0;;
     _32(0x60000049),        //make $r0 = 73 (0x49);;
     _32(0x240171cc),        //sb 455 (0x1c7)[$r12] = $r0;;
     _32(0x10000011),        //goto 16b5c <bar+0x224>;;
     _32(0x3000740c),        //lwz $r0 = 464 (0x1d0)[$r12];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x2601740c),        //sw 464 (0x1d0)[$r12] = $r0;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2601720c),        //sw 456 (0x1c8)[$r12] = $r0;;
     _32(0x60000044),        //make $r0 = 68 (0x44);;
     _32(0x240171cc),        //sb 455 (0x1c7)[$r12] = $r0;;
     _32(0x10000009),        //goto 16b5c <bar+0x224>;;
     _32(0x3000740c),        //lwz $r0 = 464 (0x1d0)[$r12];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x2601740c),        //sw 464 (0x1d0)[$r12] = $r0;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x2601720c),        //sw 456 (0x1c8)[$r12] = $r0;;
     _32(0x60000044),        //make $r0 = 68 (0x44);;
     _32(0x240171cc),        //sb 455 (0x1c7)[$r12] = $r0;;
     _32(0x7f03f000),        //nop ;;
     _32(0x240071cc),        //lbs $r0 = 455 (0x1c7)[$r12];;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _32(0x2400718c),        //lbs $r0 = 454 (0x1c6)[$r12];;
     _32(0x7001b001),        //compw.ne $r0 = $r1, $r0;;
     _32(0x0c000140),        //cb.wnez $r0? 16b80 <bar+0x248>;;
     _32(0x3000730c),        //lwz $r0 = 460 (0x1cc)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601730c),        //sw 460 (0x1cc)[$r12] = $r0;;
     _32(0x10000006),        //goto 16b94 <bar+0x25c>;;
     _32(0x2400718c),        //lbs $r0 = 454 (0x1c6)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffff38),        //call 16868 <foo>;;
     _32(0x200071cc),        //lbz $r0 = 455 (0x1c7)[$r12];;
     _32(0x2401718c),        //sb 454 (0x1c6)[$r12] = $r0;;
     _32(0x3000750c),        //lwz $r0 = 468 (0x1d4)[$r12];;
     _32(0x0effe180),        //cb.wgtz $r0? 169b0 <bar+0x78>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130780c),        //addd $r12 = $r12, 480 (0x1e0);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x60000044),        //make $r0 = 68 (0x44);;
     _32(0x240107cc),        //sb 31 (0x1f)[$r12] = $r0;;
     _32(0x240007cc),        //lbs $r0 = 31 (0x1f)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffff25),        //call 16868 <foo>;;
     _32(0x1fffff58),        //call 16938 <bar>;;
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
     _32(0x98000167),        //call 17198 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000831),        //call 18cc8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101110111000; //0x16bb8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(baz, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100001101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100100111000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101110111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101111110000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016bb8;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
