// executing pipeline 20051113_1.c.out.dumped test 
val k1_pipeline_20051113_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20051113_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let Sum: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701020c),        //sd 8 (0x8)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x1000000f),        //goto 16874 <Sum+0x54>;;
     _32(0x3808020c),        //ld $r2 = 8 (0x8)[$r12];;
     _32(0x3404050c),        //lws $r1 = 20 (0x14)[$r12];;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x79022100),        //slld $r0 = $r0, 4 (0x4);;
     _32(0x75010001),        //sbfd $r0 = $r1, $r0;;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x38000280),        //ld $r0 = 10 (0xa)[$r0];;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3000050c),        //lwz $r0 = 20 (0x14)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x3004050c),        //lwz $r1 = 20 (0x14)[$r12];;
     _32(0x7201b001),        //compw.lt $r0 = $r1, $r0;;
     _32(0x0c7ffb80),        //cb.wnez $r0? 1683c <Sum+0x1c>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let Sum2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701020c),        //sd 8 (0x8)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x1000000f),        //goto 168ec <Sum2+0x54>;;
     _32(0x3808020c),        //ld $r2 = 8 (0x8)[$r12];;
     _32(0x3404050c),        //lws $r1 = 20 (0x14)[$r12];;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x79022100),        //slld $r0 = $r0, 4 (0x4);;
     _32(0x75010001),        //sbfd $r0 = $r1, $r0;;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x38000480),        //ld $r0 = 18 (0x12)[$r0];;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3000050c),        //lwz $r0 = 20 (0x14)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x3004050c),        //lwz $r1 = 20 (0x14)[$r12];;
     _32(0x7201b001),        //compw.lt $r0 = $r1, $r0;;
     _32(0x0c7ffb80),        //cb.wnez $r0? 168b4 <Sum2+0x1c>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x6000005e),        //make $r0 = 94 (0x5e);;
     _32(0x18000076),        //call 16af8 <malloc>;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x6008005e),        //make $r2 = 94 (0x5e);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x180002e3),        //call 174c0 <memset>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x60040003),        //make $r1 = 3 (0x3);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6004022b),        //make $r1 = 555 (0x22b);;
     _32(0x27050280),        //sd 10 (0xa)[$r0] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x600403e7),        //make $r1 = 999 (0x3e7);;
     _32(0x27050a00),        //sd 40 (0x28)[$r0] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x00404040e0044040),        //make $r1 = 4311810305 (0x101010101);;
     _32(0x27051180),        //sd 70 (0x46)[$r0] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6004022b),        //make $r1 = 555 (0x22b);;
     _32(0x27050480),        //sd 18 (0x12)[$r0] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x600403e7),        //make $r1 = 999 (0x3e7);;
     _32(0x27050c00),        //sd 48 (0x30)[$r0] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x00404040e0044040),        //make $r1 = 4311810305 (0x101010101);;
     _32(0x27051380),        //sd 78 (0x4e)[$r0] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x1fffffa2),        //call 16820 <Sum>;;
     _64(0x00404041e101c4c0),        //compd.eq $r0 = $r0, 4311811859 (0x101010713);;
     _32(0x08000080),        //cb.dnez $r0? 169ac <main+0x9c>;;
     _32(0x1800000c),        //call 169d8 <abort>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x1fffffba),        //call 16898 <Sum2>;;
     _64(0x00404041e101c4c0),        //compd.eq $r0 = $r0, 4311811859 (0x101010713);;
     _32(0x08000080),        //cb.dnez $r0? 169c4 <main+0xb4>;;
     _32(0x18000006),        //call 169d8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980003ff),        //call 179e0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x9800083d),        //call 18ae0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100010000; //0x16910
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(Sum, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(Sum2, 0b00010110100010011000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100111011000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016910;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
