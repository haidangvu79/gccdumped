// executing pipeline mode_dependent_address.c.out.dumped test 
val k1_pipeline_mode_dependent_address: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_mode_dependent_address() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let f883b: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x27050a0c),        //sd 40 (0x28)[$r12] = $r1;;
     _32(0x2709080c),        //sd 32 (0x20)[$r12] = $r2;;
     _32(0x270d060c),        //sd 24 (0x18)[$r12] = $r3;;
     _32(0x2711040c),        //sd 16 (0x10)[$r12] = $r4;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x1000002e),        //goto 168f8 <f883b+0xd8>;;
     _32(0x34000f0c),        //lws $r0 = 60 (0x3c)[$r12];;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x38040a0c),        //ld $r1 = 40 (0x28)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x72000040),        //minw $r0 = $r0, 1 (0x1);;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x34000f0c),        //lws $r0 = 60 (0x3c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x3808080c),        //ld $r2 = 32 (0x20)[$r12];;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x780007c0),        //andw $r0 = $r0, 31 (0x1f);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a027001),        //sraw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7c000040),        //xorw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71000800),        //addw $r0 = $r0, 32 (0x20);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a0231c0),        //sraw $r0 = $r0, 7 (0x7);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7a00fec0),        //orw $r0 = $r0, -5 (0xfffffffb);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x78043fc0),        //zxbd $r1 = $r0;;
     _32(0x34000f0c),        //lws $r0 = 60 (0x3c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x3808060c),        //ld $r2 = 24 (0x18)[$r12];;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x78011001),        //andw $r0 = $r1, $r0;;
     _32(0x78083fc0),        //zxbd $r2 = $r0;;
     _32(0x34000f0c),        //lws $r0 = 60 (0x3c)[$r12];;
     _32(0x38040c0c),        //ld $r1 = 48 (0x30)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x78043fc2),        //zxbd $r1 = $r2;;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _64(0x00000002f401b7c0),        //compw.le $r0 = $r0, 95 (0x5f);;
     _32(0x0c7ff400),        //cb.wnez $r0? 16844 <f883b+0x24>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130980c),        //addd $r12 = $r12, -416 (0xfffffe60);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _96(0x00000000800000fce004f000),        //make $r1 = 259008 (0x3f3c0);;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x6a0c0001),        //copyd $r3 = $r1;;
     _32(0x60040180),        //make $r1 = 384 (0x180);;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _32(0x6a040003),        //copyd $r1 = $r3;;
     _32(0x180000ab),        //call 16bf0 <memcpy>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601670c),        //sw 412 (0x19c)[$r12] = $r0;;
     _32(0x1000002d),        //goto 16a04 <main+0xec>;;
     _32(0x3000670c),        //lwz $r0 = 412 (0x19c)[$r12];;
     _32(0x78083fc0),        //zxbd $r2 = $r0;;
     _96(0x0000000080000118e0041200),        //make $r1 = 286792 (0x46048);;
     _32(0x3400670c),        //lws $r0 = 412 (0x19c)[$r12];;
     _32(0x240be001),        //sb $r0[$r1] = $r2;;
     _96(0x0000000080000118e0041200),        //make $r1 = 286792 (0x46048);;
     _32(0x3400670c),        //lws $r0 = 412 (0x19c)[$r12];;
     _32(0x2002e001),        //lbz $r0 = $r0[$r1];;
     _32(0x640bf000),        //zxhd $r2 = $r0;;
     _96(0x0000000080000117e004e200),        //make $r1 = 286600 (0x45f88);;
     _32(0x3400670c),        //lws $r0 = 412 (0x19c)[$r12];;
     _32(0x250bf001),        //sh.xs $r0[$r1] = $r2;;
     _96(0x0000000080000117e004e200),        //make $r1 = 286600 (0x45f88);;
     _32(0x3400670c),        //lws $r0 = 412 (0x19c)[$r12];;
     _32(0x2802f001),        //lhz.xs $r0 = $r0[$r1];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _96(0x0000000080000117e0048200),        //make $r1 = 286216 (0x45e08);;
     _32(0x3400670c),        //lws $r0 = 412 (0x19c)[$r12];;
     _32(0x260bf001),        //sw.xs $r0[$r1] = $r2;;
     _96(0x0000000080000117e0048200),        //make $r1 = 286216 (0x45e08);;
     _32(0x3400670c),        //lws $r0 = 412 (0x19c)[$r12];;
     _32(0x3002f001),        //lwz.xs $r0 = $r0[$r1];;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _96(0x0000000080000118e0042a00),        //make $r1 = 286888 (0x460a8);;
     _32(0x3400670c),        //lws $r0 = 412 (0x19c)[$r12];;
     _32(0x270bf001),        //sd.xs $r0[$r1] = $r2;;
     _32(0x3000670c),        //lwz $r0 = 412 (0x19c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601670c),        //sw 412 (0x19c)[$r12] = $r0;;
     _32(0x3000670c),        //lwz $r0 = 412 (0x19c)[$r12];;
     _64(0x00000002f401b7c0),        //compw.le $r0 = $r0, 95 (0x5f);;
     _32(0x0c7ff440),        //cb.wnez $r0? 16954 <main+0x3c>;;
     _96(0x0000000080000118e0101200),        //make $r4 = 286792 (0x46048);;
     _96(0x0000000080000118e00c2a00),        //make $r3 = 286888 (0x460a8);;
     _96(0x0000000080000117e0088200),        //make $r2 = 286216 (0x45e08);;
     _96(0x0000000080000117e004e200),        //make $r1 = 286600 (0x45f88);;
     _96(0x0000000080000118e000ea00),        //make $r0 = 287656 (0x463a8);;
     _32(0x1fffff74),        //call 16820 <f883b>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601670c),        //sw 412 (0x19c)[$r12] = $r0;;
     _32(0x10000013),        //goto 16aa8 <main+0x190>;;
     _96(0x0000000080000118e004ea00),        //make $r1 = 287656 (0x463a8);;
     _32(0x3400670c),        //lws $r0 = 412 (0x19c)[$r12];;
     _32(0x2002e001),        //lbz $r0 = $r0[$r1];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3400670c),        //lws $r0 = 412 (0x19c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x6108680c),        //addd $r2 = $r12, 416 (0x1a0);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x30009e00),        //lwz $r0 = -392 (0xfffffe78)[$r0];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16a9c <main+0x184>;;
     _32(0x1800000e),        //call 16ad0 <abort>;;
     _32(0x3000670c),        //lwz $r0 = 412 (0x19c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601670c),        //sw 412 (0x19c)[$r12] = $r0;;
     _32(0x3000670c),        //lwz $r0 = 412 (0x19c)[$r12];;
     _64(0x00000002f401b7c0),        //compw.le $r0 = $r0, 95 (0x5f);;
     _32(0x0c7ffac0),        //cb.wnez $r0? 16a60 <main+0x148>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130680c),        //addd $r12 = $r12, 416 (0x1a0);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000167),        //call 17078 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000831),        //call 18ba8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100011000; //0x16918
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f883b, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101011010000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016918;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
