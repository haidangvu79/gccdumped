// executing pipeline pr78720.c.out.dumped test 
val k1_pipeline_pr78720: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr78720() = {
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
     _32(0x2401060c),        //sb 24 (0x18)[$r12] = $r0;;
     _32(0x2400060c),        //lbs $r0 = 24 (0x18)[$r12];;
     _64(0x00000200e8000000),        //andd $r0 = $r0, 524288 (0x80000);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let bar: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2401060c),        //sb 24 (0x18)[$r12] = $r0;;
     _32(0x2400060c),        //lbs $r0 = 24 (0x18)[$r12];;
     _32(0x68002000),        //andd $r0 = $r0, 128 (0x80);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let baz: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2401060c),        //sb 24 (0x18)[$r12] = $r0;;
     _32(0x2400060c),        //lbs $r0 = 24 (0x18)[$r12];;
     _32(0x7a023080),        //sraw $r0 = $r0, 2 (0x2);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x68000800),        //andd $r0 = $r0, 32 (0x20);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1fffffe4),        //call 16820 <foo>;;
     _64(0x00000200e0010000),        //compd.ne $r0 = $r0, 524288 (0x80000);;
     _32(0x080006c0),        //cb.dnez $r0? 16908 <main+0x88>;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1fffffe7),        //call 16840 <bar>;;
     _32(0x60012000),        //compd.ne $r0 = $r0, 128 (0x80);;
     _32(0x080005c0),        //cb.dnez $r0? 16908 <main+0x88>;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1fffffe9),        //call 16858 <baz>;;
     _32(0x60010800),        //compd.ne $r0 = $r0, 32 (0x20);;
     _32(0x080004c0),        //cb.dnez $r0? 16908 <main+0x88>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffd7),        //call 16820 <foo>;;
     _32(0x08000400),        //cb.dnez $r0? 16908 <main+0x88>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffdc),        //call 16840 <bar>;;
     _32(0x08000340),        //cb.dnez $r0? 16908 <main+0x88>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffdf),        //call 16858 <baz>;;
     _32(0x08000280),        //cb.dnez $r0? 16908 <main+0x88>;;
     _32(0x6000001f),        //make $r0 = 31 (0x1f);;
     _32(0x1fffffce),        //call 16820 <foo>;;
     _32(0x080001c0),        //cb.dnez $r0? 16908 <main+0x88>;;
     _32(0x6000001f),        //make $r0 = 31 (0x1f);;
     _32(0x1fffffd3),        //call 16840 <bar>;;
     _32(0x08000100),        //cb.dnez $r0? 16908 <main+0x88>;;
     _32(0x6000001f),        //make $r0 = 31 (0x1f);;
     _32(0x1fffffd6),        //call 16858 <baz>;;
     _32(0x08800080),        //cb.deqz $r0? 1690c <main+0x8c>;;
     _32(0x18000006),        //call 16920 <abort>;;
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
     _32(0x980000f3),        //call 16cf8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18828 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100010000000; //0x16880
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100001000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(baz, 0b00010110100001011000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100100100000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016880;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
