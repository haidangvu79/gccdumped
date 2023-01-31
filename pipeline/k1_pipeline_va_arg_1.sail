// executing pipeline va_arg_1 test 
val k1_pipeline_va_arg_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_va_arg_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let f: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x27251a0c),        //sd 104 (0x68)[$r12] = $r9;;
     _32(0x28291c0c),        //sq 112 (0x70)[$r12] = $r10r11;;
     _32(0x2701140c),        //sd 80 (0x50)[$r12] = $r0;;
     _32(0x2705120c),        //sd 72 (0x48)[$r12] = $r1;;
     _32(0x2709100c),        //sd 64 (0x40)[$r12] = $r2;;
     _32(0x270d0e0c),        //sd 56 (0x38)[$r12] = $r3;;
     _32(0x27110c0c),        //sd 48 (0x30)[$r12] = $r4;;
     _32(0x27150a0c),        //sd 40 (0x28)[$r12] = $r5;;
     _32(0x2719080c),        //sd 32 (0x20)[$r12] = $r6;;
     _32(0x271d060c),        //sd 24 (0x18)[$r12] = $r7;;
     _32(0x2721040c),        //sd 16 (0x10)[$r12] = $r8;;
     _32(0x61001a0c),        //addd $r0 = $r12, 104 (0x68);;
     _32(0x2701160c),        //sd 88 (0x58)[$r12] = $r0;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705160c),        //sd 88 (0x58)[$r12] = $r1;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x61010280),        //compd.eq $r0 = $r0, 10 (0xa);;
     _32(0x08000080),        //cb.dnez $r0? 1687c <f+0x5c>;;
     _32(0x18000026),        //call 16910 <abort>;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705160c),        //sd 88 (0x58)[$r12] = $r1;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x610102c0),        //compd.eq $r0 = $r0, 11 (0xb);;
     _32(0x08000080),        //cb.dnez $r0? 16898 <f+0x78>;;
     _32(0x1800001f),        //call 16910 <abort>;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705160c),        //sd 88 (0x58)[$r12] = $r1;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x08800080),        //cb.deqz $r0? 168b0 <f+0x90>;;
     _32(0x18000019),        //call 16910 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130200c),        //addd $r12 = $r12, 128 (0x80);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x602c0000),        //make $r11 = 0 (0x0);;
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
     _32(0x1fffffc7),        //call 16820 <f>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16930 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16d30 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18a08 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
 |];

let adr_start:bits(addr_bits) = 0b00010110100011001000; //0x168c8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100011001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100100010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100100110000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000168c8;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
