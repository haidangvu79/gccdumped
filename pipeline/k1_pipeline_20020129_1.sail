// executing pipeline 20020129_1.c.out.dumped test 
val k1_pipeline_20020129_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20020129_1() = {
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
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2705020c),        //sd 8 (0x8)[$r12] = $r1;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000e00),        //ld $r0 = 56 (0x38)[$r0];;
     _32(0x080004c0),        //cb.dnez $r0? 16888 <foo+0x68>;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x38000e00),        //ld $r0 = 56 (0x38)[$r0];;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x27050e00),        //sd 56 (0x38)[$r0] = $r1;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x27050e00),        //sd 56 (0x38)[$r0] = $r1;;
     _32(0x10000007),        //goto 16880 <foo+0x60>;;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x27050200),        //sd 8 (0x8)[$r0] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x087ffe40),        //cb.dnez $r0? 16868 <foo+0x48>;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x38000e00),        //ld $r0 = 56 (0x38)[$r0];;
     _32(0x08800080),        //cb.deqz $r0? 16898 <foo+0x78>;;
     _32(0x1800003d),        //call 16988 <abort>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000600),        //ld $r0 = 24 (0x18)[$r0];;
     _32(0x6001ffc0),        //compd.ne $r0 = $r0, -1 (0xffffffff);;
     _32(0x080003c0),        //cb.dnez $r0? 168e0 <foo+0xc0>;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x38040600),        //ld $r1 = 24 (0x18)[$r0];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x27050600),        //sd 24 (0x18)[$r0] = $r1;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x38040800),        //ld $r1 = 32 (0x20)[$r0];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x27050800),        //sd 32 (0x20)[$r0] = $r1;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x6004ffff),        //make $r1 = -1 (0xffffffff);;
     _32(0x27050600),        //sd 24 (0x18)[$r0] = $r1;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x27050800),        //sd 32 (0x20)[$r0] = $r1;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x38000600),        //ld $r0 = 24 (0x18)[$r0];;
     _32(0x6101ffc0),        //compd.eq $r0 = $r0, -1 (0xffffffff);;
     _32(0x08000080),        //cb.dnez $r0? 168f4 <foo+0xd4>;;
     _32(0x18000026),        //call 16988 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x60040006),        //make $r1 = 6 (0x6);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x60040091),        //make $r1 = 145 (0x91);;
     _32(0x27050600),        //sd 24 (0x18)[$r0] = $r1;;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x60040990),        //make $r1 = 2448 (0x990);;
     _32(0x27050800),        //sd 32 (0x20)[$r0] = $r1;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x6004ffff),        //make $r1 = -1 (0xffffffff);;
     _32(0x27050600),        //sd 24 (0x18)[$r0] = $r1;;
     _96(0x0000000080000117e0043200),        //make $r1 = 285896 (0x45cc8);;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x1fffffa9),        //call 16820 <foo>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 169a8 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16da8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18a80 <_exit>
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
     _32(0x98000161),        //call 16f40 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 169e4 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18a80 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100001000; //0x16908
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100110001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100110101000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016908;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
