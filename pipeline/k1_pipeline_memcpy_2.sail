// executing pipeline memcpy_2.c.out.dumped test 
val k1_pipeline_memcpy_2: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_memcpy_2() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let main: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x100000a1),        //goto 16ab8 <main+0x298>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x10000097),        //goto 16a9c <main+0x27c>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x1000008d),        //goto 16a80 <main+0x260>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010c0c),        //sw 48 (0x30)[$r12] = $r0;;
     _32(0x60000041),        //make $r0 = 65 (0x41);;
     _32(0x240109cc),        //sb 39 (0x27)[$r12] = $r0;;
     _32(0x1000001b),        //goto 168cc <main+0xac>;;
     _96(0x0000000080000106e0047000),        //make $r1 = 268736 (0x419c0);;
     _32(0x34000c0c),        //lws $r0 = 48 (0x30)[$r12];;
     _32(0x60080061),        //make $r2 = 97 (0x61);;
     _32(0x240be001),        //sb $r0[$r1] = $r2;;
     _32(0x240009cc),        //lbs $r0 = 39 (0x27)[$r12];;
     _64(0x00000002f401b7c0),        //compw.le $r0 = $r0, 95 (0x5f);;
     _32(0x0c0000c0),        //cb.wnez $r0? 16894 <main+0x74>;;
     _32(0x60000041),        //make $r0 = 65 (0x41);;
     _32(0x240109cc),        //sb 39 (0x27)[$r12] = $r0;;
     _96(0x0000000080000106e0088800),        //make $r2 = 268832 (0x41a20);;
     _32(0x34000c0c),        //lws $r0 = 48 (0x30)[$r12];;
     _32(0x200409cc),        //lbz $r1 = 39 (0x27)[$r12];;
     _32(0x2407e002),        //sb $r0[$r2] = $r1;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010c0c),        //sw 48 (0x30)[$r12] = $r0;;
     _32(0x200009cc),        //lbz $r0 = 39 (0x27)[$r12];;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x240109cc),        //sb 39 (0x27)[$r12] = $r0;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _64(0x00000002f801b7c0),        //compw.leu $r0 = $r0, 95 (0x5f);;
     _32(0x0c7ff8c0),        //cb.wnez $r0? 16864 <main+0x44>;;
     _32(0x34000f0c),        //lws $r0 = 60 (0x3c)[$r12];;
     _96(0x0000000080000106e10c7000),        //addd $r3 = $r0, 268736 (0x419c0);;
     _32(0x34000e0c),        //lws $r0 = 56 (0x38)[$r12];;
     _96(0x0000000080000106e1008800),        //addd $r0 = $r0, 268832 (0x41a20);;
     _32(0x34040d0c),        //lws $r1 = 52 (0x34)[$r12];;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x6a000003),        //copyd $r0 = $r3;;
     _32(0x180000cd),        //call 16c40 <memcpy>;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x34000f0c),        //lws $r0 = 60 (0x3c)[$r12];;
     _96(0x0000000080000106e1007000),        //addd $r0 = $r0, 268736 (0x419c0);;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16934 <main+0x114>;;
     _32(0x18000068),        //call 16ad0 <abort>;;
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010c0c),        //sw 48 (0x30)[$r12] = $r0;;
     _32(0x1000000e),        //goto 16984 <main+0x164>;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000003f101b040),        //compw.eq $r0 = $r0, 97 (0x61);;
     _32(0x0c000080),        //cb.wnez $r0? 1696c <main+0x14c>;;
     _32(0x1800005a),        //call 16ad0 <abort>;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010c0c),        //sw 48 (0x30)[$r12] = $r0;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x30040c0c),        //lwz $r1 = 48 (0x30)[$r12];;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x7201b001),        //compw.lt $r0 = $r1, $r0;;
     _32(0x0c7ffc00),        //cb.wnez $r0? 16950 <main+0x130>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010c0c),        //sw 48 (0x30)[$r12] = $r0;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x71001040),        //addw $r0 = $r0, 65 (0x41);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x240109cc),        //sb 39 (0x27)[$r12] = $r0;;
     _32(0x10000019),        //goto 16a14 <main+0x1f4>;;
     _32(0x240009cc),        //lbs $r0 = 39 (0x27)[$r12];;
     _64(0x00000002f401b7c0),        //compw.le $r0 = $r0, 95 (0x5f);;
     _32(0x0c0000c0),        //cb.wnez $r0? 169cc <main+0x1ac>;;
     _32(0x60000041),        //make $r0 = 65 (0x41);;
     _32(0x240109cc),        //sb 39 (0x27)[$r12] = $r0;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x240409cc),        //lbs $r1 = 39 (0x27)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 169e8 <main+0x1c8>;;
     _32(0x1800003b),        //call 16ad0 <abort>;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010c0c),        //sw 48 (0x30)[$r12] = $r0;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x200009cc),        //lbz $r0 = 39 (0x27)[$r12];;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x240109cc),        //sb 39 (0x27)[$r12] = $r0;;
     _32(0x30040c0c),        //lwz $r1 = 48 (0x30)[$r12];;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _32(0x7201b001),        //compw.lt $r0 = $r1, $r0;;
     _32(0x0c7ff940),        //cb.wnez $r0? 169b4 <main+0x194>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010c0c),        //sw 48 (0x30)[$r12] = $r0;;
     _32(0x1000000e),        //goto 16a64 <main+0x244>;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000003f101b040),        //compw.eq $r0 = $r0, 97 (0x61);;
     _32(0x0c000080),        //cb.wnez $r0? 16a4c <main+0x22c>;;
     _32(0x18000022),        //call 16ad0 <abort>;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010c0c),        //sw 48 (0x30)[$r12] = $r0;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _64(0x00000000f801b1c0),        //compw.leu $r0 = $r0, 7 (0x7);;
     _32(0x0c7ffc00),        //cb.wnez $r0? 16a30 <main+0x210>;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _64(0x00000002f801b3c0),        //compw.leu $r0 = $r0, 79 (0x4f);;
     _32(0x0c7fdc40),        //cb.wnez $r0? 16850 <main+0x30>;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _64(0x00000000f801b1c0),        //compw.leu $r0 = $r0, 7 (0x7);;
     _32(0x0c7fd9c0),        //cb.wnez $r0? 16844 <main+0x24>;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _64(0x00000000f801b1c0),        //compw.leu $r0 = $r0, 7 (0x7);;
     _32(0x0c7fd740),        //cb.wnez $r0? 16838 <main+0x18>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16af0 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x9800017b),        //call 170c8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980008af),        //call 18da0 <_exit>
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
     _32(0x980001d7),        //call 17260 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16b2c <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x9800089d),        //call 18da0 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101011010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110101011110000, num_instr, mI);
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
