// executing pipeline 931004_6.c.out.dumped test 
val k1_pipeline_931004_6: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_931004_6() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let f: list_I = 
 [|
     _32(0x6130d80c),        //addd $r12 = $r12, -160 (0xffffff60);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2705120c),        //sd 72 (0x48)[$r12] = $r1;;
     _32(0x2809140c),        //sq 80 (0x50)[$r12] = $r2r3;;
     _32(0x2811180c),        //sq 96 (0x60)[$r12] = $r4r5;;
     _32(0x28191c0c),        //sq 112 (0x70)[$r12] = $r6r7;;
     _32(0x2821200c),        //sq 128 (0x80)[$r12] = $r8r9;;
     _32(0x2829240c),        //sq 144 (0x90)[$r12] = $r10r11;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x6100120c),        //addd $r0 = $r12, 72 (0x48);;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x1000001b),        //goto 168c4 <f+0xa4>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705080c),        //sd 32 (0x20)[$r12] = $r1;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x26010a0c),        //sw 40 (0x28)[$r12] = $r0;;
     _32(0x28000a0c),        //lhz $r0 = 40 (0x28)[$r12];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x71000280),        //addw $r0 = $r0, 10 (0xa);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16894 <f+0x74>;;
     _32(0x18000038),        //call 16970 <abort>;;
     _32(0x28000a8c),        //lhz $r0 = 42 (0x2a)[$r12];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x71000500),        //addw $r0 = $r0, 20 (0x14);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 168b8 <f+0x98>;;
     _32(0x1800002f),        //call 16970 <abort>;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x30040f0c),        //lwz $r1 = 60 (0x3c)[$r12];;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7201b001),        //compw.lt $r0 = $r1, $r0;;
     _32(0x0c7ff8c0),        //cb.wnez $r0? 1685c <f+0x3c>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705080c),        //sd 32 (0x20)[$r12] = $r1;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x61011ec0),        //compd.eq $r0 = $r0, 123 (0x7b);;
     _32(0x08000080),        //cb.dnez $r0? 168f8 <f+0xd8>;;
     _32(0x1800001f),        //call 16970 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130280c),        //addd $r12 = $r12, 160 (0xa0);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x6000000a),        //make $r0 = 10 (0xa);;
     _32(0x2501040c),        //sh 16 (0x10)[$r12] = $r0;;
     _32(0x6000000b),        //make $r0 = 11 (0xb);;
     _32(0x2501050c),        //sh 20 (0x14)[$r12] = $r0;;
     _32(0x6000000c),        //make $r0 = 12 (0xc);;
     _32(0x2501060c),        //sh 24 (0x18)[$r12] = $r0;;
     _32(0x60000014),        //make $r0 = 20 (0x14);;
     _32(0x2501048c),        //sh 18 (0x12)[$r12] = $r0;;
     _32(0x60000015),        //make $r0 = 21 (0x15);;
     _32(0x2501058c),        //sh 22 (0x16)[$r12] = $r0;;
     _32(0x60000016),        //make $r0 = 22 (0x16);;
     _32(0x2501068c),        //sh 26 (0x1a)[$r12] = $r0;;
     _32(0x6010007b),        //make $r4 = 123 (0x7b);;
     _32(0x300c060c),        //lwz $r3 = 24 (0x18)[$r12];;
     _32(0x3008050c),        //lwz $r2 = 20 (0x14)[$r12];;
     _32(0x3004040c),        //lwz $r1 = 16 (0x10)[$r12];;
     _32(0x60000003),        //make $r0 = 3 (0x3);;
     _32(0x1fffffb0),        //call 16820 <f>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 16990 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16d90 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18a68 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0xf838ffc0),        //zxwd $r14 = $r0
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x98000161),        //call 16f28 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 169cc <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18a68 <_exit>
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
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100101110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100110010000, num_instr, mI);
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
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
