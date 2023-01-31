// executing pipeline pr61673.c.out.dumped test 
val k1_pipeline_pr61673: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr61673() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let bar: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2401060c),        //sb 24 (0x18)[$r12] = $r0;;
     _32(0x2400060c),        //lbs $r0 = 24 (0x18)[$r12];;
     _64(0x00000002f101b500),        //compw.eq $r0 = $r0, 84 (0x54);;
     _32(0x0c000180),        //cb.wnez $r0? 16854 <bar+0x34>;;
     _32(0x2400060c),        //lbs $r0 = 24 (0x18)[$r12];;
     _64(0x07fffffcf101b1c0),        //compw.eq $r0 = $r0, 4294967175 (0xffffff87);;
     _32(0x0c000080),        //cb.wnez $r0? 16854 <bar+0x34>;;
     _32(0x18000082),        //call 16a58 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let foo: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x240107cc),        //sb 31 (0x1f)[$r12] = $r0;;
     _32(0x240007cc),        //lbs $r0 = 31 (0x1f)[$r12];;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0d0001c0),        //cb.wltz $r0? 168ac <foo+0x44>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000003f501b7c0),        //compw.gt $r0 = $r0, 127 (0x7f);;
     _32(0x0c0000c0),        //cb.wnez $r0? 168ac <foo+0x44>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x10000002),        //goto 168b0 <foo+0x48>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x08000180),        //cb.dnez $r0? 168c8 <foo+0x60>;;
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _32(0x200007cc),        //lbz $r0 = 31 (0x1f)[$r12];;
     _32(0x24010001),        //sb 0 (0x0)[$r1] = $r0;;
     _32(0x240007cc),        //lbs $r0 = 31 (0x1f)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffffd4),        //call 16820 <bar>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let baz: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x240107cc),        //sb 31 (0x1f)[$r12] = $r0;;
     _32(0x240007cc),        //lbs $r0 = 31 (0x1f)[$r12];;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0d0001c0),        //cb.wltz $r0? 16924 <baz+0x3c>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000003f501b7c0),        //compw.gt $r0 = $r0, 127 (0x7f);;
     _32(0x0c0000c0),        //cb.wnez $r0? 16924 <baz+0x3c>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x10000002),        //goto 16928 <baz+0x40>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x08000180),        //cb.dnez $r0? 16940 <baz+0x58>;;
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _32(0x200007cc),        //lbz $r0 = 31 (0x1f)[$r12];;
     _32(0x24010001),        //sb 0 (0x0)[$r1] = $r0;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x60008754),        //make $r0 = -30892 (0xffff8754);;
     _32(0x2501060c),        //sh 24 (0x18)[$r12] = $r0;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x60040021),        //make $r1 = 33 (0x21);;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x1fffffbb),        //call 16868 <foo>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000001f101b040),        //compw.eq $r0 = $r0, 33 (0x21);;
     _32(0x0c000080),        //cb.wnez $r0? 169a4 <main+0x54>;;
     _32(0x1800002e),        //call 16a58 <abort>;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x1fffffaf),        //call 16868 <foo>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x07fffffcf101b1c0),        //compw.eq $r0 = $r0, 4294967175 (0xffffff87);;
     _32(0x0c000080),        //cb.wnez $r0? 169d4 <main+0x84>;;
     _32(0x18000022),        //call 16a58 <abort>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x60040021),        //make $r1 = 33 (0x21);;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x1fffffbf),        //call 168e8 <baz>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000001f101b040),        //compw.eq $r0 = $r0, 33 (0x21);;
     _32(0x0c000080),        //cb.wnez $r0? 16a14 <main+0xc4>;;
     _32(0x18000012),        //call 16a58 <abort>;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x1fffffb3),        //call 168e8 <baz>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x07fffffcf101b1c0),        //compw.eq $r0 = $r0, 4294967175 (0xffffff87);;
     _32(0x0c000080),        //cb.wnez $r0? 16a44 <main+0xf4>;;
     _32(0x18000006),        //call 16a58 <abort>;;
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
     _32(0x980000f3),        //call 16e30 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18960 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100101010000; //0x16950
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100001101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(baz, 0b00010110100011101000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100101010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101001011000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016950;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
