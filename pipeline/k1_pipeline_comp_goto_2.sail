// executing pipeline comp_goto_2.c.out.dumped test 
val k1_pipeline_comp_goto_2: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_comp_goto_2() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let y_2124: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741080c),        //sd 32 (0x20)[$r12] = $r16;;
     _32(0x2739060c),        //sd 24 (0x18)[$r12] = $r14;;
     _32(0x6138060c),        //addd $r14 = $r12, 24 (0x18);;
     _32(0x2601060e),        //sw 24 (0x18)[$r14] = $r0;;
     _32(0x38000a0e),        //ld $r0 = 40 (0x28)[$r14];;
     _32(0x38040a0e),        //ld $r1 = 40 (0x28)[$r14];;
     _32(0x2705040e),        //sd 16 (0x10)[$r14] = $r1;;
     _96(0x000000008000005ae0042300),        //make $r1 = 92300 (0x1688c);;
     _32(0x2705080e),        //sd 32 (0x20)[$r14] = $r1;;
     _32(0x3004060e),        //lwz $r1 = 24 (0x18)[$r14];;
     _64(0x07fffffff005b7c1),        //compw.ne $r1 = $r1, 4294967295 (0xffffffff);;
     _32(0x0c800281),        //cb.weqz $r1? 16888 <y.2124+0x68>;;
     _32(0x3004060e),        //lwz $r1 = 24 (0x18)[$r14];;
     _32(0x0c000241),        //cb.wnez $r1? 1688c <y.2124+0x6c>;;
     _96(0x000000008000005ae0084300),        //make $r2 = 92428 (0x1690c);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x38300200),        //ld $r12 = 8 (0x8)[$r0];;
     _32(0x6a380001),        //copyd $r14 = $r1;;
     _32(0x0fd80002),        //igoto $r2;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3004060e),        //lwz $r1 = 24 (0x18)[$r14];;
     _32(0x7104ffc1),        //addw $r1 = $r1, -1 (0xffffffff);;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0x27010a0e),        //sd 40 (0x28)[$r14] = $r0;;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x1fffffe0),        //call 16820 <y.2124>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130fa0e),        //addd $r12 = $r14, -24 (0xffffffe8);;
     _32(0x3840080c),        //ld $r16 = 32 (0x20)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838060c),        //ld $r14 = 24 (0x18)[$r12];;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000)        //ret ;;
 |];

let x: list_I = 
 [|
     _32(0x6130c80c),        //addd $r12 = $r12, -224 (0xffffff20);;
     _32(0x2739060c),        //sd 24 (0x18)[$r12] = $r14;;
     _32(0x2849080c),        //sq 32 (0x20)[$r12] = $r18r19;;
     _32(0x28550c0c),        //so 48 (0x30)[$r12] = $r20r21r22r23;;
     _32(0x2865140c),        //so 80 (0x50)[$r12] = $r24r25r26r27;;
     _32(0x28751c0c),        //so 112 (0x70)[$r12] = $r28r29r30r31;;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741240c),        //sd 144 (0x90)[$r12] = $r16;;
     _32(0x2601260c),        //sw 152 (0x98)[$r12] = $r0;;
     _32(0x6100300c),        //addd $r0 = $r12, 192 (0xc0);;
     _32(0x2701280c),        //sd 160 (0xa0)[$r12] = $r0;;
     _32(0x27312a0c),        //sd 168 (0xa8)[$r12] = $r12;;
     _32(0x6100380c),        //addd $r0 = $r12, 224 (0xe0);;
     _32(0x27012e0c),        //sd 184 (0xb8)[$r12] = $r0;;
     _32(0x6100280c),        //addd $r0 = $r12, 160 (0xa0);;
     _32(0x2701300c),        //sd 192 (0xc0)[$r12] = $r0;;
     _32(0x3000260c),        //lwz $r0 = 152 (0x98)[$r12];;
     _32(0x1fffffc7),        //call 16820 <y.2124>;;
     _32(0x10000001),        //goto 1690c <x+0x4c>;;
     _32(0x3000260c),        //lwz $r0 = 152 (0x98)[$r12];;
     _32(0x3838060c),        //ld $r14 = 24 (0x18)[$r12];;
     _32(0x3c48080c),        //lq $r18r19 = 32 (0x20)[$r12];;
     _32(0x3c540c0c),        //lo $r20r21r22r23 = 48 (0x30)[$r12];;
     _32(0x3c64140c),        //lo $r24r25r26r27 = 80 (0x50)[$r12];;
     _32(0x3c741c0c),        //lo $r28r29r30r31 = 112 (0x70)[$r12];;
     _32(0x3840240c),        //ld $r16 = 144 (0x90)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130380c),        //addd $r12 = $r12, 224 (0xe0);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x600003e8),        //make $r0 = 1000 (0x3e8);;
     _32(0x1fffffde),        //call 168c0 <x>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x0000001ff101b200),        //compw.eq $r0 = $r0, 1000 (0x3e8);;
     _32(0x0c000080),        //cb.wnez $r0? 16960 <main+0x28>;;
     _32(0x18000003),        //call 16968 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16988 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16d88 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18a60 <_exit>
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
     _32(0x98000161),        //call 16f20 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 169c4 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18a60 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100111000; //0x16938
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(y_2124, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(x, 0b00010110100011000000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100101101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100110001000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016938;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
