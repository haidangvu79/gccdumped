// executing pipeline pr85169.c.out.dumped test 
val k1_pipeline_pr85169: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr85169() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo: list_I = 
 [|
     _32(0x6130b80c),        //addd $r12 = $r12, -288 (0xfffffee0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x6100480c),        //addd $r0 = $r12, 288 (0x120);;
     _32(0x6100c000),        //addd $r0 = $r0, -256 (0xffffff00);;
     _32(0x61000fc0),        //addd $r0 = $r0, 63 (0x3f);;
     _32(0x7b022180),        //srld $r0 = $r0, 6 (0x6);;
     _32(0x79022180),        //slld $r0 = $r0, 6 (0x6);;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x38080001),        //ld $r2 = 0 (0x0)[$r1];;
     _32(0x27091000),        //sd 64 (0x40)[$r0] = $r2;;
     _32(0x38080201),        //ld $r2 = 8 (0x8)[$r1];;
     _32(0x27091200),        //sd 72 (0x48)[$r0] = $r2;;
     _32(0x38080401),        //ld $r2 = 16 (0x10)[$r1];;
     _32(0x27091400),        //sd 80 (0x50)[$r0] = $r2;;
     _32(0x38080601),        //ld $r2 = 24 (0x18)[$r1];;
     _32(0x27091600),        //sd 88 (0x58)[$r0] = $r2;;
     _32(0x38080801),        //ld $r2 = 32 (0x20)[$r1];;
     _32(0x27091800),        //sd 96 (0x60)[$r0] = $r2;;
     _32(0x38080a01),        //ld $r2 = 40 (0x28)[$r1];;
     _32(0x27091a00),        //sd 104 (0x68)[$r0] = $r2;;
     _32(0x38080c01),        //ld $r2 = 48 (0x30)[$r1];;
     _32(0x27091c00),        //sd 112 (0x70)[$r0] = $r2;;
     _32(0x38040e01),        //ld $r1 = 56 (0x38)[$r1];;
     _32(0x27051e00),        //sd 120 (0x78)[$r0] = $r1;;
     _32(0x38041000),        //ld $r1 = 64 (0x40)[$r0];;
     _32(0x27052000),        //sd 128 (0x80)[$r0] = $r1;;
     _32(0x38041200),        //ld $r1 = 72 (0x48)[$r0];;
     _32(0x27052200),        //sd 136 (0x88)[$r0] = $r1;;
     _32(0x38041400),        //ld $r1 = 80 (0x50)[$r0];;
     _32(0x27052400),        //sd 144 (0x90)[$r0] = $r1;;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x27052600),        //sd 152 (0x98)[$r0] = $r1;;
     _32(0x38041800),        //ld $r1 = 96 (0x60)[$r0];;
     _32(0x27052800),        //sd 160 (0xa0)[$r0] = $r1;;
     _32(0x38041a00),        //ld $r1 = 104 (0x68)[$r0];;
     _32(0x27052a00),        //sd 168 (0xa8)[$r0] = $r1;;
     _32(0x38041c00),        //ld $r1 = 112 (0x70)[$r0];;
     _32(0x27052c00),        //sd 176 (0xb0)[$r0] = $r1;;
     _32(0x38041e00),        //ld $r1 = 120 (0x78)[$r0];;
     _32(0x27052e00),        //sd 184 (0xb8)[$r0] = $r1;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x24052fc0),        //sb 191 (0xbf)[$r0] = $r1;;
     _32(0x38042000),        //ld $r1 = 128 (0x80)[$r0];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x38042200),        //ld $r1 = 136 (0x88)[$r0];;
     _32(0x27050200),        //sd 8 (0x8)[$r0] = $r1;;
     _32(0x38042400),        //ld $r1 = 144 (0x90)[$r0];;
     _32(0x27050400),        //sd 16 (0x10)[$r0] = $r1;;
     _32(0x38042600),        //ld $r1 = 152 (0x98)[$r0];;
     _32(0x27050600),        //sd 24 (0x18)[$r0] = $r1;;
     _32(0x38042800),        //ld $r1 = 160 (0xa0)[$r0];;
     _32(0x27050800),        //sd 32 (0x20)[$r0] = $r1;;
     _32(0x38042a00),        //ld $r1 = 168 (0xa8)[$r0];;
     _32(0x27050a00),        //sd 40 (0x28)[$r0] = $r1;;
     _32(0x38042c00),        //ld $r1 = 176 (0xb0)[$r0];;
     _32(0x27050c00),        //sd 48 (0x30)[$r0] = $r1;;
     _32(0x38042e00),        //ld $r1 = 184 (0xb8)[$r0];;
     _32(0x27050e00),        //sd 56 (0x38)[$r0] = $r1;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x38080000),        //ld $r2 = 0 (0x0)[$r0];;
     _32(0x27090001),        //sd 0 (0x0)[$r1] = $r2;;
     _32(0x38080200),        //ld $r2 = 8 (0x8)[$r0];;
     _32(0x27090201),        //sd 8 (0x8)[$r1] = $r2;;
     _32(0x38080400),        //ld $r2 = 16 (0x10)[$r0];;
     _32(0x27090401),        //sd 16 (0x10)[$r1] = $r2;;
     _32(0x38080600),        //ld $r2 = 24 (0x18)[$r0];;
     _32(0x27090601),        //sd 24 (0x18)[$r1] = $r2;;
     _32(0x38080800),        //ld $r2 = 32 (0x20)[$r0];;
     _32(0x27090801),        //sd 32 (0x20)[$r1] = $r2;;
     _32(0x38080a00),        //ld $r2 = 40 (0x28)[$r0];;
     _32(0x27090a01),        //sd 40 (0x28)[$r1] = $r2;;
     _32(0x38080c00),        //ld $r2 = 48 (0x30)[$r0];;
     _32(0x27090c01),        //sd 48 (0x30)[$r1] = $r2;;
     _32(0x38000e00),        //ld $r0 = 56 (0x38)[$r0];;
     _32(0x27010e01),        //sd 56 (0x38)[$r1] = $r0;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130480c),        //addd $r12 = $r12, 288 (0x120);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130d00c),        //addd $r12 = $r12, -192 (0xffffff40);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x6100300c),        //addd $r0 = $r12, 192 (0xc0);;
     _32(0x6100d800),        //addd $r0 = $r0, -160 (0xffffff60);;
     _32(0x61000fc0),        //addd $r0 = $r0, 63 (0x3f);;
     _32(0x7b022180),        //srld $r0 = $r0, 6 (0x6);;
     _32(0x793a2180),        //slld $r14 = $r0, 6 (0x6);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701000e),        //sd 0 (0x0)[$r14] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701020e),        //sd 8 (0x8)[$r14] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701040e),        //sd 16 (0x10)[$r14] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701060e),        //sd 24 (0x18)[$r14] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701080e),        //sd 32 (0x20)[$r14] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x27010a0e),        //sd 40 (0x28)[$r14] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x27010c0e),        //sd 48 (0x30)[$r14] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x27010e0e),        //sd 56 (0x38)[$r14] = $r0;;
     _32(0x6a00000e),        //copyd $r0 = $r14;;
     _32(0x1fffff98),        //call 16820 <foo>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26012f0c),        //sw 188 (0xbc)[$r12] = $r0;;
     _32(0x10000010),        //goto 16a0c <main+0xb4>;;
     _32(0x30002f0c),        //lwz $r0 = 188 (0xbc)[$r12];;
     _32(0x2002e00e),        //lbz $r0 = $r0[$r14];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x30002f0c),        //lwz $r0 = 188 (0xbc)[$r12];;
     _64(0x00000001f101b7c0),        //compw.eq $r0 = $r0, 63 (0x3f);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16a00 <main+0xa8>;;
     _32(0x1800000f),        //call 16a38 <abort>;;
     _32(0x30002f0c),        //lwz $r0 = 188 (0xbc)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26012f0c),        //sw 188 (0xbc)[$r12] = $r0;;
     _32(0x30002f0c),        //lwz $r0 = 188 (0xbc)[$r12];;
     _64(0x00000001f801b7c0),        //compw.leu $r0 = $r0, 63 (0x3f);;
     _32(0x0c7ffb80),        //cb.wnez $r0? 169d0 <main+0x78>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838040c),        //ld $r14 = 16 (0x10)[$r12];;
     _32(0x6130300c),        //addd $r12 = $r12, 192 (0xc0);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16e10 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18940 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100101011000; //0x16958
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100101011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101000111000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016958;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
