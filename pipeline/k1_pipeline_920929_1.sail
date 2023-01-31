// executing pipeline 920929_1.c.out.dumped test 
val k1_pipeline_920929_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_920929_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let f: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x6138040c),        //addd $r14 = $r12, 16 (0x10);;
     _32(0x2601040e),        //sw 16 (0x10)[$r14] = $r0;;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x6a280000),        //copyd $r10 = $r0;;
     _32(0x3004040e),        //lwz $r1 = 16 (0x10)[$r14];;
     _32(0x6903f001),        //sxwd $r0 = $r1;;
     _32(0x6100ffc0),        //addd $r0 = $r0, -1 (0xffffffff);;
     _32(0x2701080e),        //sd 32 (0x20)[$r14] = $r0;;
     _32(0x6903f001),        //sxwd $r0 = $r1;;
     _32(0x6a100000),        //copyd $r4 = $r0;;
     _32(0x60140000),        //make $r5 = 0 (0x0);;
     _32(0x7b022e84),        //srld $r0 = $r4, 58 (0x3a);;
     _32(0x79262185),        //slld $r9 = $r5, 6 (0x6);;
     _32(0x7a250240),        //ord $r9 = $r0, $r9;;
     _32(0x79222184),        //slld $r8 = $r4, 6 (0x6);;
     _32(0x6903f001),        //sxwd $r0 = $r1;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0x7b022e82),        //srld $r0 = $r2, 58 (0x3a);;
     _32(0x791e2183),        //slld $r7 = $r3, 6 (0x6);;
     _32(0x7a1d01c0),        //ord $r7 = $r0, $r7;;
     _32(0x791a2182),        //slld $r6 = $r2, 6 (0x6);;
     _32(0x6903f001),        //sxwd $r0 = $r1;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x610001c0),        //addd $r0 = $r0, 7 (0x7);;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x7b022140),        //srld $r0 = $r0, 5 (0x5);;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x75310300),        //sbfd $r12 = $r0, $r12;;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x610001c0),        //addd $r0 = $r0, 7 (0x7);;
     _32(0x7b0220c0),        //srld $r0 = $r0, 3 (0x3);;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x2701060e),        //sd 24 (0x18)[$r14] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010b0e),        //sw 44 (0x2c)[$r14] = $r0;;
     _32(0x10000008),        //goto 168e0 <f+0xc0>;;
     _32(0x3800060e),        //ld $r0 = 24 (0x18)[$r14];;
     _32(0x34040b0e),        //lws $r1 = 44 (0x2c)[$r14];;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x270bf040),        //sd.xs $r1[$r0] = $r2;;
     _32(0x30000b0e),        //lwz $r0 = 44 (0x2c)[$r14];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010b0e),        //sw 44 (0x2c)[$r14] = $r0;;
     _32(0x30040b0e),        //lwz $r1 = 44 (0x2c)[$r14];;
     _32(0x3000040e),        //lwz $r0 = 16 (0x10)[$r14];;
     _32(0x7201b001),        //compw.lt $r0 = $r1, $r0;;
     _32(0x0c7ffd80),        //cb.wnez $r0? 168c4 <f+0xa4>;;
     _32(0x6a30000a),        //copyd $r12 = $r10;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130fc0e),        //addd $r12 = $r14, -16 (0xfffffff0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838040c),        //ld $r14 = 16 (0x10)[$r12];;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000064),        //make $r0 = 100 (0x64);;
     _32(0x1fffffc0),        //call 16820 <f>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000002),        //call 16930 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0xf838ffc0),        //zxwd $r14 = $r0
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x9800004d),        //call 16a78 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 1696c <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x980002e5),        //call 17500 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100010000; //0x16910
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100100110000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016910;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
