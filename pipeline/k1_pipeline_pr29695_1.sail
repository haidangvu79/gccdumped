// executing pipeline pr29695_1 test 
val k1_pipeline_pr29695_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr29695_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let f1: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x60000080),        //make $r0 = 128 (0x80);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x78002000),        //andw $r0 = $r0, 128 (0x80);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x6000ff80),        //make $r0 = -128 (0xffffff80);;
     _32(0x240107cc),        //sb 31 (0x1f)[$r12] = $r0;;
     _32(0x200007cc),        //lbz $r0 = 31 (0x1f)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x78002000),        //andw $r0 = $r0, 128 (0x80);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f3: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x6000ff80),        //make $r0 = -128 (0xffffff80);;
     _32(0x240107cc),        //sb 31 (0x1f)[$r12] = $r0;;
     _32(0x200007cc),        //lbz $r0 = 31 (0x1f)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x0d8000c0),        //cb.wgez $r0? 16888 <f3+0x20>;;
     _32(0x60000380),        //make $r0 = 896 (0x380);;
     _32(0x10000002),        //goto 1688c <f3+0x24>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f4: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x6000ff80),        //make $r0 = -128 (0xffffff80);;
     _32(0x240107cc),        //sb 31 (0x1f)[$r12] = $r0;;
     _32(0x200007cc),        //lbz $r0 = 31 (0x1f)[$r12];;
     _32(0x7800e000),        //andw $r0 = $r0, -128 (0xffffff80);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f5: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _64(0x00200000e0000000),        //make $r0 = 2147483648 (0x80000000);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x00200000e8000000),        //andd $r0 = $r0, 2147483648 (0x80000000);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let f6: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _64(0x07e00000e000003f),        //make $r0 = -2147483648 (0xffffffff80000000);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _64(0x00200000e8000000),        //andd $r0 = $r0, 2147483648 (0x80000000);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f7: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _64(0x07e00000e000003f),        //make $r0 = -2147483648 (0xffffffff80000000);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x0d800100),        //cb.wgez $r0? 16934 <f7+0x24>;;
     _64(0x00e00000e0000000),        //make $r0 = 15032385536 (0x380000000);;
     _32(0x10000002),        //goto 16938 <f7+0x28>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f8: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _64(0x07e00000e000003f),        //make $r0 = -2147483648 (0xffffffff80000000);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x07e00000f8000000),        //andw $r0 = $r0, -2147483648 (0xffffffff80000000);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1fffffa9),        //call 16820 <f1>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000004f101b000),        //compw.eq $r0 = $r0, 128 (0x80);;
     _32(0x0c000080),        //cb.wnez $r0? 16994 <main+0x24>;;
     _32(0x1800002c),        //call 16a40 <abort>;;
     _32(0x1fffffab),        //call 16840 <f2>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000004f101b000),        //compw.eq $r0 = $r0, 128 (0x80);;
     _32(0x0c000080),        //cb.wnez $r0? 169ac <main+0x3c>;;
     _32(0x18000026),        //call 16a40 <abort>;;
     _32(0x1fffffaf),        //call 16868 <f3>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x0000001cf101b000),        //compw.eq $r0 = $r0, 896 (0x380);;
     _32(0x0c000080),        //cb.wnez $r0? 169c4 <main+0x54>;;
     _32(0x18000020),        //call 16a40 <abort>;;
     _32(0x1fffffb5),        //call 16898 <f4>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x07fffffcf101b000),        //compw.eq $r0 = $r0, 4294967168 (0xffffff80);;
     _32(0x0c000080),        //cb.wnez $r0? 169dc <main+0x6c>;;
     _32(0x1800001a),        //call 16a40 <abort>;;
     _32(0x1fffffb9),        //call 168c0 <f5>;;
     _64(0x00200000e1010000),        //compd.eq $r0 = $r0, 2147483648 (0x80000000);;
     _32(0x08000080),        //cb.dnez $r0? 169f0 <main+0x80>;;
     _32(0x18000015),        //call 16a40 <abort>;;
     _32(0x1fffffbe),        //call 168e8 <f6>;;
     _64(0x00200000e1010000),        //compd.eq $r0 = $r0, 2147483648 (0x80000000);;
     _32(0x08000080),        //cb.dnez $r0? 16a04 <main+0x94>;;
     _32(0x18000010),        //call 16a40 <abort>;;
     _32(0x1fffffc3),        //call 16910 <f7>;;
     _64(0x00e00000e1010000),        //compd.eq $r0 = $r0, 15032385536 (0x380000000);;
     _32(0x08000080),        //cb.dnez $r0? 16a18 <main+0xa8>;;
     _32(0x1800000b),        //call 16a40 <abort>;;
     _32(0x1fffffca),        //call 16940 <f8>;;
     _64(0x07e00000e1010000),        //compd.eq $r0 = $r0, -2147483648 (0xffffffff80000000);;
     _32(0x08000080),        //cb.dnez $r0? 16a2c <main+0xbc>;;
     _32(0x18000006),        //call 16a40 <abort>;;
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
     _32(0x980000f3),        //call 16e18 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18948 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100101110000; //0x16970
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f1, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f2, 0b00010110100001000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f3, 0b00010110100001101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f4, 0b00010110100010011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f5, 0b00010110100011000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f6, 0b00010110100011101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f7, 0b00010110100100010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f8, 0b00010110100101000000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100101110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101001000000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016970;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
