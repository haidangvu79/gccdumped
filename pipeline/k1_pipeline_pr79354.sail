// executing pipeline pr79354 test 
val k1_pipeline_pr79354: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr79354() = {
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
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x0000000080000117e0002a00),        //make $r0 = 285864 (0x45ca8);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x10000027),        //goto 168e0 <foo+0xc0>;;
     _96(0x0000000080000117e0002800),        //make $r0 = 285856 (0x45ca0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x08800600),        //cb.deqz $r0? 168b8 <foo+0x98>;;
     _96(0x0000000080000117e0002c00),        //make $r0 = 285872 (0x45cb0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x18000041),        //call 16970 <__floatundisf>;;
     _96(0x0000000080000117e0042e00),        //make $r1 = 285880 (0x45cb8);;
     _32(0x26010001),        //sw 0 (0x0)[$r1] = $r0;;
     _96(0x0000000080000117e0002e00),        //make $r0 = 285880 (0x45cb8);;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0002a00),        //make $r0 = 285864 (0x45ca8);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000117e0002a00),        //make $r0 = 285864 (0x45ca8);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0002a00),        //make $r0 = 285864 (0x45ca8);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000000f401b7c0),        //compw.le $r0 = $r0, 31 (0x1f);;
     _32(0x0c7ff500),        //cb.wnez $r0? 16848 <foo+0x28>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _96(0x0000000080000117e0002800),        //make $r0 = 285856 (0x45ca0);;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x1fffffb7),        //call 16820 <foo>;;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _32(0x1fffffb3),        //call 16820 <foo>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let __floatundisf: list_I = 
 [|
     _32(0x0fc40104),        //get $r4 = $cs;;
     _32(0x88800cc0),        //cb.deqz $r0? 16a40 <__floatundisf+0xd0>
     _32(0xe0080000),        //make $r2 = 0 (0x0)
     _32(0xe0040000),        //make $r1 = 0 (0x0)
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0x7b0a2800),        //srld $r2 = $r0, 32 (0x20);;
     _32(0x08800c82),        //cb.deqz $r2? 16a50 <__floatundisf+0xe0>;;
     _32(0x70063002),        //clzw $r1 = $r2;;
     _32(0xf814ffc1),        //zxwd $r5 = $r1
     _32(0x75042f81),        //sbfw $r1 = $r1, 190 (0xbe);;
     _32(0xf10806c5),        //addw $r2 = $r5, 27 (0x1b)
     _32(0x750c0945),        //sbfw $r3 = $r5, 37 (0x25);;
     _32(0xf90a6080),        //slld $r2 = $r0, $r2
     _32(0x7b0260c0),        //srld $r0 = $r0, $r3;;
     _32(0x60090002),        //compd.ne $r2 = $r2, 0 (0x0);;
     _32(0x7a010002),        //ord $r0 = $r2, $r0;;
     _32(0x780cffc0),        //zxwd $r3 = $r0;;
     _32(0xf100f6c5),        //addw $r0 = $r5, -37 (0xffffffdb)
     _32(0xe0080000),        //make $r2 = 0 (0x0)
     _64(0x10000001f419b145),        //compw.le $r6 = $r5, 37 (0x25);;
     _32(0x79027003),        //sllw $r0 = $r3, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x790e0006),        //cmoved.weqz $r6? $r3 = $r0;;
     _32(0xf81801c3),        //andw $r6 = $r3, 7 (0x7)
     _64(0xf81cffc3e800ffc3),        //andd $r0 = $r3, 4227858431 (0xfbffffff)
     _64(0x17feffff883effff),        //andw $r7 = $r3, -67108865 (0xfffffffffbffffff);;
     _32(0x0c800546),        //cb.weqz $r6? 16a38 <__floatundisf+0xc8>;;
     _64(0xf8100004e8080004),        //andd $r2 = $r4, 3342336 (0x330000)
     _64(0x08000cc080000cc0),        //andw $r4 = $r4, 3342336 (0x330000);;
     _64(0x00008800f111b004),        //compw.eq $r4 = $r4, 1114112 (0x110000);;
     _32(0x08800d02),        //cb.deqz $r2? 16ad0 <__floatundisf+0x160>;;
     _32(0x0c800bc4),        //cb.weqz $r4? 16ac0 <__floatundisf+0x150>;;
     _32(0xf1080207),        //addw $r2 = $r7, 8 (0x8)
     _32(0x71000207),        //addw $r0 = $r7, 8 (0x8);;
     _64(0x00010000f8080002),        //andw $r2 = $r2, 67108864 (0x4000000);;
     _32(0x7808ffc2),        //zxwd $r2 = $r2;;
     _32(0x08800a42),        //cb.deqz $r2? 16ac0 <__floatundisf+0x150>;;
     _32(0xf5042fc5),        //sbfw $r1 = $r5, 191 (0xbf)
     _64(0xe0080000e800ffc0),        //andd $r0 = $r0, 4227858431 (0xfbffffff)
     _96(0x1000010190000000883effff),        //make $r2 = 35321811042304 (0x202000000000);;
     _32(0xe50f90c0),        //extfz $r3 = $r0, 25 (0x19), 3 (0x3)
     _32(0x78043fc1),        //zxbd $r1 = $r1;;
     _32(0x790635c1),        //sllw $r1 = $r1, 23 (0x17);;
     _32(0x7a0110c1),        //orw $r0 = $r1, $r3;;
     _32(0x0fb80102),        //wfxl $cs, $r2;;
     _32(0x0fd00000),        //ret ;;
     _32(0xf0223000),        //clzw $r8 = $r0
     _32(0x780cffc0),        //zxwd $r3 = $r0;;
     _32(0x71180808),        //addw $r6 = $r8, 32 (0x20);;
     _32(0xf51c2f86),        //sbfw $r7 = $r6, 190 (0xbe)
     _32(0xf814ffc6),        //zxwd $r5 = $r6
     _32(0x75042f86),        //sbfw $r1 = $r6, 190 (0xbe);;
     _64(0x00000004f525b587),        //compw.gt $r9 = $r7, 150 (0x96);;
     _32(0x0c000409),        //cb.wnez $r9? 16ab0 <__floatundisf+0x140>;;
     _32(0xf120fe08),        //addw $r8 = $r8, -8 (0xfffffff8)
     _32(0xf8043fc1),        //zxbd $r1 = $r1
     _64(0xe800ffc0f519b206),        //compw.gt $r6 = $r6, 40 (0x28)
     _64(0x18001fff90000001),        //andd $r0 = $r0, 8388607 (0x7fffff);;
     _32(0xf90e7203),        //sllw $r3 = $r3, $r8
     _32(0x790635c1),        //sllw $r1 = $r1, 23 (0x17);;
     _64(0x00001fffe80cffc3),        //andd $r3 = $r3, 8388607 (0x7fffff);;
     _32(0x780200c6),        //cmoved.wnez $r6? $r0 = $r3;;
     _32(0x6a0c0000),        //copyd $r3 = $r0;;
     _32(0x7a0110c1),        //orw $r0 = $r1, $r3;;
     _32(0x0fb80102),        //wfxl $cs, $r2;;
     _32(0x0fd00000),        //ret ;;
     _64(0x00000004f41db647),        //compw.le $r7 = $r7, 153 (0x99);;
     _32(0x0c7fefc7),        //cb.wnez $r7? 169b4 <__floatundisf+0x44>;;
     _32(0x17ffffb7),        //goto 16998 <__floatundisf+0x28>;;
     _32(0x97ffffde),        //goto 16a38 <__floatundisf+0xc8>
     _96(0x0000010180000000e0080000),        //make $r2 = 35321811042304 (0x202000000000);;
     _32(0xf80c03c3),        //andw $r3 = $r3, 15 (0xf)
     _32(0x71080107),        //addw $r2 = $r7, 4 (0x4);;
     _64(0xf8080002f10db103),        //compw.eq $r3 = $r3, 4 (0x4)
     _64(0x0801000080000000),        //andw $r2 = $r2, 67108864 (0x4000000);;
     _32(0x7808ffc2),        //zxwd $r2 = $r2;;
     _32(0x0c7ffd43),        //cb.wnez $r3? 16ac0 <__floatundisf+0x150>;;
     _32(0x97ffffcb),        //goto 16a1c <__floatundisf+0xac>
     _32(0x71000107)        //addw $r0 = $r7, 4 (0x4);;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100011000; //0x16918
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__floatundisf, 0b00010110100101110000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016918;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
