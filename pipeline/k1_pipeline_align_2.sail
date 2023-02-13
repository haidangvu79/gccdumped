// executing pipeline align_2.c.out.dumped test 
val k1_pipeline_align_2: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_align_2() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000003f101b040),        //compw.eq $r0 = $r0, 97 (0x61);;
     _32(0x0c000080),        //cb.wnez $r0? 16850 <main+0x30>;;
     _32(0x180000ff),        //call 16c48 <abort>;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x28000080),        //lhz $r0 = 2 (0x2)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _64(0x00000000f101b340),        //compw.eq $r0 = $r0, 13 (0xd);;
     _32(0x0c000080),        //cb.wnez $r0? 16874 <main+0x54>;;
     _32(0x180000f6),        //call 16c48 <abort>;;
     _96(0x00000000800000f8e0000400),        //make $r0 = 253968 (0x3e010);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000003f101b080),        //compw.eq $r0 = $r0, 98 (0x62);;
     _32(0x0c000080),        //cb.wnez $r0? 16898 <main+0x78>;;
     _32(0x180000ed),        //call 16c48 <abort>;;
     _96(0x00000000800000f8e0000400),        //make $r0 = 253968 (0x3e010);;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _64(0x00000000f101b380),        //compw.eq $r0 = $r0, 14 (0xe);;
     _32(0x0c000080),        //cb.wnez $r0? 168b8 <main+0x98>;;
     _32(0x180000e5),        //call 16c48 <abort>;;
     _96(0x00000000800000f8e0000600),        //make $r0 = 253976 (0x3e018);;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _64(0x00000000f101b3c0),        //compw.eq $r0 = $r0, 15 (0xf);;
     _32(0x0c000080),        //cb.wnez $r0? 168dc <main+0xbc>;;
     _32(0x180000dc),        //call 16c48 <abort>;;
     _96(0x00000000800000f8e0000600),        //make $r0 = 253976 (0x3e018);;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _64(0x00000000f101b400),        //compw.eq $r0 = $r0, 16 (0x10);;
     _32(0x0c000080),        //cb.wnez $r0? 168fc <main+0xdc>;;
     _32(0x180000d4),        //call 16c48 <abort>;;
     _96(0x00000000800000f8e0000800),        //make $r0 = 253984 (0x3e020);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000003f101b0c0),        //compw.eq $r0 = $r0, 99 (0x63);;
     _32(0x0c000080),        //cb.wnez $r0? 16920 <main+0x100>;;
     _32(0x180000cb),        //call 16c48 <abort>;;
     _96(0x00000000800000f8e0000800),        //make $r0 = 253984 (0x3e020);;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _64(0x00106200e0040000),        //make $r1 = 1099431936 (0x41880000);;
     _32(0x72030040),        //fcompw.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16944 <main+0x124>;;
     _32(0x180000c2),        //call 16c48 <abort>;;
     _96(0x00000000800000f8e0000a00),        //make $r0 = 253992 (0x3e028);;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _64(0x00000000f101b480),        //compw.eq $r0 = $r0, 18 (0x12);;
     _32(0x0c000080),        //cb.wnez $r0? 16968 <main+0x148>;;
     _32(0x180000b9),        //call 16c48 <abort>;;
     _96(0x00000000800000f8e0000a00),        //make $r0 = 253992 (0x3e028);;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _64(0x00106600e0040000),        //make $r1 = 1100480512 (0x41980000);;
     _32(0x72030040),        //fcompw.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 1698c <main+0x16c>;;
     _32(0x180000b0),        //call 16c48 <abort>;;
     _96(0x00000000800000f8e0000c00),        //make $r0 = 254000 (0x3e030);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000003f101b100),        //compw.eq $r0 = $r0, 100 (0x64);;
     _32(0x0c000080),        //cb.wnez $r0? 169b0 <main+0x190>;;
     _32(0x180000a7),        //call 16c48 <abort>;;
     _96(0x00000000800000f8e0000c00),        //make $r0 = 254000 (0x3e030);;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _96(0x0201a00080000000e0040000),        //make $r1 = 4626322717216342016 (0x4034000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 169d8 <main+0x1b8>;;
     _32(0x1800009d),        //call 16c48 <abort>;;
     _96(0x00000000800000f8e0001000),        //make $r0 = 254016 (0x3e040);;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _64(0x00000000f101b540),        //compw.eq $r0 = $r0, 21 (0x15);;
     _32(0x0c000080),        //cb.wnez $r0? 169fc <main+0x1dc>;;
     _32(0x18000094),        //call 16c48 <abort>;;
     _96(0x00000000800000f8e0001000),        //make $r0 = 254016 (0x3e040);;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _96(0x0201b00080000000e0040000),        //make $r1 = 4626885667169763328 (0x4036000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16a24 <main+0x204>;;
     _32(0x1800008a),        //call 16c48 <abort>;;
     _96(0x00000000800000f8e0001400),        //make $r0 = 254032 (0x3e050);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000000f101b5c0),        //compw.eq $r0 = $r0, 23 (0x17);;
     _32(0x0c000080),        //cb.wnez $r0? 16a44 <main+0x224>;;
     _32(0x18000082),        //call 16c48 <abort>;;
     _96(0x00000000800000f8e0001400),        //make $r0 = 254032 (0x3e050);;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _96(0x0201c00080000000e0040000),        //make $r1 = 4627448617123184640 (0x4038000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16a6c <main+0x24c>;;
     _32(0x18000078),        //call 16c48 <abort>;;
     _96(0x00000000800000f8e0001800),        //make $r0 = 254048 (0x3e060);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00107200e0040000),        //make $r1 = 1103626240 (0x41c80000);;
     _32(0x72030040),        //fcompw.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16a90 <main+0x270>;;
     _32(0x1800006f),        //call 16c48 <abort>;;
     _96(0x00000000800000f8e0001800),        //make $r0 = 254048 (0x3e060);;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _96(0x0201d00080000000e0040000),        //make $r1 = 4628011567076605952 (0x403a000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16ab8 <main+0x298>;;
     _32(0x18000065),        //call 16c48 <abort>;;
     _96(0x00000000800000f8e0001c00),        //make $r0 = 254064 (0x3e070);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000003f101b140),        //compw.eq $r0 = $r0, 101 (0x65);;
     _32(0x0c000080),        //cb.wnez $r0? 16adc <main+0x2bc>;;
     _32(0x1800005c),        //call 16c48 <abort>;;
     _96(0x00000000800000f8e0001c00),        //make $r0 = 254064 (0x3e070);;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _96(0x0201d80080000000e0040000),        //make $r1 = 4628293042053316608 (0x403b000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16b04 <main+0x2e4>;;
     _32(0x18000052),        //call 16c48 <abort>;;
     _96(0x00000000800000f8e0002000),        //make $r0 = 254080 (0x3e080);;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _64(0x00000000f101b700),        //compw.eq $r0 = $r0, 28 (0x1c);;
     _32(0x0c000080),        //cb.wnez $r0? 16b28 <main+0x308>;;
     _32(0x18000049),        //call 16c48 <abort>;;
     _96(0x00000000800000f8e0002000),        //make $r0 = 254080 (0x3e080);;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _96(0x0201e80080000000e0040000),        //make $r1 = 4628855992006737920 (0x403d000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16b50 <main+0x330>;;
     _32(0x1800003f),        //call 16c48 <abort>;;
     _96(0x00000000800000f8e0002400),        //make $r0 = 254096 (0x3e090);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000000f101b780),        //compw.eq $r0 = $r0, 30 (0x1e);;
     _32(0x0c000080),        //cb.wnez $r0? 16b70 <main+0x350>;;
     _32(0x18000037),        //call 16c48 <abort>;;
     _96(0x00000000800000f8e0002400),        //make $r0 = 254096 (0x3e090);;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _96(0x0201f80080000000e0040000),        //make $r1 = 4629418941960159232 (0x403f000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16b98 <main+0x378>;;
     _32(0x1800002d),        //call 16c48 <abort>;;
     _96(0x00000000800000f8e0002800),        //make $r0 = 254112 (0x3e0a0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00108000e0040000),        //make $r1 = 1107296256 (0x42000000);;
     _32(0x72030040),        //fcompw.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16bbc <main+0x39c>;;
     _32(0x18000024),        //call 16c48 <abort>;;
     _96(0x00000000800000f8e0002800),        //make $r0 = 254112 (0x3e0a0);;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _96(0x0202040080000000e0040000),        //make $r1 = 4629841154425225216 (0x4040800000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16be4 <main+0x3c4>;;
     _32(0x1800001a),        //call 16c48 <abort>;;
     _96(0x00000000800000f8e0002c00),        //make $r0 = 254128 (0x3e0b0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x0202080080000000e0040000),        //make $r1 = 4629981891913580544 (0x4041000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16c0c <main+0x3ec>;;
     _32(0x18000010),        //call 16c48 <abort>;;
     _96(0x00000000800000f8e0002c00),        //make $r0 = 254128 (0x3e0b0);;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _96(0x02020c0080000000e0040000),        //make $r1 = 4630122629401935872 (0x4041800000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16c34 <main+0x414>;;
     _32(0x18000006),        //call 16c48 <abort>;;
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
     _32(0x980000f3),        //call 17020 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18b50 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110110001001000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016820;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
