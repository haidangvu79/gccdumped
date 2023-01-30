// executing pipeline 930614_2 test 
val k1_pipeline_930614_2: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_930614_2() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let main: list_I = 
 [|
     _64(0x07fffffee130f80c),        //addd $r12 = $r12, -1056 (0xfffffffffffffbe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _64(0x18000001a601070c),        //sw 1052 (0x41c)[$r12] = $r0;;
     _32(0x10000082),        //goto 16a44 <main+0x224>;;
     _64(0x18000001b000070c),        //lwz $r0 = 1052 (0x41c)[$r12];;
     _64(0x18000001a601060c),        //sw 1048 (0x418)[$r12] = $r0;;
     _32(0x10000073),        //goto 16a1c <main+0x1fc>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _64(0x18000001a601050c),        //sw 1044 (0x414)[$r12] = $r0;;
     _32(0x10000065),        //goto 169f4 <main+0x1d4>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _64(0x18000001a601040c),        //sw 1040 (0x410)[$r12] = $r0;;
     _32(0x10000057),        //goto 169cc <main+0x1ac>;;
     _64(0x18000001b004070c),        //lwz $r1 = 1052 (0x41c)[$r12];;
     _64(0x18000001b000060c),        //lwz $r0 = 1048 (0x418)[$r12];;
     _32(0x7001b001),        //compw.ne $r0 = $r1, $r0;;
     _32(0x0c000780),        //cb.wnez $r0? 16900 <main+0xe0>;;
     _64(0x18000001b004050c),        //lwz $r1 = 1044 (0x414)[$r12];;
     _64(0x18000001b000040c),        //lwz $r0 = 1040 (0x410)[$r12];;
     _32(0x7001b001),        //compw.ne $r0 = $r1, $r0;;
     _32(0x0c000600),        //cb.wnez $r0? 16900 <main+0xe0>;;
     _64(0x18000001b400040c),        //lws $r0 = 1040 (0x410)[$r12];;
     _64(0x18000001b404050c),        //lws $r1 = 1044 (0x414)[$r12];;
     _64(0x18000001b408070c),        //lws $r2 = 1052 (0x41c)[$r12];;
     _32(0x790a2042),        //slld $r2 = $r2, 1 (0x1);;
     _32(0x71090042),        //addd $r2 = $r2, $r1;;
     _64(0x18000001b404060c),        //lws $r1 = 1048 (0x418)[$r12];;
     _32(0x790a20c2),        //slld $r2 = $r2, 3 (0x3);;
     _32(0x71050042),        //addd $r1 = $r2, $r1;;
     _32(0x79062041),        //slld $r1 = $r1, 1 (0x1);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _64(0x00000001e104080c),        //addd $r1 = $r12, 1056 (0x420);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _64(0x000fd333e0043340),        //make $r1 = 1061997773 (0x3f4ccccd);;
     _64(0x1ffffffea605fc00),        //sw -1040 (0xfffffffffffffbf0)[$r0] = $r1;;
     _32(0x10000017),        //goto 16958 <main+0x138>;;
     _64(0x18000001b400040c),        //lws $r0 = 1040 (0x410)[$r12];;
     _64(0x18000001b404050c),        //lws $r1 = 1044 (0x414)[$r12];;
     _64(0x18000001b408070c),        //lws $r2 = 1052 (0x41c)[$r12];;
     _32(0x790a2042),        //slld $r2 = $r2, 1 (0x1);;
     _32(0x71090042),        //addd $r2 = $r2, $r1;;
     _64(0x18000001b404060c),        //lws $r1 = 1048 (0x418)[$r12];;
     _32(0x790a20c2),        //slld $r2 = $r2, 3 (0x3);;
     _32(0x71050042),        //addd $r1 = $r2, $r1;;
     _32(0x79062041),        //slld $r1 = $r1, 1 (0x1);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _64(0x00000001e104080c),        //addd $r1 = $r12, 1056 (0x420);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _64(0x000fd333e0043340),        //make $r1 = 1061997773 (0x3f4ccccd);;
     _64(0x1ffffffea605fc00),        //sw -1040 (0xfffffffffffffbf0)[$r0] = $r1;;
     _64(0x18000001b400040c),        //lws $r0 = 1040 (0x410)[$r12];;
     _64(0x18000001b404050c),        //lws $r1 = 1044 (0x414)[$r12];;
     _64(0x18000001b408070c),        //lws $r2 = 1052 (0x41c)[$r12];;
     _32(0x790a2042),        //slld $r2 = $r2, 1 (0x1);;
     _32(0x71090042),        //addd $r2 = $r2, $r1;;
     _64(0x18000001b404060c),        //lws $r1 = 1048 (0x418)[$r12];;
     _32(0x790a20c2),        //slld $r2 = $r2, 3 (0x3);;
     _32(0x71050042),        //addd $r1 = $r2, $r1;;
     _32(0x79062041),        //slld $r1 = $r1, 1 (0x1);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _64(0x00000001e104080c),        //addd $r1 = $r12, 1056 (0x420);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _64(0x1ffffffeb000fc00),        //lwz $r0 = -1040 (0xfffffffffffffbf0)[$r0];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x74030040),        //fcompw.olt $r0 = $r0, $r1;;
     _32(0x08800080),        //cb.deqz $r0? 169b8 <main+0x198>;;
     _32(0x1800002b),        //call 16a60 <abort>;;
     _64(0x18000001b000040c),        //lwz $r0 = 1040 (0x410)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _64(0x18000001a601040c),        //sw 1040 (0x410)[$r12] = $r0;;
     _64(0x18000001b000040c),        //lwz $r0 = 1040 (0x410)[$r12];;
     _64(0x00000000f401b040),        //compw.le $r0 = $r0, 1 (0x1);;
     _32(0x0c7fe980),        //cb.wnez $r0? 16874 <main+0x54>;;
     _64(0x18000001b000050c),        //lwz $r0 = 1044 (0x414)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _64(0x18000001a601050c),        //sw 1044 (0x414)[$r12] = $r0;;
     _64(0x18000001b000050c),        //lwz $r0 = 1044 (0x414)[$r12];;
     _64(0x00000000f401b040),        //compw.le $r0 = $r0, 1 (0x1);;
     _32(0x0c7fe600),        //cb.wnez $r0? 16864 <main+0x44>;;
     _64(0x18000001b000060c),        //lwz $r0 = 1048 (0x418)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _64(0x18000001a601060c),        //sw 1048 (0x418)[$r12] = $r0;;
     _64(0x18000001b000060c),        //lwz $r0 = 1048 (0x418)[$r12];;
     _64(0x00000000f401b1c0),        //compw.le $r0 = $r0, 7 (0x7);;
     _32(0x0c7fe280),        //cb.wnez $r0? 16854 <main+0x34>;;
     _64(0x18000001b000070c),        //lwz $r0 = 1052 (0x41c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _64(0x18000001a601070c),        //sw 1052 (0x41c)[$r12] = $r0;;
     _64(0x18000001b000070c),        //lwz $r0 = 1052 (0x41c)[$r12];;
     _64(0x00000000f401b1c0),        //compw.le $r0 = $r0, 7 (0x7);;
     _32(0x0c7fdec0),        //cb.wnez $r0? 16840 <main+0x20>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16a80 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16e80 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18b58 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0xf838ffc0),        //zxwd $r14 = $r0
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x98000161),        //call 17018 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16abc <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18b58 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101001100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit, 0b00010110101010000000, num_instr, mI);
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
