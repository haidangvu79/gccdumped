// executing pipeline loop_15 test 
val k1_pipeline_loop_15: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_loop_15() = {
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
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2705020c),        //sd 8 (0x8)[$r12] = $r1;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x6100fe00),        //addd $r0 = $r0, -8 (0xfffffff8);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x10000009),        //goto 1685c <foo+0x3c>;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x6100fe01),        //addd $r0 = $r1, -8 (0xfffffff8);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800020c),        //ld $r0 = 8 (0x8)[$r12];;
     _32(0x6108fe00),        //addd $r2 = $r0, -8 (0xfffffff8);;
     _32(0x2709020c),        //sd 8 (0x8)[$r12] = $r2;;
     _32(0x38040001),        //ld $r1 = 0 (0x0)[$r1];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x3804020c),        //ld $r1 = 8 (0x8)[$r12];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x7901a001),        //compd.gtu $r0 = $r1, $r0;;
     _32(0x087ffd40),        //cb.dnez $r0? 1683c <foo+0x1c>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x10000067),        //goto 16a30 <main+0x1b0>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x1000005d),        //goto 16a14 <main+0x194>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x1000000a),        //goto 168d4 <main+0x54>;;
     _32(0x34040d0c),        //lws $r1 = 52 (0x34)[$r12];;
     _32(0x34000d0c),        //lws $r0 = 52 (0x34)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6108100c),        //addd $r2 = $r12, 64 (0x40);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x2705f200),        //sd -56 (0xffffffc8)[$r0] = $r1;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _64(0x00000000f401b100),        //compw.le $r0 = $r0, 4 (0x4);;
     _32(0x0c7ffd00),        //cb.wnez $r0? 168b0 <main+0x30>;;
     _32(0x34000f0c),        //lws $r0 = 60 (0x3c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104020c),        //addd $r1 = $r12, 8 (0x8);;
     _32(0x71090001),        //addd $r2 = $r1, $r0;;
     _32(0x34000e0c),        //lws $r0 = 56 (0x38)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104020c),        //addd $r1 = $r12, 8 (0x8);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x6a000002),        //copyd $r0 = $r2;;
     _32(0x1fffffc5),        //call 16820 <foo>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x1000000d),        //goto 1694c <main+0xcc>;;
     _32(0x34000d0c),        //lws $r0 = 52 (0x34)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104100c),        //addd $r1 = $r12, 64 (0x40);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3804f200),        //ld $r1 = -56 (0xffffffc8)[$r0];;
     _32(0x34000d0c),        //lws $r0 = 52 (0x34)[$r12];;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16940 <main+0xc0>;;
     _32(0x18000047),        //call 16a58 <abort>;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x30040d0c),        //lwz $r1 = 52 (0x34)[$r12];;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x7401b001),        //compw.le $r0 = $r1, $r0;;
     _32(0x0c7ffc40),        //cb.wnez $r0? 1691c <main+0x9c>;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x10000010),        //goto 169a8 <main+0x128>;;
     _32(0x34000d0c),        //lws $r0 = 52 (0x34)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104100c),        //addd $r1 = $r12, 64 (0x40);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3804f200),        //ld $r1 = -56 (0xffffffc8)[$r0];;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 1699c <main+0x11c>;;
     _32(0x18000030),        //call 16a58 <abort>;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x30040d0c),        //lwz $r1 = 52 (0x34)[$r12];;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _32(0x7401b001),        //compw.le $r0 = $r1, $r0;;
     _32(0x0c7ffb80),        //cb.wnez $r0? 1696c <main+0xec>;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x1000000d),        //goto 169f8 <main+0x178>;;
     _32(0x34000d0c),        //lws $r0 = 52 (0x34)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104100c),        //addd $r1 = $r12, 64 (0x40);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3804f200),        //ld $r1 = -56 (0xffffffc8)[$r0];;
     _32(0x34000d0c),        //lws $r0 = 52 (0x34)[$r12];;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 169ec <main+0x16c>;;
     _32(0x1800001c),        //call 16a58 <abort>;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _64(0x00000000f401b100),        //compw.le $r0 = $r0, 4 (0x4);;
     _32(0x0c7ffc40),        //cb.wnez $r0? 169c8 <main+0x148>;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _64(0x00000000f401b100),        //compw.le $r0 = $r0, 4 (0x4);;
     _32(0x0c7fe840),        //cb.wnez $r0? 168a4 <main+0x24>;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _64(0x00000000f401b100),        //compw.le $r0 = $r0, 4 (0x4);;
     _32(0x0c7fe5c0),        //cb.wnez $r0? 16898 <main+0x18>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
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

let adr_start:bits(addr_bits) = 0b00010110100010000000; //0x16880
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101001011000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016880;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
