// executing pipeline usad_run.c.out.dumped test 
val k1_pipeline_usad_run: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_usad_run() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x26050c0c),        //sw 48 (0x30)[$r12] = $r1;;
     _32(0x2709080c),        //sd 32 (0x20)[$r12] = $r2;;
     _32(0x260d060c),        //sw 24 (0x18)[$r12] = $r3;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x10000027),        //goto 168e0 <foo+0xc0>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x10000015),        //goto 168a4 <foo+0x84>;;
     _32(0x34000d0c),        //lws $r0 = 52 (0x34)[$r12];;
     _32(0x38040a0c),        //ld $r1 = 40 (0x28)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x34000d0c),        //lws $r0 = 52 (0x34)[$r12];;
     _32(0x3808080c),        //ld $r2 = 32 (0x20)[$r12];;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x75011040),        //sbfw $r0 = $r0, $r1;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x74000000),        //absw $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x30040f0c),        //lwz $r1 = 60 (0x3c)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _64(0x00000000f401b3c0),        //compw.le $r0 = $r0, 15 (0xf);;
     _32(0x0c7ffa40),        //cb.wnez $r0? 16854 <foo+0x34>;;
     _32(0x34000c0c),        //lws $r0 = 48 (0x30)[$r12];;
     _32(0x38040a0c),        //ld $r1 = 40 (0x28)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x3400060c),        //lws $r0 = 24 (0x18)[$r12];;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _64(0x00000000f401b3c0),        //compw.le $r0 = $r0, 15 (0xf);;
     _32(0x0c7ff5c0),        //cb.wnez $r0? 16848 <foo+0x28>;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let bar: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x27050c0c),        //sd 48 (0x30)[$r12] = $r1;;
     _32(0x26090a0c),        //sw 40 (0x28)[$r12] = $r2;;
     _32(0x270d080c),        //sd 32 (0x20)[$r12] = $r3;;
     _32(0x300c0a0c),        //lwz $r3 = 40 (0x28)[$r12];;
     _32(0x38080c0c),        //ld $r2 = 48 (0x30)[$r12];;
     _32(0x60040010),        //make $r1 = 16 (0x10);;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x1fffffbd),        //call 16820 <foo>;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _64(0x07ffffffe130780c),        //addd $r12 = $r12, -544 (0xfffffffffffffde0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000a601870c),        //sw 540 (0x21c)[$r12] = $r0;;
     _32(0x1000005b),        //goto 16ad8 <main+0x188>;;
     _64(0x18000000b000870c),        //lwz $r0 = 540 (0x21c)[$r12];;
     _32(0x78000040),        //andw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x080009c0),        //cb.dnez $r0? 16a1c <main+0xcc>;;
     _64(0x18000000b004870c),        //lwz $r1 = 540 (0x21c)[$r12];;
     _32(0x7a0237c1),        //sraw $r0 = $r1, 31 (0x1f);;
     _32(0x7b023740),        //srlw $r0 = $r0, 29 (0x1d);;
     _32(0x71051001),        //addw $r1 = $r1, $r0;;
     _32(0x780401c1),        //andw $r1 = $r1, 7 (0x7);;
     _32(0x75011040),        //sbfw $r0 = $r0, $r1;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x78043fc0),        //zxbd $r1 = $r0;;
     _64(0x18000000b400870c),        //lws $r0 = 540 (0x21c)[$r12];;
     _64(0x00000000e108880c),        //addd $r2 = $r12, 544 (0x220);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x2405be00),        //sb -264 (0xfffffef8)[$r0] = $r1;;
     _64(0x18000000b004870c),        //lwz $r1 = 540 (0x21c)[$r12];;
     _32(0x7a0237c1),        //sraw $r0 = $r1, 31 (0x1f);;
     _32(0x7b023740),        //srlw $r0 = $r0, 29 (0x1d);;
     _32(0x71051001),        //addw $r1 = $r1, $r0;;
     _32(0x780401c1),        //andw $r1 = $r1, 7 (0x7);;
     _32(0x75011040),        //sbfw $r0 = $r0, $r1;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x75000000),        //negw $r0 = $r0;;
     _32(0x78043fc0),        //zxbd $r1 = $r0;;
     _64(0x18000000b400870c),        //lws $r0 = 540 (0x21c)[$r12];;
     _64(0x00000000e108880c),        //addd $r2 = $r12, 544 (0x220);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _64(0x1fffffffa4057e00),        //sb -520 (0xfffffffffffffdf8)[$r0] = $r1;;
     _32(0x1000002b),        //goto 16ac4 <main+0x174>;;
     _64(0x18000000b004870c),        //lwz $r1 = 540 (0x21c)[$r12];;
     _32(0x7a0237c1),        //sraw $r0 = $r1, 31 (0x1f);;
     _32(0x7b023740),        //srlw $r0 = $r0, 29 (0x1d);;
     _32(0x71051001),        //addw $r1 = $r1, $r0;;
     _32(0x780401c1),        //andw $r1 = $r1, 7 (0x7);;
     _32(0x75011040),        //sbfw $r0 = $r0, $r1;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x75011001),        //sbfw $r0 = $r1, $r0;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x78043fc0),        //zxbd $r1 = $r0;;
     _64(0x18000000b400870c),        //lws $r0 = 540 (0x21c)[$r12];;
     _64(0x00000000e108880c),        //addd $r2 = $r12, 544 (0x220);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x2405be00),        //sb -264 (0xfffffef8)[$r0] = $r1;;
     _64(0x18000000b004870c),        //lwz $r1 = 540 (0x21c)[$r12];;
     _32(0x7a0237c1),        //sraw $r0 = $r1, 31 (0x1f);;
     _32(0x7b023740),        //srlw $r0 = $r0, 29 (0x1d);;
     _32(0x71051001),        //addw $r1 = $r1, $r0;;
     _32(0x780401c1),        //andw $r1 = $r1, 7 (0x7);;
     _32(0x75011040),        //sbfw $r0 = $r0, $r1;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a023040),        //sraw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x75000000),        //negw $r0 = $r0;;
     _32(0x78043fc0),        //zxbd $r1 = $r0;;
     _64(0x18000000b400870c),        //lws $r0 = 540 (0x21c)[$r12];;
     _64(0x00000000e108880c),        //addd $r2 = $r12, 544 (0x220);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _64(0x1fffffffa4057e00),        //sb -520 (0xfffffffffffffdf8)[$r0] = $r1;;
     _64(0x18000000b000870c),        //lwz $r0 = 540 (0x21c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _64(0x18000000a601870c),        //sw 540 (0x21c)[$r12] = $r0;;
     _64(0x18000000b000870c),        //lwz $r0 = 540 (0x21c)[$r12];;
     _64(0x00000007f401b7c0),        //compw.le $r0 = $r0, 255 (0xff);;
     _32(0x0c7fe880),        //cb.wnez $r0? 16970 <main+0x20>;;
     _32(0x6108040c),        //addd $r2 = $r12, 16 (0x10);;
     _32(0x6104060c),        //addd $r1 = $r12, 24 (0x18);;
     _32(0x6100460c),        //addd $r0 = $r12, 280 (0x118);;
     _32(0x6a0c0002),        //copyd $r3 = $r2;;
     _32(0x60080010),        //make $r2 = 16 (0x10);;
     _32(0x1fffff80),        //call 16900 <bar>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _64(0x000003f4f101b000),        //compw.eq $r0 = $r0, 32384 (0x7e80);;
     _32(0x0c000080),        //cb.wnez $r0? 16b18 <main+0x1c8>;;
     _32(0x18000007),        //call 16b30 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _64(0x00000000e130880c),        //addd $r12 = $r12, 544 (0x220);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16f08 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18a38 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100101010000; //0x16950
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100100000000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100101010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101100110000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016950;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
