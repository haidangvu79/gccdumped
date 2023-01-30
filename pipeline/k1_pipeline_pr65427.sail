// executing pipeline pr65427 test 
val k1_pipeline_pr65427: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr65427() = {
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
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0c800480),        //cb.weqz $r0? 16878 <foo+0x58>;;
     _96(0x0000000080000117e0004800),        //make $r0 = 285984 (0x45d20);;
     _32(0x3c140000),        //lo $r4r5r6r7 = 0 (0x0)[$r0];;
     _96(0x0000000080000117e0003800),        //make $r0 = 285920 (0x45ce0);;
     _32(0x3c040000),        //lo $r0r1r2r3 = 0 (0x0)[$r0];;
     _32(0xfc010004),        //xord $r0 = $r4, $r0
     _32(0xfc050045),        //xord $r1 = $r5, $r1
     _32(0xfc090086),        //xord $r2 = $r6, $r2
     _32(0x7c0d00c7),        //xord $r3 = $r7, $r3;;
     _96(0x0000000080000117e0104000),        //make $r4 = 285952 (0x45d00);;
     _32(0x28050004),        //so 0 (0x0)[$r4] = $r0r1r2r3;;
     _32(0x10000011),        //goto 168b8 <foo+0x98>;;
     _96(0x0000000080000117e0004800),        //make $r0 = 285984 (0x45d20);;
     _32(0x3c140000),        //lo $r4r5r6r7 = 0 (0x0)[$r0];;
     _96(0x0000000080000117e0002800),        //make $r0 = 285856 (0x45ca0);;
     _32(0x3c040000),        //lo $r0r1r2r3 = 0 (0x0)[$r0];;
     _32(0xfc010004),        //xord $r0 = $r4, $r0
     _32(0xfc050045),        //xord $r1 = $r5, $r1
     _32(0xfc090086),        //xord $r2 = $r6, $r2
     _32(0x7c0d00c7),        //xord $r3 = $r7, $r3;;
     _96(0x0000000080000117e0104000),        //make $r4 = 285952 (0x45d00);;
     _32(0x28050004),        //so 0 (0x0)[$r4] = $r0r1r2r3;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x0c7ff700),        //cb.wnez $r0? 1682c <foo+0xc>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x0000000080000117e0104800),        //make $r4 = 285984 (0x45d20);;
     _64(0x00800000e0000040),        //make $r0 = 8589934593 (0x200000001);;
     _64(0x01000000e00400c0),        //make $r1 = 17179869187 (0x400000003);;
     _64(0x01800000e0080140),        //make $r2 = 25769803781 (0x600000005);;
     _64(0x02000000e00c01c0),        //make $r3 = 34359738375 (0x800000007);;
     _32(0x28050004),        //so 0 (0x0)[$r4] = $r0r1r2r3;;
     _96(0x0000000080000117e0102800),        //make $r4 = 285856 (0x45ca0);;
     _64(0x00000000e0001004),        //make $r0 = 549755813952 (0x8000000040);;
     _64(0x00000000e0041004),        //make $r1 = 549755813952 (0x8000000040);;
     _64(0x00000000e0081004),        //make $r2 = 549755813952 (0x8000000040);;
     _64(0x00000000e00c1004),        //make $r3 = 549755813952 (0x8000000040);;
     _32(0x28050004),        //so 0 (0x0)[$r4] = $r0r1r2r3;;
     _96(0x0000000080000117e0105000),        //make $r4 = 286016 (0x45d40);;
     _64(0x00800000e0001044),        //make $r0 = 558345748545 (0x8200000041);;
     _64(0x01000000e00410c4),        //make $r1 = 566935683139 (0x8400000043);;
     _64(0x01800000e0081144),        //make $r2 = 575525617733 (0x8600000045);;
     _64(0x02000000e00c11c4),        //make $r3 = 584115552327 (0x8800000047);;
     _32(0x28050004),        //so 0 (0x0)[$r4] = $r0r1r2r3;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffab),        //call 16820 <foo>;;
     _32(0x60080020),        //make $r2 = 32 (0x20);;
     _96(0x0000000080000117e0045000),        //make $r1 = 286016 (0x45d40);;
     _96(0x0000000080000117e0004000),        //make $r0 = 285952 (0x45d00);;
     _32(0x18000077),        //call 16b70 <memcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 169a4 <main+0xd4>;;
     _32(0x1800002c),        //call 16a50 <abort>;;
     _96(0x0000000080000117e0103800),        //make $r4 = 285920 (0x45ce0);;
     _64(0x00000000e0002002),        //make $r0 = 274877907072 (0x4000000080);;
     _64(0x00000000e0042002),        //make $r1 = 274877907072 (0x4000000080);;
     _64(0x00000000e0082002),        //make $r2 = 274877907072 (0x4000000080);;
     _64(0x00000000e00c2002),        //make $r3 = 274877907072 (0x4000000080);;
     _32(0x28050004),        //so 0 (0x0)[$r4] = $r0r1r2r3;;
     _96(0x0000000080000117e0103000),        //make $r4 = 285888 (0x45cc0);;
     _64(0x00800000e0002042),        //make $r0 = 283467841665 (0x4200000081);;
     _64(0x01000000e00420c2),        //make $r1 = 292057776259 (0x4400000083);;
     _64(0x01800000e0082142),        //make $r2 = 300647710853 (0x4600000085);;
     _64(0x02000000e00c21c2),        //make $r3 = 309237645447 (0x4800000087);;
     _32(0x28050004),        //so 0 (0x0)[$r4] = $r0r1r2r3;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffff85),        //call 16820 <foo>;;
     _32(0x60080020),        //make $r2 = 32 (0x20);;
     _96(0x0000000080000117e0043000),        //make $r1 = 285888 (0x45cc0);;
     _96(0x0000000080000117e0004000),        //make $r0 = 285952 (0x45d00);;
     _32(0x18000051),        //call 16b70 <memcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16a3c <main+0x16c>;;
     _32(0x18000006),        //call 16a50 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000115),        //call 16eb0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007df),        //call 189e0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100011010000; //0x168d0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100011010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101001010000, num_instr, mI);
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
