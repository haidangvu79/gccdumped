// executing pipeline 960608_1 test 
val k1_pipeline_960608_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_960608_1() = {
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
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x78000800),        //andw $r0 = $r0, 32 (0x20);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x08000640),        //cb.dnez $r0? 1689c <foo+0x7c>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x78001000),        //andw $r0 = $r0, 64 (0x40);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x08800500),        //cb.deqz $r0? 1689c <foo+0x7c>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x7800e000),        //andw $r0 = $r0, -128 (0xffffff80);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x088003c0),        //cb.deqz $r0? 1689c <foo+0x7c>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x780000c0),        //andw $r0 = $r0, 3 (0x3);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _64(0x00000000f001b080),        //compw.ne $r0 = $r0, 2 (0x2);;
     _32(0x0c000200),        //cb.wnez $r0? 1689c <foo+0x7c>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x78000700),        //andw $r0 = $r0, 28 (0x1c);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _64(0x00000000f101b300),        //compw.eq $r0 = $r0, 12 (0xc);;
     _32(0x0c0000c0),        //cb.wnez $r0? 168a4 <foo+0x84>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x10000002),        //goto 168a8 <foo+0x88>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2000060c),        //lbz $r0 = 24 (0x18)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x60035141),        //insf $r0 = $r1, 5 (0x5), 5 (0x5);;
     _32(0x2401060c),        //sb 24 (0x18)[$r12] = $r0;;
     _32(0x2000060c),        //lbz $r0 = 24 (0x18)[$r12];;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x60036181),        //insf $r0 = $r1, 6 (0x6), 6 (0x6);;
     _32(0x2401060c),        //sb 24 (0x18)[$r12] = $r0;;
     _32(0x2000060c),        //lbz $r0 = 24 (0x18)[$r12];;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x600371c1),        //insf $r0 = $r1, 7 (0x7), 7 (0x7);;
     _32(0x2401060c),        //sb 24 (0x18)[$r12] = $r0;;
     _32(0x2000060c),        //lbz $r0 = 24 (0x18)[$r12];;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _32(0x60031001),        //insf $r0 = $r1, 1 (0x1), 0 (0x0);;
     _32(0x2401060c),        //sb 24 (0x18)[$r12] = $r0;;
     _32(0x2000060c),        //lbz $r0 = 24 (0x18)[$r12];;
     _32(0x60040003),        //make $r1 = 3 (0x3);;
     _32(0x60034081),        //insf $r0 = $r1, 4 (0x4), 2 (0x2);;
     _32(0x2401060c),        //sb 24 (0x18)[$r12] = $r0;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x1fffffc2),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16928 <main+0x70>;;
     _32(0x18000003),        //call 16930 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16950 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16d50 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18a28 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
 |];

let adr_start:bits(addr_bits) = 0b00010110100010111000; //0x168b8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100100110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100101010000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000168b8;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
