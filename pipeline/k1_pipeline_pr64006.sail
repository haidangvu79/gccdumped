// executing pipeline pr64006.c.out.dumped test 
val k1_pipeline_pr64006: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr64006() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let test: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701020c),        //sd 8 (0x8)[$r12] = $r0;;
     _32(0x2605000c),        //sw 0 (0x0)[$r12] = $r1;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000021),        //goto 168c0 <test+0xa0>;;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x3810020c),        //ld $r4 = 8 (0x8)[$r12];;
     _32(0x71010004),        //addd $r0 = $r4, $r0;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x60140000),        //make $r5 = 0 (0x0);;
     _32(0x58041001),        //muldt $r0r1 = $r1, $r0;;
     _32(0x7a0a2001),        //srad $r2 = $r1, 0 (0x0);;
     _32(0x7a0e2fc1),        //srad $r3 = $r1, 63 (0x3f);;
     _32(0x7a122fc0),        //srad $r4 = $r0, 63 (0x3f);;
     _32(0x7111a084),        //compd.eq $r4 = $r4, $r2;;
     _32(0x08000084),        //cb.dnez $r4? 16878 <test+0x58>;;
     _32(0x60140001),        //make $r5 = 1 (0x1);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x6a000005),        //copyd $r0 = $r5;;
     _32(0x78000040),        //andw $r0 = $r0, 1 (0x1);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x088002c0),        //cb.deqz $r0? 168b4 <test+0x94>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x3000000c),        //lwz $r0 = 0 (0x0)[$r12];;
     _32(0x7201b001),        //compw.lt $r0 = $r1, $r0;;
     _32(0x0c7ff740),        //cb.wnez $r0? 16840 <test+0x20>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x600003cf),        //make $r0 = 975 (0x3cf);;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x600003cf),        //make $r0 = 975 (0x3cf);;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x600003cf),        //make $r0 = 975 (0x3cf);;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x600003cf),        //make $r0 = 975 (0x3cf);;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x600003cf),        //make $r0 = 975 (0x3cf);;
     _32(0x2701100c),        //sd 64 (0x40)[$r12] = $r0;;
     _32(0x600003cf),        //make $r0 = 975 (0x3cf);;
     _32(0x2701120c),        //sd 72 (0x48)[$r12] = $r0;;
     _32(0x600003cf),        //make $r0 = 975 (0x3cf);;
     _32(0x2701140c),        //sd 80 (0x50)[$r12] = $r0;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x60040007),        //make $r1 = 7 (0x7);;
     _32(0x1fffffbd),        //call 16820 <test>;;
     _32(0x2701160c),        //sd 88 (0x58)[$r12] = $r0;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16954 <main+0x74>;;
     _32(0x18000006),        //call 16968 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16d40 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18870 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100011100000; //0x168e0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100011100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100101101000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000168e0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
