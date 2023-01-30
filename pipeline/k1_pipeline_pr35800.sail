// executing pipeline pr35800 test 
val k1_pipeline_pr35800: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr35800() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let stab_xcoff_builtin_type: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x0d800140),        //cb.wgez $r0? 16840 <stab_xcoff_builtin_type+0x20>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _64(0x07fffffef301b780),        //compw.ge $r0 = $r0, 4294967262 (0xffffffde);;
     _32(0x0c0000c0),        //cb.wnez $r0? 16848 <stab_xcoff_builtin_type+0x28>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000009b),        //goto 16ab0 <stab_xcoff_builtin_type+0x290>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x75000000),        //negw $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000001f905b080),        //compw.gtu $r1 = $r0, 34 (0x22);;
     _32(0x0c002441),        //cb.wnez $r1? 16aa0 <stab_xcoff_builtin_type+0x280>;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _96(0x00000000800000fde1006000),        //addd $r0 = $r0, 259456 (0x3f580);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x0fd80000),        //igoto $r0;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x10000086),        //goto 16aa0 <stab_xcoff_builtin_type+0x280>;;
     _96(0x00000000800000fce000f200),        //make $r0 = 259016 (0x3f3c8);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fce000f400),        //make $r0 = 259024 (0x3f3d0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x1000007d),        //goto 16aa0 <stab_xcoff_builtin_type+0x280>;;
     _96(0x00000000800000fce000f600),        //make $r0 = 259032 (0x3f3d8);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fce000f800),        //make $r0 = 259040 (0x3f3e0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fce000fc00),        //make $r0 = 259056 (0x3f3f0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fde0000000),        //make $r0 = 259072 (0x3f400);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fde0000400),        //make $r0 = 259088 (0x3f410);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fde0000800),        //make $r0 = 259104 (0x3f420);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fde0000c00),        //make $r0 = 259120 (0x3f430);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fde0001000),        //make $r0 = 259136 (0x3f440);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fde0001200),        //make $r0 = 259144 (0x3f448);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fde0001400),        //make $r0 = 259152 (0x3f450);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fde0001600),        //make $r0 = 259160 (0x3f458);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fde0001a00),        //make $r0 = 259176 (0x3f468);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fde0001c00),        //make $r0 = 259184 (0x3f470);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fde0001e00),        //make $r0 = 259192 (0x3f478);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fde0002200),        //make $r0 = 259208 (0x3f488);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fde0002400),        //make $r0 = 259216 (0x3f490);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fde0002800),        //make $r0 = 259232 (0x3f4a0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fde0002c00),        //make $r0 = 259248 (0x3f4b0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fde0003000),        //make $r0 = 259264 (0x3f4c0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fde0003400),        //make $r0 = 259280 (0x3f4d0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fde0003800),        //make $r0 = 259296 (0x3f4e0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fde0003a00),        //make $r0 = 259304 (0x3f4e8);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fde0003c00),        //make $r0 = 259312 (0x3f4f0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fde0004000),        //make $r0 = 259328 (0x3f500);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fde0004400),        //make $r0 = 259344 (0x3f510);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fde0004800),        //make $r0 = 259360 (0x3f520);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fde0004c00),        //make $r0 = 259376 (0x3f530);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fde0004e00),        //make $r0 = 259384 (0x3f538);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fde0005200),        //make $r0 = 259400 (0x3f548);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fde0005800),        //make $r0 = 259424 (0x3f560);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fde0005c00),        //make $r0 = 259440 (0x3f570);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff56),        //call 16820 <stab_xcoff_builtin_type>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16ad8 <main+0x20>;;
     _32(0x18000031),        //call 16b98 <abort>;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1fffff51),        //call 16820 <stab_xcoff_builtin_type>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000003f101b240),        //compw.eq $r0 = $r0, 105 (0x69);;
     _32(0x0c000080),        //cb.wnez $r0? 16af4 <main+0x3c>;;
     _32(0x1800002a),        //call 16b98 <abort>;;
     _32(0x6000fffe),        //make $r0 = -2 (0xfffffffe);;
     _32(0x1fffff4a),        //call 16820 <stab_xcoff_builtin_type>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000003f101b4c0),        //compw.eq $r0 = $r0, 115 (0x73);;
     _32(0x0c000080),        //cb.wnez $r0? 16b10 <main+0x58>;;
     _32(0x18000023),        //call 16b98 <abort>;;
     _32(0x6000fffd),        //make $r0 = -3 (0xfffffffd);;
     _32(0x1fffff43),        //call 16820 <stab_xcoff_builtin_type>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000003f101b4c0),        //compw.eq $r0 = $r0, 115 (0x73);;
     _32(0x0c000080),        //cb.wnez $r0? 16b2c <main+0x74>;;
     _32(0x1800001c),        //call 16b98 <abort>;;
     _32(0x6000fffc),        //make $r0 = -4 (0xfffffffc);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000000b),        //goto 16b60 <main+0xa8>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x1fffff39),        //call 16820 <stab_xcoff_builtin_type>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000003f101b240),        //compw.eq $r0 = $r0, 105 (0x69);;
     _32(0x0c000080),        //cb.wnez $r0? 16b54 <main+0x9c>;;
     _32(0x18000012),        //call 16b98 <abort>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x07fffffef301b780),        //compw.ge $r0 = $r0, 4294967262 (0xffffffde);;
     _32(0x0c7ffcc0),        //cb.wnez $r0? 16b38 <main+0x80>;;
     _32(0x6000ffdd),        //make $r0 = -35 (0xffffffdd);;
     _32(0x1fffff2b),        //call 16820 <stab_xcoff_builtin_type>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16b84 <main+0xcc>;;
     _32(0x18000006),        //call 16b98 <abort>;;
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
     _32(0x980000f3),        //call 16f70 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18aa0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101010111000; //0x16ab8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(stab_xcoff_builtin_type, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101010111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101110011000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016ab8;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
