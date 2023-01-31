// executing pipeline 921017_1 test 
val k1_pipeline_921017_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_921017_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let g_2124: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x38000001),        //ld $r0 = 0 (0x0)[$r1];;
     _32(0x3404060c),        //lws $r1 = 24 (0x18)[$r12];;
     _32(0x3002f040),        //lwz.xs $r0 = $r1[$r0];;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let f: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x2739020c),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2749060c),        //sd 24 (0x18)[$r12] = $r18;;
     _32(0x6138020c),        //addd $r14 = $r12, 8 (0x8);;
     _32(0x2601060e),        //sw 24 (0x18)[$r14] = $r0;;
     _32(0x6100160e),        //addd $r0 = $r14, 88 (0x58);;
     _32(0x27010a0e),        //sd 40 (0x28)[$r14] = $r0;;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x6a480000),        //copyd $r18 = $r0;;
     _32(0x3004060e),        //lwz $r1 = 24 (0x18)[$r14];;
     _32(0x6903f001),        //sxwd $r0 = $r1;;
     _32(0x6100ffc0),        //addd $r0 = $r0, -1 (0xffffffff);;
     _32(0x27010c0e),        //sd 48 (0x30)[$r14] = $r0;;
     _32(0x6903f001),        //sxwd $r0 = $r1;;
     _32(0x6a100000),        //copyd $r4 = $r0;;
     _32(0x60140000),        //make $r5 = 0 (0x0);;
     _32(0x7b022ec4),        //srld $r0 = $r4, 59 (0x3b);;
     _32(0x79262145),        //slld $r9 = $r5, 5 (0x5);;
     _32(0x7a250240),        //ord $r9 = $r0, $r9;;
     _32(0x79222144),        //slld $r8 = $r4, 5 (0x5);;
     _32(0x6903f001),        //sxwd $r0 = $r1;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0x7b022ec2),        //srld $r0 = $r2, 59 (0x3b);;
     _32(0x791e2143),        //slld $r7 = $r3, 5 (0x5);;
     _32(0x7a1d01c0),        //ord $r7 = $r0, $r7;;
     _32(0x791a2142),        //slld $r6 = $r2, 5 (0x5);;
     _32(0x6903f001),        //sxwd $r0 = $r1;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x610000c0),        //addd $r0 = $r0, 3 (0x3);;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x7b022140),        //srld $r0 = $r0, 5 (0x5);;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x75310300),        //sbfd $r12 = $r0, $r12;;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x610000c0),        //addd $r0 = $r0, 3 (0x3);;
     _32(0x7b022080),        //srld $r0 = $r0, 2 (0x2);;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x2701080e),        //sd 32 (0x20)[$r14] = $r0;;
     _32(0x3800080e),        //ld $r0 = 32 (0x20)[$r14];;
     _32(0x60041267),        //make $r1 = 4711 (0x1267);;
     _32(0x26050100),        //sw 4 (0x4)[$r0] = $r1;;
     _32(0x6100080e),        //addd $r0 = $r14, 32 (0x20);;
     _32(0x27010e0e),        //sd 56 (0x38)[$r14] = $r0;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffffc7),        //call 16820 <g.2124>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6a300012),        //copyd $r12 = $r18;;
     _32(0x6130fe0e),        //addd $r12 = $r14, -8 (0xfffffff8);;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3848060c),        //ld $r18 = 24 (0x18)[$r12];;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x1fffffc2),        //call 16848 <f>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000093f101b1c0),        //compw.eq $r0 = $r0, 4711 (0x1267);;
     _32(0x0c000080),        //cb.wnez $r0? 16958 <main+0x28>;;
     _32(0x18000003),        //call 16960 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16980 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16d80 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18a58 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
 |];

let adr_start:bits(addr_bits) = 0b00010110100100110000; //0x16930
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(g_2124, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100001001000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100101100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100110000000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016930;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
