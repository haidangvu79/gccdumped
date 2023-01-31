// executing pipeline 20000707_1.c.out.dumped test 
val k1_pipeline_20000707_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20000707_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x2609020c),        //sw 8 (0x8)[$r12] = $r2;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f101b100),        //compw.eq $r0 = $r0, 4 (0x4);;
     _32(0x0c000080),        //cb.wnez $r0? 1684c <foo+0x2c>;;
     _32(0x18000026),        //call 168e0 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let bar: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x6110100c),        //addd $r4 = $r12, 64 (0x40);;
     _32(0x2801fc04),        //sq -16 (0xfffffff0)[$r4] = $r0r1;;
     _32(0x26090a0c),        //sw 40 (0x28)[$r12] = $r2;;
     _32(0x260d080c),        //sw 32 (0x20)[$r12] = $r3;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _32(0x3008080c),        //lwz $r2 = 32 (0x20)[$r12];;
     _32(0x30040a0c),        //lwz $r1 = 40 (0x28)[$r12];;
     _32(0x1fffffe6),        //call 16820 <foo>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x60000003),        //make $r0 = 3 (0x3);;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x60000004),        //make $r0 = 4 (0x4);;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x600c0002),        //make $r3 = 2 (0x2);;
     _32(0x60080001),        //make $r2 = 1 (0x1);;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x3c00fc00),        //lq $r0r1 = -16 (0xfffffff0)[$r0];;
     _32(0x1fffffe3),        //call 16860 <bar>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16900 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16d00 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 189d8 <_exit>
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
     _32(0x98000161),        //call 16e98 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 1693c <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 189d8 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100010100000; //0x168a0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100001100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100011100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100100000000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000168a0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
