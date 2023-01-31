// executing pipeline 921029_1 test 
val k1_pipeline_921029_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_921029_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let build: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _96(0x0000000080000117e0042600),        //make $r1 = 285848 (0x45c98);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x79022800),        //slld $r0 = $r0, 32 (0x20);;
     _96(0x0000000080000117e0042600),        //make $r1 = 285848 (0x45c98);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _96(0x0000000080000117e0042400),        //make $r1 = 285840 (0x45c90);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _64(0x003fffffe800ffc0),        //andd $r0 = $r0, 4294967295 (0xffffffff);;
     _96(0x0000000080000117e0042400),        //make $r1 = 285840 (0x45c90);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x7a010001),        //ord $r0 = $r1, $r0;;
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffc7),        //call 16820 <build>;;
     _32(0x61010040),        //compd.eq $r0 = $r0, 1 (0x1);;
     _32(0x08000080),        //cb.dnez $r0? 16914 <main+0x24>;;
     _32(0x18000056),        //call 16a68 <abort>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffc1),        //call 16820 <build>;;
     _32(0x08800080),        //cb.deqz $r0? 16928 <main+0x38>;;
     _32(0x18000051),        //call 16a68 <abort>;;
     _64(0x003fffffe004ffc0),        //make $r1 = 4294967295 (0xffffffff);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffbb),        //call 16820 <build>;;
     _64(0x003fffffe101ffc0),        //compd.eq $r0 = $r0, 4294967295 (0xffffffff);;
     _32(0x08000080),        //cb.dnez $r0? 16948 <main+0x58>;;
     _32(0x18000049),        //call 16a68 <abort>;;
     _64(0x003fffffe004ff80),        //make $r1 = 4294967294 (0xfffffffe);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffb3),        //call 16820 <build>;;
     _64(0x003fffffe101ff80),        //compd.eq $r0 = $r0, 4294967294 (0xfffffffe);;
     _32(0x08000080),        //cb.dnez $r0? 16968 <main+0x78>;;
     _32(0x18000041),        //call 16a68 <abort>;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffffac),        //call 16820 <build>;;
     _64(0x00400000e1010040),        //compd.eq $r0 = $r0, 4294967297 (0x100000001);;
     _32(0x08000080),        //cb.dnez $r0? 16984 <main+0x94>;;
     _32(0x1800003a),        //call 16a68 <abort>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffffa5),        //call 16820 <build>;;
     _64(0x00400000e1010000),        //compd.eq $r0 = $r0, 4294967296 (0x100000000);;
     _32(0x08000080),        //cb.dnez $r0? 169a0 <main+0xb0>;;
     _32(0x18000033),        //call 16a68 <abort>;;
     _64(0x003fffffe004ffc0),        //make $r1 = 4294967295 (0xffffffff);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffff9d),        //call 16820 <build>;;
     _64(0x007fffffe101ffc0),        //compd.eq $r0 = $r0, 8589934591 (0x1ffffffff);;
     _32(0x08000080),        //cb.dnez $r0? 169c0 <main+0xd0>;;
     _32(0x1800002b),        //call 16a68 <abort>;;
     _64(0x003fffffe004ff80),        //make $r1 = 4294967294 (0xfffffffe);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffff95),        //call 16820 <build>;;
     _64(0x007fffffe101ff80),        //compd.eq $r0 = $r0, 8589934590 (0x1fffffffe);;
     _32(0x08000080),        //cb.dnez $r0? 169e0 <main+0xf0>;;
     _32(0x18000023),        //call 16a68 <abort>;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _64(0x003fffffe000ffc0),        //make $r0 = 4294967295 (0xffffffff);;
     _32(0x1fffff8d),        //call 16820 <build>;;
     _64(0x07c00000e1010040),        //compd.eq $r0 = $r0, -4294967295 (0xffffffff00000001);;
     _32(0x08000080),        //cb.dnez $r0? 16a00 <main+0x110>;;
     _32(0x1800001b),        //call 16a68 <abort>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _64(0x003fffffe000ffc0),        //make $r0 = 4294967295 (0xffffffff);;
     _32(0x1fffff85),        //call 16820 <build>;;
     _64(0x07c00000e1010000),        //compd.eq $r0 = $r0, -4294967296 (0xffffffff00000000);;
     _32(0x08000080),        //cb.dnez $r0? 16a20 <main+0x130>;;
     _32(0x18000013),        //call 16a68 <abort>;;
     _64(0x003fffffe004ffc0),        //make $r1 = 4294967295 (0xffffffff);;
     _64(0x003fffffe000ffc0),        //make $r0 = 4294967295 (0xffffffff);;
     _32(0x1fffff7c),        //call 16820 <build>;;
     _32(0x6101ffc0),        //compd.eq $r0 = $r0, -1 (0xffffffff);;
     _32(0x08000080),        //cb.dnez $r0? 16a40 <main+0x150>;;
     _32(0x1800000b),        //call 16a68 <abort>;;
     _64(0x003fffffe004ff80),        //make $r1 = 4294967294 (0xfffffffe);;
     _64(0x003fffffe000ffc0),        //make $r0 = 4294967295 (0xffffffff);;
     _32(0x1fffff74),        //call 16820 <build>;;
     _32(0x6101ff80),        //compd.eq $r0 = $r0, -2 (0xfffffffe);;
     _32(0x08000080),        //cb.dnez $r0? 16a60 <main+0x170>;;
     _32(0x18000003),        //call 16a68 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16a88 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16e88 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18b60 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
 |];

let adr_start:bits(addr_bits) = 0b00010110100011110000; //0x168f0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(build, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100011110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101001101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110101010001000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000168f0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
