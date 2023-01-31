// executing pipeline 960416_1 test 
val k1_pipeline_960416_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_960416_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let f_le: list_I = 
 [|
     _32(0x6130d80c),        //addd $r12 = $r12, -160 (0xffffff60);;
     _32(0x28010a0c),        //sq 40 (0x28)[$r12] = $r0r1;;
     _32(0x2809060c),        //sq 24 (0x18)[$r12] = $r2r3;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601250c),        //sw 148 (0x94)[$r12] = $r0;;
     _32(0x38040c0c),        //ld $r1 = 48 (0x30)[$r12];;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x75010040),        //sbfd $r0 = $r0, $r1;;
     _32(0x2701220c),        //sd 136 (0x88)[$r12] = $r0;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x75010040),        //sbfd $r0 = $r0, $r1;;
     _32(0x2701260c),        //sd 152 (0x98)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3804260c),        //ld $r1 = 152 (0x98)[$r12];;
     _32(0x7801a001),        //compd.leu $r0 = $r1, $r0;;
     _32(0x080001c0),        //cb.dnez $r0? 1687c <f_le+0x5c>;;
     _32(0x3800260c),        //ld $r0 = 152 (0x98)[$r12];;
     _32(0x65000000),        //negd $r0 = $r0;;
     _32(0x2701260c),        //sd 152 (0x98)[$r12] = $r0;;
     _32(0x3000250c),        //lwz $r0 = 148 (0x94)[$r12];;
     _32(0x7c00ffc0),        //notw $r0 = $r0;;
     _32(0x2601250c),        //sw 148 (0x94)[$r12] = $r0;;
     _32(0x38040a0c),        //ld $r1 = 40 (0x28)[$r12];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x54001001),        //muld $r0 = $r1, $r0;;
     _32(0x2701160c),        //sd 88 (0x58)[$r12] = $r0;;
     _32(0x38040c0c),        //ld $r1 = 48 (0x30)[$r12];;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x54001001),        //muld $r0 = $r1, $r0;;
     _32(0x27011a0c),        //sd 104 (0x68)[$r12] = $r0;;
     _32(0x3804220c),        //ld $r1 = 136 (0x88)[$r12];;
     _32(0x3800260c),        //ld $r0 = 152 (0x98)[$r12];;
     _32(0x54001001),        //muld $r0 = $r1, $r0;;
     _32(0x2701120c),        //sd 72 (0x48)[$r12] = $r0;;
     _32(0x3804120c),        //ld $r1 = 72 (0x48)[$r12];;
     _32(0x3400250c),        //lws $r0 = 148 (0x94)[$r12];;
     _32(0x7c010001),        //xord $r0 = $r1, $r0;;
     _32(0x2701120c),        //sd 72 (0x48)[$r12] = $r0;;
     _32(0x38041a0c),        //ld $r1 = 104 (0x68)[$r12];;
     _32(0x38001c0c),        //ld $r0 = 112 (0x70)[$r12];;
     _32(0x71050001),        //addd $r1 = $r1, $r0;;
     _32(0x3800180c),        //ld $r0 = 96 (0x60)[$r12];;
     _32(0x71050001),        //addd $r1 = $r1, $r0;;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x27011e0c),        //sd 120 (0x78)[$r12] = $r0;;
     _32(0x3804180c),        //ld $r1 = 96 (0x60)[$r12];;
     _32(0x38001a0c),        //ld $r0 = 104 (0x68)[$r12];;
     _32(0x71050001),        //addd $r1 = $r1, $r0;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x71050001),        //addd $r1 = $r1, $r0;;
     _32(0x3800120c),        //ld $r0 = 72 (0x48)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x38001e0c),        //ld $r0 = 120 (0x78)[$r12];;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130280c),        //addd $r12 = $r12, 160 (0xa0);;
     _32(0x0fd00000)        //ret ;;
 |];

let f_be: list_I = 
 [|
     _32(0x6130d80c),        //addd $r12 = $r12, -160 (0xffffff60);;
     _32(0x28010a0c),        //sq 40 (0x28)[$r12] = $r0r1;;
     _32(0x2809060c),        //sq 24 (0x18)[$r12] = $r2r3;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601250c),        //sw 148 (0x94)[$r12] = $r0;;
     _32(0x38040a0c),        //ld $r1 = 40 (0x28)[$r12];;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x75010040),        //sbfd $r0 = $r0, $r1;;
     _32(0x2701220c),        //sd 136 (0x88)[$r12] = $r0;;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x75010040),        //sbfd $r0 = $r0, $r1;;
     _32(0x2701260c),        //sd 152 (0x98)[$r12] = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x3804260c),        //ld $r1 = 152 (0x98)[$r12];;
     _32(0x7801a001),        //compd.leu $r0 = $r1, $r0;;
     _32(0x080001c0),        //cb.dnez $r0? 1697c <f_be+0x5c>;;
     _32(0x3800260c),        //ld $r0 = 152 (0x98)[$r12];;
     _32(0x65000000),        //negd $r0 = $r0;;
     _32(0x2701260c),        //sd 152 (0x98)[$r12] = $r0;;
     _32(0x3000250c),        //lwz $r0 = 148 (0x94)[$r12];;
     _32(0x7c00ffc0),        //notw $r0 = $r0;;
     _32(0x2601250c),        //sw 148 (0x94)[$r12] = $r0;;
     _32(0x38040c0c),        //ld $r1 = 48 (0x30)[$r12];;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x54001001),        //muld $r0 = $r1, $r0;;
     _32(0x2701160c),        //sd 88 (0x58)[$r12] = $r0;;
     _32(0x38040a0c),        //ld $r1 = 40 (0x28)[$r12];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x54001001),        //muld $r0 = $r1, $r0;;
     _32(0x27011a0c),        //sd 104 (0x68)[$r12] = $r0;;
     _32(0x3804220c),        //ld $r1 = 136 (0x88)[$r12];;
     _32(0x3800260c),        //ld $r0 = 152 (0x98)[$r12];;
     _32(0x54001001),        //muld $r0 = $r1, $r0;;
     _32(0x2701120c),        //sd 72 (0x48)[$r12] = $r0;;
     _32(0x3804120c),        //ld $r1 = 72 (0x48)[$r12];;
     _32(0x3400250c),        //lws $r0 = 148 (0x94)[$r12];;
     _32(0x7c010001),        //xord $r0 = $r1, $r0;;
     _32(0x2701120c),        //sd 72 (0x48)[$r12] = $r0;;
     _32(0x38041a0c),        //ld $r1 = 104 (0x68)[$r12];;
     _32(0x38001a0c),        //ld $r0 = 104 (0x68)[$r12];;
     _32(0x71050001),        //addd $r1 = $r1, $r0;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x71050001),        //addd $r1 = $r1, $r0;;
     _32(0x3800120c),        //ld $r0 = 72 (0x48)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x27011e0c),        //sd 120 (0x78)[$r12] = $r0;;
     _32(0x3804160c),        //ld $r1 = 88 (0x58)[$r12];;
     _32(0x38001c0c),        //ld $r0 = 112 (0x70)[$r12];;
     _32(0x71050001),        //addd $r1 = $r1, $r0;;
     _32(0x3800180c),        //ld $r0 = 96 (0x60)[$r12];;
     _32(0x71050001),        //addd $r1 = $r1, $r0;;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x3800200c),        //ld $r0 = 128 (0x80)[$r12];;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130280c),        //addd $r12 = $r12, 160 (0xa0);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _64(0x00040000e0000000),        //make $r0 = 268435456 (0x10000000);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _64(0x00380000e0000000),        //make $r0 = 3758096384 (0xe0000000);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _96(0x0080000080380000e0040000),        //make $r1 = 1152921508364943360 (0x10000000e0000000);;
     _32(0x7001a040),        //compd.ne $r0 = $r0, $r1;;
     _32(0x080003c0),        //cb.dnez $r0? 16a94 <main+0x74>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _64(0x00400000e0000000),        //make $r0 = 4294967296 (0x100000000);;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _64(0x00400000e0080000),        //make $r2 = 4294967296 (0x100000000);;
     _32(0x1fffffa9),        //call 16920 <f_be>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x07fffffff101b7c0),        //compw.eq $r0 = $r0, 4294967295 (0xffffffff);;
     _32(0x0c000080),        //cb.wnez $r0? 16a94 <main+0x74>;;
     _32(0x18000018),        //call 16af0 <abort>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _96(0x0700000080040000e0040000),        //make $r1 = 16140901064764293120 (0xe000000010000000);;
     _32(0x7001a040),        //compd.ne $r0 = $r0, $r1;;
     _32(0x080003c0),        //cb.dnez $r0? 16ae4 <main+0xc4>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _64(0x00400000e0000000),        //make $r0 = 4294967296 (0x100000000);;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _64(0x00400000e0080000),        //make $r2 = 4294967296 (0x100000000);;
     _32(0x1fffff55),        //call 16820 <f_le>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x07fffffff101b7c0),        //compw.eq $r0 = $r0, 4294967295 (0xffffffff);;
     _32(0x0c000080),        //cb.wnez $r0? 16ae4 <main+0xc4>;;
     _32(0x18000004),        //call 16af0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 16b10 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16f10 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18be8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
 |];

let adr_start:bits(addr_bits) = 0b00010110101000100000; //0x16a20
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f_le, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f_be, 0b00010110100100100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101011110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110101100010000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016a20;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
