// executing pipeline pr51877.c.out.dumped test 
val k1_pipeline_pr51877: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr51877() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let bar: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x6a04000f),        //copyd $r1 = $r15;;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x26090000),        //sw 0 (0x0)[$r0] = $r2;;
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x61000100),        //addd $r0 = $r0, 4 (0x4);;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x27090000),        //sd 0 (0x0)[$r0] = $r2;;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x27090200),        //sd 8 (0x8)[$r0] = $r2;;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x27090400),        //sd 16 (0x10)[$r0] = $r2;;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x27090600),        //sd 24 (0x18)[$r0] = $r2;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x2401070c),        //sb 28 (0x1c)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x27010201),        //sd 8 (0x8)[$r1] = $r0;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x27010401),        //sd 16 (0x10)[$r1] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x27010601),        //sd 24 (0x18)[$r1] = $r0;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _32(0x26010801),        //sw 32 (0x20)[$r1] = $r0;;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let baz: list_I = 
 [|
     _32(0x7f03f000),        //nop ;;
     _32(0x0fd00000)        //ret ;;
 |];

let foo: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x27011e0c),        //sd 120 (0x78)[$r12] = $r0;;
     _32(0x26051c0c),        //sw 112 (0x70)[$r12] = $r1;;
     _32(0x30001c0c),        //lwz $r0 = 112 (0x70)[$r12];;
     _64(0x00000000f001b180),        //compw.ne $r0 = $r0, 6 (0x6);;
     _32(0x0c0004c0),        //cb.wnez $r0? 16948 <foo+0x70>;;
     _96(0x0000000080000117e0383c00),        //make $r14 = 285936 (0x45cf0);;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x6a3c0000),        //copyd $r15 = $r0;;
     _32(0x60000007),        //make $r0 = 7 (0x7);;
     _32(0x1fffffc2),        //call 16820 <bar>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x2701000e),        //sd 0 (0x0)[$r14] = $r0;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x2701020e),        //sd 8 (0x8)[$r14] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x2701040e),        //sd 16 (0x10)[$r14] = $r0;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x2701060e),        //sd 24 (0x18)[$r14] = $r0;;
     _32(0x3000100c),        //lwz $r0 = 64 (0x40)[$r12];;
     _32(0x2601080e),        //sw 32 (0x20)[$r14] = $r0;;
     _32(0x10000010),        //goto 16984 <foo+0xac>;;
     _32(0x38381e0c),        //ld $r14 = 120 (0x78)[$r12];;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x6a3c0000),        //copyd $r15 = $r0;;
     _32(0x60000007),        //make $r0 = 7 (0x7);;
     _32(0x1fffffb2),        //call 16820 <bar>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x2701000e),        //sd 0 (0x0)[$r14] = $r0;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x2701020e),        //sd 8 (0x8)[$r14] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x2701040e),        //sd 16 (0x10)[$r14] = $r0;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x2701060e),        //sd 24 (0x18)[$r14] = $r0;;
     _32(0x3000100c),        //lwz $r0 = 64 (0x40)[$r12];;
     _32(0x2601080e),        //sw 32 (0x20)[$r14] = $r0;;
     _32(0x1fffffd3),        //call 168d0 <baz>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838040c),        //ld $r14 = 16 (0x10)[$r12];;
     _32(0x6130200c),        //addd $r12 = $r12, 128 (0x80);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _96(0x0000000080000117e0383c00),        //make $r14 = 285936 (0x45cf0);;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x6a3c0000),        //copyd $r15 = $r0;;
     _32(0x60000003),        //make $r0 = 3 (0x3);;
     _32(0x1fffff96),        //call 16820 <bar>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x2701000e),        //sd 0 (0x0)[$r14] = $r0;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x2701020e),        //sd 8 (0x8)[$r14] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x2701040e),        //sd 16 (0x10)[$r14] = $r0;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x2701060e),        //sd 24 (0x18)[$r14] = $r0;;
     _32(0x3000100c),        //lwz $r0 = 64 (0x40)[$r12];;
     _32(0x2601080e),        //sw 32 (0x20)[$r14] = $r0;;
     _96(0x0000000080000117e0383200),        //make $r14 = 285896 (0x45cc8);;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x6a3c0000),        //copyd $r15 = $r0;;
     _32(0x60000004),        //make $r0 = 4 (0x4);;
     _32(0x1fffff85),        //call 16820 <bar>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x2701000e),        //sd 0 (0x0)[$r14] = $r0;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x2701020e),        //sd 8 (0x8)[$r14] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x2701040e),        //sd 16 (0x10)[$r14] = $r0;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x2701060e),        //sd 24 (0x18)[$r14] = $r0;;
     _32(0x3000100c),        //lwz $r0 = 64 (0x40)[$r12];;
     _32(0x2601080e),        //sw 32 (0x20)[$r14] = $r0;;
     _96(0x0000000080000117e0003c00),        //make $r0 = 285936 (0x45cf0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c000600),        //cb.wnez $r0? 16ab0 <main+0x110>;;
     _96(0x0000000080000117e0003c00),        //make $r0 = 285936 (0x45cf0);;
     _32(0x20000100),        //lbz $r0 = 4 (0x4)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000000f001b0c0),        //compw.ne $r0 = $r0, 3 (0x3);;
     _32(0x0c000400),        //cb.wnez $r0? 16ab0 <main+0x110>;;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000000f001b080),        //compw.ne $r0 = $r0, 2 (0x2);;
     _32(0x0c000240),        //cb.wnez $r0? 16ab0 <main+0x110>;;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x20000100),        //lbz $r0 = 4 (0x4)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000000f101b100),        //compw.eq $r0 = $r0, 4 (0x4);;
     _32(0x0c000080),        //cb.wnez $r0? 16ab4 <main+0x114>;;
     _32(0x18000050),        //call 16bf0 <abort>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x1fffff85),        //call 168d8 <foo>;;
     _96(0x0000000080000117e0003c00),        //make $r0 = 285936 (0x45cf0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c000600),        //cb.wnez $r0? 16b40 <main+0x1a0>;;
     _96(0x0000000080000117e0003c00),        //make $r0 = 285936 (0x45cf0);;
     _32(0x20000100),        //lbz $r0 = 4 (0x4)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000000f001b0c0),        //compw.ne $r0 = $r0, 3 (0x3);;
     _32(0x0c000400),        //cb.wnez $r0? 16b40 <main+0x1a0>;;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000000f001b0c0),        //compw.ne $r0 = $r0, 3 (0x3);;
     _32(0x0c000240),        //cb.wnez $r0? 16b40 <main+0x1a0>;;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x20000100),        //lbz $r0 = 4 (0x4)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000000f101b1c0),        //compw.eq $r0 = $r0, 7 (0x7);;
     _32(0x0c000080),        //cb.wnez $r0? 16b44 <main+0x1a4>;;
     _32(0x1800002c),        //call 16bf0 <abort>;;
     _32(0x60040006),        //make $r1 = 6 (0x6);;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x1fffff61),        //call 168d8 <foo>;;
     _96(0x0000000080000117e0003c00),        //make $r0 = 285936 (0x45cf0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000000f001b100),        //compw.ne $r0 = $r0, 4 (0x4);;
     _32(0x0c000600),        //cb.wnez $r0? 16bd0 <main+0x230>;;
     _96(0x0000000080000117e0003c00),        //make $r0 = 285936 (0x45cf0);;
     _32(0x20000100),        //lbz $r0 = 4 (0x4)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000000f001b1c0),        //compw.ne $r0 = $r0, 7 (0x7);;
     _32(0x0c000400),        //cb.wnez $r0? 16bd0 <main+0x230>;;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000000f001b0c0),        //compw.ne $r0 = $r0, 3 (0x3);;
     _32(0x0c000240),        //cb.wnez $r0? 16bd0 <main+0x230>;;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x20000100),        //lbz $r0 = 4 (0x4)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000000f101b1c0),        //compw.eq $r0 = $r0, 7 (0x7);;
     _32(0x0c000080),        //cb.wnez $r0? 16bd4 <main+0x234>;;
     _32(0x18000008),        //call 16bf0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838040c),        //ld $r14 = 16 (0x10)[$r12];;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16fc8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18af8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100110100000; //0x169a0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(baz, 0b00010110100011010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100011011000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100110100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101111110000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000169a0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
