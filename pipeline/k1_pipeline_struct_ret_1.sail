// executing pipeline struct_ret_1 test 
val k1_pipeline_struct_ret_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_struct_ret_1() = {
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
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2739020c),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0x6a38000f),        //copyd $r14 = $r15;;
     _32(0x2701100c),        //sd 64 (0x40)[$r12] = $r0;;
     _32(0x2705120c),        //sd 72 (0x48)[$r12] = $r1;;
     _32(0x2709140c),        //sd 80 (0x50)[$r12] = $r2;;
     _32(0x7a000003),        //copyw $r0 = $r3;;
     _32(0x27110c0c),        //sd 48 (0x30)[$r12] = $r4;;
     _32(0x2715060c),        //sd 24 (0x18)[$r12] = $r5;;
     _32(0x2719080c),        //sd 32 (0x20)[$r12] = $r6;;
     _32(0x271d0a0c),        //sd 40 (0x28)[$r12] = $r7;;
     _32(0x24010e0c),        //sb 56 (0x38)[$r12] = $r0;;
     _96(0x00000000800000f8e0004a00),        //make $r0 = 254248 (0x3e128);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x2705160c),        //sd 88 (0x58)[$r12] = $r1;;
     _32(0x38040200),        //ld $r1 = 8 (0x8)[$r0];;
     _32(0x2705180c),        //sd 96 (0x60)[$r12] = $r1;;
     _32(0x38040400),        //ld $r1 = 16 (0x10)[$r0];;
     _32(0x27051a0c),        //sd 104 (0x68)[$r12] = $r1;;
     _32(0x38040600),        //ld $r1 = 24 (0x18)[$r0];;
     _32(0x27051c0c),        //sd 112 (0x70)[$r12] = $r1;;
     _32(0x28000800),        //lhz $r0 = 32 (0x20)[$r0];;
     _32(0x25011e0c),        //sh 120 (0x78)[$r12] = $r0;;
     _32(0x20000e0c),        //lbz $r0 = 56 (0x38)[$r12];;
     _32(0x24011e4c),        //sb 121 (0x79)[$r12] = $r0;;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x3008120c),        //lwz $r2 = 72 (0x48)[$r12];;
     _32(0x300c130c),        //lwz $r3 = 76 (0x4c)[$r12];;
     _32(0x3010140c),        //lwz $r4 = 80 (0x50)[$r12];;
     _32(0x24040e0c),        //lbs $r1 = 56 (0x38)[$r12];;
     _32(0x7814ffc1),        //zxwd $r5 = $r1;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x3018080c),        //lwz $r6 = 32 (0x20)[$r12];;
     _32(0x301c090c),        //lwz $r7 = 36 (0x24)[$r12];;
     _32(0x30200a0c),        //lwz $r8 = 40 (0x28)[$r12];;
     _32(0x7a2c0008),        //copyw $r11 = $r8;;
     _32(0x7a280007),        //copyw $r10 = $r7;;
     _32(0x7a240006),        //copyw $r9 = $r6;;
     _32(0x6a200001),        //copyd $r8 = $r1;;
     _32(0x381c0c0c),        //ld $r7 = 48 (0x30)[$r12];;
     _32(0x7a180005),        //copyw $r6 = $r5;;
     _32(0x7a140004),        //copyw $r5 = $r4;;
     _32(0x7a100003),        //copyw $r4 = $r3;;
     _32(0x7a0c0002),        //copyw $r3 = $r2;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _96(0x00000000800000fde0044000),        //make $r1 = 259328 (0x3f500);;
     _96(0x0000000080000117e0009000),        //make $r0 = 286272 (0x45e40);;
     _32(0x180001fb),        //call 170e8 <sprintf>;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x2701000e),        //sd 0 (0x0)[$r14] = $r0;;
     _32(0x3800180c),        //ld $r0 = 96 (0x60)[$r12];;
     _32(0x2701020e),        //sd 8 (0x8)[$r14] = $r0;;
     _32(0x38001a0c),        //ld $r0 = 104 (0x68)[$r12];;
     _32(0x2701040e),        //sd 16 (0x10)[$r14] = $r0;;
     _32(0x38001c0c),        //ld $r0 = 112 (0x70)[$r12];;
     _32(0x2701060e),        //sd 24 (0x18)[$r14] = $r0;;
     _32(0x28001e0c),        //lhz $r0 = 120 (0x78)[$r12];;
     _32(0x2501080e),        //sh 32 (0x20)[$r14] = $r0;;
     _32(0x6a00000e),        //copyd $r0 = $r14;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0x6130200c),        //addd $r12 = $r12, 128 (0x80);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130c00c),        //addd $r12 = $r12, -256 (0xffffff00);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000f8e0000400),        //make $r0 = 253968 (0x3e010);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x7820ffc0),        //zxwd $r8 = $r0;;
     _96(0x00000000800000f8e0001000),        //make $r0 = 254016 (0x3e040);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0002400),        //make $r0 = 254096 (0x3e090);;
     _96(0x00000000800000f8e0081e00),        //make $r2 = 254072 (0x3e078);;
     _32(0x610c360c),        //addd $r3 = $r12, 216 (0xd8);;
     _32(0x6a3c0003),        //copyd $r15 = $r3;;
     _32(0x38140000),        //ld $r5 = 0 (0x0)[$r0];;
     _32(0x38180200),        //ld $r6 = 8 (0x8)[$r0];;
     _32(0x381c0400),        //ld $r7 = 16 (0x10)[$r0];;
     _32(0x6a100001),        //copyd $r4 = $r1;;
     _32(0x7a0c0008),        //copyw $r3 = $r8;;
     _32(0x38000002),        //ld $r0 = 0 (0x0)[$r2];;
     _32(0x38040202),        //ld $r1 = 8 (0x8)[$r2];;
     _32(0x38080402),        //ld $r2 = 16 (0x10)[$r2];;
     _32(0x1fffff9b),        //call 16820 <f>;;
     _32(0x61001c0c),        //addd $r0 = $r12, 112 (0x70);;
     _96(0x0000000080000117e0049000),        //make $r1 = 286272 (0x45e40);;
     _32(0x18000220),        //call 17248 <strcpy>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x24013e4c),        //sb 249 (0xf9)[$r12] = $r0;;
     _32(0x20003e4c),        //lbz $r0 = 249 (0xf9)[$r12];;
     _32(0x2401360c),        //sb 216 (0xd8)[$r12] = $r0;;
     _96(0x00000000800000f8e0004800),        //make $r0 = 254240 (0x3e120);;
     _32(0x38200000),        //ld $r8 = 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0000400),        //make $r0 = 253968 (0x3e010);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x7824ffc0),        //zxwd $r9 = $r0;;
     _96(0x00000000800000f8e0001000),        //make $r0 = 254016 (0x3e040);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0002400),        //make $r0 = 254096 (0x3e090);;
     _96(0x00000000800000f8e0081e00),        //make $r2 = 254072 (0x3e078);;
     _32(0x610c080c),        //addd $r3 = $r12, 32 (0x20);;
     _32(0x6a3c0003),        //copyd $r15 = $r3;;
     _32(0x38140000),        //ld $r5 = 0 (0x0)[$r0];;
     _32(0x38180200),        //ld $r6 = 8 (0x8)[$r0];;
     _32(0x381c0400),        //ld $r7 = 16 (0x10)[$r0];;
     _32(0x6a100001),        //copyd $r4 = $r1;;
     _32(0x7a0c0009),        //copyw $r3 = $r9;;
     _32(0x38000002),        //ld $r0 = 0 (0x0)[$r2];;
     _32(0x38040202),        //ld $r1 = 8 (0x8)[$r2];;
     _32(0x38080402),        //ld $r2 = 16 (0x10)[$r2];;
     _32(0x0fdc0008),        //icall $r8;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x2701360c),        //sd 216 (0xd8)[$r12] = $r0;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x2701380c),        //sd 224 (0xe0)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x27013a0c),        //sd 232 (0xe8)[$r12] = $r0;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x27013c0c),        //sd 240 (0xf0)[$r12] = $r0;;
     _32(0x2800100c),        //lhz $r0 = 64 (0x40)[$r12];;
     _32(0x25013e0c),        //sh 248 (0xf8)[$r12] = $r0;;
     _32(0x61001c0c),        //addd $r0 = $r12, 112 (0x70);;
     _96(0x0000000080000117e0049000),        //make $r1 = 286272 (0x45e40);;
     _32(0x180001be),        //call 17188 <strcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16aa0 <main+0x160>;;
     _32(0x18000003),        //call 16aa8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16ac8 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16ec8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980023d1),        //call 1fa00 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
 |];

let adr_start:bits(addr_bits) = 0b00010110100101000000; //0x16940
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100101000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101010101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110101011001000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016940;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
