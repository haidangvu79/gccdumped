// executing pipeline pr53160.c.out.dumped test 
val k1_pipeline_pr53160: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr53160() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo: list_I = 
 [|
     _96(0x0000000080000117e0003000),        //make $r0 = 285888 (0x45cc0);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x1000000b),        //goto 16860 <foo+0x40>;;
     _96(0x0000000080000117e0003000),        //make $r0 = 285888 (0x45cc0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000117e0003000),        //make $r0 = 285888 (0x45cc0);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0003000),        //make $r0 = 285888 (0x45cc0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x087ffc80),        //cb.dnez $r0? 16838 <foo+0x18>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x7f03f000),        //nop ;;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x08800140),        //cb.deqz $r0? 168b0 <main+0x30>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x1fffffdc),        //call 16820 <foo>;;
     _96(0x0000000080000117e0002a00),        //make $r0 = 285864 (0x45ca8);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x10000022),        //goto 16950 <main+0xd0>;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x2501078c),        //sh 30 (0x1e)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2c00078c),        //lhs $r0 = 30 (0x1e)[$r12];;
     _32(0x0c000200),        //cb.wnez $r0? 16914 <main+0x94>;;
     _32(0x2c00078c),        //lhs $r0 = 30 (0x1e)[$r12];;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x79027001),        //sllw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x10000002),        //goto 16918 <main+0x98>;;
     _32(0x2800078c),        //lhz $r0 = 30 (0x1e)[$r12];;
     _96(0x0000000080000117e0042800),        //make $r1 = 285856 (0x45ca0);;
     _32(0x25010001),        //sh 0 (0x0)[$r1] = $r0;;
     _96(0x0000000080000117e0002a00),        //make $r0 = 285864 (0x45ca8);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000117e0002a00),        //make $r0 = 285864 (0x45ca8);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0002a00),        //make $r0 = 285864 (0x45ca8);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x0dfff6c0),        //cb.wgez $r0? 168cc <main+0x4c>;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x088001c0),        //cb.deqz $r0? 16990 <main+0x110>;;
     _96(0x0000000080000117e0002800),        //make $r0 = 285856 (0x45ca0);;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x10000002),        //goto 16994 <main+0x114>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _96(0x0000000080000117e0042c00),        //make $r1 = 285872 (0x45cb0);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x0000000080000117e0002c00),        //make $r0 = 285872 (0x45cb0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000117e0002e00),        //make $r0 = 285880 (0x45cb8);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0002e00),        //make $r0 = 285880 (0x45cb8);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x08800080),        //cb.deqz $r0? 169e0 <main+0x160>;;
     _32(0x18000007),        //call 169f8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
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
     _32(0x980000f3),        //call 16dd0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18900 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100010000000; //0x16880
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100111111000, num_instr, mI);
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
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
