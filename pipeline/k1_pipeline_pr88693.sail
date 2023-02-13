// executing pipeline pr88693.c.out.dumped test 
val k1_pipeline_pr88693: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr88693() = {
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
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x180001f5),        //call 17008 <strlen>;;
     _32(0x61010240),        //compd.eq $r0 = $r0, 9 (0x9);;
     _32(0x08000080),        //cb.dnez $r0? 16844 <foo+0x24>;;
     _32(0x18000096),        //call 16a98 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let quux: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000000d),        //goto 168a4 <quux+0x4c>;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000003f101b600),        //compw.eq $r0 = $r0, 120 (0x78);;
     _32(0x0c000080),        //cb.wnez $r0? 16898 <quux+0x40>;;
     _32(0x18000081),        //call 16a98 <abort>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000003f401b0c0),        //compw.le $r0 = $r0, 99 (0x63);;
     _32(0x0c7ffc40),        //cb.wnez $r0? 16874 <quux+0x1c>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let qux: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _96(0x03c3c3c3861e1e1ee0041e00),        //make $r1 = 8680820740569200760 (0x7878787878787878);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _96(0x03c3c3c3861e1e1ee0041e00),        //make $r1 = 8680820740569200760 (0x7878787878787878);;
     _32(0x27050200),        //sd 8 (0x8)[$r0] = $r1;;
     _96(0x03c3c3c3861e1e1ee0041e00),        //make $r1 = 8680820740569200760 (0x7878787878787878);;
     _32(0x27050400),        //sd 16 (0x10)[$r0] = $r1;;
     _96(0x03c3c3c3861e1e1ee0041e00),        //make $r1 = 8680820740569200760 (0x7878787878787878);;
     _32(0x27050600),        //sd 24 (0x18)[$r0] = $r1;;
     _96(0x03c3c3c3861e1e1ee0041e00),        //make $r1 = 8680820740569200760 (0x7878787878787878);;
     _32(0x27050800),        //sd 32 (0x20)[$r0] = $r1;;
     _96(0x03c3c3c3861e1e1ee0041e00),        //make $r1 = 8680820740569200760 (0x7878787878787878);;
     _32(0x27050a00),        //sd 40 (0x28)[$r0] = $r1;;
     _96(0x03c3c3c3861e1e1ee0041e00),        //make $r1 = 8680820740569200760 (0x7878787878787878);;
     _32(0x27050c00),        //sd 48 (0x30)[$r0] = $r1;;
     _96(0x03c3c3c3861e1e1ee0041e00),        //make $r1 = 8680820740569200760 (0x7878787878787878);;
     _32(0x27050e00),        //sd 56 (0x38)[$r0] = $r1;;
     _96(0x03c3c3c3861e1e1ee0041e00),        //make $r1 = 8680820740569200760 (0x7878787878787878);;
     _32(0x27051000),        //sd 64 (0x40)[$r0] = $r1;;
     _96(0x03c3c3c3861e1e1ee0041e00),        //make $r1 = 8680820740569200760 (0x7878787878787878);;
     _32(0x27051200),        //sd 72 (0x48)[$r0] = $r1;;
     _96(0x03c3c3c3861e1e1ee0041e00),        //make $r1 = 8680820740569200760 (0x7878787878787878);;
     _32(0x27051400),        //sd 80 (0x50)[$r0] = $r1;;
     _96(0x03c3c3c3861e1e1ee0041e00),        //make $r1 = 8680820740569200760 (0x7878787878787878);;
     _32(0x27051600),        //sd 88 (0x58)[$r0] = $r1;;
     _64(0x001e1e1ee0041e00),        //make $r1 = 2021161080 (0x78787878);;
     _32(0x26051800),        //sw 96 (0x60)[$r0] = $r1;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x1fffffaa),        //call 16858 <quux>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130200c),        //addd $r12 = $r12, 128 (0x80);;
     _32(0x0fd00000)        //ret ;;
 |];

let bar: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x20000200),        //lbz $r0 = 8 (0x8)[$r0];;
     _32(0x2401080c),        //sb 32 (0x20)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2401084c),        //sb 33 (0x21)[$r12] = $r0;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x1fffff89),        //call 16820 <foo>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130200c),        //addd $r12 = $r12, 128 (0x80);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let baz: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _96(0x00000000800000f8e0000600),        //make $r0 = 253976 (0x3e018);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x20000200),        //lbz $r0 = 8 (0x8)[$r0];;
     _32(0x2401080c),        //sb 32 (0x20)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2401084c),        //sb 33 (0x21)[$r12] = $r0;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x1fffff75),        //call 16820 <foo>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130200c),        //addd $r12 = $r12, 128 (0x80);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1fffff97),        //call 168d0 <qux>;;
     _32(0x1fffffd4),        //call 169c8 <bar>;;
     _32(0x1fffffe7),        //call 16a18 <baz>;;
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
     _32(0x980000f3),        //call 16e70 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007e3),        //call 18a38 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101001101000; //0x16a68
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(quux, 0b00010110100001011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(qux, 0b00010110100011010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100111001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(baz, 0b00010110101000011000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101001101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101010011000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016a68;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
