// executing pipeline pr36321.c.out.dumped test 
val k1_pipeline_pr36321: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr36321() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x6138040c),        //addd $r14 = $r12, 16 (0x10);;
     _32(0x2701040e),        //sd 16 (0x10)[$r14] = $r0;;
     _32(0x3800040e),        //ld $r0 = 16 (0x10)[$r14];;
     _32(0x1800006d),        //call 169f0 <strlen>;;
     _32(0x26010b0e),        //sw 44 (0x2c)[$r14] = $r0;;
     _32(0x2731080e),        //sd 32 (0x20)[$r14] = $r12;;
     _32(0x30040b0e),        //lwz $r1 = 44 (0x2c)[$r14];;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x71011040),        //addw $r0 = $r0, $r1;;
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
     _32(0x2701060e),        //sd 24 (0x18)[$r14] = $r0;;
     _32(0x30040b0e),        //lwz $r1 = 44 (0x2c)[$r14];;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x71011040),        //addw $r0 = $r0, $r1;;
     _32(0x6130fc0e),        //addd $r12 = $r14, -16 (0xfffffff0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838040c),        //ld $r14 = 16 (0x10)[$r12];;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x1fffffd3),        //call 16820 <foo>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let __libc_fini_array: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _96(0x800000d8a749040ce0480000),        //make $r18 = 221184 (0x36000)
     _32(0x00000000),        //sd 16 (0x10)[$r12] = $r18;;
     _96(0x800000d8a739020ce5380012),        //sbfd $r14 = $r18, 221184 (0x36000)
     _32(0x00000000),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0xfa3a20ce),        //srad $r14 = $r14, 3 (0x3)
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x0880014e),        //cb.deqz $r14? 16934 <__libc_fini_array+0x44>;;
     _32(0x6138ffce),        //addd $r14 = $r14, -1 (0xffffffff);;
     _32(0x3802f392),        //ld.xs $r0 = $r14[$r18];;
     _32(0x0fdc0000),        //icall $r0;;
     _32(0x087fff4e),        //cb.dnez $r14? 16924 <__libc_fini_array+0x34>;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3848040c),        //ld $r18 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let __libc_init_array: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _96(0x800000d8a849020ce04c0000),        //make $r19 = 221184 (0x36000)
     _32(0x00000000),        //sq 8 (0x8)[$r12] = $r18r19;;
     _32(0xe0380000),        //make $r14 = 0 (0x0)
     _96(0x880000d8a739000ce5480013),        //sbfd $r18 = $r19, 221184 (0x36000)
     _32(0x08000000),        //sd 0 (0x0)[$r12] = $r14;;
     _32(0xfa4a20d2),        //srad $r18 = $r18, 3 (0x3)
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x08800192),        //cb.deqz $r18? 1699c <__libc_init_array+0x4c>;;
     _32(0xe138004e),        //addd $r14 = $r14, 1 (0x1)
     _32(0x3802f393),        //ld.xs $r0 = $r14[$r19];;
     _32(0x0fdc0000),        //icall $r0;;
     _32(0x7001a392),        //compd.ne $r0 = $r18, $r14;;
     _32(0x087fff00),        //cb.dnez $r0? 16988 <__libc_init_array+0x38>;;
     _32(0xe0380000),        //make $r14 = 0 (0x0)
     _96(0x08000000880000d8e04c0000),        //make $r19 = 221184 (0x36000);;
     _96(0x00000000800000d8e5480013),        //sbfd $r18 = $r19, 221184 (0x36000);;
     _32(0x7a4a20d2),        //srad $r18 = $r18, 3 (0x3);;
     _32(0x08800192),        //cb.deqz $r18? 169d4 <__libc_init_array+0x84>;;
     _32(0xe138004e),        //addd $r14 = $r14, 1 (0x1)
     _32(0x3802f393),        //ld.xs $r0 = $r14[$r19];;
     _32(0x0fdc0000),        //icall $r0;;
     _32(0x7001a392),        //compd.ne $r0 = $r18, $r14;;
     _32(0x087fff00),        //cb.dnez $r0? 169c0 <__libc_init_array+0x70>;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3c48020c),        //lq $r18r19 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let strlen: list_I = 
 [|
     _32(0x680401c0),        //andd $r1 = $r0, 7 (0x7);;
     _32(0x08800281),        //cb.deqz $r1? 16a1c <strlen+0x2c>;;
     _32(0x90000005),        //goto 16a0c <strlen+0x1c>
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x61040041),        //addd $r1 = $r1, 1 (0x1);;
     _32(0x680801c1),        //andd $r2 = $r1, 7 (0x7);;
     _32(0x08800182),        //cb.deqz $r2? 16a20 <strlen+0x30>;;
     _32(0x24080001),        //lbs $r2 = 0 (0x0)[$r1];;
     _32(0x0c7fff02),        //cb.wnez $r2? 16a00 <strlen+0x10>;;
     _32(0x8fd00000),        //ret 
     _32(0x75010040),        //sbfd $r0 = $r0, $r1;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x38080001),        //ld $r2 = 0 (0x0)[$r1];;
     _96(0x07f7f7f787bfbfbfe10cbfc2),        //addd $r3 = $r2, 18374403900871474943 (0xfefefefefefefeff);;
     _32(0x7e0900c2),        //andnd $r2 = $r2, $r3;;
     _96(0x0404040480202020e8082002),        //andd $r2 = $r2, 9259542123273814144 (0x8080808080808080);;
     _32(0x08000342),        //cb.dnez $r2? 16a74 <strlen+0x84>;;
     _32(0xe1040201),        //addd $r1 = $r1, 8 (0x8)
     _32(0x38080201),        //ld $r2 = 8 (0x8)[$r1];;
     _96(0x07f7f7f787bfbfbfe10cbfc2),        //addd $r3 = $r2, 18374403900871474943 (0xfefefefefefefeff);;
     _32(0x7e0900c2),        //andnd $r2 = $r2, $r3;;
     _96(0x0404040480202020e8082002),        //andd $r2 = $r2, 9259542123273814144 (0x8080808080808080);;
     _32(0x08fffdc2),        //cb.deqz $r2? 16a44 <strlen+0x54>;;
     _32(0x10000002),        //goto 16a74 <strlen+0x84>;;
     _32(0x61040041),        //addd $r1 = $r1, 1 (0x1);;
     _32(0x24080001),        //lbs $r2 = 0 (0x0)[$r1];;
     _32(0x0c7fff82),        //cb.wnez $r2? 16a70 <strlen+0x80>;;
     _32(0x8fd00000),        //ret 
     _32(0x75010040),        //sbfd $r0 = $r0, $r1;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100010110000; //0x168b0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__libc_fini_array, 0b00010110100011110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__libc_init_array, 0b00010110100101010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(strlen, 0b00010110100111110000, num_instr, mI);
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
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
