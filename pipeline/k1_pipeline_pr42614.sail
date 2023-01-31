// executing pipeline pr42614.c.out.dumped test 
val k1_pipeline_pr42614: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr42614() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let init: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x1800009a),        //call 16a98 <malloc>;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let inlined_wrong: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2605060c),        //sw 24 (0x18)[$r12] = $r1;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0c000080),        //cb.wnez $r0? 16874 <inlined_wrong+0x2c>;;
     _32(0x18000042),        //call 16978 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x240107cc),        //sb 31 (0x1f)[$r12] = $r0;;
     _32(0x1000000a),        //goto 168a4 <inlined_wrong+0x5c>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x78043fc0),        //zxbd $r1 = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _32(0x200007cc),        //lbz $r0 = 31 (0x1f)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x240107cc),        //sb 31 (0x1f)[$r12] = $r0;;
     _32(0x200007cc),        //lbz $r0 = 31 (0x1f)[$r12];;
     _32(0x0cfffd80),        //cb.weqz $r0? 16880 <inlined_wrong+0x38>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x08000080),        //cb.dnez $r0? 168bc <inlined_wrong+0x74>;;
     _32(0x18000030),        //call 16978 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let expect_func: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0c000080),        //cb.wnez $r0? 168f0 <expect_func+0x20>;;
     _32(0x18000023),        //call 16978 <abort>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x08000080),        //cb.dnez $r0? 168fc <expect_func+0x2c>;;
     _32(0x18000020),        //call 16978 <abort>;;
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
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2401040c),        //sb 16 (0x10)[$r12] = $r0;;
     _32(0x1fffffbf),        //call 16820 <init>;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x1fffffc4),        //call 16848 <inlined_wrong>;;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffffe2),        //call 168d0 <expect_func>;;
     _32(0x6100020c),        //addd $r0 = $r12, 8 (0x8);;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x1fffffbd),        //call 16848 <inlined_wrong>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x18000055),        //call 16ab0 <free>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
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
     _32(0x9800038b),        //call 177b0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007c9),        //call 188b0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100010000; //0x16910
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(init, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(inlined_wrong, 0b00010110100001001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(expect_func, 0b00010110100011010000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100101111000, num_instr, mI);
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
