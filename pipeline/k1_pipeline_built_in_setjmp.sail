// executing pipeline built_in_setjmp test 
val k1_pipeline_built_in_setjmp: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_built_in_setjmp() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let sub2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x6138040c),        //addd $r14 = $r12, 16 (0x10);;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x38040200),        //ld $r1 = 8 (0x8)[$r0];;
     _32(0x38080000),        //ld $r2 = 0 (0x0)[$r0];;
     _32(0x38300400),        //ld $r12 = 16 (0x10)[$r0];;
     _32(0x6a380002),        //copyd $r14 = $r2;;
     _32(0x0fd80001),        //igoto $r1;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130d80c),        //addd $r12 = $r12, -160 (0xffffff60);;
     _32(0x2739020c),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0x2849060c),        //sq 24 (0x18)[$r12] = $r18r19;;
     _32(0x28550a0c),        //so 40 (0x28)[$r12] = $r20r21r22r23;;
     _32(0x2865120c),        //so 72 (0x48)[$r12] = $r24r25r26r27;;
     _32(0x28751a0c),        //so 104 (0x68)[$r12] = $r28r29r30r31;;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x6138020c),        //addd $r14 = $r12, 8 (0x8);;
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x7b022140),        //srld $r0 = $r0, 5 (0x5);;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x2701220e),        //sd 136 (0x88)[$r14] = $r0;;
     _32(0x3800220e),        //ld $r0 = 136 (0x88)[$r14];;
     _64(0x001d1cd9e0045d00),        //make $r1 = 1953719668 (0x74736574);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x24050100),        //sb 4 (0x4)[$r0] = $r1;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x6104260e),        //addd $r1 = $r14, 152 (0x98);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _96(0x000000008000005ae0043700),        //make $r1 = 92380 (0x168dc);;
     _32(0x27050200),        //sd 8 (0x8)[$r0] = $r1;;
     _32(0x27310400),        //sd 16 (0x10)[$r0] = $r12;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000003),        //goto 168e4 <main+0x8c>;;
     _32(0x6138da0e),        //addd $r14 = $r14, -152 (0xffffff68);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x088002c0),        //cb.deqz $r0? 16914 <main+0xbc>;;
     _96(0x00000000800000fce004f000),        //make $r1 = 259008 (0x3f3c0);;
     _32(0x3800220e),        //ld $r0 = 136 (0x88)[$r14];;
     _32(0x18000199),        //call 16f60 <strcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 1690c <main+0xb4>;;
     _32(0x18000028),        //call 169a8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800002e),        //call 169c8 <exit>;;
     _32(0x3800220e),        //ld $r0 = 136 (0x88)[$r14];;
     _32(0x61000080),        //addd $r0 = $r0, 2 (0x2);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x7b022140),        //srld $r0 = $r0, 5 (0x5);;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x75310300),        //sbfd $r12 = $r0, $r12;;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x7b022140),        //srld $r0 = $r0, 5 (0x5);;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x2701200e),        //sd 128 (0x80)[$r14] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601250e),        //sw 148 (0x94)[$r14] = $r0;;
     _32(0x1000000a),        //goto 16980 <main+0x128>;;
     _32(0x3400250e),        //lws $r0 = 148 (0x94)[$r14];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x3804200e),        //ld $r1 = 128 (0x80)[$r14];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x3000250e),        //lwz $r0 = 148 (0x94)[$r14];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601250e),        //sw 148 (0x94)[$r14] = $r0;;
     _32(0x3800220e),        //ld $r0 = 136 (0x88)[$r14];;
     _32(0x61000080),        //addd $r0 = $r0, 2 (0x2);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004250e),        //lwz $r1 = 148 (0x94)[$r14];;
     _32(0x7201b001),        //compw.lt $r0 = $r1, $r0;;
     _32(0x0c7ffc00),        //cb.wnez $r0? 1695c <main+0x104>;;
     _32(0x1fffffa0),        //call 16820 <sub2>;;
     _32(0x17ffffff)        //goto 169a0 <main+0x148>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16dc8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000869),        //call 18b60 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0xf838ffc0),        //zxwd $r14 = $r0
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x98000191),        //call 17020 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f200),        //make $r0 = 259016 (0x3f3c8);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16a04 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000857),        //call 18b60 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100001011000; //0x16858
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(sub2, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100001011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100110101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit, 0b00010110100111001000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016858;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
