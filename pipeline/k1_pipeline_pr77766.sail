// executing pipeline pr77766.c.out.dumped test 
val k1_pipeline_pr77766: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr77766() = {
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
     _32(0x1000004a),        //goto 1694c <main+0x12c>;;
     _96(0x0000000080000117e0002a00),        //make $r0 = 285864 (0x45ca8);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x10000031),        //goto 16900 <main+0xe0>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000018),        //goto 168a8 <main+0x88>;;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _96(0x0000000080000117e0042c00),        //make $r1 = 285872 (0x45cb0);;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x2002e001),        //lbz $r0 = $r0[$r1];;
     _32(0x08000200),        //cb.dnez $r0? 16898 <main+0x78>;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x0e7ffbc0),        //cb.wlez $r0? 1684c <main+0x2c>;;
     _32(0x10000002),        //goto 1689c <main+0x7c>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f401b080),        //compw.le $r0 = $r0, 2 (0x2);;
     _32(0x0c7ffc80),        //cb.wnez $r0? 1687c <main+0x5c>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x10000002),        //goto 168c4 <main+0xa4>;;
     _32(0x7f03f000),        //nop ;;
     _96(0x0000000080000117e0002800),        //make $r0 = 285856 (0x45ca0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x080004c0),        //cb.dnez $r0? 16920 <main+0x100>;;
     _96(0x0000000080000117e0002a00),        //make $r0 = 285864 (0x45ca8);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000117e0002a00),        //make $r0 = 285864 (0x45ca8);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0002a00),        //make $r0 = 285864 (0x45ca8);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000001f401b000),        //compw.le $r0 = $r0, 32 (0x20);;
     _32(0x0c7ff280),        //cb.wnez $r0? 16840 <main+0x20>;;
     _32(0x10000002),        //goto 16924 <main+0x104>;;
     _32(0x7f03f000),        //nop ;;
     _96(0x0000000080000117e0003000),        //make $r0 = 285888 (0x45cc0);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x00000000800000f8e0000400),        //make $r0 = 253968 (0x3e010);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x00000000800000f8e0000400),        //make $r0 = 253968 (0x3e010);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x087fecc0),        //cb.dnez $r0? 16828 <main+0x8>;;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x10000019),        //goto 169d8 <main+0x1b8>;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x6407f000),        //zxhd $r1 = $r0;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x25050000),        //sh 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _96(0x0000000080000117e0002e00),        //make $r0 = 285880 (0x45cb8);;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x087ff000),        //cb.dnez $r0? 168c0 <main+0xa0>;;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x087ff900),        //cb.dnez $r0? 16978 <main+0x158>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
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
