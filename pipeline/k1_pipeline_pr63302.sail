// executing pipeline pr63302.c.out.dumped test 
val k1_pipeline_pr63302: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr63302() = {
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
     _32(0x2801000c),        //sq 0 (0x0)[$r12] = $r0r1;;
     _32(0x3800000c),        //ld $r0 = 0 (0x0)[$r12];;
     _96(0x0400000080000001e808ffc0),        //andd $r2 = $r0, 9223372036854777855 (0x80000000000007ff);;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x680cffc0),        //andd $r3 = $r0, -1 (0xffffffff);;
     _32(0x2809040c),        //sq 16 (0x10)[$r12] = $r2r3;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x7a010040),        //ord $r0 = $r0, $r1;;
     _32(0x08800280),        //cb.deqz $r0? 16878 <foo+0x58>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _96(0x0400000080000000e0040000),        //make $r1 = 9223372036854775808 (0x8000000000000000);;
     _32(0x7001a040),        //compd.ne $r0 = $r0, $r1;;
     _32(0x08000180),        //cb.dnez $r0? 16880 <foo+0x60>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6001ffc0),        //compd.ne $r0 = $r0, -1 (0xffffffff);;
     _32(0x080000c0),        //cb.dnez $r0? 16880 <foo+0x60>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x10000002),        //goto 16884 <foo+0x64>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let bar: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _64(0x07e00001e800ffc0),        //andd $r0 = $r0, -2147481601 (0xffffffff800007ff);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x08800140),        //cb.deqz $r0? 168c0 <bar+0x30>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x07e00000e0010000),        //compd.ne $r0 = $r0, -2147483648 (0xffffffff80000000);;
     _32(0x080000c0),        //cb.dnez $r0? 168c8 <bar+0x38>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x10000002),        //goto 168cc <bar+0x3c>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x1fffffcd),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c000e40),        //cb.wnez $r0? 169e0 <main+0x108>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x1fffffc6),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000d00),        //cb.dnez $r0? 169e0 <main+0x108>;;
     _32(0x60000800),        //make $r0 = 2048 (0x800);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x1fffffc1),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c000b40),        //cb.wnez $r0? 169e0 <main+0x108>;;
     _32(0x60000801),        //make $r0 = 2049 (0x801);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x1fffffba),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000a00),        //cb.dnez $r0? 169e0 <main+0x108>;;
     _96(0x0400000080000000e0000000),        //make $r0 = 9223372036854775808 (0x8000000000000000);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x1fffffb3),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000840),        //cb.dnez $r0? 169e0 <main+0x108>;;
     _96(0x0400000080000000e0000000),        //make $r0 = 9223372036854775808 (0x8000000000000000);;
     _32(0x6004ffff),        //make $r1 = -1 (0xffffffff);;
     _32(0x1fffffac),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c000600),        //cb.wnez $r0? 169e0 <main+0x108>;;
     _96(0x0400000080000000e0000040),        //make $r0 = 9223372036854775809 (0x8000000000000001);;
     _32(0x6004ffff),        //make $r1 = -1 (0xffffffff);;
     _32(0x1fffffa3),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000440),        //cb.dnez $r0? 169e0 <main+0x108>;;
     _96(0x0400000080000002e0000000),        //make $r0 = 9223372036854777856 (0x8000000000000800);;
     _32(0x6004ffff),        //make $r1 = -1 (0xffffffff);;
     _32(0x1fffff9c),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c000200),        //cb.wnez $r0? 169e0 <main+0x108>;;
     _96(0x0400000080000002e0000040),        //make $r0 = 9223372036854777857 (0x8000000000000801);;
     _32(0x6004ffff),        //make $r1 = -1 (0xffffffff);;
     _32(0x1fffff93),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 169e4 <main+0x10c>;;
     _32(0x18000038),        //call 16ac0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffaa),        //call 16890 <bar>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c000b00),        //cb.wnez $r0? 16aa8 <main+0x1d0>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffffa4),        //call 16890 <bar>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000a00),        //cb.dnez $r0? 16aa8 <main+0x1d0>;;
     _32(0x60000800),        //make $r0 = 2048 (0x800);;
     _32(0x1fffffa0),        //call 16890 <bar>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c000880),        //cb.wnez $r0? 16aa8 <main+0x1d0>;;
     _32(0x60000801),        //make $r0 = 2049 (0x801);;
     _32(0x1fffff9a),        //call 16890 <bar>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000780),        //cb.dnez $r0? 16aa8 <main+0x1d0>;;
     _64(0x00200000e0000000),        //make $r0 = 2147483648 (0x80000000);;
     _32(0x1fffff95),        //call 16890 <bar>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000640),        //cb.dnez $r0? 16aa8 <main+0x1d0>;;
     _64(0x07e00000e000003f),        //make $r0 = -2147483648 (0xffffffff80000000);;
     _32(0x1fffff90),        //call 16890 <bar>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c000480),        //cb.wnez $r0? 16aa8 <main+0x1d0>;;
     _64(0x07e00000e000007f),        //make $r0 = -2147483647 (0xffffffff80000001);;
     _32(0x1fffff89),        //call 16890 <bar>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000340),        //cb.dnez $r0? 16aa8 <main+0x1d0>;;
     _64(0x07e00002e000003f),        //make $r0 = -2147481600 (0xffffffff80000800);;
     _32(0x1fffff84),        //call 16890 <bar>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c000180),        //cb.wnez $r0? 16aa8 <main+0x1d0>;;
     _64(0x07e00002e000007f),        //make $r0 = -2147481599 (0xffffffff80000801);;
     _32(0x1fffff7d),        //call 16890 <bar>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16aac <main+0x1d4>;;
     _32(0x18000006),        //call 16ac0 <abort>;;
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
     _32(0x980000f3),        //call 16e98 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 189c8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100011011000; //0x168d8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100010010000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100011011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101011000000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000168d8;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
