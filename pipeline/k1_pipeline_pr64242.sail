// executing pipeline pr64242.c.out.dumped test 
val k1_pipeline_pr64242: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr64242() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let broken_longjmp: list_I = 
 [|
     _32(0x6130b80c),        //addd $r12 = $r12, -288 (0xfffffee0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2739020c),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0x6138020c),        //addd $r14 = $r12, 8 (0x8);;
     _32(0x2701040e),        //sd 16 (0x10)[$r14] = $r0;;
     _32(0x6100060e),        //addd $r0 = $r14, 24 (0x18);;
     _32(0x3804040e),        //ld $r1 = 16 (0x10)[$r14];;
     _32(0x38080001),        //ld $r2 = 0 (0x0)[$r1];;
     _32(0x27090000),        //sd 0 (0x0)[$r0] = $r2;;
     _32(0x38080201),        //ld $r2 = 8 (0x8)[$r1];;
     _32(0x27090200),        //sd 8 (0x8)[$r0] = $r2;;
     _32(0x38080401),        //ld $r2 = 16 (0x10)[$r1];;
     _32(0x27090400),        //sd 16 (0x10)[$r0] = $r2;;
     _32(0x38080601),        //ld $r2 = 24 (0x18)[$r1];;
     _32(0x27090600),        //sd 24 (0x18)[$r0] = $r2;;
     _32(0x38040801),        //ld $r1 = 32 (0x20)[$r1];;
     _32(0x27050800),        //sd 32 (0x20)[$r0] = $r1;;
     _32(0x3800040e),        //ld $r0 = 16 (0x10)[$r14];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x27050200),        //sd 8 (0x8)[$r0] = $r1;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x27050400),        //sd 16 (0x10)[$r0] = $r1;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x27050600),        //sd 24 (0x18)[$r0] = $r1;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x27050800),        //sd 32 (0x20)[$r0] = $r1;;
     _32(0x6100060e),        //addd $r0 = $r14, 24 (0x18);;
     _32(0x38040200),        //ld $r1 = 8 (0x8)[$r0];;
     _32(0x38080000),        //ld $r2 = 0 (0x0)[$r0];;
     _32(0x38300400),        //ld $r12 = 16 (0x10)[$r0];;
     _32(0x6a380002),        //copyd $r14 = $r2;;
     _32(0x0fd80001),        //igoto $r1;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130d00c),        //addd $r12 = $r12, -192 (0xffffff40);;
     _32(0x2739060c),        //sd 24 (0x18)[$r12] = $r14;;
     _32(0x28490a0c),        //sq 40 (0x28)[$r12] = $r18r19;;
     _32(0x28550e0c),        //so 56 (0x38)[$r12] = $r20r21r22r23;;
     _32(0x2865160c),        //so 88 (0x58)[$r12] = $r24r25r26r27;;
     _32(0x28751e0c),        //so 120 (0x78)[$r12] = $r28r29r30r31;;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741080c),        //sd 32 (0x20)[$r12] = $r16;;
     _32(0x6138060c),        //addd $r14 = $r12, 24 (0x18);;
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x7b022140),        //srld $r0 = $r0, 5 (0x5);;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x75310300),        //sbfd $r12 = $r0, $r12;;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x7b022140),        //srld $r0 = $r0, 5 (0x5);;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x7b022140),        //srld $r0 = $r0, 5 (0x5);;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x75310300),        //sbfd $r12 = $r0, $r12;;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x7b022140),        //srld $r0 = $r0, 5 (0x5);;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x0000000080000117e0003400),        //make $r0 = 285904 (0x45cd0);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x6100200e),        //addd $r0 = $r14, 128 (0x80);;
     _32(0x61042a0e),        //addd $r1 = $r14, 168 (0xa8);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _96(0x000000008000005ae0046700),        //make $r1 = 92572 (0x1699c);;
     _32(0x27050200),        //sd 8 (0x8)[$r0] = $r1;;
     _32(0x27310400),        //sd 16 (0x10)[$r0] = $r12;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000003),        //goto 169a4 <main+0xf4>;;
     _32(0x6138d60e),        //addd $r14 = $r14, -168 (0xffffff58);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x080000c0),        //cb.dnez $r0? 169b4 <main+0x104>;;
     _32(0x6100200e),        //addd $r0 = $r14, 128 (0x80);;
     _32(0x1fffff9c),        //call 16820 <broken_longjmp>;;
     _96(0x0000000080000117e0003400),        //make $r0 = 285904 (0x45cd0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x0000000080000117e0043400),        //make $r1 = 285904 (0x45cd0);;
     _32(0x38080001),        //ld $r2 = 0 (0x0)[$r1];;
     _96(0x0000000080000117e0043200),        //make $r1 = 285896 (0x45cc8);;
     _32(0x38040001),        //ld $r1 = 0 (0x0)[$r1];;
     _32(0x75050081),        //sbfd $r1 = $r1, $r2;;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _96(0x0000000080000117e0043200),        //make $r1 = 285896 (0x45cc8);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x7b022140),        //srld $r0 = $r0, 5 (0x5);;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x75310300),        //sbfd $r12 = $r0, $r12;;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x7b022140),        //srld $r0 = $r0, 5 (0x5);;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16a58 <main+0x1a8>;;
     _32(0x1800000d),        //call 16a88 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x6130fa0e),        //addd $r12 = $r14, -24 (0xffffffe8);;
     _32(0x3838060c),        //ld $r14 = 24 (0x18)[$r12];;
     _32(0x3c480a0c),        //lq $r18r19 = 40 (0x28)[$r12];;
     _32(0x3c540e0c),        //lo $r20r21r22r23 = 56 (0x38)[$r12];;
     _32(0x3c64160c),        //lo $r24r25r26r27 = 88 (0x58)[$r12];;
     _32(0x3c741e0c),        //lo $r28r29r30r31 = 120 (0x78)[$r12];;
     _32(0x3840080c),        //ld $r16 = 32 (0x20)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130300c),        //addd $r12 = $r12, 192 (0xc0);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16e60 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18990 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100010110000; //0x168b0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(broken_longjmp, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101010001000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000168b0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
