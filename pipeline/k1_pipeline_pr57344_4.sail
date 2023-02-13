// executing pipeline pr57344_4.c.out.dumped test 
val k1_pipeline_pr57344_4: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr57344_4() = {
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
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _96(0x07ffdd4c81d950c8e0047f80),        //make $r1 = 18445523097810575870 (0xfffba987654321fe);;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 1684c <foo+0x2c>;;
     _32(0x1800005a),        //call 169b0 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x2801040c),        //sq 16 (0x10)[$r12] = $r0r1;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _96(0x003fffff87ffffffe800ffc0),        //andd $r0 = $r0, 576460752303423487 (0x7ffffffffffffff);;
     _96(0x0780000080000000ea000000),        //ord $r0 = $r0, 17293822569102704640 (0xf000000000000000);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x78000000),        //andw $r0 = $r0, 0 (0x0);;
     _64(0x000eca86fa0043c0),        //orw $r0 = $r0, 992614671 (0x3b2a190f);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2800070c),        //lhz $r0 = 28 (0x1c)[$r12];;
     _32(0x78000000),        //andw $r0 = $r0, 0 (0x0);;
     _64(0x07fffff7fa005300),        //orw $r0 = $r0, -8884 (0xffffffffffffdd4c);;
     _32(0x2501070c),        //sh 28 (0x1c)[$r12] = $r0;;
     _32(0x2000078c),        //lbz $r0 = 30 (0x1e)[$r12];;
     _32(0x7a000040),        //orw $r0 = $r0, 1 (0x1);;
     _32(0x2401078c),        //sb 30 (0x1e)[$r12] = $r0;;
     _96(0x0000000080000117e0082400),        //make $r2 = 285840 (0x45c90);;
     _32(0x3c00040c),        //lq $r0r1 = 16 (0x10)[$r12];;
     _32(0x28010402),        //sq 16 (0x10)[$r2] = $r0r1;;
     _32(0x1000002a),        //goto 16988 <main+0x128>;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x200405c0),        //lbz $r1 = 23 (0x17)[$r0];;
     _32(0x7b0630c1),        //srlw $r1 = $r1, 3 (0x3);;
     _32(0x78043fc1),        //zxbd $r1 = $r1;;
     _32(0x20080600),        //lbz $r2 = 24 (0x18)[$r0];;
     _32(0x790a2142),        //slld $r2 = $r2, 5 (0x5);;
     _32(0x7a050042),        //ord $r1 = $r2, $r1;;
     _32(0x20080640),        //lbz $r2 = 25 (0x19)[$r0];;
     _32(0x790a2342),        //slld $r2 = $r2, 13 (0xd);;
     _32(0x7a050042),        //ord $r1 = $r2, $r1;;
     _32(0x20080680),        //lbz $r2 = 26 (0x1a)[$r0];;
     _32(0x790a2542),        //slld $r2 = $r2, 21 (0x15);;
     _32(0x7a050042),        //ord $r1 = $r2, $r1;;
     _32(0x200806c0),        //lbz $r2 = 27 (0x1b)[$r0];;
     _32(0x790a2742),        //slld $r2 = $r2, 29 (0x1d);;
     _32(0x7a050042),        //ord $r1 = $r2, $r1;;
     _32(0x20080700),        //lbz $r2 = 28 (0x1c)[$r0];;
     _32(0x790a2942),        //slld $r2 = $r2, 37 (0x25);;
     _32(0x7a050042),        //ord $r1 = $r2, $r1;;
     _32(0x20080740),        //lbz $r2 = 29 (0x1d)[$r0];;
     _32(0x790a2b42),        //slld $r2 = $r2, 45 (0x2d);;
     _32(0x7a050042),        //ord $r1 = $r2, $r1;;
     _32(0x20000780),        //lbz $r0 = 30 (0x1e)[$r0];;
     _32(0x68000040),        //andd $r0 = $r0, 1 (0x1);;
     _32(0x79022d40),        //slld $r0 = $r0, 53 (0x35);;
     _32(0x7a010040),        //ord $r0 = $r0, $r1;;
     _32(0x79022280),        //slld $r0 = $r0, 10 (0xa);;
     _32(0x7a022280),        //srad $r0 = $r0, 10 (0xa);;
     _32(0x1fffffb1),        //call 16820 <foo>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x0e7ff4c0),        //cb.wlez $r0? 168e4 <main+0x84>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16d88 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 188b8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100001100000; //0x16860
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100001100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100110110000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016860;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
