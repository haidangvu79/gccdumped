// executing pipeline 931004_11.c.out.dumped test 
val k1_pipeline_931004_11: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_931004_11() = {
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
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x27050c0c),        //sd 48 (0x30)[$r12] = $r1;;
     _32(0x27090a0c),        //sd 40 (0x28)[$r12] = $r2;;
     _32(0x270d080c),        //sd 32 (0x20)[$r12] = $r3;;
     _32(0x2711060c),        //sd 24 (0x18)[$r12] = $r4;;
     _32(0x20000c0c),        //lbz $r0 = 48 (0x30)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000000f101b280),        //compw.eq $r0 = $r0, 10 (0xa);;
     _32(0x0c000080),        //cb.wnez $r0? 16858 <f+0x38>;;
     _32(0x18000063),        //call 169e0 <abort>;;
     _32(0x20000c4c),        //lbz $r0 = 49 (0x31)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000000f101b500),        //compw.eq $r0 = $r0, 20 (0x14);;
     _32(0x0c000080),        //cb.wnez $r0? 16870 <f+0x50>;;
     _32(0x1800005d),        //call 169e0 <abort>;;
     _32(0x20000c8c),        //lbz $r0 = 50 (0x32)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000000f101b780),        //compw.eq $r0 = $r0, 30 (0x1e);;
     _32(0x0c000080),        //cb.wnez $r0? 16888 <f+0x68>;;
     _32(0x18000057),        //call 169e0 <abort>;;
     _32(0x20000a0c),        //lbz $r0 = 40 (0x28)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000000f101b2c0),        //compw.eq $r0 = $r0, 11 (0xb);;
     _32(0x0c000080),        //cb.wnez $r0? 168a0 <f+0x80>;;
     _32(0x18000051),        //call 169e0 <abort>;;
     _32(0x20000a4c),        //lbz $r0 = 41 (0x29)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000000f101b540),        //compw.eq $r0 = $r0, 21 (0x15);;
     _32(0x0c000080),        //cb.wnez $r0? 168b8 <f+0x98>;;
     _32(0x1800004b),        //call 169e0 <abort>;;
     _32(0x20000a8c),        //lbz $r0 = 42 (0x2a)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000000f101b7c0),        //compw.eq $r0 = $r0, 31 (0x1f);;
     _32(0x0c000080),        //cb.wnez $r0? 168d0 <f+0xb0>;;
     _32(0x18000045),        //call 169e0 <abort>;;
     _32(0x2000080c),        //lbz $r0 = 32 (0x20)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000000f101b300),        //compw.eq $r0 = $r0, 12 (0xc);;
     _32(0x0c000080),        //cb.wnez $r0? 168e8 <f+0xc8>;;
     _32(0x1800003f),        //call 169e0 <abort>;;
     _32(0x2000084c),        //lbz $r0 = 33 (0x21)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000000f101b580),        //compw.eq $r0 = $r0, 22 (0x16);;
     _32(0x0c000080),        //cb.wnez $r0? 16900 <f+0xe0>;;
     _32(0x18000039),        //call 169e0 <abort>;;
     _32(0x2000088c),        //lbz $r0 = 34 (0x22)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000001f101b000),        //compw.eq $r0 = $r0, 32 (0x20);;
     _32(0x0c000080),        //cb.wnez $r0? 16918 <f+0xf8>;;
     _32(0x18000033),        //call 169e0 <abort>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61011ec0),        //compd.eq $r0 = $r0, 123 (0x7b);;
     _32(0x08000080),        //cb.dnez $r0? 16928 <f+0x108>;;
     _32(0x1800002f),        //call 169e0 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x6000000a),        //make $r0 = 10 (0xa);;
     _32(0x2401040c),        //sb 16 (0x10)[$r12] = $r0;;
     _32(0x6000000b),        //make $r0 = 11 (0xb);;
     _32(0x240104cc),        //sb 19 (0x13)[$r12] = $r0;;
     _32(0x6000000c),        //make $r0 = 12 (0xc);;
     _32(0x2401058c),        //sb 22 (0x16)[$r12] = $r0;;
     _32(0x60000014),        //make $r0 = 20 (0x14);;
     _32(0x2401044c),        //sb 17 (0x11)[$r12] = $r0;;
     _32(0x60000015),        //make $r0 = 21 (0x15);;
     _32(0x2401050c),        //sb 20 (0x14)[$r12] = $r0;;
     _32(0x60000016),        //make $r0 = 22 (0x16);;
     _32(0x240105cc),        //sb 23 (0x17)[$r12] = $r0;;
     _32(0x6000001e),        //make $r0 = 30 (0x1e);;
     _32(0x2401048c),        //sb 18 (0x12)[$r12] = $r0;;
     _32(0x6000001f),        //make $r0 = 31 (0x1f);;
     _32(0x2401054c),        //sb 21 (0x15)[$r12] = $r0;;
     _32(0x60000020),        //make $r0 = 32 (0x20);;
     _32(0x2401060c),        //sb 24 (0x18)[$r12] = $r0;;
     _32(0x6010007b),        //make $r4 = 123 (0x7b);;
     _32(0x3000058c),        //lwz $r0 = 22 (0x16)[$r12];;
     _32(0x650f7000),        //extfz $r3 = $r0, 23 (0x17), 0 (0x0);;
     _32(0x7800ffc3),        //zxwd $r0 = $r3;;
     _32(0x6a0c0000),        //copyd $r3 = $r0;;
     _32(0x200004cc),        //lbz $r0 = 19 (0x13)[$r12];;
     _32(0x2004050c),        //lbz $r1 = 20 (0x14)[$r12];;
     _32(0x79062201),        //slld $r1 = $r1, 8 (0x8);;
     _32(0x7a010001),        //ord $r0 = $r1, $r0;;
     _32(0x2004054c),        //lbz $r1 = 21 (0x15)[$r12];;
     _32(0x79062401),        //slld $r1 = $r1, 16 (0x10);;
     _32(0x7a010001),        //ord $r0 = $r1, $r0;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x60000003),        //make $r0 = 3 (0x3);;
     _32(0x1fffff94),        //call 16820 <f>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 16a00 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16e00 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18ad8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0xf838ffc0),        //zxwd $r14 = $r0
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x98000161),        //call 16f98 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16a3c <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18ad8 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100101000000; //0x16940
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100101000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100111100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110101000000000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016940;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
