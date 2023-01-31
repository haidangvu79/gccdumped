// executing pipeline 960512_1 test 
val k1_pipeline_960512_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_960512_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let f: list_I = 
 [|
     _32(0x6130d00c),        //addd $r12 = $r12, -192 (0xffffff40);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x44030000),        //floatd.rn $r0 = $r0, 0 (0x0);;
     _32(0x27012c0c),        //sd 176 (0xb0)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x27012e0c),        //sd 184 (0xb8)[$r12] = $r0;;
     _32(0x38042c0c),        //ld $r1 = 176 (0xb0)[$r12];;
     _32(0x38002e0c),        //ld $r0 = 184 (0xb8)[$r12];;
     _32(0x6a0c0001),        //copyd $r3 = $r1;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x6a000003),        //copyd $r0 = $r3;;
     _32(0x6a040002),        //copyd $r1 = $r2;;
     _32(0x6130300c),        //addd $r12 = $r12, 192 (0xc0);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x1fffffeb),        //call 16820 <f>;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x3808060c),        //ld $r2 = 24 (0x18)[$r12];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x7b030001),        //fcompd.une $r0 = $r1, $r0;;
     _32(0x78043fc0),        //zxbd $r1 = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x7b030002),        //fcompd.une $r0 = $r2, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7a011001),        //orw $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 168b4 <main+0x4c>;;
     _32(0x18000004),        //call 168c0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 168e0 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16ce0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 189b8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
 |];

let adr_start:bits(addr_bits) = 0b00010110100001101000; //0x16868
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100001101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100011000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100011100000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016868;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
