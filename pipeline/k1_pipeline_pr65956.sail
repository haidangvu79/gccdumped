// executing pipeline pr65956.c.out.dumped test 
val k1_pipeline_pr65956: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr65956() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let fn1: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _96(0x0000000080000117e0042240),        //make $r1 = 285833 (0x45c89);;
     _32(0x7001a040),        //compd.ne $r0 = $r0, $r1;;
     _32(0x080001c0),        //cb.dnez $r0? 16864 <fn1+0x44>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _96(0x0000000080000117e0042280),        //make $r1 = 285834 (0x45c8a);;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16868 <fn1+0x48>;;
     _32(0x180000c5),        //call 16b78 <abort>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x20000040),        //lbz $r0 = 1 (0x1)[$r0];;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x78043fc0),        //zxbd $r1 = $r0;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x24050040),        //sb 1 (0x1)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let fn2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let fn3: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x08800080),        //cb.deqz $r0? 16908 <fn3+0x20>;;
     _32(0x1800009d),        //call 16b78 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let foo: list_I = 
 [|
     _32(0x6130d00c),        //addd $r12 = $r12, -192 (0xffffff40);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x2701220c),        //sd 136 (0x88)[$r12] = $r0;;
     _32(0x27051c0c),        //sd 112 (0x70)[$r12] = $r1;;
     _32(0x27091e0c),        //sd 120 (0x78)[$r12] = $r2;;
     _32(0x270d200c),        //sd 128 (0x80)[$r12] = $r3;;
     _32(0x2711160c),        //sd 88 (0x58)[$r12] = $r4;;
     _32(0x2715180c),        //sd 96 (0x60)[$r12] = $r5;;
     _32(0x27191a0c),        //sd 104 (0x68)[$r12] = $r6;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701240c),        //sd 144 (0x90)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601260c),        //sw 152 (0x98)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701280c),        //sd 160 (0xa0)[$r12] = $r0;;
     _32(0x30001e0c),        //lwz $r0 = 120 (0x78)[$r12];;
     _32(0x088006c0),        //cb.deqz $r0? 169d0 <foo+0xb0>;;
     _32(0x3000180c),        //lwz $r0 = 96 (0x60)[$r12];;
     _32(0x08800640),        //cb.deqz $r0? 169d0 <foo+0xb0>;;
     _32(0x38001c0c),        //ld $r0 = 112 (0x70)[$r12];;
     _32(0x1fffffcf),        //call 168b0 <fn2>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x088003c0),        //cb.deqz $r0? 169b8 <foo+0x98>;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x1fffffcb),        //call 168b0 <fn2>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x088002c0),        //cb.deqz $r0? 169b8 <foo+0x98>;;
     _32(0x3800220c),        //ld $r0 = 136 (0x88)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000003f001b700),        //compw.ne $r0 = $r0, 124 (0x7c);;
     _32(0x0c800180),        //cb.weqz $r0? 169c0 <foo+0xa0>;;
     _32(0x3800220c),        //ld $r0 = 136 (0x88)[$r12];;
     _32(0x1fffffce),        //call 168e8 <fn3>;;
     _32(0x10000004),        //goto 169c4 <foo+0xa4>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x10000002),        //goto 169c4 <foo+0xa4>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x38001c0c),        //ld $r0 = 112 (0x70)[$r12];;
     _32(0x3804160c),        //ld $r1 = 88 (0x58)[$r12];;
     _32(0x1fffff95),        //call 16820 <fn1>;;
     _32(0x3800240c),        //ld $r0 = 144 (0x90)[$r12];;
     _32(0x27012a0c),        //sd 168 (0xa8)[$r12] = $r0;;
     _32(0x3800260c),        //ld $r0 = 152 (0x98)[$r12];;
     _32(0x27012c0c),        //sd 176 (0xb0)[$r12] = $r0;;
     _32(0x3800280c),        //ld $r0 = 160 (0xa0)[$r12];;
     _32(0x27012e0c),        //sd 184 (0xb8)[$r12] = $r0;;
     _32(0x38002a0c),        //ld $r0 = 168 (0xa8)[$r12];;
     _32(0x38042c0c),        //ld $r1 = 176 (0xb0)[$r12];;
     _32(0x38082e0c),        //ld $r2 = 184 (0xb8)[$r12];;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130300c),        //addd $r12 = $r12, 192 (0xc0);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let bar: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000006f101b6c0),        //compw.eq $r0 = $r0, 219 (0xdb);;
     _32(0x0c000180),        //cb.wnez $r0? 16a40 <bar+0x38>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000006f101b700),        //compw.eq $r0 = $r0, 220 (0xdc);;
     _32(0x0c0003c0),        //cb.wnez $r0? 16a74 <bar+0x6c>;;
     _32(0x1000001b),        //goto 16aa8 <bar+0xa0>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x6100f400),        //addd $r0 = $r0, -48 (0xffffffd0);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x38100001),        //ld $r4 = 0 (0x0)[$r1];;
     _32(0x38140201),        //ld $r5 = 8 (0x8)[$r1];;
     _32(0x38180401),        //ld $r6 = 16 (0x10)[$r1];;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x38080200),        //ld $r2 = 8 (0x8)[$r0];;
     _32(0x380c0400),        //ld $r3 = 16 (0x10)[$r0];;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x1fffffac),        //call 16920 <foo>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x6100f400),        //addd $r0 = $r0, -48 (0xffffffd0);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x38100001),        //ld $r4 = 0 (0x0)[$r1];;
     _32(0x38140201),        //ld $r5 = 8 (0x8)[$r1];;
     _32(0x38180401),        //ld $r6 = 16 (0x10)[$r1];;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x38080200),        //ld $r2 = 8 (0x8)[$r0];;
     _32(0x380c0400),        //ld $r3 = 16 (0x10)[$r0];;
     _96(0x00000000800000fce000f200),        //make $r0 = 259016 (0x3f3c8);;
     _32(0x1fffff9f),        //call 16920 <foo>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _96(0x0000000080000117e0002240),        //make $r0 = 285833 (0x45c89);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2601080c),        //sw 32 (0x20)[$r12] = $r0;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701100c),        //sd 64 (0x40)[$r12] = $r0;;
     _96(0x0000000080000117e0002280),        //make $r0 = 285834 (0x45c8a);;
     _32(0x2701120c),        //sd 72 (0x48)[$r12] = $r0;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x2601140c),        //sw 80 (0x50)[$r12] = $r0;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x2701160c),        //sd 88 (0x58)[$r12] = $r0;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x61000c00),        //addd $r0 = $r0, 48 (0x30);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x600000dc),        //make $r0 = 220 (0xdc);;
     _32(0x1fffffb3),        //call 16a08 <bar>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x20000040),        //lbz $r0 = 1 (0x1)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16b64 <main+0xa4>;;
     _32(0x18000006),        //call 16b78 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16f50 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18a80 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101011000000; //0x16ac0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fn1, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fn2, 0b00010110100010110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fn3, 0b00010110100011101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100100100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110101000001000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101011000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101101111000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016ac0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
