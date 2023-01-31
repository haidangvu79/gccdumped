// executing pipeline 20021118_1 test 
val k1_pipeline_20021118_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20021118_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x2801140c),        //sq 80 (0x50)[$r12] = $r0r1;;
     _32(0x2609120c),        //sw 72 (0x48)[$r12] = $r2;;
     _32(0x260d100c),        //sw 64 (0x40)[$r12] = $r3;;
     _32(0x26110e0c),        //sw 56 (0x38)[$r12] = $r4;;
     _32(0x26150c0c),        //sw 48 (0x30)[$r12] = $r5;;
     _32(0x26190a0c),        //sw 40 (0x28)[$r12] = $r6;;
     _32(0x261d080c),        //sw 32 (0x20)[$r12] = $r7;;
     _32(0x2621060c),        //sw 24 (0x18)[$r12] = $r8;;
     _32(0x3000170c),        //lwz $r0 = 92 (0x5c)[$r12];;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x60000003),        //make $r0 = 3 (0x3);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x60000004),        //make $r0 = 4 (0x4);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x602002bc),        //make $r8 = 700 (0x2bc);;
     _32(0x601c0258),        //make $r7 = 600 (0x258);;
     _32(0x601801f4),        //make $r6 = 500 (0x1f4);;
     _32(0x60140190),        //make $r5 = 400 (0x190);;
     _32(0x6010012c),        //make $r4 = 300 (0x12c);;
     _32(0x600c00c8),        //make $r3 = 200 (0xc8);;
     _32(0x60080064),        //make $r2 = 100 (0x64);;
     _32(0x3c00040c),        //lq $r0r1 = 16 (0x10)[$r12];;
     _32(0x1fffffdd),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000016f101b000),        //compw.eq $r0 = $r0, 704 (0x2c0);;
     _32(0x0c000080),        //cb.wnez $r0? 168c4 <main+0x64>;;
     _32(0x18000004),        //call 168d0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 168f0 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16cf0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 189c8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
 |];

let adr_start:bits(addr_bits) = 0b00010110100001100000; //0x16860
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100001100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100011010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100011110000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016860;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
