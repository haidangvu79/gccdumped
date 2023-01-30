// executing pipeline 920625_1 test 
val k1_pipeline_920625_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_920625_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let va1: list_I = 
 [|
     _32(0x6130d80c),        //addd $r12 = $r12, -160 (0xffffff60);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2705120c),        //sd 72 (0x48)[$r12] = $r1;;
     _32(0x2809140c),        //sq 80 (0x50)[$r12] = $r2r3;;
     _32(0x2811180c),        //sq 96 (0x60)[$r12] = $r4r5;;
     _32(0x28191c0c),        //sq 112 (0x70)[$r12] = $r6r7;;
     _32(0x2821200c),        //sq 128 (0x80)[$r12] = $r8r9;;
     _32(0x2829240c),        //sq 144 (0x90)[$r12] = $r10r11;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x6100120c),        //addd $r0 = $r12, 72 (0x48);;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x1000001f),        //goto 168d4 <va1+0xb4>;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x61040400),        //addd $r1 = $r0, 16 (0x10);;
     _32(0x27050c0c),        //sd 48 (0x30)[$r12] = $r1;;
     _32(0x3c000000),        //lq $r0r1 = 0 (0x0)[$r0];;
     _32(0x2801080c),        //sq 32 (0x20)[$r12] = $r0r1;;
     _96(0x00000000800000f8e0040200),        //make $r1 = 253960 (0x3e008);;
     _32(0x34000f0c),        //lws $r0 = 60 (0x3c)[$r12];;
     _32(0x79022100),        //slld $r0 = $r0, 4 (0x4);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x7b030001),        //fcompd.une $r0 = $r1, $r0;;
     _32(0x08000300),        //cb.dnez $r0? 168c4 <va1+0xa4>;;
     _96(0x00000000800000f8e0040200),        //make $r1 = 253960 (0x3e008);;
     _32(0x34000f0c),        //lws $r0 = 60 (0x3c)[$r12];;
     _32(0x79022100),        //slld $r0 = $r0, 4 (0x4);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x7a030001),        //fcompd.oeq $r0 = $r1, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 168c8 <va1+0xa8>;;
     _32(0x18000075),        //call 16a98 <abort>;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x30040f0c),        //lwz $r1 = 60 (0x3c)[$r12];;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7201b001),        //compw.lt $r0 = $r1, $r0;;
     _32(0x0c7ff7c0),        //cb.wnez $r0? 1685c <va1+0x3c>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130280c),        //addd $r12 = $r12, 160 (0xa0);;
     _32(0x0fd00000)        //ret ;;
 |];

let va2: list_I = 
 [|
     _32(0x6130d80c),        //addd $r12 = $r12, -160 (0xffffff60);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x2705120c),        //sd 72 (0x48)[$r12] = $r1;;
     _32(0x2809140c),        //sq 80 (0x50)[$r12] = $r2r3;;
     _32(0x2811180c),        //sq 96 (0x60)[$r12] = $r4r5;;
     _32(0x28191c0c),        //sq 112 (0x70)[$r12] = $r6r7;;
     _32(0x2821200c),        //sq 128 (0x80)[$r12] = $r8r9;;
     _32(0x2829240c),        //sq 144 (0x90)[$r12] = $r10r11;;
     _32(0x2601080c),        //sw 32 (0x20)[$r12] = $r0;;
     _32(0x6100120c),        //addd $r0 = $r12, 72 (0x48);;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x1000001f),        //goto 169ac <va2+0xb4>;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x27050c0c),        //sd 48 (0x30)[$r12] = $r1;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _96(0x00000000800000f8e0041200),        //make $r1 = 254024 (0x3e048);;
     _32(0x34000f0c),        //lws $r0 = 60 (0x3c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _32(0x30000a0c),        //lwz $r0 = 40 (0x28)[$r12];;
     _32(0x7001b001),        //compw.ne $r0 = $r1, $r0;;
     _32(0x0c000300),        //cb.wnez $r0? 1699c <va2+0xa4>;;
     _96(0x00000000800000f8e0041200),        //make $r1 = 254024 (0x3e048);;
     _32(0x34000f0c),        //lws $r0 = 60 (0x3c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x61000100),        //addd $r0 = $r0, 4 (0x4);;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _32(0x30000b0c),        //lwz $r0 = 44 (0x2c)[$r12];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 169a0 <va2+0xa8>;;
     _32(0x1800003f),        //call 16a98 <abort>;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x30040f0c),        //lwz $r1 = 60 (0x3c)[$r12];;
     _32(0x3000080c),        //lwz $r0 = 32 (0x20)[$r12];;
     _32(0x7201b001),        //compw.lt $r0 = $r1, $r0;;
     _32(0x0c7ff7c0),        //cb.wnez $r0? 16934 <va2+0x3c>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130280c),        //addd $r12 = $r12, 160 (0xa0);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _96(0x00000000800000f8e0100200),        //make $r4 = 253960 (0x3e008);;
     _96(0x00000000800000f8e00c0200),        //make $r3 = 253960 (0x3e008);;
     _96(0x00000000800000f8e0080200),        //make $r2 = 253960 (0x3e008);;
     _32(0x3c000c00),        //lq $r0r1 = 48 (0x30)[$r0];;
     _32(0x6a1c0000),        //copyd $r7 = $r0;;
     _32(0x6a200001),        //copyd $r8 = $r1;;
     _32(0x3c000804),        //lq $r0r1 = 32 (0x20)[$r4];;
     _32(0x6a140000),        //copyd $r5 = $r0;;
     _32(0x6a180001),        //copyd $r6 = $r1;;
     _32(0x3c000403),        //lq $r0r1 = 16 (0x10)[$r3];;
     _32(0x6a0c0000),        //copyd $r3 = $r0;;
     _32(0x6a100001),        //copyd $r4 = $r1;;
     _32(0x3c000002),        //lq $r0r1 = 0 (0x0)[$r2];;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x60000004),        //make $r0 = 4 (0x4);;
     _32(0x1fffff78),        //call 16820 <va1>;;
     _96(0x00000000800000f8e00c1200),        //make $r3 = 254024 (0x3e048);;
     _96(0x00000000800000f8e0081200),        //make $r2 = 254024 (0x3e048);;
     _96(0x00000000800000f8e0041200),        //make $r1 = 254024 (0x3e048);;
     _96(0x00000000800000f8e0001200),        //make $r0 = 254024 (0x3e048);;
     _32(0x38100603),        //ld $r4 = 24 (0x18)[$r3];;
     _32(0x380c0402),        //ld $r3 = 16 (0x10)[$r2];;
     _32(0x38080201),        //ld $r2 = 8 (0x8)[$r1];;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x60000004),        //make $r0 = 4 (0x4);;
     _32(0x1fffff9c),        //call 168f8 <va2>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 16ab8 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16eb8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18b90 <_exit>
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
     _32(0x98000161),        //call 17050 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fde0000000),        //make $r0 = 259072 (0x3f400);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16af4 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18b90 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100111010000; //0x169d0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(va1, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(va2, 0b00010110100011111000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100111010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101010011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit, 0b00010110101010111000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000169d0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
