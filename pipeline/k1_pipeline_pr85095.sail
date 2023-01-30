// executing pipeline pr85095 test 
val k1_pipeline_pr85095: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr85095() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let f1: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2705020c),        //sd 8 (0x8)[$r12] = $r1;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x3804020c),        //ld $r1 = 8 (0x8)[$r12];;
     _32(0x71050040),        //addd $r1 = $r0, $r1;;
     _32(0x7701a001),        //compd.geu $r0 = $r1, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16848 <f1+0x28>;;
     _32(0x60080001),        //make $r2 = 1 (0x1);;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x6a000002),        //copyd $r0 = $r2;;
     _32(0x78000040),        //andw $r0 = $r0, 1 (0x1);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let f2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2705020c),        //sd 8 (0x8)[$r12] = $r1;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x3804020c),        //ld $r1 = 8 (0x8)[$r12];;
     _32(0x71050040),        //addd $r1 = $r0, $r1;;
     _32(0x7701a001),        //compd.geu $r0 = $r1, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 168a0 <f2+0x28>;;
     _32(0x60080001),        //make $r2 = 1 (0x1);;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x6a000002),        //copyd $r0 = $r2;;
     _32(0x78000040),        //andw $r0 = $r0, 1 (0x1);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x75010040),        //sbfd $r0 = $r0, $r1;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let f3: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x7105a040),        //compd.eq $r1 = $r0, $r1;;
     _32(0x08000081),        //cb.dnez $r1? 168fc <f3+0x2c>;;
     _32(0x60080001),        //make $r2 = 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x7800ffc2),        //zxwd $r0 = $r2;;
     _32(0x78000040),        //andw $r0 = $r0, 1 (0x1);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let f4: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x7105a040),        //compd.eq $r1 = $r0, $r1;;
     _32(0x08000081),        //cb.dnez $r1? 1695c <f4+0x2c>;;
     _32(0x60080001),        //make $r2 = 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x7800ffc2),        //zxwd $r0 = $r2;;
     _32(0x78000040),        //andw $r0 = $r0, 1 (0x1);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x75011040),        //sbfw $r0 = $r0, $r1;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x6004ffee),        //make $r1 = -18 (0xffffffee);;
     _32(0x60000010),        //make $r0 = 16 (0x10);;
     _32(0x1fffff9f),        //call 16820 <f1>;;
     _32(0x6001ff80),        //compd.ne $r0 = $r0, -2 (0xfffffffe);;
     _32(0x080013c0),        //cb.dnez $r0? 16ae8 <main+0x158>;;
     _32(0x6004ffef),        //make $r1 = -17 (0xffffffef);;
     _32(0x60000010),        //make $r0 = 16 (0x10);;
     _32(0x1fffff9a),        //call 16820 <f1>;;
     _32(0x6001ffc0),        //compd.ne $r0 = $r0, -1 (0xffffffff);;
     _32(0x08001280),        //cb.dnez $r0? 16ae8 <main+0x158>;;
     _32(0x6004fff0),        //make $r1 = -16 (0xfffffff0);;
     _32(0x60000010),        //make $r0 = 16 (0x10);;
     _32(0x1fffff95),        //call 16820 <f1>;;
     _32(0x60010040),        //compd.ne $r0 = $r0, 1 (0x1);;
     _32(0x08001140),        //cb.dnez $r0? 16ae8 <main+0x158>;;
     _32(0x6004fff1),        //make $r1 = -15 (0xfffffff1);;
     _32(0x60000010),        //make $r0 = 16 (0x10);;
     _32(0x1fffff90),        //call 16820 <f1>;;
     _32(0x60010080),        //compd.ne $r0 = $r0, 2 (0x2);;
     _32(0x08001000),        //cb.dnez $r0? 16ae8 <main+0x158>;;
     _32(0x6004ffe6),        //make $r1 = -26 (0xffffffe6);;
     _32(0x60000018),        //make $r0 = 24 (0x18);;
     _32(0x1fffffa1),        //call 16878 <f2>;;
     _32(0x6001ff80),        //compd.ne $r0 = $r0, -2 (0xfffffffe);;
     _32(0x08000ec0),        //cb.dnez $r0? 16ae8 <main+0x158>;;
     _32(0x6004ffe7),        //make $r1 = -25 (0xffffffe7);;
     _32(0x60000018),        //make $r0 = 24 (0x18);;
     _32(0x1fffff9c),        //call 16878 <f2>;;
     _32(0x6001ffc0),        //compd.ne $r0 = $r0, -1 (0xffffffff);;
     _32(0x08000d80),        //cb.dnez $r0? 16ae8 <main+0x158>;;
     _32(0x6004ffe8),        //make $r1 = -24 (0xffffffe8);;
     _32(0x60000018),        //make $r0 = 24 (0x18);;
     _32(0x1fffff97),        //call 16878 <f2>;;
     _32(0x6001ffc0),        //compd.ne $r0 = $r0, -1 (0xffffffff);;
     _32(0x08000c40),        //cb.dnez $r0? 16ae8 <main+0x158>;;
     _32(0x6004ffe9),        //make $r1 = -23 (0xffffffe9);;
     _32(0x60000018),        //make $r0 = 24 (0x18);;
     _32(0x1fffff92),        //call 16878 <f2>;;
     _32(0x08000b40),        //cb.dnez $r0? 16ae8 <main+0x158>;;
     _32(0x6004ffde),        //make $r1 = -34 (0xffffffde);;
     _32(0x60000020),        //make $r0 = 32 (0x20);;
     _32(0x1fffffa4),        //call 168d0 <f3>;;
     _64(0x003fffffe001ff80),        //compd.ne $r0 = $r0, 4294967294 (0xfffffffe);;
     _32(0x080009c0),        //cb.dnez $r0? 16ae8 <main+0x158>;;
     _32(0x6004ffdf),        //make $r1 = -33 (0xffffffdf);;
     _32(0x60000020),        //make $r0 = 32 (0x20);;
     _32(0x1fffff9e),        //call 168d0 <f3>;;
     _64(0x003fffffe001ffc0),        //compd.ne $r0 = $r0, 4294967295 (0xffffffff);;
     _32(0x08000840),        //cb.dnez $r0? 16ae8 <main+0x158>;;
     _32(0x6004ffe0),        //make $r1 = -32 (0xffffffe0);;
     _32(0x60000020),        //make $r0 = 32 (0x20);;
     _32(0x1fffff98),        //call 168d0 <f3>;;
     _32(0x60010040),        //compd.ne $r0 = $r0, 1 (0x1);;
     _32(0x08000700),        //cb.dnez $r0? 16ae8 <main+0x158>;;
     _32(0x6004ffe1),        //make $r1 = -31 (0xffffffe1);;
     _32(0x60000020),        //make $r0 = 32 (0x20);;
     _32(0x1fffff93),        //call 168d0 <f3>;;
     _32(0x60010080),        //compd.ne $r0 = $r0, 2 (0x2);;
     _32(0x080005c0),        //cb.dnez $r0? 16ae8 <main+0x158>;;
     _32(0x6004ffdb),        //make $r1 = -37 (0xffffffdb);;
     _32(0x60000023),        //make $r0 = 35 (0x23);;
     _32(0x1fffffa6),        //call 16930 <f4>;;
     _64(0x003fffffe001ff80),        //compd.ne $r0 = $r0, 4294967294 (0xfffffffe);;
     _32(0x08000440),        //cb.dnez $r0? 16ae8 <main+0x158>;;
     _32(0x6004ffdc),        //make $r1 = -36 (0xffffffdc);;
     _32(0x60000023),        //make $r0 = 35 (0x23);;
     _32(0x1fffffa0),        //call 16930 <f4>;;
     _64(0x003fffffe001ffc0),        //compd.ne $r0 = $r0, 4294967295 (0xffffffff);;
     _32(0x080002c0),        //cb.dnez $r0? 16ae8 <main+0x158>;;
     _32(0x6004ffdd),        //make $r1 = -35 (0xffffffdd);;
     _32(0x60000023),        //make $r0 = 35 (0x23);;
     _32(0x1fffff9a),        //call 16930 <f4>;;
     _64(0x003fffffe001ffc0),        //compd.ne $r0 = $r0, 4294967295 (0xffffffff);;
     _32(0x08000140),        //cb.dnez $r0? 16ae8 <main+0x158>;;
     _32(0x6004ffde),        //make $r1 = -34 (0xffffffde);;
     _32(0x60000023),        //make $r0 = 35 (0x23);;
     _32(0x1fffff94),        //call 16930 <f4>;;
     _32(0x08800080),        //cb.deqz $r0? 16aec <main+0x15c>;;
     _32(0x18000006),        //call 16b00 <abort>;;
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
     _32(0x980000f3),        //call 16ed8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18a08 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100110010000; //0x16990
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f1, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f2, 0b00010110100001111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f3, 0b00010110100011010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f4, 0b00010110100100110000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100110010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101100000000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016990;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
