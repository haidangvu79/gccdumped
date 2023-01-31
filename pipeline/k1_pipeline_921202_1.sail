// executing pipeline 921202_1 test 
val k1_pipeline_921202_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_921202_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let main: list_I = 
 [|
     _64(0x07ffffcfe130c80c),        //addd $r12 = $r12, -49376 (0xffffffffffff3f20);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x60000807),        //make $r0 = 2055 (0x807);;
     _64(0x18000030a701340c),        //sd 49360 (0xc0d0)[$r12] = $r0;;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _64(0x18000030b804340c),        //ld $r1 = 49360 (0xc0d0)[$r12];;
     _32(0x1800005a),        //call 169b0 <mpn_random2>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _64(0x18000030a601360c),        //sw 49368 (0xc0d8)[$r12] = $r0;;
     _32(0x10000006),        //goto 16870 <main+0x50>;;
     _64(0x18000030b000360c),        //lwz $r0 = 49368 (0xc0d8)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _64(0x18000030a601360c),        //sw 49368 (0xc0d8)[$r12] = $r0;;
     _64(0x18000030b000360c),        //lwz $r0 = 49368 (0xc0d8)[$r12];;
     _32(0x0e7ffe40),        //cb.wlez $r0? 1685c <main+0x3c>;;
     _64(0x18000030b800340c),        //ld $r0 = 49360 (0xc0d0)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _64(0x00000030e104380c),        //addd $r1 = $r12, 49376 (0xc0e0);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _64(0x00048d15e0049e00),        //make $r1 = 305419896 (0x12345678);;
     _64(0x1fffffdfa705da00),        //sd -32920 (0xffffffffffff7f68)[$r0] = $r1;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _64(0x18000030a601360c),        //sw 49368 (0xc0d8)[$r12] = $r0;;
     _32(0x1000000e),        //goto 168e8 <main+0xc8>;;
     _32(0x6104040c),        //addd $r1 = $r12, 16 (0x10);;
     _64(0x00000010e100120c),        //addd $r0 = $r12, 16456 (0x4048);;
     _64(0x18000030b808340c),        //ld $r2 = 49360 (0xc0d0)[$r12];;
     _32(0x18000036),        //call 169a0 <mpn_mul_1>;;
     _64(0x18000030a601370c),        //sw 49372 (0xc0dc)[$r12] = $r0;;
     _64(0x18000030b000360c),        //lwz $r0 = 49368 (0xc0d8)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _64(0x18000030a601360c),        //sw 49368 (0xc0d8)[$r12] = $r0;;
     _64(0x18000030b000360c),        //lwz $r0 = 49368 (0xc0d8)[$r12];;
     _32(0x0e7ffc40),        //cb.wlez $r0? 168b4 <main+0x94>;;
     _64(0x18000030b004330c),        //lwz $r1 = 49356 (0xc0cc)[$r12];;
     _64(0x18000030b000370c),        //lwz $r0 = 49372 (0xc0dc)[$r12];;
     _32(0x7001b001),        //compw.ne $r0 = $r1, $r0;;
     _32(0x0c000580),        //cb.wnez $r0? 16960 <main+0x140>;;
     _64(0x18000030b800340c),        //ld $r0 = 49360 (0xc0d0)[$r12];;
     _32(0x61080040),        //addd $r2 = $r0, 1 (0x1);;
     _64(0x00000010e104120c),        //addd $r1 = $r12, 16456 (0x4048);;
     _64(0x00000020e100220c),        //addd $r0 = $r12, 32904 (0x8088);;
     _32(0x18000024),        //call 169b8 <mpn_cmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000300),        //cb.dnez $r0? 16960 <main+0x140>;;
     _64(0x18000030b800340c),        //ld $r0 = 49360 (0xc0d0)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _64(0x00000030e104380c),        //addd $r1 = $r12, 49376 (0xc0e0);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _64(0x1fffffefb800ea00),        //ld $r0 = -16472 (0xffffffffffffbfa8)[$r0];;
     _64(0x00048d15e1019e00),        //compd.eq $r0 = $r0, 305419896 (0x12345678);;
     _32(0x08000340),        //cb.dnez $r0? 16990 <main+0x170>;;
     _64(0x18000030b008370c),        //lwz $r2 = 49372 (0xc0dc)[$r12];;
     _32(0x60040008),        //make $r1 = 8 (0x8);;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x18000008),        //call 16998 <foo>;;
     _64(0x00000010e100120c),        //addd $r0 = $r12, 16456 (0x4048);;
     _64(0x18000030b804340c),        //ld $r1 = 49360 (0xc0d0)[$r12];;
     _32(0x18000007),        //call 169a8 <mpn_print>;;
     _32(0x1800000c),        //call 169c0 <exxit>;;
     _32(0x17ffffa7)        //goto 16830 <main+0x10>;;
 |];

let foo: list_I = 
 [|
     _32(0x7f03f000),        //nop ;;
     _32(0x0fd00000)        //ret ;;
 |];

let mpn_mul_1: list_I = 
 [|
     _32(0x7f03f000),        //nop ;;
     _32(0x0fd00000)        //ret ;;
 |];

let mpn_print: list_I = 
 [|
     _32(0x7f03f000),        //nop ;;
     _32(0x0fd00000)        //ret ;;
 |];

let mpn_random2: list_I = 
 [|
     _32(0x7f03f000),        //nop ;;
     _32(0x0fd00000)        //ret ;;
 |];

let mpn_cmp: list_I = 
 [|
     _32(0x7f03f000),        //nop ;;
     _32(0x0fd00000)        //ret ;;
 |];

let exxit: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000002),        //call 169d8 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100110011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(mpn_mul_1, 0b00010110100110100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(mpn_print, 0b00010110100110101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(mpn_random2, 0b00010110100110110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(mpn_cmp, 0b00010110100110111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exxit, 0b00010110100111000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100111011000, num_instr, mI);
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
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
