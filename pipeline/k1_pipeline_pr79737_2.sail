// executing pipeline pr79737_2.c.out.dumped test 
val k1_pipeline_pr79737_2: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr79737_2() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo: list_I = 
 [|
     _96(0x0000000080000117e0042600),        //make $r1 = 285848 (0x45c98);;
     _32(0x30000101),        //lwz $r0 = 4 (0x4)[$r1];;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x610392c2),        //insf $r0 = $r2, 25 (0x19), 11 (0xb);;
     _32(0x26010101),        //sw 4 (0x4)[$r1] = $r0;;
     _96(0x0000000080000117e0042600),        //make $r1 = 285848 (0x45c98);;
     _32(0x30000001),        //lwz $r0 = 0 (0x0)[$r1];;
     _32(0x60080005),        //make $r2 = 5 (0x5);;
     _32(0x61031002),        //insf $r0 = $r2, 17 (0x11), 0 (0x0);;
     _32(0x26010001),        //sw 0 (0x0)[$r1] = $r0;;
     _96(0x0000000080000117e0042600),        //make $r1 = 285848 (0x45c98);;
     _32(0x30000001),        //lwz $r0 = 0 (0x0)[$r1];;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x61032482),        //insf $r0 = $r2, 18 (0x12), 18 (0x12);;
     _32(0x26010001),        //sw 0 (0x0)[$r1] = $r0;;
     _96(0x0000000080000117e0042600),        //make $r1 = 285848 (0x45c98);;
     _32(0x38000001),        //ld $r0 = 0 (0x0)[$r1];;
     _32(0x6008fffb),        //make $r2 = -5 (0xfffffffb);;
     _32(0x6203a4c2),        //insf $r0 = $r2, 42 (0x2a), 19 (0x13);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _32(0x200401c0),        //lbz $r1 = 7 (0x7)[$r0];;
     _32(0x780400c1),        //andw $r1 = $r1, 3 (0x3);;
     _32(0x7a040501),        //orw $r1 = $r1, 20 (0x14);;
     _32(0x240501c0),        //sb 7 (0x7)[$r0] = $r1;;
     _32(0x20040200),        //lbz $r1 = 8 (0x8)[$r0];;
     _32(0x78040001),        //andw $r1 = $r1, 0 (0x0);;
     _32(0x24050200),        //sb 8 (0x8)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x0fd00000)        //ret ;;
 |];

let bar: list_I = 
 [|
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _32(0x30000001),        //lwz $r0 = 0 (0x0)[$r1];;
     _32(0x60080005),        //make $r2 = 5 (0x5);;
     _32(0x61031002),        //insf $r0 = $r2, 17 (0x11), 0 (0x0);;
     _32(0x26010001),        //sw 0 (0x0)[$r1] = $r0;;
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _32(0x30000001),        //lwz $r0 = 0 (0x0)[$r1];;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x61032482),        //insf $r0 = $r2, 18 (0x12), 18 (0x12);;
     _32(0x26010001),        //sw 0 (0x0)[$r1] = $r0;;
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _32(0x38000001),        //ld $r0 = 0 (0x0)[$r1];;
     _32(0x6008fffb),        //make $r2 = -5 (0xfffffffb);;
     _32(0x6203a4c2),        //insf $r0 = $r2, 42 (0x2a), 19 (0x13);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _32(0x30000101),        //lwz $r0 = 4 (0x4)[$r1];;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x610392c2),        //insf $r0 = $r2, 25 (0x19), 11 (0xb);;
     _32(0x26010101),        //sw 4 (0x4)[$r1] = $r0;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x200401c0),        //lbz $r1 = 7 (0x7)[$r0];;
     _32(0x780400c1),        //andw $r1 = $r1, 3 (0x3);;
     _32(0x7a040501),        //orw $r1 = $r1, 20 (0x14);;
     _32(0x240501c0),        //sb 7 (0x7)[$r0] = $r1;;
     _32(0x20040200),        //lbz $r1 = 8 (0x8)[$r0];;
     _32(0x78040001),        //andw $r1 = $r1, 0 (0x0);;
     _32(0x24050200),        //sb 8 (0x8)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1fffffad),        //call 16820 <foo>;;
     _32(0x1fffffd4),        //call 168c0 <bar>;;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _32(0x20040000),        //lbz $r1 = 0 (0x0)[$r0];;
     _32(0x20080040),        //lbz $r2 = 1 (0x1)[$r0];;
     _32(0x790a2202),        //slld $r2 = $r2, 8 (0x8);;
     _32(0x7a050042),        //ord $r1 = $r2, $r1;;
     _32(0x20000080),        //lbz $r0 = 2 (0x2)[$r0];;
     _32(0x680000c0),        //andd $r0 = $r0, 3 (0x3);;
     _32(0x79022400),        //slld $r0 = $r0, 16 (0x10);;
     _32(0x7a010040),        //ord $r0 = $r0, $r1;;
     _32(0x79022b80),        //slld $r0 = $r0, 46 (0x2e);;
     _32(0x7a022b80),        //srad $r0 = $r0, 46 (0x2e);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x20080000),        //lbz $r2 = 0 (0x0)[$r0];;
     _32(0x200c0040),        //lbz $r3 = 1 (0x1)[$r0];;
     _32(0x790e2203),        //slld $r3 = $r3, 8 (0x8);;
     _32(0x7a090083),        //ord $r2 = $r3, $r2;;
     _32(0x20000080),        //lbz $r0 = 2 (0x2)[$r0];;
     _32(0x680000c0),        //andd $r0 = $r0, 3 (0x3);;
     _32(0x79022400),        //slld $r0 = $r0, 16 (0x10);;
     _32(0x7a010080),        //ord $r0 = $r0, $r2;;
     _32(0x79022b80),        //slld $r0 = $r0, 46 (0x2e);;
     _32(0x7a022b80),        //srad $r0 = $r0, 46 (0x2e);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7001b001),        //compw.ne $r0 = $r1, $r0;;
     _32(0x0c001940),        //cb.wnez $r0? 16b7c <main+0x21c>;;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _32(0x20000080),        //lbz $r0 = 2 (0x2)[$r0];;
     _32(0x68032080),        //extfs $r0 = $r0, 2 (0x2), 2 (0x2);;
     _32(0x78043fc0),        //zxbd $r1 = $r0;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x20000080),        //lbz $r0 = 2 (0x2)[$r0];;
     _32(0x68032080),        //extfs $r0 = $r0, 2 (0x2), 2 (0x2);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x68077001),        //sxbd $r1 = $r1;;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x7001b001),        //compw.ne $r0 = $r1, $r0;;
     _32(0x0c001540),        //cb.wnez $r0? 16b7c <main+0x21c>;;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _32(0x20040080),        //lbz $r1 = 2 (0x2)[$r0];;
     _32(0x7b0630c1),        //srlw $r1 = $r1, 3 (0x3);;
     _32(0x78043fc1),        //zxbd $r1 = $r1;;
     _32(0x200800c0),        //lbz $r2 = 3 (0x3)[$r0];;
     _32(0x790a2142),        //slld $r2 = $r2, 5 (0x5);;
     _32(0x7a050042),        //ord $r1 = $r2, $r1;;
     _32(0x20080100),        //lbz $r2 = 4 (0x4)[$r0];;
     _32(0x790a2342),        //slld $r2 = $r2, 13 (0xd);;
     _32(0x7a050042),        //ord $r1 = $r2, $r1;;
     _32(0x20000140),        //lbz $r0 = 5 (0x5)[$r0];;
     _32(0x680001c0),        //andd $r0 = $r0, 7 (0x7);;
     _32(0x79022540),        //slld $r0 = $r0, 21 (0x15);;
     _32(0x7a010040),        //ord $r0 = $r0, $r1;;
     _32(0x79022a00),        //slld $r0 = $r0, 40 (0x28);;
     _32(0x7a022a00),        //srad $r0 = $r0, 40 (0x28);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x20080080),        //lbz $r2 = 2 (0x2)[$r0];;
     _32(0x7b0a30c2),        //srlw $r2 = $r2, 3 (0x3);;
     _32(0x78083fc2),        //zxbd $r2 = $r2;;
     _32(0x200c00c0),        //lbz $r3 = 3 (0x3)[$r0];;
     _32(0x790e2143),        //slld $r3 = $r3, 5 (0x5);;
     _32(0x7a090083),        //ord $r2 = $r3, $r2;;
     _32(0x200c0100),        //lbz $r3 = 4 (0x4)[$r0];;
     _32(0x790e2343),        //slld $r3 = $r3, 13 (0xd);;
     _32(0x7a090083),        //ord $r2 = $r3, $r2;;
     _32(0x20000140),        //lbz $r0 = 5 (0x5)[$r0];;
     _32(0x680001c0),        //andd $r0 = $r0, 7 (0x7);;
     _32(0x79022540),        //slld $r0 = $r0, 21 (0x15);;
     _32(0x7a010080),        //ord $r0 = $r0, $r2;;
     _32(0x79022a00),        //slld $r0 = $r0, 40 (0x28);;
     _32(0x7a022a00),        //srad $r0 = $r0, 40 (0x28);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7001b001),        //compw.ne $r0 = $r1, $r0;;
     _32(0x0c000b40),        //cb.wnez $r0? 16b7c <main+0x21c>;;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _32(0x690392c0),        //extfs $r0 = $r0, 25 (0x19), 11 (0xb);;
     _32(0x6407f000),        //zxhd $r1 = $r0;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _32(0x690392c0),        //extfs $r0 = $r0, 25 (0x19), 11 (0xb);;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x6807f001),        //sxhd $r1 = $r1;;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7001b001),        //compw.ne $r0 = $r1, $r0;;
     _32(0x0c000740),        //cb.wnez $r0? 16b7c <main+0x21c>;;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _32(0x200401c0),        //lbz $r1 = 7 (0x7)[$r0];;
     _32(0x7b063081),        //srlw $r1 = $r1, 2 (0x2);;
     _32(0x78043fc1),        //zxbd $r1 = $r1;;
     _32(0x20000200),        //lbz $r0 = 8 (0x8)[$r0];;
     _32(0x79022180),        //slld $r0 = $r0, 6 (0x6);;
     _32(0x7a010040),        //ord $r0 = $r0, $r1;;
     _32(0x79022c80),        //slld $r0 = $r0, 50 (0x32);;
     _32(0x7a022c80),        //srad $r0 = $r0, 50 (0x32);;
     _32(0x640bf000),        //zxhd $r2 = $r0;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x200401c0),        //lbz $r1 = 7 (0x7)[$r0];;
     _32(0x7b063081),        //srlw $r1 = $r1, 2 (0x2);;
     _32(0x78043fc1),        //zxbd $r1 = $r1;;
     _32(0x20000200),        //lbz $r0 = 8 (0x8)[$r0];;
     _32(0x79022180),        //slld $r0 = $r0, 6 (0x6);;
     _32(0x7a010040),        //ord $r0 = $r0, $r1;;
     _32(0x79022c80),        //slld $r0 = $r0, 50 (0x32);;
     _32(0x7a022c80),        //srad $r0 = $r0, 50 (0x32);;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x6807f002),        //sxhd $r1 = $r2;;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16b80 <main+0x220>;;
     _32(0x18000007),        //call 16b98 <abort>;;
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
     _32(0x980000f3),        //call 16f70 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18aa0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100101100000; //0x16960
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100011000000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100101100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101110011000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016960;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
