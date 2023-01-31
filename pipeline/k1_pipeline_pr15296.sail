// executing pipeline pr15296.c.out.dumped test 
val k1_pipeline_pr15296: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr15296() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let f: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x27050a0c),        //sd 40 (0x28)[$r12] = $r1;;
     _32(0x2709080c),        //sd 32 (0x20)[$r12] = $r2;;
     _32(0x270d060c),        //sd 24 (0x18)[$r12] = $r3;;
     _32(0x2711040c),        //sd 16 (0x10)[$r12] = $r4;;
     _32(0x2715020c),        //sd 8 (0x8)[$r12] = $r5;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701160c),        //sd 88 (0x58)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701140c),        //sd 80 (0x50)[$r12] = $r0;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x2701120c),        //sd 72 (0x48)[$r12] = $r0;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _32(0x2701100c),        //sd 64 (0x40)[$r12] = $r0;;
     _32(0x3800120c),        //ld $r0 = 72 (0x48)[$r12];;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x7301a001),        //compd.ge $r0 = $r1, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16888 <f+0x68>;;
     _32(0x17fffffc),        //goto 16874 <f+0x54>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x08800700),        //cb.deqz $r0? 168fc <f+0xdc>;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x08000680),        //cb.dnez $r0? 16904 <f+0xe4>;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x2701160c),        //sd 88 (0x58)[$r12] = $r0;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x08800180),        //cb.deqz $r0? 168e0 <f+0xc0>;;
     _96(0x00000000800000fce004f000),        //make $r1 = 259008 (0x3f3c0);;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x18000031),        //call 169a0 <g>;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x61000600),        //addd $r0 = $r0, 24 (0x18);;
     _32(0x2701140c),        //sd 80 (0x50)[$r12] = $r0;;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x10000025),        //goto 1698c <f+0x16c>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x10000002),        //goto 16908 <f+0xe8>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x2701160c),        //sd 88 (0x58)[$r12] = $r0;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x08800180),        //cb.deqz $r0? 16940 <f+0x120>;;
     _96(0x00000000800000fce004f000),        //make $r1 = 259008 (0x3f3c0);;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x18000019),        //call 169a0 <g>;;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x2701160c),        //sd 88 (0x58)[$r12] = $r0;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x08000180),        //cb.dnez $r0? 16968 <f+0x148>;;
     _96(0x00000000800000fce004f000),        //make $r1 = 259008 (0x3f3c0);;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x1800000f),        //call 169a0 <g>;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x61000400),        //addd $r0 = $r0, 16 (0x10);;
     _32(0x2701140c),        //sd 80 (0x50)[$r12] = $r0;;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000)        //ret ;;
 |];

let g: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x1800003b)        //call 16aa0 <abort>;;
 |];

let main: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x6000006f),        //make $r0 = 111 (0x6f);;
     _32(0x2701100c),        //sd 64 (0x40)[$r12] = $r0;;
     _32(0x600000de),        //make $r0 = 222 (0xde);;
     _32(0x2701120c),        //sd 72 (0x48)[$r12] = $r0;;
     _32(0x6000014d),        //make $r0 = 333 (0x14d);;
     _32(0x2701140c),        //sd 80 (0x50)[$r12] = $r0;;
     _32(0x600001bc),        //make $r0 = 444 (0x1bc);;
     _32(0x2701160c),        //sd 88 (0x58)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x6000022b),        //make $r0 = 555 (0x22b);;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x600003e7),        //make $r0 = 999 (0x3e7);;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x60000309),        //make $r0 = 777 (0x309);;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x6104100c),        //addd $r1 = $r12, 64 (0x40);;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x6a140001),        //copyd $r5 = $r1;;
     _32(0x60102710),        //make $r4 = 10000 (0x2710);;
     _32(0x600c4e20),        //make $r3 = 20000 (0x4e20);;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff7d),        //call 16820 <f>;;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x7001a001),        //compd.ne $r0 = $r1, $r0;;
     _32(0x08000580),        //cb.dnez $r0? 16a94 <main+0xdc>;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x08000500),        //cb.dnez $r0? 16a94 <main+0xdc>;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _64(0x00000000e001f9c0),        //compd.ne $r0 = $r0, 999 (0x3e7);;
     _32(0x08000400),        //cb.dnez $r0? 16a94 <main+0xdc>;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _64(0x00000000e001c240),        //compd.ne $r0 = $r0, 777 (0x309);;
     _32(0x08000300),        //cb.dnez $r0? 16a94 <main+0xdc>;;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x60011bc0),        //compd.ne $r0 = $r0, 111 (0x6f);;
     _32(0x08000240),        //cb.dnez $r0? 16a94 <main+0xdc>;;
     _32(0x3800120c),        //ld $r0 = 72 (0x48)[$r12];;
     _32(0x60013780),        //compd.ne $r0 = $r0, 222 (0xde);;
     _32(0x08000180),        //cb.dnez $r0? 16a94 <main+0xdc>;;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _32(0x08000100),        //cb.dnez $r0? 16a94 <main+0xdc>;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x61016f00),        //compd.eq $r0 = $r0, 444 (0x1bc);;
     _32(0x08000080),        //cb.dnez $r0? 16a98 <main+0xe0>;;
     _32(0x18000003),        //call 16aa0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16ac0 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16ec0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18b98 <_exit>
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
     _32(0x98000161),        //call 17058 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f200),        //make $r0 = 259016 (0x3f3c8);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16afc <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18b98 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100110111000; //0x169b8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(g, 0b00010110100110100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100110111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101010100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110101011000000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000169b8;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
