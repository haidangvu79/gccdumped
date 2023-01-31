// executing pipeline pr82524.c.out.dumped test 
val k1_pipeline_pr82524: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr82524() = {
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
     _32(0x2401060c),        //sb 24 (0x18)[$r12] = $r0;;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x2401040c),        //sb 16 (0x10)[$r12] = $r0;;
     _32(0x2000060c),        //lbz $r0 = 24 (0x18)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x2000040c),        //lbz $r0 = 16 (0x10)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x5b003001),        //mulw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a023200),        //sraw $r0 = $r0, 8 (0x8);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let bar: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741080c),        //sd 32 (0x20)[$r12] = $r16;;
     _32(0x2739060c),        //sd 24 (0x18)[$r12] = $r14;;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x27050a0c),        //sd 40 (0x28)[$r12] = $r1;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x200000c0),        //lbz $r0 = 3 (0x3)[$r0];;
     _32(0x24010fcc),        //sb 63 (0x3f)[$r12] = $r0;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x200000c0),        //lbz $r0 = 3 (0x3)[$r0];;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _32(0x20000fcc),        //lbz $r0 = 63 (0x3f)[$r12];;
     _32(0x7c00ffc0),        //notw $r0 = $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _32(0x7a000002),        //copyw $r0 = $r2;;
     _32(0x1fffffdc),        //call 16820 <foo>;;
     _32(0x24010f8c),        //sb 62 (0x3e)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x20000080),        //lbz $r0 = 2 (0x2)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x20040fcc),        //lbz $r1 = 63 (0x3f)[$r12];;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0x1fffffd5),        //call 16820 <foo>;;
     _32(0x78383fc0),        //zxbd $r14 = $r0;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x20000080),        //lbz $r0 = 2 (0x2)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x20040f8c),        //lbz $r1 = 62 (0x3e)[$r12];;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0x1fffffce),        //call 16820 <foo>;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7101100e),        //addw $r0 = $r14, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x24010e8c),        //sb 58 (0x3a)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x20000040),        //lbz $r0 = 1 (0x1)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x20040fcc),        //lbz $r1 = 63 (0x3f)[$r12];;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0x1fffffc4),        //call 16820 <foo>;;
     _32(0x78383fc0),        //zxbd $r14 = $r0;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x20000040),        //lbz $r0 = 1 (0x1)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x20040f8c),        //lbz $r1 = 62 (0x3e)[$r12];;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0x1fffffbd),        //call 16820 <foo>;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7101100e),        //addw $r0 = $r14, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x24010e4c),        //sb 57 (0x39)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x20040fcc),        //lbz $r1 = 63 (0x3f)[$r12];;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0x1fffffb3),        //call 16820 <foo>;;
     _32(0x78383fc0),        //zxbd $r14 = $r0;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x20040f8c),        //lbz $r1 = 62 (0x3e)[$r12];;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0x1fffffac),        //call 16820 <foo>;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7101100e),        //addw $r0 = $r14, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x24010e0c),        //sb 56 (0x38)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x24010ecc),        //sb 59 (0x3b)[$r12] = $r0;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _32(0x3840080c),        //ld $r16 = 32 (0x20)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838060c),        //ld $r14 = 24 (0x18)[$r12];;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x2401060c),        //sb 24 (0x18)[$r12] = $r0;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x2401064c),        //sb 25 (0x19)[$r12] = $r0;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x2401068c),        //sb 26 (0x1a)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x240106cc),        //sb 27 (0x1b)[$r12] = $r0;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x2401040c),        //sb 16 (0x10)[$r12] = $r0;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x2401044c),        //sb 17 (0x11)[$r12] = $r0;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x2401048c),        //sb 18 (0x12)[$r12] = $r0;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x240104cc),        //sb 19 (0x13)[$r12] = $r0;;
     _32(0x6104040c),        //addd $r1 = $r12, 16 (0x10);;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x1fffff9b),        //call 16868 <bar>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x2601020c),        //sw 8 (0x8)[$r12] = $r0;;
     _32(0x2000020c),        //lbz $r0 = 8 (0x8)[$r12];;
     _64(0x00000007f001b7c0),        //compw.ne $r0 = $r0, 255 (0xff);;
     _32(0x0c0002c0),        //cb.wnez $r0? 16a40 <main+0x98>;;
     _32(0x2000024c),        //lbz $r0 = 9 (0x9)[$r12];;
     _64(0x00000007f001b7c0),        //compw.ne $r0 = $r0, 255 (0xff);;
     _32(0x0c0001c0),        //cb.wnez $r0? 16a40 <main+0x98>;;
     _32(0x2000028c),        //lbz $r0 = 10 (0xa)[$r12];;
     _64(0x00000007f001b7c0),        //compw.ne $r0 = $r0, 255 (0xff);;
     _32(0x0c0000c0),        //cb.wnez $r0? 16a40 <main+0x98>;;
     _32(0x200002cc),        //lbz $r0 = 11 (0xb)[$r12];;
     _32(0x08800080),        //cb.deqz $r0? 16a44 <main+0x9c>;;
     _32(0x18000006),        //call 16a58 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
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

let adr_start:bits(addr_bits) = 0b00010110100110101000; //0x169a8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100001101000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100110101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101001011000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000169a8;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
