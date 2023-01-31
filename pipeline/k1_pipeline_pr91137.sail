// executing pipeline pr91137.c.out.dumped test 
val k1_pipeline_pr91137: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr91137() = {
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
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x3404040c),        //lws $r1 = 16 (0x10)[$r12];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let fn2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000046),        //goto 1696c <fn2+0x124>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x1000002a),        //goto 16908 <fn2+0xc0>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x088001c0),        //cb.deqz $r0? 16890 <fn2+0x48>;;
     _96(0x0000000080000117e0042400),        //make $r1 = 285840 (0x45c90);;
     _32(0x3400060c),        //lws $r0 = 24 (0x18)[$r12];;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x260bf001),        //sw.xs $r0[$r1] = $r2;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x10000015),        //goto 168ec <fn2+0xa4>;;
     _96(0x0000000080000117e0086a00),        //make $r2 = 286120 (0x45da8);;
     _32(0x3400060c),        //lws $r0 = 24 (0x18)[$r12];;
     _32(0x3404050c),        //lws $r1 = 20 (0x14)[$r12];;
     _32(0x44041181),        //muld $r1 = $r1, 70 (0x46);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x300af002),        //lwz.xs $r2 = $r0[$r2];;
     _96(0x0000000080000117e0046a00),        //make $r1 = 286120 (0x45da8);;
     _32(0x3400060c),        //lws $r0 = 24 (0x18)[$r12];;
     _32(0x44004600),        //muld $r0 = $r0, 280 (0x118);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x61000100),        //addd $r0 = $r0, 4 (0x4);;
     _32(0x7a040002),        //copyw $r1 = $r2;;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x3000050c),        //lwz $r0 = 20 (0x14)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x3000050c),        //lwz $r0 = 20 (0x14)[$r12];;
     _64(0x00000002f401b140),        //compw.le $r0 = $r0, 69 (0x45);;
     _32(0x0c7ffa40),        //cb.wnez $r0? 1689c <fn2+0x54>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000002f401b140),        //compw.le $r0 = $r0, 69 (0x45);;
     _32(0x0c7ff500),        //cb.wnez $r0? 16864 <fn2+0x1c>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x1000000c),        //goto 16950 <fn2+0x108>;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _96(0x000000008000012ae0009000),        //make $r0 = 305728 (0x4aa40);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _64(0x00000002f401b140),        //compw.le $r0 = $r0, 69 (0x45);;
     _32(0x0c7ffc80),        //cb.wnez $r0? 16924 <fn2+0xdc>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000002f401b140),        //compw.le $r0 = $r0, 69 (0x45);;
     _32(0x0c7fee00),        //cb.wnez $r0? 16858 <fn2+0x10>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x60040005),        //make $r1 = 5 (0x5);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000000b),        //goto 169e4 <main+0x54>;;
     _96(0x0000000080000117e0042400),        //make $r1 = 285840 (0x45c90);;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _64(0x001eedc2e0086000),        //make $r2 = 2075593088 (0x7bb70980);;
     _32(0x260bf001),        //sw.xs $r0[$r1] = $r2;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000002f401b140),        //compw.le $r0 = $r0, 69 (0x45);;
     _32(0x0c7ffcc0),        //cb.wnez $r0? 169bc <main+0x2c>;;
     _32(0x1fffff95),        //call 16848 <fn2>;;
     _96(0x000000008000012ae0009000),        //make $r0 = 305728 (0x4aa40);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _96(0x000000008000012ae0008e00),        //make $r0 = 305720 (0x4aa38);;
     _32(0x1fffff82),        //call 16820 <f>;;
     _96(0x000000008000012ae0008e00),        //make $r0 = 305720 (0x4aa38);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x08800080),        //cb.deqz $r0? 16a34 <main+0xa4>;;
     _32(0x18000006),        //call 16a48 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16e20 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18950 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100110010000; //0x16990
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fn2, 0b00010110100001001000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100110010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101001001000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016990;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
