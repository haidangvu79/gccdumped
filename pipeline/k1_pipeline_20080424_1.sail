// executing pipeline 20080424_1 test 
val k1_pipeline_20080424_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20080424_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let bar: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000200),        //addw $r0 = $r0, 8 (0x8);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6907f000),        //sxwd $r1 = $r0;;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _96(0x0000000080000117e1003200),        //addd $r0 = $r0, 285896 (0x45cc8);;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x7001a001),        //compd.ne $r0 = $r1, $r0;;
     _32(0x080005c0),        //cb.dnez $r0? 168d0 <bar+0xb0>;;
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71040040),        //addw $r1 = $r0, 1 (0x1);;
     _32(0x7808ffc1),        //zxwd $r2 = $r1;;
     _96(0x0000000080000106e0047000),        //make $r1 = 268736 (0x419c0);;
     _32(0x26090001),        //sw 0 (0x0)[$r1] = $r2;;
     _32(0x6907f000),        //sxwd $r1 = $r0;;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _96(0x0000000080000117e1003200),        //addd $r0 = $r0, 285896 (0x45cc8);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 168d4 <bar+0xb4>;;
     _32(0x18000034),        //call 169a0 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x1000001a),        //goto 16974 <main+0x8c>;;
     _32(0x3000050c),        //lwz $r0 = 20 (0x14)[$r12];;
     _32(0x71000200),        //addw $r0 = $r0, 8 (0x8);;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x3404040c),        //lws $r1 = 16 (0x10)[$r12];;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x71090040),        //addd $r2 = $r0, $r1;;
     _32(0x3404040c),        //lws $r1 = 16 (0x10)[$r12];;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x6100b800),        //addd $r0 = $r0, -288 (0xfffffee0);;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x6a000002),        //copyd $r0 = $r2;;
     _32(0x1fffffaf),        //call 16820 <bar>;;
     _32(0x3000050c),        //lwz $r0 = 20 (0x14)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x3000050c),        //lwz $r0 = 20 (0x14)[$r12];;
     _64(0x00000000f401b1c0),        //compw.le $r0 = $r0, 7 (0x7);;
     _32(0x0c7ff900),        //cb.wnez $r0? 16910 <main+0x28>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
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
     _32(0x980000f3),        //call 16d78 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 188a8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100011101000; //0x168e8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100011101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100110100000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000168e8;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
