// executing pipeline pr70005.c.out.dumped test 
val k1_pipeline_pr70005: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr70005() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let fn1: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x76000040),        //minuw $r0 = $r0, 1 (0x1);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x08800440),        //cb.deqz $r0? 1689c <fn1+0x7c>;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x088000c0),        //cb.deqz $r0? 1689c <fn1+0x7c>;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x10000002),        //goto 168a0 <fn1+0x80>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x78000180),        //andw $r0 = $r0, 6 (0x6);;
     _32(0x26010c0c),        //sw 48 (0x30)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x26010b0c),        //sw 44 (0x2c)[$r12] = $r0;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7c00ffc0),        //notw $r0 = $r0;;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x08000180),        //cb.dnez $r0? 16924 <fn1+0x104>;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x088000c0),        //cb.deqz $r0? 1692c <fn1+0x10c>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x10000002),        //goto 16930 <fn1+0x110>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010a0c),        //sw 40 (0x28)[$r12] = $r0;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x7c00ffc0),        //notw $r0 = $r0;;
     _32(0x240109cc),        //sb 39 (0x27)[$r12] = $r0;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x088000c0),        //cb.deqz $r0? 16968 <fn1+0x148>;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x200009cc),        //lbz $r0 = 39 (0x27)[$r12];;
     _32(0x0c800200),        //cb.weqz $r0? 1698c <fn1+0x16c>;;
     _32(0x30000a0c),        //lwz $r0 = 40 (0x28)[$r12];;
     _32(0x0c800180),        //cb.weqz $r0? 1698c <fn1+0x16c>;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x30040e0c),        //lwz $r1 = 56 (0x38)[$r12];;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x5b003001),        //mulw $r0 = $r1, $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x200009cc),        //lbz $r0 = 39 (0x27)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x5b003001),        //mulw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800340),        //cb.deqz $r0? 16a00 <fn1+0x1e0>;;
     _32(0x30000b0c),        //lwz $r0 = 44 (0x2c)[$r12];;
     _32(0x0c0000c0),        //cb.wnez $r0? 169e0 <fn1+0x1c0>;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _32(0x0c8000c0),        //cb.weqz $r0? 169e8 <fn1+0x1c8>;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x10000002),        //goto 169ec <fn1+0x1cc>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _32(0x7101b040),        //compw.eq $r0 = $r0, $r1;;
     _32(0x0c0000c0),        //cb.wnez $r0? 16a00 <fn1+0x1e0>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x10000002),        //goto 16a04 <fn1+0x1e4>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16a1c <fn1+0x1fc>;;
     _32(0x18000010),        //call 16a58 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1fffff79),        //call 16820 <fn1>;;
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
     _32(0x980000f3),        //call 16e30 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18960 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101000110000; //0x16a30
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fn1, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101000110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101001011000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016a30;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
