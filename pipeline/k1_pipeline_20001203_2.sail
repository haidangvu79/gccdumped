// executing pipeline 20001203_2 test 
val k1_pipeline_20001203_2: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20001203_2() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let create_array_type: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x080000c0),        //cb.dnez $r0? 16844 <create_array_type+0x24>;;
     _32(0x18000065),        //call 169d0 <alloc_type>;;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x61040a0c),        //addd $r1 = $r12, 40 (0x28);;
     _32(0x61000c0c),        //addd $r0 = $r12, 48 (0x30);;
     _32(0x18000071),        //call 16a10 <get_discrete_bounds>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _32(0x38080a0c),        //ld $r2 = 40 (0x28)[$r12];;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x75010080),        //sbfd $r0 = $r0, $r2;;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x5b003001),        //mulw $r0 = $r1, $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x25050400),        //sh 16 (0x10)[$r0] = $r1;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _32(0x088011c0),        //cb.deqz $r0? 169ac <create_array_type+0x18c>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _32(0x2701160c),        //sd 88 (0x58)[$r12] = $r0;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x2701140c),        //sd 80 (0x50)[$r12] = $r0;;
     _32(0x60000020),        //make $r0 = 32 (0x20);;
     _32(0x2601130c),        //sw 76 (0x4c)[$r12] = $r0;;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _32(0x38040800),        //ld $r1 = 32 (0x20)[$r0];;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _32(0x38000600),        //ld $r0 = 24 (0x18)[$r0];;
     _32(0x75050040),        //sbfd $r1 = $r0, $r1;;
     _32(0x3400130c),        //lws $r0 = 76 (0x4c)[$r12];;
     _32(0x7301a001),        //compd.ge $r0 = $r1, $r0;;
     _32(0x08000100),        //cb.dnez $r0? 168e0 <create_array_type+0xc0>;;
     _32(0x3004130c),        //lwz $r1 = 76 (0x4c)[$r12];;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _32(0x18000047),        //call 169f8 <_obstack_newchunk>;;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _32(0x38040600),        //ld $r1 = 24 (0x18)[$r0];;
     _32(0x3400130c),        //lws $r0 = 76 (0x4c)[$r12];;
     _32(0x71050001),        //addd $r1 = $r1, $r0;;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _32(0x27050600),        //sd 24 (0x18)[$r0] = $r1;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x2701100c),        //sd 64 (0x40)[$r12] = $r0;;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x38000600),        //ld $r0 = 24 (0x18)[$r0];;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x7001a001),        //compd.ne $r0 = $r1, $r0;;
     _32(0x08000100),        //cb.dnez $r0? 1692c <create_array_type+0x10c>;;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x26050b00),        //sw 44 (0x2c)[$r0] = $r1;;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x38000600),        //ld $r0 = 24 (0x18)[$r0];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x30000a00),        //lwz $r0 = 40 (0x28)[$r0];;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x71050001),        //addd $r1 = $r1, $r0;;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x30000a00),        //lwz $r0 = 40 (0x28)[$r0];;
     _32(0x7c00ffc0),        //notw $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x78010001),        //andd $r0 = $r1, $r0;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x27050600),        //sd 24 (0x18)[$r0] = $r1;;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x38040600),        //ld $r1 = 24 (0x18)[$r0];;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x38000800),        //ld $r0 = 32 (0x20)[$r0];;
     _32(0x7801a001),        //compd.leu $r0 = $r1, $r0;;
     _32(0x08000140),        //cb.dnez $r0? 16994 <create_array_type+0x174>;;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x38040800),        //ld $r1 = 32 (0x20)[$r0];;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x27050600),        //sd 24 (0x18)[$r0] = $r1;;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x38040600),        //ld $r1 = 24 (0x18)[$r0];;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x27050400),        //sd 16 (0x10)[$r0] = $r1;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x10000003),        //goto 169b4 <create_array_type+0x194>;;
     _32(0x60000020),        //make $r0 = 32 (0x20);;
     _32(0x1800000c),        //call 169e0 <xmalloc>;;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x27010601),        //sd 24 (0x18)[$r1] = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000)        //ret ;;
 |];

let alloc_type: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x18000031)        //call 16aa0 <abort>;;
 |];

let xmalloc: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let _obstack_newchunk: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x18000025)        //call 16aa0 <abort>;;
 |];

let get_discrete_bounds: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x60080020),        //make $r2 = 32 (0x20);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x1800006e),        //call 16c10 <memset>;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x60080020),        //make $r2 = 32 (0x20);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x1800006a),        //call 16c10 <memset>;;
     _32(0x60000004),        //make $r0 = 4 (0x4);;
     _32(0x2601100c),        //sw 64 (0x40)[$r12] = $r0;;
     _32(0x6104100c),        //addd $r1 = $r12, 64 (0x40);;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x1fffff69),        //call 16820 <create_array_type>;;
     _32(0x3000080c),        //lwz $r0 = 32 (0x20)[$r12];;
     _64(0x00000000f101b300),        //compw.eq $r0 = $r0, 12 (0xc);;
     _32(0x0c000080),        //cb.wnez $r0? 16a94 <main+0x54>;;
     _32(0x18000004),        //call 16aa0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 16ac0 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x9800017b),        //call 17098 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980008af),        //call 18d70 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
 |];

let adr_start:bits(addr_bits) = 0b00010110101001000000; //0x16a40
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(create_array_type, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(alloc_type, 0b00010110100111010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(xmalloc, 0b00010110100111100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(_obstack_newchunk, 0b00010110100111111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(get_discrete_bounds, 0b00010110101000010000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101001000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101010100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110101011000000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016a40;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
