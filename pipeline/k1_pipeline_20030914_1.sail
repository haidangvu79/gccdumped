// executing pipeline 20030914_1 test 
val k1_pipeline_20030914_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20030914_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let f: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2739020c),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x6a380001),        //copyd $r14 = $r1;;
     _32(0x2709040c),        //sd 16 (0x10)[$r12] = $r2;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000000b),        //goto 16868 <f+0x48>;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x3002f00e),        //lwz.xs $r0 = $r0[$r14];;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x44030000),        //floatd.rn $r0 = $r0, 0 (0x0);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x50027001),        //faddd $r0 = $r1, $r0;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f401b3c0),        //compw.le $r0 = $r0, 15 (0xf);;
     _32(0x0c7ffcc0),        //cb.wnez $r0? 16840 <f+0x20>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130d00c),        //addd $r12 = $r12, -192 (0xffffff40);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26012f0c),        //sw 188 (0xbc)[$r12] = $r0;;
     _32(0x1000000c),        //goto 168cc <main+0x44>;;
     _32(0x30002f0c),        //lwz $r0 = 188 (0xbc)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x34002f0c),        //lws $r0 = 188 (0xbc)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x6108300c),        //addd $r2 = $r12, 192 (0xc0);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x2605ee00),        //sw -72 (0xffffffb8)[$r0] = $r1;;
     _32(0x30002f0c),        //lwz $r0 = 188 (0xbc)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26012f0c),        //sw 188 (0xbc)[$r12] = $r0;;
     _32(0x30002f0c),        //lwz $r0 = 188 (0xbc)[$r12];;
     _64(0x00000000f401b3c0),        //compw.le $r0 = $r0, 15 (0xf);;
     _32(0x0c7ffc80),        //cb.wnez $r0? 168a0 <main+0x18>;;
     _32(0x38001e0c),        //ld $r0 = 120 (0x78)[$r12];;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x3800200c),        //ld $r0 = 128 (0x80)[$r12];;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x3800220c),        //ld $r0 = 136 (0x88)[$r12];;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x3800240c),        //ld $r0 = 144 (0x90)[$r12];;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x3800260c),        //ld $r0 = 152 (0x98)[$r12];;
     _32(0x2701100c),        //sd 64 (0x40)[$r12] = $r0;;
     _32(0x3800280c),        //ld $r0 = 160 (0xa0)[$r12];;
     _32(0x2701120c),        //sd 72 (0x48)[$r12] = $r0;;
     _32(0x38002a0c),        //ld $r0 = 168 (0xa8)[$r12];;
     _32(0x2701140c),        //sd 80 (0x50)[$r12] = $r0;;
     _32(0x38002c0c),        //ld $r0 = 176 (0xb0)[$r12];;
     _32(0x2701160c),        //sd 88 (0x58)[$r12] = $r0;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _96(0x02061c4080000000e0080000),        //make $r2 = 4666723172467343360 (0x40c3880000000000);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffffbb),        //call 16820 <f>;;
     _96(0x02061e6080000000e0040000),        //make $r1 = 4666797939258032128 (0x40c3cc0000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16950 <main+0xc8>;;
     _32(0x18000003),        //call 16958 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16978 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16d78 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18a50 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
 |];

let adr_start:bits(addr_bits) = 0b00010110100010001000; //0x16888
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100101011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100101111000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016888;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
