// executing pipeline pr60003 test 
val k1_pipeline_pr60003: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr60003() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let baz: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x6138040c),        //addd $r14 = $r12, 16 (0x10);;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x38040200),        //ld $r1 = 8 (0x8)[$r0];;
     _32(0x38080000),        //ld $r2 = 0 (0x0)[$r0];;
     _32(0x38300400),        //ld $r12 = 16 (0x10)[$r0];;
     _32(0x6a380002),        //copyd $r14 = $r2;;
     _32(0x0fd80001),        //igoto $r1;;
     _32(0x7f03f000)        //nop ;;
 |];

let bar: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1fffffef),        //call 16820 <baz>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let foo: list_I = 
 [|
     _32(0x6130d80c),        //addd $r12 = $r12, -160 (0xffffff60);;
     _32(0x2739060c),        //sd 24 (0x18)[$r12] = $r14;;
     _32(0x2849080c),        //sq 32 (0x20)[$r12] = $r18r19;;
     _32(0x28550c0c),        //so 48 (0x30)[$r12] = $r20r21r22r23;;
     _32(0x2865140c),        //so 80 (0x50)[$r12] = $r24r25r26r27;;
     _32(0x28751c0c),        //so 112 (0x70)[$r12] = $r28r29r30r31;;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741240c),        //sd 144 (0x90)[$r12] = $r16;;
     _32(0x2601260c),        //sw 152 (0x98)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601270c),        //sw 156 (0x9c)[$r12] = $r0;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x6104280c),        //addd $r1 = $r12, 160 (0xa0);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _96(0x000000008000005ae0043700),        //make $r1 = 92380 (0x168dc);;
     _32(0x27050200),        //sd 8 (0x8)[$r0] = $r1;;
     _32(0x27310400),        //sd 16 (0x10)[$r0] = $r12;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000002),        //goto 168e0 <foo+0x60>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000140),        //cb.dnez $r0? 168f8 <foo+0x78>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2601270c),        //sw 156 (0x9c)[$r12] = $r0;;
     _32(0x1fffffda),        //call 16858 <bar>;;
     _32(0x17fffffd),        //goto 168e8 <foo+0x68>;;
     _32(0x3000270c),        //lwz $r0 = 156 (0x9c)[$r12];;
     _32(0x0c0000c0),        //cb.wnez $r0? 16908 <foo+0x88>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000002),        //goto 1690c <foo+0x8c>;;
     _32(0x3000260c),        //lwz $r0 = 152 (0x98)[$r12];;
     _32(0x3838060c),        //ld $r14 = 24 (0x18)[$r12];;
     _32(0x3c48080c),        //lq $r18r19 = 32 (0x20)[$r12];;
     _32(0x3c540c0c),        //lo $r20r21r22r23 = 48 (0x30)[$r12];;
     _32(0x3c64140c),        //lo $r24r25r26r27 = 80 (0x50)[$r12];;
     _32(0x3c741c0c),        //lo $r28r29r30r31 = 112 (0x70)[$r12];;
     _32(0x3840240c),        //ld $r16 = 144 (0x90)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130280c),        //addd $r12 = $r12, 160 (0xa0);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffffd0),        //call 16880 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16950 <main+0x20>;;
     _32(0x18000007),        //call 16968 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
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
     _32(0x980000f3),        //call 16d40 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18870 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100110000; //0x16930
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(baz, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100001011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100010000000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100101101000, num_instr, mI);
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
