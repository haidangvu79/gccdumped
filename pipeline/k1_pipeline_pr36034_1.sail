// executing pipeline pr36034_1.c.out.dumped test 
val k1_pipeline_pr36034_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr36034_1() = {
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
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000086),        //goto 16a44 <test+0x224>;;
     _96(0x00000000800000f8e0080200),        //make $r2 = 253960 (0x3e008);;
     _32(0x3404070c),        //lws $r1 = 28 (0x1c)[$r12];;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x79022100),        //slld $r0 = $r0, 4 (0x4);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x38080000),        //ld $r2 = 0 (0x0)[$r0];;
     _96(0x0000000080000117e00c8200),        //make $r3 = 286216 (0x45e08);;
     _32(0x3404070c),        //lws $r1 = 28 (0x1c)[$r12];;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x79022100),        //slld $r0 = $r0, 4 (0x4);;
     _32(0x71010003),        //addd $r0 = $r3, $r0;;
     _32(0x27090000),        //sd 0 (0x0)[$r0] = $r2;;
     _96(0x00000000800000f8e0080200),        //make $r2 = 253960 (0x3e008);;
     _32(0x3404070c),        //lws $r1 = 28 (0x1c)[$r12];;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x79022100),        //slld $r0 = $r0, 4 (0x4);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _32(0x38080000),        //ld $r2 = 0 (0x0)[$r0];;
     _96(0x0000000080000117e00c8200),        //make $r3 = 286216 (0x45e08);;
     _32(0x3404070c),        //lws $r1 = 28 (0x1c)[$r12];;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x79022100),        //slld $r0 = $r0, 4 (0x4);;
     _32(0x71010003),        //addd $r0 = $r3, $r0;;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _32(0x27090000),        //sd 0 (0x0)[$r0] = $r2;;
     _96(0x00000000800000f8e0080200),        //make $r2 = 253960 (0x3e008);;
     _32(0x3404070c),        //lws $r1 = 28 (0x1c)[$r12];;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x79022100),        //slld $r0 = $r0, 4 (0x4);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x61000400),        //addd $r0 = $r0, 16 (0x10);;
     _32(0x38080000),        //ld $r2 = 0 (0x0)[$r0];;
     _96(0x0000000080000117e00c8200),        //make $r3 = 286216 (0x45e08);;
     _32(0x3404070c),        //lws $r1 = 28 (0x1c)[$r12];;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x79022100),        //slld $r0 = $r0, 4 (0x4);;
     _32(0x71010003),        //addd $r0 = $r3, $r0;;
     _32(0x61000400),        //addd $r0 = $r0, 16 (0x10);;
     _32(0x27090000),        //sd 0 (0x0)[$r0] = $r2;;
     _96(0x00000000800000f8e0080200),        //make $r2 = 253960 (0x3e008);;
     _32(0x3404070c),        //lws $r1 = 28 (0x1c)[$r12];;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x79022100),        //slld $r0 = $r0, 4 (0x4);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x61000600),        //addd $r0 = $r0, 24 (0x18);;
     _32(0x38080000),        //ld $r2 = 0 (0x0)[$r0];;
     _96(0x0000000080000117e00c8200),        //make $r3 = 286216 (0x45e08);;
     _32(0x3404070c),        //lws $r1 = 28 (0x1c)[$r12];;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x79022100),        //slld $r0 = $r0, 4 (0x4);;
     _32(0x71010003),        //addd $r0 = $r3, $r0;;
     _32(0x61000600),        //addd $r0 = $r0, 24 (0x18);;
     _32(0x27090000),        //sd 0 (0x0)[$r0] = $r2;;
     _96(0x00000000800000f8e0080200),        //make $r2 = 253960 (0x3e008);;
     _32(0x3404070c),        //lws $r1 = 28 (0x1c)[$r12];;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x79022100),        //slld $r0 = $r0, 4 (0x4);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x61000800),        //addd $r0 = $r0, 32 (0x20);;
     _32(0x38080000),        //ld $r2 = 0 (0x0)[$r0];;
     _96(0x0000000080000117e00c8200),        //make $r3 = 286216 (0x45e08);;
     _32(0x3404070c),        //lws $r1 = 28 (0x1c)[$r12];;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x79022100),        //slld $r0 = $r0, 4 (0x4);;
     _32(0x71010003),        //addd $r0 = $r3, $r0;;
     _32(0x61000800),        //addd $r0 = $r0, 32 (0x20);;
     _32(0x27090000),        //sd 0 (0x0)[$r0] = $r2;;
     _96(0x00000000800000f8e0080200),        //make $r2 = 253960 (0x3e008);;
     _32(0x3404070c),        //lws $r1 = 28 (0x1c)[$r12];;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x79022100),        //slld $r0 = $r0, 4 (0x4);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x61000a00),        //addd $r0 = $r0, 40 (0x28);;
     _32(0x38080000),        //ld $r2 = 0 (0x0)[$r0];;
     _96(0x0000000080000117e00c8200),        //make $r3 = 286216 (0x45e08);;
     _32(0x3404070c),        //lws $r1 = 28 (0x1c)[$r12];;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x79022100),        //slld $r0 = $r0, 4 (0x4);;
     _32(0x71010003),        //addd $r0 = $r3, $r0;;
     _32(0x61000a00),        //addd $r0 = $r0, 40 (0x28);;
     _32(0x27090000),        //sd 0 (0x0)[$r0] = $r2;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f401b100),        //compw.le $r0 = $r0, 4 (0x4);;
     _32(0x0c7fde00),        //cb.wnez $r0? 16830 <test+0x10>;;
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
     _32(0x1fffff6b),        //call 16820 <test>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000001f),        //goto 16afc <main+0x94>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x10000015),        //goto 16ae0 <main+0x78>;;
     _96(0x0000000080000117e00c8200),        //make $r3 = 286216 (0x45e08);;
     _32(0x3408060c),        //lws $r2 = 24 (0x18)[$r12];;
     _32(0x3404070c),        //lws $r1 = 28 (0x1c)[$r12];;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x71010080),        //addd $r0 = $r0, $r2;;
     _32(0x3802f003),        //ld.xs $r0 = $r0[$r3];;
     _96(0x05ff800080000000e0040000),        //make $r1 = 13830554455654793216 (0xbff0000000000000);;
     _32(0x7b030040),        //fcompd.une $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16ad4 <main+0x6c>;;
     _32(0x18000014),        //call 16b20 <abort>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f401b140),        //compw.le $r0 = $r0, 5 (0x5);;
     _32(0x0c7ffa40),        //cb.wnez $r0? 16a90 <main+0x28>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f401b100),        //compw.le $r0 = $r0, 4 (0x4);;
     _32(0x0c7ff7c0),        //cb.wnez $r0? 16a84 <main+0x1c>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16ef8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18a28 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101001101000; //0x16a68
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101001101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101100100000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016a68;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
