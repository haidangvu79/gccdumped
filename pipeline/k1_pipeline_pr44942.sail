// executing pipeline pr44942 test 
val k1_pipeline_pr44942: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr44942() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let test1: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2821180c),        //sq 96 (0x60)[$r12] = $r8r9;;
     _32(0x28291c0c),        //sq 112 (0x70)[$r12] = $r10r11;;
     _32(0x2601120c),        //sw 72 (0x48)[$r12] = $r0;;
     _32(0x2605100c),        //sw 64 (0x40)[$r12] = $r1;;
     _32(0x26090e0c),        //sw 56 (0x38)[$r12] = $r2;;
     _32(0x260d0c0c),        //sw 48 (0x30)[$r12] = $r3;;
     _32(0x26110a0c),        //sw 40 (0x28)[$r12] = $r4;;
     _32(0x2615080c),        //sw 32 (0x20)[$r12] = $r5;;
     _32(0x2619060c),        //sw 24 (0x18)[$r12] = $r6;;
     _32(0x271d040c),        //sd 16 (0x10)[$r12] = $r7;;
     _32(0x6100180c),        //addd $r0 = $r12, 96 (0x60);;
     _32(0x2701140c),        //sd 80 (0x50)[$r12] = $r0;;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705140c),        //sd 80 (0x50)[$r12] = $r1;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x2601170c),        //sw 92 (0x5c)[$r12] = $r0;;
     _32(0x3000170c),        //lwz $r0 = 92 (0x5c)[$r12];;
     _64(0x00000026f101b480),        //compw.eq $r0 = $r0, 1234 (0x4d2);;
     _32(0x0c000080),        //cb.wnez $r0? 16884 <test1+0x64>;;
     _32(0x180000ae),        //call 16b38 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130200c),        //addd $r12 = $r12, 128 (0x80);;
     _32(0x0fd00000)        //ret ;;
 |];

let test2: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x26011a0c),        //sw 104 (0x68)[$r12] = $r0;;
     _32(0x2605180c),        //sw 96 (0x60)[$r12] = $r1;;
     _32(0x2609160c),        //sw 88 (0x58)[$r12] = $r2;;
     _32(0x260d140c),        //sw 80 (0x50)[$r12] = $r3;;
     _32(0x2611120c),        //sw 72 (0x48)[$r12] = $r4;;
     _32(0x2615100c),        //sw 64 (0x40)[$r12] = $r5;;
     _32(0x26190e0c),        //sw 56 (0x38)[$r12] = $r6;;
     _32(0x271d0c0c),        //sd 48 (0x30)[$r12] = $r7;;
     _32(0x26210a0c),        //sw 40 (0x28)[$r12] = $r8;;
     _32(0x2725080c),        //sd 32 (0x20)[$r12] = $r9;;
     _32(0x2629060c),        //sw 24 (0x18)[$r12] = $r10;;
     _32(0x272d040c),        //sd 16 (0x10)[$r12] = $r11;;
     _32(0x6100240c),        //addd $r0 = $r12, 144 (0x90);;
     _32(0x27011c0c),        //sd 112 (0x70)[$r12] = $r0;;
     _32(0x38001c0c),        //ld $r0 = 112 (0x70)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x27051c0c),        //sd 112 (0x70)[$r12] = $r1;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x26011f0c),        //sw 124 (0x7c)[$r12] = $r0;;
     _32(0x30001f0c),        //lwz $r0 = 124 (0x7c)[$r12];;
     _64(0x00000026f101b480),        //compw.eq $r0 = $r0, 1234 (0x4d2);;
     _32(0x0c000080),        //cb.wnez $r0? 16904 <test2+0x6c>;;
     _32(0x1800008e),        //call 16b38 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130200c),        //addd $r12 = $r12, 128 (0x80);;
     _32(0x0fd00000)        //ret ;;
 |];

let test3: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2821180c),        //sq 96 (0x60)[$r12] = $r8r9;;
     _32(0x28291c0c),        //sq 112 (0x70)[$r12] = $r10r11;;
     _32(0x2701120c),        //sd 72 (0x48)[$r12] = $r0;;
     _32(0x2705100c),        //sd 64 (0x40)[$r12] = $r1;;
     _32(0x27090e0c),        //sd 56 (0x38)[$r12] = $r2;;
     _32(0x270d0c0c),        //sd 48 (0x30)[$r12] = $r3;;
     _32(0x27110a0c),        //sd 40 (0x28)[$r12] = $r4;;
     _32(0x2715080c),        //sd 32 (0x20)[$r12] = $r5;;
     _32(0x2719060c),        //sd 24 (0x18)[$r12] = $r6;;
     _32(0x271d040c),        //sd 16 (0x10)[$r12] = $r7;;
     _32(0x6100180c),        //addd $r0 = $r12, 96 (0x60);;
     _32(0x2701140c),        //sd 80 (0x50)[$r12] = $r0;;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705140c),        //sd 80 (0x50)[$r12] = $r1;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x2701160c),        //sd 88 (0x58)[$r12] = $r0;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _96(0x02049a4080000000e0040000),        //make $r1 = 4653142004841054208 (0x4093480000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16984 <test3+0x6c>;;
     _32(0x1800006e),        //call 16b38 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130200c),        //addd $r12 = $r12, 128 (0x80);;
     _32(0x0fd00000)        //ret ;;
 |];

let test4: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x27011a0c),        //sd 104 (0x68)[$r12] = $r0;;
     _32(0x2705180c),        //sd 96 (0x60)[$r12] = $r1;;
     _32(0x2709160c),        //sd 88 (0x58)[$r12] = $r2;;
     _32(0x270d140c),        //sd 80 (0x50)[$r12] = $r3;;
     _32(0x2711120c),        //sd 72 (0x48)[$r12] = $r4;;
     _32(0x2715100c),        //sd 64 (0x40)[$r12] = $r5;;
     _32(0x27190e0c),        //sd 56 (0x38)[$r12] = $r6;;
     _32(0x271d0c0c),        //sd 48 (0x30)[$r12] = $r7;;
     _32(0x27210a0c),        //sd 40 (0x28)[$r12] = $r8;;
     _32(0x2725080c),        //sd 32 (0x20)[$r12] = $r9;;
     _32(0x2729060c),        //sd 24 (0x18)[$r12] = $r10;;
     _32(0x272d040c),        //sd 16 (0x10)[$r12] = $r11;;
     _32(0x6100240c),        //addd $r0 = $r12, 144 (0x90);;
     _32(0x27011c0c),        //sd 112 (0x70)[$r12] = $r0;;
     _32(0x38001c0c),        //ld $r0 = 112 (0x70)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x27051c0c),        //sd 112 (0x70)[$r12] = $r1;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x27011e0c),        //sd 120 (0x78)[$r12] = $r0;;
     _32(0x38001e0c),        //ld $r0 = 120 (0x78)[$r12];;
     _96(0x02049a4080000000e0040000),        //make $r1 = 4653142004841054208 (0x4093480000000000);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16a0c <test4+0x74>;;
     _32(0x1800004c),        //call 16b38 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130200c),        //addd $r12 = $r12, 128 (0x80);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x27410e0c),        //sd 56 (0x38)[$r12] = $r16;;
     _32(0x602004d2),        //make $r8 = 1234 (0x4d2);;
     _32(0x601c0000),        //make $r7 = 0 (0x0);;
     _32(0x60180000),        //make $r6 = 0 (0x0);;
     _32(0x60140000),        //make $r5 = 0 (0x0);;
     _32(0x60100000),        //make $r4 = 0 (0x0);;
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff74),        //call 16820 <test1>;;
     _32(0x600004d2),        //make $r0 = 1234 (0x4d2);;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701020c),        //sd 8 (0x8)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601000c),        //sw 0 (0x0)[$r12] = $r0;;
     _32(0x602c0000),        //make $r11 = 0 (0x0);;
     _32(0x60280000),        //make $r10 = 0 (0x0);;
     _32(0x60240000),        //make $r9 = 0 (0x0);;
     _32(0x60200000),        //make $r8 = 0 (0x0);;
     _32(0x601c0000),        //make $r7 = 0 (0x0);;
     _32(0x60180000),        //make $r6 = 0 (0x0);;
     _32(0x60140000),        //make $r5 = 0 (0x0);;
     _32(0x60100000),        //make $r4 = 0 (0x0);;
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff7f),        //call 16898 <test2>;;
     _96(0x02049a4080000000e0200000),        //make $r8 = 4653142004841054208 (0x4093480000000000);;
     _32(0x601c0000),        //make $r7 = 0 (0x0);;
     _32(0x60180000),        //make $r6 = 0 (0x0);;
     _32(0x60140000),        //make $r5 = 0 (0x0);;
     _32(0x60100000),        //make $r4 = 0 (0x0);;
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff93),        //call 16918 <test3>;;
     _96(0x02049a4080000000e0000000),        //make $r0 = 4653142004841054208 (0x4093480000000000);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701020c),        //sd 8 (0x8)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701000c),        //sd 0 (0x0)[$r12] = $r0;;
     _32(0x602c0000),        //make $r11 = 0 (0x0);;
     _32(0x60280000),        //make $r10 = 0 (0x0);;
     _32(0x60240000),        //make $r9 = 0 (0x0);;
     _32(0x60200000),        //make $r8 = 0 (0x0);;
     _32(0x601c0000),        //make $r7 = 0 (0x0);;
     _32(0x60180000),        //make $r6 = 0 (0x0);;
     _32(0x60140000),        //make $r5 = 0 (0x0);;
     _32(0x60100000),        //make $r4 = 0 (0x0);;
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff9e),        //call 16998 <test4>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x38400e0c),        //ld $r16 = 56 (0x38)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16f10 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18a40 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101000100000; //0x16a20
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test1, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test2, 0b00010110100010011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test3, 0b00010110100100011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test4, 0b00010110100110011000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101100111000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016a20;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
