// executing pipeline 20000113_1.c.out.dumped test 
val k1_pipeline_20000113_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20000113_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foobar: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2601080c),        //sw 32 (0x20)[$r12] = $r0;;
     _32(0x2605060c),        //sw 24 (0x18)[$r12] = $r1;;
     _32(0x2609040c),        //sw 16 (0x10)[$r12] = $r2;;
     _32(0x3000080c),        //lwz $r0 = 32 (0x20)[$r12];;
     _32(0x78000040),        //andw $r0 = $r0, 1 (0x1);;
     _32(0x78043fc0),        //zxbd $r1 = $r0;;
     _32(0x20000c0c),        //lbz $r0 = 48 (0x30)[$r12];;
     _32(0x60030001),        //insf $r0 = $r1, 0 (0x0), 0 (0x0);;
     _32(0x24010c0c),        //sb 48 (0x30)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x780000c0),        //andw $r0 = $r0, 3 (0x3);;
     _32(0x78043fc0),        //zxbd $r1 = $r0;;
     _32(0x20000c0c),        //lbz $r0 = 48 (0x30)[$r12];;
     _32(0x60032041),        //insf $r0 = $r1, 2 (0x2), 1 (0x1);;
     _32(0x24010c0c),        //sb 48 (0x30)[$r12] = $r0;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x780001c0),        //andw $r0 = $r0, 7 (0x7);;
     _32(0x78043fc0),        //zxbd $r1 = $r0;;
     _32(0x20000c0c),        //lbz $r0 = 48 (0x30)[$r12];;
     _32(0x600350c1),        //insf $r0 = $r1, 5 (0x5), 3 (0x3);;
     _32(0x24010c0c),        //sb 48 (0x30)[$r12] = $r0;;
     _32(0x3000080c),        //lwz $r0 = 32 (0x20)[$r12];;
     _32(0x78000040),        //andw $r0 = $r0, 1 (0x1);;
     _32(0x78043fc0),        //zxbd $r1 = $r0;;
     _32(0x20000a0c),        //lbz $r0 = 40 (0x28)[$r12];;
     _32(0x60030001),        //insf $r0 = $r1, 0 (0x0), 0 (0x0);;
     _32(0x24010a0c),        //sb 40 (0x28)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x780000c0),        //andw $r0 = $r0, 3 (0x3);;
     _32(0x78043fc0),        //zxbd $r1 = $r0;;
     _32(0x20000a0c),        //lbz $r0 = 40 (0x28)[$r12];;
     _32(0x60032041),        //insf $r0 = $r1, 2 (0x2), 1 (0x1);;
     _32(0x24010a0c),        //sb 40 (0x28)[$r12] = $r0;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x780001c0),        //andw $r0 = $r0, 7 (0x7);;
     _32(0x78043fc0),        //zxbd $r1 = $r0;;
     _32(0x20000a0c),        //lbz $r0 = 40 (0x28)[$r12];;
     _32(0x600350c1),        //insf $r0 = $r1, 5 (0x5), 3 (0x3);;
     _32(0x24010a0c),        //sb 40 (0x28)[$r12] = $r0;;
     _32(0x61000a0c),        //addd $r0 = $r12, 40 (0x28);;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x640350c0),        //extfz $r0 = $r0, 5 (0x5), 3 (0x3);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _32(0x64032040),        //extfz $r0 = $r0, 2 (0x2), 1 (0x1);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _32(0x64030000),        //extfz $r0 = $r0, 0 (0x0), 0 (0x0);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x75011040),        //sbfw $r0 = $r0, $r1;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x30040001),        //lwz $r1 = 0 (0x0)[$r1];;
     _32(0x64072041),        //extfz $r1 = $r1, 2 (0x2), 1 (0x1);;
     _32(0x78043fc1),        //zxbd $r1 = $r1;;
     _32(0x5b003040),        //mulw $r0 = $r0, $r1;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x71011002),        //addw $r0 = $r2, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x780001c0),        //andw $r0 = $r0, 7 (0x7);;
     _32(0x78083fc0),        //zxbd $r2 = $r0;;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x20000001),        //lbz $r0 = 0 (0x0)[$r1];;
     _32(0x600350c2),        //insf $r0 = $r2, 5 (0x5), 3 (0x3);;
     _32(0x24010001),        //sb 0 (0x0)[$r1] = $r0;;
     _32(0x20000c0c),        //lbz $r0 = 48 (0x30)[$r12];;
     _32(0x78000040),        //andw $r0 = $r0, 1 (0x1);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x08800200),        //cb.deqz $r0? 16974 <foobar+0x154>;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x78000e00),        //andw $r0 = $r0, 56 (0x38);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _64(0x00000001f101b200),        //compw.eq $r0 = $r0, 40 (0x28);;
     _32(0x0c000080),        //cb.wnez $r0? 16978 <foobar+0x158>;;
     _32(0x1800000f),        //call 169b0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000015)        //call 169d0 <exit>;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60080003),        //make $r2 = 3 (0x3);;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffffa2),        //call 16820 <foobar>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16dd0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18aa8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0xf838ffc0),        //zxwd $r14 = $r0
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x98000161),        //call 16f68 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16a0c <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18aa8 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100110000000; //0x16980
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foobar, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100110000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100110110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100111010000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016980;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
