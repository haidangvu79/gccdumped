// executing pipeline pr52760.c.out.dumped test 
val k1_pipeline_pr52760: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr52760() = {
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
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000006c),        //goto 169e4 <foo+0x1c4>;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x7b023200),        //srlw $r0 = $r0, 8 (0x8);;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x640bf000),        //zxhd $r2 = $r0;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x79023200),        //sllw $r0 = $r0, 8 (0x8);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x7a040002),        //copyw $r1 = $r2;;
     _32(0x7a011001),        //orw $r0 = $r1, $r0;;
     _32(0x640bf000),        //zxhd $r2 = $r0;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x6407f002),        //zxhd $r1 = $r2;;
     _32(0x25050000),        //sh 0 (0x0)[$r0] = $r1;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x28000080),        //lhz $r0 = 2 (0x2)[$r0];;
     _32(0x7b023200),        //srlw $r0 = $r0, 8 (0x8);;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x640bf000),        //zxhd $r2 = $r0;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x28000080),        //lhz $r0 = 2 (0x2)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x79023200),        //sllw $r0 = $r0, 8 (0x8);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x7a040002),        //copyw $r1 = $r2;;
     _32(0x7a011001),        //orw $r0 = $r1, $r0;;
     _32(0x640bf000),        //zxhd $r2 = $r0;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x6407f002),        //zxhd $r1 = $r2;;
     _32(0x25050080),        //sh 2 (0x2)[$r0] = $r1;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x28000100),        //lhz $r0 = 4 (0x4)[$r0];;
     _32(0x7b023200),        //srlw $r0 = $r0, 8 (0x8);;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x640bf000),        //zxhd $r2 = $r0;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x28000100),        //lhz $r0 = 4 (0x4)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x79023200),        //sllw $r0 = $r0, 8 (0x8);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x7a040002),        //copyw $r1 = $r2;;
     _32(0x7a011001),        //orw $r0 = $r1, $r0;;
     _32(0x640bf000),        //zxhd $r2 = $r0;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x6407f002),        //zxhd $r1 = $r2;;
     _32(0x25050100),        //sh 4 (0x4)[$r0] = $r1;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x28000180),        //lhz $r0 = 6 (0x6)[$r0];;
     _32(0x7b023200),        //srlw $r0 = $r0, 8 (0x8);;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x640bf000),        //zxhd $r2 = $r0;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x28000180),        //lhz $r0 = 6 (0x6)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x79023200),        //sllw $r0 = $r0, 8 (0x8);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x7a040002),        //copyw $r1 = $r2;;
     _32(0x7a011001),        //orw $r0 = $r1, $r0;;
     _32(0x640bf000),        //zxhd $r2 = $r0;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x6407f002),        //zxhd $r1 = $r2;;
     _32(0x25050180),        //sh 6 (0x6)[$r0] = $r1;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7201b001),        //compw.lt $r0 = $r1, $r0;;
     _32(0x0c7fe480),        //cb.wnez $r0? 16838 <foo+0x18>;;
     _32(0x7f03f000),        //nop ;;
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
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2501060c),        //sh 24 (0x18)[$r12] = $r0;;
     _32(0x60000203),        //make $r0 = 515 (0x203);;
     _32(0x2501068c),        //sh 26 (0x1a)[$r12] = $r0;;
     _32(0x60000405),        //make $r0 = 1029 (0x405);;
     _32(0x2501070c),        //sh 28 (0x1c)[$r12] = $r0;;
     _32(0x60000607),        //make $r0 = 1543 (0x607);;
     _32(0x2501078c),        //sh 30 (0x1e)[$r12] = $r0;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffff78),        //call 16820 <foo>;;
     _32(0x2800060c),        //lhz $r0 = 24 (0x18)[$r12];;
     _64(0x00000008f001b000),        //compw.ne $r0 = $r0, 256 (0x100);;
     _32(0x0c000340),        //cb.wnez $r0? 16a84 <main+0x7c>;;
     _32(0x2800068c),        //lhz $r0 = 26 (0x1a)[$r12];;
     _64(0x00000018f001b080),        //compw.ne $r0 = $r0, 770 (0x302);;
     _32(0x0c000240),        //cb.wnez $r0? 16a84 <main+0x7c>;;
     _32(0x2800070c),        //lhz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000028f001b100),        //compw.ne $r0 = $r0, 1284 (0x504);;
     _32(0x0c000140),        //cb.wnez $r0? 16a84 <main+0x7c>;;
     _32(0x2800078c),        //lhz $r0 = 30 (0x1e)[$r12];;
     _64(0x00000038f101b180),        //compw.eq $r0 = $r0, 1798 (0x706);;
     _32(0x0c000080),        //cb.wnez $r0? 16a88 <main+0x80>;;
     _32(0x18000007),        //call 16aa0 <abort>;;
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
     _32(0x980000f3),        //call 16e78 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 189a8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101000001000; //0x16a08
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101000001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101010100000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016a08;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
