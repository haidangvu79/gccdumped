// executing pipeline 20010129_1 test 
val k1_pipeline_20010129_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20010129_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let baz1: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x61040040),        //addd $r1 = $r0, 1 (0x1);;
     _96(0x0000000080000106e0087000),        //make $r2 = 268736 (0x419c0);;
     _32(0x27050002),        //sd 0 (0x0)[$r2] = $r1;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let baz2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let baz3: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0c000080),        //cb.wnez $r0? 1688c <baz3+0x1c>;;
     _32(0x1800009a),        //call 16af0 <abort>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let foo: list_I = 
 [|
     _32(0x6130b00c),        //addd $r12 = $r12, -320 (0xfffffec0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x2609020c),        //sw 8 (0x8)[$r12] = $r2;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26014f0c),        //sw 316 (0x13c)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601490c),        //sw 292 (0x124)[$r12] = $r0;;
     _32(0x6000000a),        //make $r0 = 10 (0xa);;
     _32(0x2401080c),        //sb 32 (0x20)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2401084c),        //sb 33 (0x21)[$r12] = $r0;;
     _32(0x10000068),        //goto 16a78 <foo+0x1d8>;;
     _32(0x2000080c),        //lbz $r0 = 32 (0x20)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000001f101b000),        //compw.eq $r0 = $r0, 32 (0x20);;
     _32(0x0c0018c0),        //cb.wnez $r0? 16a78 <foo+0x1d8>;;
     _32(0x2000080c),        //lbz $r0 = 32 (0x20)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000000f101b240),        //compw.eq $r0 = $r0, 9 (0x9);;
     _32(0x0c001780),        //cb.wnez $r0? 16a78 <foo+0x1d8>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2601490c),        //sw 292 (0x124)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26014e0c),        //sw 312 (0x138)[$r12] = $r0;;
     _32(0x30004f0c),        //lwz $r0 = 316 (0x13c)[$r12];;
     _32(0x0c000380),        //cb.wnez $r0? 16950 <foo+0xb0>;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x1fffffce),        //call 16858 <baz2>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000280),        //cb.dnez $r0? 16950 <foo+0xb0>;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x78000400),        //andw $r0 = $r0, 16 (0x10);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16940 <foo+0xa0>;;
     _32(0x1000004f),        //goto 16a78 <foo+0x1d8>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x26014f0c),        //sw 316 (0x13c)[$r12] = $r0;;
     _32(0x30004f0c),        //lwz $r0 = 316 (0x13c)[$r12];;
     _32(0x26014e0c),        //sw 312 (0x138)[$r12] = $r0;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x78000400),        //andw $r0 = $r0, 16 (0x10);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800200),        //cb.deqz $r0? 1697c <foo+0xdc>;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _64(0x00000010f8000000),        //andw $r0 = $r0, 16384 (0x4000);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x088000c0),        //cb.deqz $r0? 1697c <foo+0xdc>;;
     _32(0x30004e0c),        //lwz $r0 = 312 (0x138)[$r12];;
     _32(0x0c000180),        //cb.wnez $r0? 16990 <foo+0xf0>;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x78000080),        //andw $r0 = $r0, 2 (0x2);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16990 <foo+0xf0>;;
     _32(0x1000003b),        //goto 16a78 <foo+0x1d8>;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _64(0x00000008f8000000),        //andw $r0 = $r0, 8192 (0x2000);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800180),        //cb.deqz $r0? 169b8 <foo+0x118>;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x1fffffac),        //call 16858 <baz2>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 169b8 <foo+0x118>;;
     _32(0x10000031),        //goto 16a78 <foo+0x1d8>;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _64(0x00000005f8000200),        //andw $r0 = $r0, 5128 (0x1408);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800180),        //cb.deqz $r0? 169e0 <foo+0x140>;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x1fffffa2),        //call 16858 <baz2>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 169e0 <foo+0x140>;;
     _32(0x10000027),        //goto 16a78 <foo+0x1d8>;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _64(0x00000000f8008000),        //andw $r0 = $r0, 512 (0x200);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800180),        //cb.deqz $r0? 16a08 <foo+0x168>;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x1fffff98),        //call 16858 <baz2>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16a08 <foo+0x168>;;
     _32(0x1000001d),        //goto 16a78 <foo+0x1d8>;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x78002000),        //andw $r0 = $r0, 128 (0x80);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x088005c0),        //cb.deqz $r0? 16a70 <foo+0x1d0>;;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x27014a0c),        //sd 296 (0x128)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26014d0c),        //sw 308 (0x134)[$r12] = $r0;;
     _32(0x1000000b),        //goto 16a60 <foo+0x1c0>;;
     _32(0x30004d0c),        //lwz $r0 = 308 (0x134)[$r12];;
     _32(0x1fffff8d),        //call 16870 <baz3>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000280),        //cb.dnez $r0? 16a6c <foo+0x1cc>;;
     _32(0x38004a0c),        //ld $r0 = 296 (0x128)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x27014a0c),        //sd 296 (0x128)[$r12] = $r0;;
     _32(0x30004d0c),        //lwz $r0 = 308 (0x134)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26014d0c),        //sw 308 (0x134)[$r12] = $r0;;
     _32(0x38004a0c),        //ld $r0 = 296 (0x128)[$r12];;
     _32(0x087ffd40),        //cb.dnez $r0? 16a38 <foo+0x198>;;
     _32(0x10000002),        //goto 16a70 <foo+0x1d0>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601490c),        //sw 292 (0x124)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x1fffff69),        //call 16820 <baz1>;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x7501a040),        //compd.gt $r0 = $r0, $r1;;
     _32(0x087fe500),        //cb.dnez $r0? 168dc <foo+0x3c>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130500c),        //addd $r12 = $r12, 320 (0x140);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x0000000080000117e0043200),        //make $r1 = 285896 (0x45cc8);;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _64(0x00000032e0080440),        //make $r2 = 51217 (0xc811);;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x1fffff70),        //call 168a0 <foo>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 16b10 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16f10 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18be8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
 |];

let adr_start:bits(addr_bits) = 0b00010110101010101000; //0x16aa8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(baz1, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(baz2, 0b00010110100001011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(baz3, 0b00010110100001110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100010100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101010101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101011110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110101100010000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016aa8;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
