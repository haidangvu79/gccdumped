// executing pipeline 20030117_1 test 
val k1_pipeline_20030117_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20030117_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60080015),        //make $r2 = 21 (0x15);;
     _32(0x6004000a),        //make $r1 = 10 (0xa);;
     _32(0x60000005),        //make $r0 = 5 (0x5);;
     _32(0x18000012),        //call 16880 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b300),        //compw.eq $r0 = $r0, 12 (0xc);;
     _32(0x0c000080),        //cb.wnez $r0? 16850 <main+0x30>;;
     _32(0x18000039),        //call 16930 <abort>;;
     _32(0x6008000f),        //make $r2 = 15 (0xf);;
     _32(0x6004000c),        //make $r1 = 12 (0xc);;
     _32(0x60000009),        //make $r0 = 9 (0x9);;
     _32(0x1800001d),        //call 168d0 <bar>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000004f101b580),        //compw.eq $r0 = $r0, 150 (0x96);;
     _32(0x0c000080),        //cb.wnez $r0? 16874 <main+0x54>;;
     _32(0x18000030),        //call 16930 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000036),        //call 16950 <exit>;;
     _32(0x7f03f000)        //nop ;;
 |];

let foo: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x2609020c),        //sw 8 (0x8)[$r12] = $r2;;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004020c),        //lwz $r1 = 8 (0x8)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00155555e0045580),        //make $r1 = 1431655766 (0x55555556);;
     _32(0x58043040),        //mulwd $r1 = $r0, $r1;;
     _32(0x7b062801),        //srld $r1 = $r1, 32 (0x20);;
     _32(0x7a0237c0),        //sraw $r0 = $r0, 31 (0x1f);;
     _32(0x75011040),        //sbfw $r0 = $r0, $r1;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let bar: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x2609020c),        //sw 8 (0x8)[$r12] = $r2;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x5b003000),        //mulw $r0 = $r0, $r0;;
     _32(0x780cffc0),        //zxwd $r3 = $r0;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x5b003000),        //mulw $r0 = $r0, $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x5b003000),        //mulw $r0 = $r0, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a080000),        //copyw $r2 = $r0;;
     _32(0x7a000003),        //copyw $r0 = $r3;;
     _32(0x1fffffdb),        //call 16880 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
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
     _32(0x98000105),        //call 16d50 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18a28 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100010000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100011010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100100110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100101010000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016820;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
