// executing pipeline strct_stdarg_1.c.out.dumped test 
val k1_pipeline_strct_stdarg_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_strct_stdarg_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let f: list_I = 
 [|
     _32(0x6130d80c),        //addd $r12 = $r12, -160 (0xffffff60);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2705120c),        //sd 72 (0x48)[$r12] = $r1;;
     _32(0x2809140c),        //sq 80 (0x50)[$r12] = $r2r3;;
     _32(0x2811180c),        //sq 96 (0x60)[$r12] = $r4r5;;
     _32(0x28191c0c),        //sq 112 (0x70)[$r12] = $r6r7;;
     _32(0x2821200c),        //sq 128 (0x80)[$r12] = $r8r9;;
     _32(0x2829240c),        //sq 144 (0x90)[$r12] = $r10r11;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x6100120c),        //addd $r0 = $r12, 72 (0x48);;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x10000038),        //goto 16938 <f+0x118>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705080c),        //sd 32 (0x20)[$r12] = $r1;;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _32(0x26050a0c),        //sw 40 (0x28)[$r12] = $r1;;
     _32(0x20000100),        //lbz $r0 = 4 (0x4)[$r0];;
     _32(0x24010b0c),        //sb 44 (0x2c)[$r12] = $r0;;
     _32(0x20000a0c),        //lbz $r0 = 40 (0x28)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x71000280),        //addw $r0 = $r0, 10 (0xa);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 1689c <f+0x7c>;;
     _32(0x18000078),        //call 16a78 <abort>;;
     _32(0x20000a4c),        //lbz $r0 = 41 (0x29)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x71000500),        //addw $r0 = $r0, 20 (0x14);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 168c0 <f+0xa0>;;
     _32(0x1800006f),        //call 16a78 <abort>;;
     _32(0x20000a8c),        //lbz $r0 = 42 (0x2a)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x71000780),        //addw $r0 = $r0, 30 (0x1e);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 168e4 <f+0xc4>;;
     _32(0x18000066),        //call 16a78 <abort>;;
     _32(0x20000acc),        //lbz $r0 = 43 (0x2b)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x71000a00),        //addw $r0 = $r0, 40 (0x28);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16908 <f+0xe8>;;
     _32(0x1800005d),        //call 16a78 <abort>;;
     _32(0x20000b0c),        //lbz $r0 = 44 (0x2c)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x71000c80),        //addw $r0 = $r0, 50 (0x32);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 1692c <f+0x10c>;;
     _32(0x18000054),        //call 16a78 <abort>;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x30040f0c),        //lwz $r1 = 60 (0x3c)[$r12];;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7201b001),        //compw.lt $r0 = $r1, $r0;;
     _32(0x0c7ff180),        //cb.wnez $r0? 1685c <f+0x3c>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705080c),        //sd 32 (0x20)[$r12] = $r1;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x61011ec0),        //compd.eq $r0 = $r0, 123 (0x7b);;
     _32(0x08000080),        //cb.dnez $r0? 1696c <f+0x14c>;;
     _32(0x18000044),        //call 16a78 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130280c),        //addd $r12 = $r12, 160 (0xa0);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x6000000a),        //make $r0 = 10 (0xa);;
     _32(0x2401040c),        //sb 16 (0x10)[$r12] = $r0;;
     _32(0x6000000b),        //make $r0 = 11 (0xb);;
     _32(0x2401054c),        //sb 21 (0x15)[$r12] = $r0;;
     _32(0x6000000c),        //make $r0 = 12 (0xc);;
     _32(0x2401068c),        //sb 26 (0x1a)[$r12] = $r0;;
     _32(0x60000014),        //make $r0 = 20 (0x14);;
     _32(0x2401044c),        //sb 17 (0x11)[$r12] = $r0;;
     _32(0x60000015),        //make $r0 = 21 (0x15);;
     _32(0x2401058c),        //sb 22 (0x16)[$r12] = $r0;;
     _32(0x60000016),        //make $r0 = 22 (0x16);;
     _32(0x240106cc),        //sb 27 (0x1b)[$r12] = $r0;;
     _32(0x6000001e),        //make $r0 = 30 (0x1e);;
     _32(0x2401048c),        //sb 18 (0x12)[$r12] = $r0;;
     _32(0x6000001f),        //make $r0 = 31 (0x1f);;
     _32(0x240105cc),        //sb 23 (0x17)[$r12] = $r0;;
     _32(0x60000020),        //make $r0 = 32 (0x20);;
     _32(0x2401070c),        //sb 28 (0x1c)[$r12] = $r0;;
     _32(0x60000028),        //make $r0 = 40 (0x28);;
     _32(0x240104cc),        //sb 19 (0x13)[$r12] = $r0;;
     _32(0x60000029),        //make $r0 = 41 (0x29);;
     _32(0x2401060c),        //sb 24 (0x18)[$r12] = $r0;;
     _32(0x6000002a),        //make $r0 = 42 (0x2a);;
     _32(0x2401074c),        //sb 29 (0x1d)[$r12] = $r0;;
     _32(0x60000032),        //make $r0 = 50 (0x32);;
     _32(0x2401050c),        //sb 20 (0x14)[$r12] = $r0;;
     _32(0x60000033),        //make $r0 = 51 (0x33);;
     _32(0x2401064c),        //sb 25 (0x19)[$r12] = $r0;;
     _32(0x60000034),        //make $r0 = 52 (0x34);;
     _32(0x2401078c),        //sb 30 (0x1e)[$r12] = $r0;;
     _32(0x6010007b),        //make $r4 = 123 (0x7b);;
     _32(0x2800068c),        //lhz $r0 = 26 (0x1a)[$r12];;
     _32(0x2804070c),        //lhz $r1 = 28 (0x1c)[$r12];;
     _32(0x79062401),        //slld $r1 = $r1, 16 (0x10);;
     _32(0x7a010001),        //ord $r0 = $r1, $r0;;
     _32(0x2804078c),        //lhz $r1 = 30 (0x1e)[$r12];;
     _32(0x68043fc1),        //andd $r1 = $r1, 255 (0xff);;
     _32(0x79062801),        //slld $r1 = $r1, 32 (0x20);;
     _32(0x7a010001),        //ord $r0 = $r1, $r0;;
     _32(0x6a0c0000),        //copyd $r3 = $r0;;
     _32(0x2000054c),        //lbz $r0 = 21 (0x15)[$r12];;
     _32(0x2004058c),        //lbz $r1 = 22 (0x16)[$r12];;
     _32(0x79062201),        //slld $r1 = $r1, 8 (0x8);;
     _32(0x7a010001),        //ord $r0 = $r1, $r0;;
     _32(0x200405cc),        //lbz $r1 = 23 (0x17)[$r12];;
     _32(0x79062401),        //slld $r1 = $r1, 16 (0x10);;
     _32(0x7a010001),        //ord $r0 = $r1, $r0;;
     _32(0x2004060c),        //lbz $r1 = 24 (0x18)[$r12];;
     _32(0x79062601),        //slld $r1 = $r1, 24 (0x18);;
     _32(0x7a010001),        //ord $r0 = $r1, $r0;;
     _32(0x2004064c),        //lbz $r1 = 25 (0x19)[$r12];;
     _32(0x79062801),        //slld $r1 = $r1, 32 (0x20);;
     _32(0x7a010001),        //ord $r0 = $r1, $r0;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x60000003),        //make $r0 = 3 (0x3);;
     _32(0x1fffff6d),        //call 16820 <f>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16a98 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16e98 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18b70 <_exit>
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
     _32(0x98000161),        //call 17030 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16ad4 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18b70 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100110000000; //0x16980
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100110000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101001111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110101010011000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016980;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
