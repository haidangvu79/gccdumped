// executing bswap_1 test 
val k1_bswap_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_bswap_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let g: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _96(0x0008102082040810ee022000),        //sbmm8 $r0 = $r0, 72624976668147840 (0x102040810204080);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701020c),        //sd 8 (0x8)[$r12] = $r0;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x200007cc),        //lbz $r0 = 31 (0x1f)[$r12];;
     _32(0x2401040c),        //sb 16 (0x10)[$r12] = $r0;;
     _32(0x2000078c),        //lbz $r0 = 30 (0x1e)[$r12];;
     _32(0x2401044c),        //sb 17 (0x11)[$r12] = $r0;;
     _32(0x2000074c),        //lbz $r0 = 29 (0x1d)[$r12];;
     _32(0x2401048c),        //sb 18 (0x12)[$r12] = $r0;;
     _32(0x2000070c),        //lbz $r0 = 28 (0x1c)[$r12];;
     _32(0x240104cc),        //sb 19 (0x13)[$r12] = $r0;;
     _32(0x200006cc),        //lbz $r0 = 27 (0x1b)[$r12];;
     _32(0x2401050c),        //sb 20 (0x14)[$r12] = $r0;;
     _32(0x2000068c),        //lbz $r0 = 26 (0x1a)[$r12];;
     _32(0x2401054c),        //sb 21 (0x15)[$r12] = $r0;;
     _32(0x2000064c),        //lbz $r0 = 25 (0x19)[$r12];;
     _32(0x2401058c),        //sb 22 (0x16)[$r12] = $r0;;
     _32(0x2000060c),        //lbz $r0 = 24 (0x18)[$r12];;
     _32(0x240105cc),        //sb 23 (0x17)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x60000012),        //make $r0 = 18 (0x12);;
     _32(0x1fffffe3),        //call 16840 <f>;;
     _32(0x6a380000),        //copyd $r14 = $r0;;
     _32(0x60000012),        //make $r0 = 18 (0x12);;
     _32(0x1fffffd8),        //call 16820 <g>;;
     _32(0x7101a00e),        //compd.eq $r0 = $r14, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 168d0 <main+0x30>;;
     _32(0x18000051),        //call 16a10 <abort>;;
     _32(0x60001234),        //make $r0 = 4660 (0x1234);;
     _32(0x1fffffdb),        //call 16840 <f>;;
     _32(0x6a380000),        //copyd $r14 = $r0;;
     _32(0x60001234),        //make $r0 = 4660 (0x1234);;
     _32(0x1fffffd0),        //call 16820 <g>;;
     _32(0x7101a00e),        //compd.eq $r0 = $r14, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 168f0 <main+0x50>;;
     _32(0x18000049),        //call 16a10 <abort>;;
     _64(0x0000048de0001580),        //make $r0 = 1193046 (0x123456);;
     _32(0x1fffffd2),        //call 16840 <f>;;
     _32(0x6a380000),        //copyd $r14 = $r0;;
     _64(0x0000048de0001580),        //make $r0 = 1193046 (0x123456);;
     _32(0x1fffffc6),        //call 16820 <g>;;
     _32(0x7101a00e),        //compd.eq $r0 = $r14, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16918 <main+0x78>;;
     _32(0x1800003f),        //call 16a10 <abort>;;
     _64(0x00048d15e0009e00),        //make $r0 = 305419896 (0x12345678);;
     _32(0x1fffffc8),        //call 16840 <f>;;
     _32(0x6a380000),        //copyd $r14 = $r0;;
     _64(0x00048d15e0009e00),        //make $r0 = 305419896 (0x12345678);;
     _32(0x1fffffbc),        //call 16820 <g>;;
     _32(0x7101a00e),        //compd.eq $r0 = $r14, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16940 <main+0xa0>;;
     _32(0x18000035),        //call 16a10 <abort>;;
     _64(0x048d159ee0002400),        //make $r0 = 78187493520 (0x1234567890);;
     _32(0x1fffffbe),        //call 16840 <f>;;
     _32(0x6a380000),        //copyd $r14 = $r0;;
     _64(0x048d159ee0002400),        //make $r0 = 78187493520 (0x1234567890);;
     _32(0x1fffffb2),        //call 16820 <g>;;
     _32(0x7101a00e),        //compd.eq $r0 = $r14, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16968 <main+0xc8>;;
     _32(0x1800002b),        //call 16a10 <abort>;;
     _96(0x0000009185159e24e0000480),        //make $r0 = 20015998341138 (0x123456789012);;
     _32(0x1fffffb3),        //call 16840 <f>;;
     _32(0x6a380000),        //copyd $r14 = $r0;;
     _96(0x0000009185159e24e0000480),        //make $r0 = 20015998341138 (0x123456789012);;
     _32(0x1fffffa6),        //call 16820 <g>;;
     _32(0x7101a00e),        //compd.eq $r0 = $r14, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16998 <main+0xf8>;;
     _32(0x1800001f),        //call 16a10 <abort>;;
     _96(0x000091a2859e2404e0008d00),        //make $r0 = 5124095575331380 (0x12345678901234);;
     _32(0x1fffffa7),        //call 16840 <f>;;
     _32(0x6a380000),        //copyd $r14 = $r0;;
     _96(0x000091a2859e2404e0008d00),        //make $r0 = 5124095575331380 (0x12345678901234);;
     _32(0x1fffff9a),        //call 16820 <g>;;
     _32(0x7101a00e),        //compd.eq $r0 = $r14, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 169c8 <main+0x128>;;
     _32(0x18000013),        //call 16a10 <abort>;;
     _96(0x0091a2b38624048de0001580),        //make $r0 = 1311768467284833366 (0x1234567890123456);;
     _32(0x1fffff9b),        //call 16840 <f>;;
     _32(0x6a380000),        //copyd $r14 = $r0;;
     _96(0x0091a2b38624048de0001580),        //make $r0 = 1311768467284833366 (0x1234567890123456);;
     _32(0x1fffff8e),        //call 16820 <g>;;
     _32(0x7101a00e),        //compd.eq $r0 = $r14, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 169f8 <main+0x158>;;
     _32(0x18000007),        //call 16a10 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838040c),        //ld $r14 = 16 (0x10)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16de8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18918 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100010100000; //0x168a0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(g, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100001000000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101000010000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
