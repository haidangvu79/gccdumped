// executing pipeline 20030928_1.c.out.dumped test 
val k1_pipeline_20030928_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20030928_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let get_addrs: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x07ffffc0f1000000),        //addw $r0 = $r0, -65536 (0xffffffffffff0000);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _96(0x00000000800000fce104f000),        //addd $r1 = $r0, 259008 (0x3f3c0);;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61000100),        //addd $r0 = $r0, 4 (0x4);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x07ffff80f1000000),        //addw $r0 = $r0, -131072 (0xfffffffffffe0000);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6907f000),        //sxwd $r1 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _96(0x00000000800000fce104f201),        //addd $r1 = $r1, 259016 (0x3f3c8);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x07ffff40f1000000),        //addw $r0 = $r0, -196608 (0xfffffffffffd0000);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6907f000),        //sxwd $r1 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61000400),        //addd $r0 = $r0, 16 (0x10);;
     _96(0x00000000800000fce104f401),        //addd $r1 = $r1, 259024 (0x3f3d0);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61000300),        //addd $r0 = $r0, 12 (0xc);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x07ffff00f1000000),        //addw $r0 = $r0, -262144 (0xfffffffffffc0000);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6907f000),        //sxwd $r1 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61000600),        //addd $r0 = $r0, 24 (0x18);;
     _96(0x00000000800000fce104f601),        //addd $r1 = $r1, 259032 (0x3f3d8);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61000400),        //addd $r0 = $r0, 16 (0x10);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x07fffec0f1000000),        //addw $r0 = $r0, -327680 (0xfffffffffffb0000);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6907f000),        //sxwd $r1 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61000800),        //addd $r0 = $r0, 32 (0x20);;
     _96(0x00000000800000fce104f801),        //addd $r1 = $r1, 259040 (0x3f3e0);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61000500),        //addd $r0 = $r0, 20 (0x14);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x07fffe80f1000000),        //addw $r0 = $r0, -393216 (0xfffffffffffa0000);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6907f000),        //sxwd $r1 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61000a00),        //addd $r0 = $r0, 40 (0x28);;
     _96(0x00000000800000fce104fa01),        //addd $r1 = $r1, 259048 (0x3f3e8);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61000600),        //addd $r0 = $r0, 24 (0x18);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x07fffe40f1000000),        //addw $r0 = $r0, -458752 (0xfffffffffff90000);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6907f000),        //sxwd $r1 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61000c00),        //addd $r0 = $r0, 48 (0x30);;
     _96(0x00000000800000fce104fc01),        //addd $r1 = $r1, 259056 (0x3f3f0);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61000700),        //addd $r0 = $r0, 28 (0x1c);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x07fffe00f1000000),        //addw $r0 = $r0, -524288 (0xfffffffffff80000);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6907f000),        //sxwd $r1 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61000e00),        //addd $r0 = $r0, 56 (0x38);;
     _96(0x00000000800000fce104fe01),        //addd $r1 = $r1, 259064 (0x3f3f8);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26011f0c),        //sw 124 (0x7c)[$r12] = $r0;;
     _32(0x1000000e),        //goto 16a5c <main+0x4c>;;
     _32(0x30001f0c),        //lwz $r0 = 124 (0x7c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x79023400),        //sllw $r0 = $r0, 16 (0x10);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x34001f0c),        //lws $r0 = 124 (0x7c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x6108200c),        //addd $r2 = $r12, 128 (0x80);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x2605e600),        //sw -104 (0xffffff98)[$r0] = $r1;;
     _32(0x30001f0c),        //lwz $r0 = 124 (0x7c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26011f0c),        //sw 124 (0x7c)[$r12] = $r0;;
     _32(0x30001f0c),        //lwz $r0 = 124 (0x7c)[$r12];;
     _64(0x00000000f401b1c0),        //compw.le $r0 = $r0, 7 (0x7);;
     _32(0x0c7ffc00),        //cb.wnez $r0? 16a28 <main+0x18>;;
     _32(0x6104060c),        //addd $r1 = $r12, 24 (0x18);;
     _32(0x61000e0c),        //addd $r0 = $r12, 56 (0x38);;
     _32(0x1fffff6b),        //call 16820 <get_addrs>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26011f0c),        //sw 124 (0x7c)[$r12] = $r0;;
     _32(0x1000000f),        //goto 16abc <main+0xac>;;
     _32(0x34001f0c),        //lws $r0 = 124 (0x7c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6104200c),        //addd $r1 = $r12, 128 (0x80);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3800ee00),        //ld $r0 = -72 (0xffffffb8)[$r0];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000003f101b040),        //compw.eq $r0 = $r0, 97 (0x61);;
     _32(0x0c000080),        //cb.wnez $r0? 16ab0 <main+0xa0>;;
     _32(0x1800000b),        //call 16ad8 <abort>;;
     _32(0x30001f0c),        //lwz $r0 = 124 (0x7c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26011f0c),        //sw 124 (0x7c)[$r12] = $r0;;
     _32(0x30001f0c),        //lwz $r0 = 124 (0x7c)[$r12];;
     _64(0x00000000f401b1c0),        //compw.le $r0 = $r0, 7 (0x7);;
     _32(0x0c7ffbc0),        //cb.wnez $r0? 16a84 <main+0x74>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 16af8 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16ef8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18bd0 <_exit>
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
     _32(0x98000161),        //call 17090 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fde0000000),        //make $r0 = 259072 (0x3f400);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16b34 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18bd0 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101000010000; //0x16a10
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(get_addrs, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101000010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101011011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110101011111000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016a10;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
