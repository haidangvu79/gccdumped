// executing pipeline 20000703_1 test 
val k1_pipeline_20000703_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20000703_1() = {
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
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x2609020c),        //sw 8 (0x8)[$r12] = $r2;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61000440),        //addd $r0 = $r0, 17 (0x11);;
     _32(0x60046261),        //make $r1 = 25185 (0x6261);;
     _32(0x25050000),        //sh 0 (0x0)[$r0] = $r1;;
     _32(0x60040063),        //make $r1 = 99 (0x63);;
     _32(0x24050080),        //sb 2 (0x2)[$r0] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3004040c),        //lwz $r1 = 16 (0x10)[$r12];;
     _32(0x26050500),        //sw 20 (0x14)[$r0] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3004020c),        //lwz $r1 = 8 (0x8)[$r12];;
     _32(0x26050600),        //sw 24 (0x18)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let bar: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2605020c),        //sw 8 (0x8)[$r12] = $r1;;
     _32(0x2609000c),        //sw 0 (0x0)[$r12] = $r2;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x27050200),        //sd 8 (0x8)[$r0] = $r1;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x27050400),        //sd 16 (0x10)[$r0] = $r1;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050600),        //sw 24 (0x18)[$r0] = $r1;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _96(0x01b9b1a9850ccc8ce0044c00),        //make $r1 = 3978425819141910832 (0x3736353433323130);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _96(0x01a9a199848c4c0ee0044e00),        //make $r1 = 3833745473465760056 (0x3534333231303938);;
     _32(0x27050200),        //sd 8 (0x8)[$r0] = $r1;;
     _32(0x60040036),        //make $r1 = 54 (0x36);;
     _32(0x24050400),        //sb 16 (0x10)[$r0] = $r1;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61000440),        //addd $r0 = $r0, 17 (0x11);;
     _32(0x60046261),        //make $r1 = 25185 (0x6261);;
     _32(0x25050000),        //sh 0 (0x0)[$r0] = $r1;;
     _32(0x60040063),        //make $r1 = 99 (0x63);;
     _32(0x24050080),        //sb 2 (0x2)[$r0] = $r1;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x3004020c),        //lwz $r1 = 8 (0x8)[$r12];;
     _32(0x26050500),        //sw 20 (0x14)[$r0] = $r1;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x3004000c),        //lwz $r1 = 0 (0x0)[$r12];;
     _32(0x26050600),        //sw 24 (0x18)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x60080012),        //make $r2 = 18 (0x12);;
     _32(0x60040047),        //make $r1 = 71 (0x47);;
     _32(0x1fffffbc),        //call 16820 <foo>;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _64(0x00000002f001b1c0),        //compw.ne $r0 = $r0, 71 (0x47);;
     _32(0x0c000140),        //cb.wnez $r0? 16954 <main+0x3c>;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _64(0x00000000f101b480),        //compw.eq $r0 = $r0, 18 (0x12);;
     _32(0x0c000080),        //cb.wnez $r0? 16958 <main+0x40>;;
     _32(0x18000011),        //call 16998 <abort>;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x6008001a),        //make $r2 = 26 (0x1a);;
     _32(0x6004003b),        //make $r1 = 59 (0x3b);;
     _32(0x1fffffc3),        //call 16870 <bar>;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _64(0x00000001f001b6c0),        //compw.ne $r0 = $r0, 59 (0x3b);;
     _32(0x0c000140),        //cb.wnez $r0? 16988 <main+0x70>;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _64(0x00000000f101b680),        //compw.eq $r0 = $r0, 26 (0x1a);;
     _32(0x0c000080),        //cb.wnez $r0? 1698c <main+0x74>;;
     _32(0x18000004),        //call 16998 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 169b8 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16db8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18a90 <_exit>
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
     _32(0x98000161),        //call 16f50 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 169f4 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18a90 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100011000; //0x16918
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100001110000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100110011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit, 0b00010110100110111000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016918;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
