// executing pipeline loop_13.c.out.dumped test 
val k1_pipeline_loop_13: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_loop_13() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let scale: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x2609040c),        //sw 16 (0x10)[$r12] = $r2;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x61010040),        //compd.eq $r0 = $r0, 1 (0x1);;
     _32(0x08000c00),        //cb.dnez $r0? 168fc <scale+0xdc>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x10000027),        //goto 168ec <scale+0xcc>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x34000e0c),        //lws $r0 = 56 (0x38)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x3808060c),        //ld $r2 = 24 (0x18)[$r12];;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x54001001),        //muld $r0 = $r1, $r0;;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x34000e0c),        //lws $r0 = 56 (0x38)[$r12];;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x3808060c),        //ld $r2 = 24 (0x18)[$r12];;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x54001001),        //muld $r0 = $r1, $r0;;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x34000e0c),        //lws $r0 = 56 (0x38)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x38040c0c),        //ld $r1 = 48 (0x30)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x34000e0c),        //lws $r0 = 56 (0x38)[$r12];;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x38040a0c),        //ld $r1 = 40 (0x28)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _32(0x71000080),        //addw $r0 = $r0, 2 (0x2);;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x30040f0c),        //lwz $r1 = 60 (0x3c)[$r12];;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x7201b001),        //compw.lt $r0 = $r1, $r0;;
     _32(0x0c7ff5c0),        //cb.wnez $r0? 16854 <scale+0x34>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26011f0c),        //sw 124 (0x7c)[$r12] = $r0;;
     _32(0x1000000a),        //goto 1694c <main+0x44>;;
     _32(0x34041f0c),        //lws $r1 = 124 (0x7c)[$r12];;
     _32(0x34001f0c),        //lws $r0 = 124 (0x7c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6108200c),        //addd $r2 = $r12, 128 (0x80);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x2705ea00),        //sd -88 (0xffffffa8)[$r0] = $r1;;
     _32(0x30001f0c),        //lwz $r0 = 124 (0x7c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26011f0c),        //sw 124 (0x7c)[$r12] = $r0;;
     _32(0x30001f0c),        //lwz $r0 = 124 (0x7c)[$r12];;
     _64(0x00000000f401b240),        //compw.le $r0 = $r0, 9 (0x9);;
     _32(0x0c7ffd00),        //cb.wnez $r0? 16928 <main+0x20>;;
     _32(0x61040a0c),        //addd $r1 = $r12, 40 (0x28);;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x60080005),        //make $r2 = 5 (0x5);;
     _32(0x1fffffae),        //call 16820 <scale>;;
     _32(0x38001c0c),        //ld $r0 = 112 (0x70)[$r12];;
     _32(0x61010480),        //compd.eq $r0 = $r0, 18 (0x12);;
     _32(0x08000080),        //cb.dnez $r0? 1697c <main+0x74>;;
     _32(0x18000006),        //call 16990 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130200c),        //addd $r12 = $r12, 128 (0x80);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16d68 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18898 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100001000; //0x16908
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(scale, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100110010000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016908;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
