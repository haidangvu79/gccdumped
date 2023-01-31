// executing pipeline 20010518_1 test 
val k1_pipeline_20010518_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20010518_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let add: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x2601160c),        //sw 88 (0x58)[$r12] = $r0;;
     _32(0x2605140c),        //sw 80 (0x50)[$r12] = $r1;;
     _32(0x2609120c),        //sw 72 (0x48)[$r12] = $r2;;
     _32(0x260d100c),        //sw 64 (0x40)[$r12] = $r3;;
     _32(0x26110e0c),        //sw 56 (0x38)[$r12] = $r4;;
     _32(0x26150c0c),        //sw 48 (0x30)[$r12] = $r5;;
     _32(0x26190a0c),        //sw 40 (0x28)[$r12] = $r6;;
     _32(0x261d080c),        //sw 32 (0x20)[$r12] = $r7;;
     _32(0x2621060c),        //sw 24 (0x18)[$r12] = $r8;;
     _32(0x2625040c),        //sw 16 (0x10)[$r12] = $r9;;
     _32(0x2629020c),        //sw 8 (0x8)[$r12] = $r10;;
     _32(0x262d000c),        //sw 0 (0x0)[$r12] = $r11;;
     _32(0x3004160c),        //lwz $r1 = 88 (0x58)[$r12];;
     _32(0x3000140c),        //lwz $r0 = 80 (0x50)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004120c),        //lwz $r1 = 72 (0x48)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004100c),        //lwz $r1 = 64 (0x40)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x30040e0c),        //lwz $r1 = 56 (0x38)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x30040c0c),        //lwz $r1 = 48 (0x30)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x30040a0c),        //lwz $r1 = 40 (0x28)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004080c),        //lwz $r1 = 32 (0x20)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004040c),        //lwz $r1 = 16 (0x10)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004020c),        //lwz $r1 = 8 (0x8)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004000c),        //lwz $r1 = 0 (0x0)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004180c),        //lwz $r1 = 96 (0x60)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x27410e0c),        //sd 56 (0x38)[$r12] = $r16;;
     _32(0x6000000d),        //make $r0 = 13 (0xd);;
     _32(0x2601000c),        //sw 0 (0x0)[$r12] = $r0;;
     _32(0x602c000c),        //make $r11 = 12 (0xc);;
     _32(0x6028000b),        //make $r10 = 11 (0xb);;
     _32(0x6024000a),        //make $r9 = 10 (0xa);;
     _32(0x60200009),        //make $r8 = 9 (0x9);;
     _32(0x601c0008),        //make $r7 = 8 (0x8);;
     _32(0x60180007),        //make $r6 = 7 (0x7);;
     _32(0x60140006),        //make $r5 = 6 (0x6);;
     _32(0x60100005),        //make $r4 = 5 (0x5);;
     _32(0x600c0004),        //make $r3 = 4 (0x4);;
     _32(0x60080003),        //make $r2 = 3 (0x3);;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffffbb),        //call 16820 <add>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000002f101b6c0),        //compw.eq $r0 = $r0, 91 (0x5b);;
     _32(0x0c000080),        //cb.wnez $r0? 1694c <main+0x5c>;;
     _32(0x18000004),        //call 16958 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 16978 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16d78 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18a50 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
 |];

let adr_start:bits(addr_bits) = 0b00010110100011110000; //0x168f0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(add, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100011110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100101011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100101111000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000168f0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
