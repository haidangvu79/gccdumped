// executing pipeline pr56205.c.out.dumped test 
val k1_pipeline_pr56205: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr56205() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let f1: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x27050a0c),        //sd 40 (0x28)[$r12] = $r1;;
     _32(0x28090c0c),        //sq 48 (0x30)[$r12] = $r2r3;;
     _32(0x2811100c),        //sq 64 (0x40)[$r12] = $r4r5;;
     _32(0x2819140c),        //sq 80 (0x50)[$r12] = $r6r7;;
     _32(0x2821180c),        //sq 96 (0x60)[$r12] = $r8r9;;
     _32(0x28291c0c),        //sq 112 (0x70)[$r12] = $r10r11;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _96(0x00000000800000fce004f000),        //make $r1 = 259008 (0x3f3c0);;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x18000238),        //call 17138 <strcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16868 <f1+0x48>;;
     _32(0x180000d9),        //call 16bc8 <abort>;;
     _32(0x61000a0c),        //addd $r0 = $r12, 40 (0x28);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x00000000800000fce004f400),        //make $r1 = 259024 (0x3f3d0);;
     _32(0x1800022b),        //call 17138 <strcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000480),        //cb.dnez $r0? 168dc <f1+0xbc>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c0002c0),        //cb.wnez $r0? 168dc <f1+0xbc>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x00000000800000fce004f600),        //make $r1 = 259032 (0x3f3d8);;
     _32(0x1800021a),        //call 17138 <strcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 168e0 <f1+0xc0>;;
     _32(0x180000bb),        //call 16bc8 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130200c),        //addd $r12 = $r12, 128 (0x80);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let f2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _96(0x00000000800000fce004f800),        //make $r1 = 259040 (0x3f3e0);;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x18000207),        //call 17138 <strcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x080006c0),        //cb.dnez $r0? 16990 <f2+0x98>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x00000000800000fce004f400),        //make $r1 = 259024 (0x3f3d0);;
     _32(0x180001fd),        //call 17138 <strcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000440),        //cb.dnez $r0? 16990 <f2+0x98>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x0201400080000000e0040000),        //make $r1 = 4622945017495814144 (0x4028000000000000);;
     _32(0x7b030040),        //fcompd.une $r0 = $r0, $r1;;
     _32(0x08000200),        //cb.dnez $r0? 16990 <f2+0x98>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000000f101b680),        //compw.eq $r0 = $r0, 26 (0x1a);;
     _32(0x0c000080),        //cb.wnez $r0? 16994 <f2+0x9c>;;
     _32(0x1800008e),        //call 16bc8 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f3: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x2709020c),        //sd 8 (0x8)[$r12] = $r2;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0c800140),        //cb.weqz $r0? 169d8 <f3+0x30>;;
     _96(0x00000000800000fce004fa00),        //make $r1 = 259048 (0x3f3e8);;
     _32(0x10000004),        //goto 169e4 <f3+0x3c>;;
     _96(0x00000000800000fce004f400),        //make $r1 = 259024 (0x3f3d0);;
     _96(0x0000000080000117e0004400),        //make $r0 = 285968 (0x45d10);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _96(0x0000000080000117e0004400),        //make $r0 = 285968 (0x45d10);;
     _32(0x26090000),        //sw 0 (0x0)[$r0] = $r2;;
     _96(0x0000000080000117e0004400),        //make $r0 = 285968 (0x45d10);;
     _32(0x30080000),        //lwz $r2 = 0 (0x0)[$r0];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x08800200),        //cb.deqz $r0? 16a40 <f3+0x98>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x08800140),        //cb.deqz $r0? 16a40 <f3+0x98>;;
     _96(0x00000000800000fce000f600),        //make $r0 = 259032 (0x3f3d8);;
     _32(0x10000004),        //goto 16a4c <f3+0xa4>;;
     _96(0x00000000800000fce000fa00),        //make $r0 = 259048 (0x3f3e8);;
     _32(0x6a0c0000),        //copyd $r3 = $r0;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x1fffff71),        //call 16820 <f1>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x088001c0),        //cb.deqz $r0? 16a80 <f3+0xd8>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x08800100),        //cb.deqz $r0? 16a80 <f3+0xd8>;;
     _32(0x3804020c),        //ld $r1 = 8 (0x8)[$r12];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x1fffff9f),        //call 168f8 <f2>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let f4: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x28090c0c),        //sq 48 (0x30)[$r12] = $r2r3;;
     _32(0x2811100c),        //sq 64 (0x40)[$r12] = $r4r5;;
     _32(0x2819140c),        //sq 80 (0x50)[$r12] = $r6r7;;
     _32(0x2821180c),        //sq 96 (0x60)[$r12] = $r8r9;;
     _32(0x28291c0c),        //sq 112 (0x70)[$r12] = $r10r11;;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x2705020c),        //sd 8 (0x8)[$r12] = $r1;;
     _32(0x61000c0c),        //addd $r0 = $r12, 48 (0x30);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x0c000400),        //cb.wnez $r0? 16b0c <f4+0x74>;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x080002c0),        //cb.dnez $r0? 16b0c <f4+0x74>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x3804020c),        //ld $r1 = 8 (0x8)[$r12];;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x1fffffa3),        //call 169a8 <f3>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130200c),        //addd $r12 = $r12, 128 (0x80);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x6010001a),        //make $r4 = 26 (0x1a);;
     _96(0x0201400080000000e00c0000),        //make $r3 = 4622945017495814144 (0x4028000000000000);;
     _96(0x00000000800000fce008f400),        //make $r2 = 259024 (0x3f3d0);;
     _96(0x00000000800000fce004f800),        //make $r1 = 259040 (0x3f3e0);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffca),        //call 16a98 <f4>;;
     _96(0x0000000080000117e0004400),        //make $r0 = 285968 (0x45d10);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c000200),        //cb.wnez $r0? 16bac <main+0x74>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16bb0 <main+0x78>;;
     _32(0x18000007),        //call 16bc8 <abort>;;
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
     _32(0x980000f3),        //call 16fa0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007ed),        //call 18b90 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101100111000; //0x16b38
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f1, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f2, 0b00010110100011111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f3, 0b00010110100110101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f4, 0b00010110101010011000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101100111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101111001000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016b38;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
