// executing pipeline 20021118_2.c.out.dumped test 
val k1_pipeline_20021118_2: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20021118_2() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let t1: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x26050c0c),        //sw 48 (0x30)[$r12] = $r1;;
     _32(0x27090a0c),        //sd 40 (0x28)[$r12] = $r2;;
     _32(0x270d080c),        //sd 32 (0x20)[$r12] = $r3;;
     _32(0x38040a0c),        //ld $r1 = 40 (0x28)[$r12];;
     _96(0x0200400080000000e0000000),        //make $r0 = 4613937818241073152 (0x4008000000000000);;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x34000c0c),        //lws $r0 = 48 (0x30)[$r12];;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x71050001),        //addd $r1 = $r1, $r0;;
     _32(0x34000c0c),        //lws $r0 = 48 (0x30)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x38080e0c),        //ld $r2 = 56 (0x38)[$r12];;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x30040001),        //lwz $r1 = 0 (0x0)[$r1];;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x3808080c),        //ld $r2 = 32 (0x20)[$r12];;
     _64(0x00101800e0040000),        //make $r1 = 1080033280 (0x40600000);;
     _64(0x00100800e0000000),        //make $r0 = 1075838976 (0x40200000);;
     _32(0x0fdc0002),        //icall $r2;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let t2: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x26050c0c),        //sw 48 (0x30)[$r12] = $r1;;
     _32(0x27090a0c),        //sd 40 (0x28)[$r12] = $r2;;
     _32(0x270d080c),        //sd 32 (0x20)[$r12] = $r3;;
     _32(0x2711060c),        //sd 24 (0x18)[$r12] = $r4;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _64(0x00103000e0000000),        //make $r0 = 1086324736 (0x40c00000);;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x38040a0c),        //ld $r1 = 40 (0x28)[$r12];;
     _96(0x0200400080000000e0000000),        //make $r0 = 4613937818241073152 (0x4008000000000000);;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x34000c0c),        //lws $r0 = 48 (0x30)[$r12];;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x71050001),        //addd $r1 = $r1, $r0;;
     _32(0x34000c0c),        //lws $r0 = 48 (0x30)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x38080e0c),        //ld $r2 = 56 (0x38)[$r12];;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x30040001),        //lwz $r1 = 0 (0x0)[$r1];;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x3808080c),        //ld $r2 = 32 (0x20)[$r12];;
     _64(0x00101800e0040000),        //make $r1 = 1080033280 (0x40600000);;
     _64(0x00100800e0000000),        //make $r0 = 1075838976 (0x40200000);;
     _32(0x0fdc0002),        //icall $r2;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let f1: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _96(0x0200400080000000e0040000),        //make $r1 = 4613937818241073152 (0x4008000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16974 <f1+0x2c>;;
     _32(0x1800005a),        //call 16ad8 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00100800e0040000),        //make $r1 = 1075838976 (0x40200000);;
     _32(0x73030040),        //fcompw.une $r0 = $r0, $r1;;
     _32(0x08000180),        //cb.dnez $r0? 169c4 <f2+0x3c>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _64(0x00101800e0040000),        //make $r1 = 1080033280 (0x40600000);;
     _32(0x72030040),        //fcompw.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 169c8 <f2+0x40>;;
     _32(0x18000045),        //call 16ad8 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let f3: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00103000e0040000),        //make $r1 = 1086324736 (0x40c00000);;
     _32(0x72030040),        //fcompw.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16a08 <f3+0x28>;;
     _32(0x18000035),        //call 16ad8 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _64(0x00100000e0000000),        //make $r0 = 1073741824 (0x40000000);;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _64(0x00101000e0000000),        //make $r0 = 1077936128 (0x40400000);;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _64(0x00102000e0000000),        //make $r0 = 1082130432 (0x40800000);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _96(0x000000008000005ae00c6200),        //make $r3 = 92552 (0x16988);;
     _96(0x000000008000005ae0085200),        //make $r2 = 92488 (0x16948);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x1fffff6c),        //call 16820 <t1>;;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _96(0x000000008000005ae0107800),        //make $r4 = 92640 (0x169e0);;
     _96(0x000000008000005ae00c6200),        //make $r3 = 92552 (0x16988);;
     _96(0x000000008000005ae0085200),        //make $r2 = 92488 (0x16948);;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x1fffff82),        //call 168a8 <t2>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _64(0x00101000e0040000),        //make $r1 = 1077936128 (0x40400000);;
     _32(0x72030040),        //fcompw.oeq $r0 = $r0, $r1;;
     _32(0x080001c0),        //cb.dnez $r0? 16ad0 <main+0xb0>;;
     _32(0x3000050c),        //lwz $r0 = 20 (0x14)[$r12];;
     _64(0x00102000e0040000),        //make $r1 = 1082130432 (0x40800000);;
     _32(0x72030040),        //fcompw.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16ad0 <main+0xb0>;;
     _32(0x18000003),        //call 16ad8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16af8 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16ef8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18bd0 <_exit>
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
     _32(0x98000161),        //call 17090 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16b34 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18bd0 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101000100000; //0x16a20
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(t1, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(t2, 0b00010110100010101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f1, 0b00010110100101001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f2, 0b00010110100110001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f3, 0b00010110100111100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101011011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110101011111000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016a20;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
