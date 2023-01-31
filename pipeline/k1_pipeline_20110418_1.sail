// executing pipeline 20110418_1.c.out.dumped test 
val k1_pipeline_20110418_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20110418_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let f: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2705020c),        //sd 8 (0x8)[$r12] = $r1;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x60000020),        //make $r0 = 32 (0x20);;
     _32(0x26010b0c),        //sw 44 (0x2c)[$r12] = $r0;;
     _64(0x003fffffe000ffc0),        //make $r0 = 4294967295 (0xffffffff);;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x38040c0c),        //ld $r1 = 48 (0x30)[$r12];;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x78010001),        //andd $r0 = $r1, $r0;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x78010001),        //andd $r0 = $r1, $r0;;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x7801a001),        //compd.leu $r0 = $r1, $r0;;
     _32(0x080001c0),        //cb.dnez $r0? 1689c <f+0x7c>;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x30000b0c),        //lwz $r0 = 44 (0x2c)[$r12];;
     _32(0x79026001),        //slld $r0 = $r1, $r0;;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x6c04ffc0),        //notd $r1 = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x78010001),        //andd $r0 = $r1, $r0;;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _64(0x00400000e0000040),        //make $r0 = 4294967297 (0x100000001);;
     _32(0x2701020c),        //sd 8 (0x8)[$r12] = $r0;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _64(0x003fffffe800ffc0),        //andd $r0 = $r0, 4294967295 (0xffffffff);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x6100020c),        //addd $r0 = $r12, 8 (0x8);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x1fffffc5),        //call 16820 <f>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61040040),        //addd $r1 = $r0, 1 (0x1);;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16928 <main+0x58>;;
     _32(0x18000007),        //call 16940 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
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
     _32(0x980000f3),        //call 16d18 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18848 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100011010000; //0x168d0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100011010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100101000000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000168d0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
