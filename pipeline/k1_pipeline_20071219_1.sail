// executing pipeline 20071219_1 test 
val k1_pipeline_20071219_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20071219_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2605060c),        //sw 24 (0x18)[$r12] = $r1;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000010),        //goto 1687c <foo+0x5c>;;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x2002e001),        //lbz $r0 = $r0[$r1];;
     _32(0x08800080),        //cb.deqz $r0? 16854 <foo+0x34>;;
     _32(0x180000b4),        //call 16b20 <abort>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0c800180),        //cb.weqz $r0? 16870 <foo+0x50>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x78083fc0),        //zxbd $r2 = $r0;;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x240be001),        //sb $r0[$r1] = $r2;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f801b600),        //compw.leu $r0 = $r0, 24 (0x18);;
     _32(0x0c7ffb80),        //cb.wnez $r0? 16840 <foo+0x20>;;
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test1: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x60080019),        //make $r2 = 25 (0x19);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x180000dc),        //call 16c40 <memset>;;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x1fffffd1),        //call 16820 <foo>;;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x3800120c),        //ld $r0 = 72 (0x48)[$r12];;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x2000160c),        //lbz $r0 = 88 (0x58)[$r12];;
     _32(0x24010e0c),        //sb 56 (0x38)[$r12] = $r0;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x1fffffc6),        //call 16820 <foo>;;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x3800120c),        //ld $r0 = 72 (0x48)[$r12];;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x2000160c),        //lbz $r0 = 88 (0x58)[$r12];;
     _32(0x24010e0c),        //sb 56 (0x38)[$r12] = $r0;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x1fffffbb),        //call 16820 <foo>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test2: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x60080019),        //make $r2 = 25 (0x19);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x180000b6),        //call 16c40 <memset>;;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x1fffffab),        //call 16820 <foo>;;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x3800120c),        //ld $r0 = 72 (0x48)[$r12];;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x2000160c),        //lbz $r0 = 88 (0x58)[$r12];;
     _32(0x24010e0c),        //sb 56 (0x38)[$r12] = $r0;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x1fffffa0),        //call 16820 <foo>;;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x3800120c),        //ld $r0 = 72 (0x48)[$r12];;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x2000160c),        //lbz $r0 = 88 (0x58)[$r12];;
     _32(0x24010e0c),        //sb 56 (0x38)[$r12] = $r0;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x2705080c),        //sd 32 (0x20)[$r12] = $r1;;
     _32(0x38040200),        //ld $r1 = 8 (0x8)[$r0];;
     _32(0x27050a0c),        //sd 40 (0x28)[$r12] = $r1;;
     _32(0x38040400),        //ld $r1 = 16 (0x10)[$r0];;
     _32(0x27050c0c),        //sd 48 (0x30)[$r12] = $r1;;
     _32(0x20000600),        //lbz $r0 = 24 (0x18)[$r0];;
     _32(0x24010e0c),        //sb 56 (0x38)[$r12] = $r0;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x1fffff89),        //call 16820 <foo>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test3: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x60080019),        //make $r2 = 25 (0x19);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x18000084),        //call 16c40 <memset>;;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x1fffff79),        //call 16820 <foo>;;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x3800120c),        //ld $r0 = 72 (0x48)[$r12];;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x2000160c),        //lbz $r0 = 88 (0x58)[$r12];;
     _32(0x24010e0c),        //sb 56 (0x38)[$r12] = $r0;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x1fffff6e),        //call 16820 <foo>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x3804100c),        //ld $r1 = 64 (0x40)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x3804120c),        //ld $r1 = 72 (0x48)[$r12];;
     _32(0x27050200),        //sd 8 (0x8)[$r0] = $r1;;
     _32(0x3804140c),        //ld $r1 = 80 (0x50)[$r12];;
     _32(0x27050400),        //sd 16 (0x10)[$r0] = $r1;;
     _32(0x2004160c),        //lbz $r1 = 88 (0x58)[$r12];;
     _32(0x24050600),        //sb 24 (0x18)[$r0] = $r1;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x38040a0c),        //ld $r1 = 40 (0x28)[$r12];;
     _32(0x27050200),        //sd 8 (0x8)[$r0] = $r1;;
     _32(0x38040c0c),        //ld $r1 = 48 (0x30)[$r12];;
     _32(0x27050400),        //sd 16 (0x10)[$r0] = $r1;;
     _32(0x20040e0c),        //lbz $r1 = 56 (0x38)[$r12];;
     _32(0x24050600),        //sb 24 (0x18)[$r0] = $r1;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x1fffff53),        //call 16820 <foo>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1fffff6f),        //call 168b8 <test1>;;
     _32(0x1fffff94),        //call 16950 <test2>;;
     _32(0x1fffffc5),        //call 16a18 <test3>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
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
     _32(0x98000167),        //call 170c8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000831),        //call 18bf8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101011110000; //0x16af0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test1, 0b00010110100010111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test2, 0b00010110100101010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test3, 0b00010110101000011000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101011110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101100100000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016af0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
