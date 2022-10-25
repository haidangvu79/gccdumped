// executing 20020314_1.c.out.dumped test 
val k1_20020314_1.c.out.dumped: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20020314_1.c.out.dumped() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let f: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let g: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x6138040c),        //addd $r14 = $r12, 16 (0x10);;
     _32(0x27010a0e),        //sd 40 (0x28)[$r14] = $r0;;
     _32(0x2705080e),        //sd 32 (0x20)[$r14] = $r1;;
     _32(0x2709060e),        //sd 24 (0x18)[$r14] = $r2;;
     _32(0x270d040e),        //sd 16 (0x10)[$r14] = $r3;;
     _32(0x38040a0e),        //ld $r1 = 40 (0x28)[$r14];;
     _32(0x3800080e),        //ld $r0 = 32 (0x20)[$r14];;
     _32(0x50027001),        //faddd $r0 = $r1, $r0;;
     _32(0x2701120e),        //sd 72 (0x48)[$r14] = $r0;;
     _32(0x3804060e),        //ld $r1 = 24 (0x18)[$r14];;
     _32(0x3800040e),        //ld $r0 = 16 (0x10)[$r14];;
     _32(0x58017001),        //fmuld $r0 = $r1, $r0;;
     _32(0x2701100e),        //sd 64 (0x40)[$r14] = $r0;;
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x7b022140),        //srld $r0 = $r0, 5 (0x5);;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x27010e0e),        //sd 56 (0x38)[$r14] = $r0;;
     _32(0x3804100e),        //ld $r1 = 64 (0x40)[$r14];;
     _32(0x38000e0e),        //ld $r0 = 56 (0x38)[$r14];;
     _32(0x1fffffe1),        //call 16820 <f>;;
     _32(0x3804120e),        //ld $r1 = 72 (0x48)[$r14];;
     _32(0x3800100e),        //ld $r0 = 64 (0x40)[$r14];;
     _32(0x58017001),        //fmuld $r0 = $r1, $r0;;
     _32(0x38040a0e),        //ld $r1 = 40 (0x28)[$r14];;
     _32(0x58017001),        //fmuld $r0 = $r1, $r0;;
     _32(0x27010c0e),        //sd 48 (0x30)[$r14] = $r0;;
     _32(0x38040c0e),        //ld $r1 = 48 (0x30)[$r14];;
     _32(0x3800080e),        //ld $r0 = 32 (0x20)[$r14];;
     _32(0x50027001),        //faddd $r0 = $r1, $r0;;
     _32(0x6130fc0e),        //addd $r12 = $r14, -16 (0xfffffff0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838040c),        //ld $r14 = 16 (0x10)[$r12];;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x01ff800080000000e0000000),        //make $r0 = 4607182418800017408 (0x3ff0000000000000);;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _96(0x0201200080000000e0000000),        //make $r0 = 4621819117588971520 (0x4024000000000000);;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x380c080c),        //ld $r3 = 32 (0x20)[$r12];;
     _32(0x38080a0c),        //ld $r2 = 40 (0x28)[$r12];;
     _32(0x38040c0c),        //ld $r1 = 48 (0x30)[$r12];;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x1fffffc3),        //call 16838 <g>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16940 <main+0x60>;;
     _32(0x18000019),        //call 169a0 <abort>;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _96(0x01ff800080000000e0040000),        //make $r1 = 4607182418800017408 (0x3ff0000000000000);;
     _32(0x7b030040),        //fcompd.une $r0 = $r0, $r1;;
     _32(0x080003c0),        //cb.dnez $r0? 16990 <main+0xb0>;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x7b030040),        //fcompd.une $r0 = $r0, $r1;;
     _32(0x080002c0),        //cb.dnez $r0? 16990 <main+0xb0>;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _96(0x0201200080000000e0040000),        //make $r1 = 4621819117588971520 (0x4024000000000000);;
     _32(0x7b030040),        //fcompd.une $r0 = $r0, $r1;;
     _32(0x08000140),        //cb.dnez $r0? 16990 <main+0xb0>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x7a030040),        //fcompd.oeq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16994 <main+0xb4>;;
     _32(0x18000004),        //call 169a0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 169c0 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16dc0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18a98 <_exit>
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
     _32(0x98000161),        //call 16f58 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 169fc <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18a98 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100011100000; //0x168e0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(g, 0b00010110100000111000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100011100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100110100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit, 0b00010110100111000000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
