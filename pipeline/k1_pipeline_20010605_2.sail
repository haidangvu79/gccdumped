// executing pipeline 20010605_2.c.out.dumped test 
val k1_pipeline_20010605_2: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20010605_2() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let main: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _96(0x01ff800080000000e0000000),        //make $r0 = 4607182418800017408 (0x3ff0000000000000);;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _96(0x01ff800080000000e0000000),        //make $r0 = 4607182418800017408 (0x3ff0000000000000);;
     _32(0x2701140c),        //sd 80 (0x50)[$r12] = $r0;;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _96(0x0200000080000000e0000000),        //make $r0 = 4611686018427387904 (0x4000000000000000);;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x38040c0c),        //ld $r1 = 48 (0x30)[$r12];;
     _32(0x18000025),        //call 16908 <foo>;;
     _32(0x3000130c),        //lwz $r0 = 76 (0x4c)[$r12];;
     _32(0x2601090c),        //sw 36 (0x24)[$r12] = $r0;;
     _64(0x00101000e0000000),        //make $r0 = 1077936128 (0x40400000);;
     _32(0x2601080c),        //sw 32 (0x20)[$r12] = $r0;;
     _64(0x00101000e0000000),        //make $r0 = 1077936128 (0x40400000);;
     _32(0x2601120c),        //sw 72 (0x48)[$r12] = $r0;;
     _32(0x3000120c),        //lwz $r0 = 72 (0x48)[$r12];;
     _32(0x2601080c),        //sw 32 (0x20)[$r12] = $r0;;
     _64(0x00102000e0000000),        //make $r0 = 1082130432 (0x40800000);;
     _32(0x2601090c),        //sw 36 (0x24)[$r12] = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x1800002e),        //call 16968 <bar>;;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x0200a00080000000e0000000),        //make $r0 = 4617315517961601024 (0x4014000000000000);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _96(0x0200a00080000000e0000000),        //make $r0 = 4617315517961601024 (0x4014000000000000);;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _96(0x0200c00080000000e0000000),        //make $r0 = 4618441417868443648 (0x4018000000000000);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x1800002f),        //call 169b8 <baz>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800004d)        //call 16a38 <exit>;;
 |];

let foo: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _96(0x01ff800080000000e0040000),        //make $r1 = 4607182418800017408 (0x3ff0000000000000);;
     _32(0x7b030040),        //fcompd.une $r0 = $r0, $r1;;
     _32(0x080001c0),        //cb.dnez $r0? 1694c <foo+0x44>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _96(0x0200000080000000e0040000),        //make $r1 = 4611686018427387904 (0x4000000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16950 <foo+0x48>;;
     _32(0x18000033),        //call 16a18 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let bar: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00101000e0040000),        //make $r1 = 1077936128 (0x40400000);;
     _32(0x73030040),        //fcompw.une $r0 = $r0, $r1;;
     _32(0x08000180),        //cb.dnez $r0? 169a0 <bar+0x38>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00102000e0040000),        //make $r1 = 1082130432 (0x40800000);;
     _32(0x72030040),        //fcompw.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 169a4 <bar+0x3c>;;
     _32(0x1800001e),        //call 16a18 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let baz: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _96(0x0200a00080000000e0040000),        //make $r1 = 4617315517961601024 (0x4014000000000000);;
     _32(0x7b030040),        //fcompd.une $r0 = $r0, $r1;;
     _32(0x080001c0),        //cb.dnez $r0? 169fc <baz+0x44>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _96(0x0200c00080000000e0040000),        //make $r1 = 4618441417868443648 (0x4018000000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16a00 <baz+0x48>;;
     _32(0x18000007),        //call 16a18 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16e38 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18b10 <_exit>
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
     _32(0x98000161),        //call 16fd0 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16a74 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18b10 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100100001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100101101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(baz, 0b00010110100110111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101000011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110101000111000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016820;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
