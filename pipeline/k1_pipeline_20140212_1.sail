// executing pipeline 20140212_1.c.out.dumped test 
val k1_pipeline_20140212_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20140212_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let fn1: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0002c00),        //make $r0 = 285872 (0x45cb0);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0003000),        //make $r0 = 285888 (0x45cc0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x08800200),        //cb.deqz $r0? 1687c <fn1+0x5c>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x088000c0),        //cb.deqz $r0? 1687c <fn1+0x5c>;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x10000002),        //goto 16880 <fn1+0x60>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _96(0x0000000080000117e0002800),        //make $r0 = 285856 (0x45ca0);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0002800),        //make $r0 = 285856 (0x45ca0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _64(0x10000001db003580),        //mulw $r0 = $r0, 54 (0x36);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x78043fc0),        //zxbd $r1 = $r0;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _64(0x17fffffcdb0034c0),        //mulw $r0 = $r0, 4294967187 (0xffffff93);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x78043fc0),        //zxbd $r1 = $r0;;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7c00ffc0),        //notw $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6907f000),        //sxwd $r1 = $r0;;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x60010000),        //compd.ne $r0 = $r0, 0 (0x0);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x088001c0),        //cb.deqz $r0? 1696c <fn1+0x14c>;;
     _96(0x0000000080000117e0042c00),        //make $r1 = 285872 (0x45cb0);;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x26010001),        //sw 0 (0x0)[$r1] = $r0;;
     _32(0x10000015),        //goto 169bc <fn1+0x19c>;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x790230c0),        //sllw $r0 = $r0, 3 (0x3);;
     _32(0x71011040),        //addw $r0 = $r0, $r1;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000117e0002a00),        //make $r0 = 285864 (0x45ca8);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0002a00),        //make $r0 = 285864 (0x45ca8);;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _96(0x0000000080000117e0002e00),        //make $r0 = 285880 (0x45cb8);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x00000000800000f8e0000400),        //make $r0 = 253968 (0x3e010);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x08000080),        //cb.dnez $r0? 169d4 <fn1+0x1b4>;;
     _32(0x17ffff9f),        //goto 1684c <fn1+0x2c>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1fffff8d),        //call 16820 <fn1>;;
     _96(0x0000000080000117e0002c00),        //make $r0 = 285872 (0x45cb0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16a10 <main+0x30>;;
     _32(0x18000007),        //call 16a28 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16e00 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18930 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100111100000; //0x169e0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fn1, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100111100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101000101000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000169e0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
