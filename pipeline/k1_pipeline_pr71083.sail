// executing pipeline pr71083 test 
val k1_pipeline_pr71083: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr71083() = {
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
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000013),        //goto 1687c <foo+0x5c>;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3404070c),        //lws $r1 = 28 (0x1c)[$r12];;
     _32(0x61040041),        //addd $r1 = $r1, 1 (0x1);;
     _32(0x79062081),        //slld $r1 = $r1, 2 (0x2);;
     _32(0x3808040c),        //ld $r2 = 16 (0x10)[$r12];;
     _32(0x71050042),        //addd $r1 = $r2, $r1;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x6503f200),        //extfz $r0 = $r0, 31 (0x1f), 8 (0x8);;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _32(0x30000001),        //lwz $r0 = 0 (0x0)[$r1];;
     _32(0x6103f202),        //insf $r0 = $r2, 31 (0x1f), 8 (0x8);;
     _32(0x26010001),        //sw 0 (0x0)[$r1] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000003f401b0c0),        //compw.le $r0 = $r0, 99 (0x63);;
     _32(0x0c7ffac0),        //cb.wnez $r0? 16834 <foo+0x14>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let bar: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000013),        //goto 168f4 <bar+0x5c>;;
     _32(0x3404070c),        //lws $r1 = 28 (0x1c)[$r12];;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71090001),        //addd $r2 = $r1, $r0;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x61040040),        //addd $r1 = $r0, 1 (0x1);;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x28040042),        //lhz $r1 = 1 (0x1)[$r2];;
     _32(0x25050040),        //sh 1 (0x1)[$r0] = $r1;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000003f401b0c0),        //compw.le $r0 = $r0, 99 (0x63);;
     _32(0x0c7ffac0),        //cb.wnez $r0? 168ac <bar+0x14>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x0000000080000117e0007200),        //make $r0 = 286152 (0x45dc8);;
     _32(0x1fffffbe),        //call 16820 <foo>;;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _32(0x1fffffd8),        //call 16898 <bar>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100010000; //0x16910
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100010011000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100010000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016910;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
