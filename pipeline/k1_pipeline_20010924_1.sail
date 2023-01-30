// executing pipeline 20010924_1 test 
val k1_pipeline_20010924_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20010924_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000001f101b500),        //compw.eq $r0 = $r0, 52 (0x34);;
     _32(0x0c000080),        //cb.wnez $r0? 16850 <main+0x30>;;
     _32(0x18000075),        //call 16a20 <abort>;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000001f101b580),        //compw.eq $r0 = $r0, 54 (0x36);;
     _32(0x0c000080),        //cb.wnez $r0? 16878 <main+0x58>;;
     _32(0x1800006b),        //call 16a20 <abort>;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000001f101b480),        //compw.eq $r0 = $r0, 50 (0x32);;
     _32(0x0c000080),        //cb.wnez $r0? 168a4 <main+0x84>;;
     _32(0x18000060),        //call 16a20 <abort>;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _32(0x61000080),        //addd $r0 = $r0, 2 (0x2);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x08800080),        //cb.deqz $r0? 168c4 <main+0xa4>;;
     _32(0x18000058),        //call 16a20 <abort>;;
     _96(0x00000000800000f8e0000600),        //make $r0 = 253976 (0x3e018);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000003f101b580),        //compw.eq $r0 = $r0, 118 (0x76);;
     _32(0x0c000080),        //cb.wnez $r0? 168e8 <main+0xc8>;;
     _32(0x1800004f),        //call 16a20 <abort>;;
     _96(0x00000000800000f8e0000600),        //make $r0 = 253976 (0x3e018);;
     _32(0x20000040),        //lbz $r0 = 1 (0x1)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000003f101b0c0),        //compw.eq $r0 = $r0, 99 (0x63);;
     _32(0x0c000080),        //cb.wnez $r0? 1690c <main+0xec>;;
     _32(0x18000046),        //call 16a20 <abort>;;
     _96(0x00000000800000f8e0000600),        //make $r0 = 253976 (0x3e018);;
     _32(0x20000080),        //lbz $r0 = 2 (0x2)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000003f101b440),        //compw.eq $r0 = $r0, 113 (0x71);;
     _32(0x0c000080),        //cb.wnez $r0? 16930 <main+0x110>;;
     _32(0x1800003d),        //call 16a20 <abort>;;
     _96(0x00000000800000f8e0000800),        //make $r0 = 253984 (0x3e020);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000003f101b3c0),        //compw.eq $r0 = $r0, 111 (0x6f);;
     _32(0x0c000080),        //cb.wnez $r0? 16954 <main+0x134>;;
     _32(0x18000034),        //call 16a20 <abort>;;
     _96(0x00000000800000f8e0000800),        //make $r0 = 253984 (0x3e020);;
     _32(0x20000040),        //lbz $r0 = 1 (0x1)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000003f101b5c0),        //compw.eq $r0 = $r0, 119 (0x77);;
     _32(0x0c000080),        //cb.wnez $r0? 16978 <main+0x158>;;
     _32(0x1800002b),        //call 16a20 <abort>;;
     _96(0x00000000800000f8e0000800),        //make $r0 = 253984 (0x3e020);;
     _32(0x20000080),        //lbz $r0 = 2 (0x2)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000003f101b600),        //compw.eq $r0 = $r0, 120 (0x78);;
     _32(0x0c000080),        //cb.wnez $r0? 1699c <main+0x17c>;;
     _32(0x18000022),        //call 16a20 <abort>;;
     _96(0x00000000800000f8e0000a00),        //make $r0 = 253992 (0x3e028);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000001f101b640),        //compw.eq $r0 = $r0, 57 (0x39);;
     _32(0x0c000080),        //cb.wnez $r0? 169c0 <main+0x1a0>;;
     _32(0x18000019),        //call 16a20 <abort>;;
     _96(0x00000000800000f8e0000a00),        //make $r0 = 253992 (0x3e028);;
     _32(0x20000040),        //lbz $r0 = 1 (0x1)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000003f101b140),        //compw.eq $r0 = $r0, 101 (0x65);;
     _32(0x0c000080),        //cb.wnez $r0? 169e4 <main+0x1c4>;;
     _32(0x18000010),        //call 16a20 <abort>;;
     _96(0x00000000800000f8e0000a00),        //make $r0 = 253992 (0x3e028);;
     _32(0x20000080),        //lbz $r0 = 2 (0x2)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000003f101b080),        //compw.eq $r0 = $r0, 98 (0x62);;
     _32(0x0c000080),        //cb.wnez $r0? 16a08 <main+0x1e8>;;
     _32(0x18000007),        //call 16a20 <abort>;;
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
     _32(0x980000f3),        //call 16df8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18928 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101000100000, num_instr, mI);
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
