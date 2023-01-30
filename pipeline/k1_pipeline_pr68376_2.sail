// executing pipeline pr68376_2 test 
val k1_pipeline_pr68376_2: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr68376_2() = {
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
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0d800140),        //cb.wgez $r0? 16840 <f1+0x20>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7c00ffc0),        //notw $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x10000002),        //goto 16844 <f1+0x24>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0d000140),        //cb.wltz $r0? 16870 <f2+0x20>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7c00ffc0),        //notw $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x10000002),        //goto 16874 <f2+0x24>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f3: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0e800140),        //cb.wgtz $r0? 168a0 <f3+0x20>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7c00ffc0),        //notw $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x10000002),        //goto 168a4 <f3+0x24>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f4: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0e000140),        //cb.wlez $r0? 168d0 <f4+0x20>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7c00ffc0),        //notw $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x10000002),        //goto 168d4 <f4+0x24>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f5: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0d000140),        //cb.wltz $r0? 16900 <f5+0x20>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7c00ffc0),        //notw $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x10000002),        //goto 16904 <f5+0x24>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f6: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0d800140),        //cb.wgez $r0? 16930 <f6+0x20>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7c00ffc0),        //notw $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x10000002),        //goto 16934 <f6+0x24>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f7: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0e000140),        //cb.wlez $r0? 16960 <f7+0x20>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7c00ffc0),        //notw $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x10000002),        //goto 16964 <f7+0x24>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let f8: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0e800140),        //cb.wgtz $r0? 16990 <f8+0x20>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7c00ffc0),        //notw $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x10000002),        //goto 16994 <f8+0x24>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1fffff9c),        //call 16820 <f1>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f001b140),        //compw.ne $r0 = $r0, 5 (0x5);;
     _32(0x0c0002c0),        //cb.wnez $r0? 169ec <main+0x4c>;;
     _32(0x6000fffb),        //make $r0 = -5 (0xfffffffb);;
     _32(0x1fffff96),        //call 16820 <f1>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f001b100),        //compw.ne $r0 = $r0, 4 (0x4);;
     _32(0x0c000140),        //cb.wnez $r0? 169ec <main+0x4c>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff90),        //call 16820 <f1>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 169f0 <main+0x50>;;
     _32(0x18000085),        //call 16c00 <abort>;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1fffff97),        //call 16850 <f2>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x07fffffff001b680),        //compw.ne $r0 = $r0, 4294967290 (0xfffffffa);;
     _32(0x0c000340),        //cb.wnez $r0? 16a38 <main+0x98>;;
     _32(0x6000fffb),        //make $r0 = -5 (0xfffffffb);;
     _32(0x1fffff91),        //call 16850 <f2>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x07fffffff001b6c0),        //compw.ne $r0 = $r0, 4294967291 (0xfffffffb);;
     _32(0x0c0001c0),        //cb.wnez $r0? 16a38 <main+0x98>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff8b),        //call 16850 <f2>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x07fffffff101b7c0),        //compw.eq $r0 = $r0, 4294967295 (0xffffffff);;
     _32(0x0c000080),        //cb.wnez $r0? 16a3c <main+0x9c>;;
     _32(0x18000072),        //call 16c00 <abort>;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1fffff90),        //call 16880 <f3>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f001b140),        //compw.ne $r0 = $r0, 5 (0x5);;
     _32(0x0c000340),        //cb.wnez $r0? 16a84 <main+0xe4>;;
     _32(0x6000fffb),        //make $r0 = -5 (0xfffffffb);;
     _32(0x1fffff8a),        //call 16880 <f3>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f001b100),        //compw.ne $r0 = $r0, 4 (0x4);;
     _32(0x0c0001c0),        //cb.wnez $r0? 16a84 <main+0xe4>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff84),        //call 16880 <f3>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x07fffffff101b7c0),        //compw.eq $r0 = $r0, 4294967295 (0xffffffff);;
     _32(0x0c000080),        //cb.wnez $r0? 16a88 <main+0xe8>;;
     _32(0x1800005f),        //call 16c00 <abort>;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1fffff89),        //call 168b0 <f4>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x07fffffff001b680),        //compw.ne $r0 = $r0, 4294967290 (0xfffffffa);;
     _32(0x0c0002c0),        //cb.wnez $r0? 16ac8 <main+0x128>;;
     _32(0x6000fffb),        //make $r0 = -5 (0xfffffffb);;
     _32(0x1fffff83),        //call 168b0 <f4>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x07fffffff001b6c0),        //compw.ne $r0 = $r0, 4294967291 (0xfffffffb);;
     _32(0x0c000140),        //cb.wnez $r0? 16ac8 <main+0x128>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff7d),        //call 168b0 <f4>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16acc <main+0x12c>;;
     _32(0x1800004e),        //call 16c00 <abort>;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1fffff84),        //call 168e0 <f5>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x07fffffff001b680),        //compw.ne $r0 = $r0, 4294967290 (0xfffffffa);;
     _32(0x0c000340),        //cb.wnez $r0? 16b14 <main+0x174>;;
     _32(0x6000fffb),        //make $r0 = -5 (0xfffffffb);;
     _32(0x1fffff7e),        //call 168e0 <f5>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x07fffffff001b6c0),        //compw.ne $r0 = $r0, 4294967291 (0xfffffffb);;
     _32(0x0c0001c0),        //cb.wnez $r0? 16b14 <main+0x174>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff78),        //call 168e0 <f5>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x07fffffff101b7c0),        //compw.eq $r0 = $r0, 4294967295 (0xffffffff);;
     _32(0x0c000080),        //cb.wnez $r0? 16b18 <main+0x178>;;
     _32(0x1800003b),        //call 16c00 <abort>;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1fffff7d),        //call 16910 <f6>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f001b140),        //compw.ne $r0 = $r0, 5 (0x5);;
     _32(0x0c0002c0),        //cb.wnez $r0? 16b58 <main+0x1b8>;;
     _32(0x6000fffb),        //make $r0 = -5 (0xfffffffb);;
     _32(0x1fffff77),        //call 16910 <f6>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f001b100),        //compw.ne $r0 = $r0, 4 (0x4);;
     _32(0x0c000140),        //cb.wnez $r0? 16b58 <main+0x1b8>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff71),        //call 16910 <f6>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16b5c <main+0x1bc>;;
     _32(0x1800002a),        //call 16c00 <abort>;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1fffff78),        //call 16940 <f7>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x07fffffff001b680),        //compw.ne $r0 = $r0, 4294967290 (0xfffffffa);;
     _32(0x0c0002c0),        //cb.wnez $r0? 16b9c <main+0x1fc>;;
     _32(0x6000fffb),        //make $r0 = -5 (0xfffffffb);;
     _32(0x1fffff72),        //call 16940 <f7>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x07fffffff001b6c0),        //compw.ne $r0 = $r0, 4294967291 (0xfffffffb);;
     _32(0x0c000140),        //cb.wnez $r0? 16b9c <main+0x1fc>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff6c),        //call 16940 <f7>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16ba0 <main+0x200>;;
     _32(0x18000019),        //call 16c00 <abort>;;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x1fffff73),        //call 16970 <f8>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f001b140),        //compw.ne $r0 = $r0, 5 (0x5);;
     _32(0x0c000340),        //cb.wnez $r0? 16be8 <main+0x248>;;
     _32(0x6000fffb),        //make $r0 = -5 (0xfffffffb);;
     _32(0x1fffff6d),        //call 16970 <f8>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f001b100),        //compw.ne $r0 = $r0, 4 (0x4);;
     _32(0x0c0001c0),        //cb.wnez $r0? 16be8 <main+0x248>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff67),        //call 16970 <f8>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x07fffffff101b7c0),        //compw.eq $r0 = $r0, 4294967295 (0xffffffff);;
     _32(0x0c000080),        //cb.wnez $r0? 16bec <main+0x24c>;;
     _32(0x18000006),        //call 16c00 <abort>;;
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
     _32(0x980000f3),        //call 16fd8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18b08 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100110100000; //0x169a0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f1, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f2, 0b00010110100001010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f3, 0b00010110100010000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f4, 0b00010110100010110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f5, 0b00010110100011100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f6, 0b00010110100100010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f7, 0b00010110100101000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f8, 0b00010110100101110000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100110100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110110000000000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000169a0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
