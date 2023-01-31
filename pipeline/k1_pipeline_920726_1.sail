// executing pipeline 920726_1 test 
val k1_pipeline_920726_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_920726_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let first: list_I = 
 [|
     _32(0x6130d80c),        //addd $r12 = $r12, -160 (0xffffff60);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2809140c),        //sq 80 (0x50)[$r12] = $r2r3;;
     _32(0x2811180c),        //sq 96 (0x60)[$r12] = $r4r5;;
     _32(0x28191c0c),        //sq 112 (0x70)[$r12] = $r6r7;;
     _32(0x2821200c),        //sq 128 (0x80)[$r12] = $r8r9;;
     _32(0x2829240c),        //sq 144 (0x90)[$r12] = $r10r11;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x6100140c),        //addd $r0 = $r12, 80 (0x50);;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x10000026),        //goto 168f8 <first+0xd8>;;
     _32(0x34000f0c),        //lws $r0 = 60 (0x3c)[$r12];;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000003f001b240),        //compw.ne $r0 = $r0, 105 (0x69);;
     _32(0x0c0004c0),        //cb.wnez $r0? 168cc <first+0xac>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705080c),        //sd 32 (0x20)[$r12] = $r1;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x26010a0c),        //sw 40 (0x28)[$r12] = $r0;;
     _32(0x30080a0c),        //lwz $r2 = 40 (0x28)[$r12];;
     _96(0x00000000800000fce004f000),        //make $r1 = 259008 (0x3f3c0);;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x18000219),        //call 17110 <sprintf>;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x1800026f),        //call 17270 <strlen>;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x10000009),        //goto 168ec <first+0xcc>;;
     _32(0x34000f0c),        //lws $r0 = 60 (0x3c)[$r12];;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71050001),        //addd $r1 = $r1, $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x61080040),        //addd $r2 = $r0, 1 (0x1);;
     _32(0x27090c0c),        //sd 48 (0x30)[$r12] = $r2;;
     _32(0x20040001),        //lbz $r1 = 0 (0x0)[$r1];;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x34000f0c),        //lws $r0 = 60 (0x3c)[$r12];;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x087ff5c0),        //cb.dnez $r0? 16864 <first+0x44>;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _32(0x30000b0c),        //lwz $r0 = 44 (0x2c)[$r12];;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130280c),        //addd $r12 = $r12, 160 (0xa0);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let second: list_I = 
 [|
     _32(0x6130d80c),        //addd $r12 = $r12, -160 (0xffffff60);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x2809140c),        //sq 80 (0x50)[$r12] = $r2r3;;
     _32(0x2811180c),        //sq 96 (0x60)[$r12] = $r4r5;;
     _32(0x28191c0c),        //sq 112 (0x70)[$r12] = $r6r7;;
     _32(0x2821200c),        //sq 128 (0x80)[$r12] = $r8r9;;
     _32(0x2829240c),        //sq 144 (0x90)[$r12] = $r10r11;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2705020c),        //sd 8 (0x8)[$r12] = $r1;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x6100140c),        //addd $r0 = $r12, 80 (0x50);;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x10000026),        //goto 16a08 <second+0xd8>;;
     _32(0x34000f0c),        //lws $r0 = 60 (0x3c)[$r12];;
     _32(0x3804020c),        //ld $r1 = 8 (0x8)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000003f001b240),        //compw.ne $r0 = $r0, 105 (0x69);;
     _32(0x0c0004c0),        //cb.wnez $r0? 169dc <second+0xac>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x61040200),        //addd $r1 = $r0, 8 (0x8);;
     _32(0x2705080c),        //sd 32 (0x20)[$r12] = $r1;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x26010b0c),        //sw 44 (0x2c)[$r12] = $r0;;
     _32(0x30080b0c),        //lwz $r2 = 44 (0x2c)[$r12];;
     _96(0x00000000800000fce004f000),        //make $r1 = 259008 (0x3f3c0);;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x180001d5),        //call 17110 <sprintf>;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x1800022b),        //call 17270 <strlen>;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x10000009),        //goto 169fc <second+0xcc>;;
     _32(0x34000f0c),        //lws $r0 = 60 (0x3c)[$r12];;
     _32(0x3804020c),        //ld $r1 = 8 (0x8)[$r12];;
     _32(0x71050001),        //addd $r1 = $r1, $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x61080040),        //addd $r2 = $r0, 1 (0x1);;
     _32(0x27090c0c),        //sd 48 (0x30)[$r12] = $r2;;
     _32(0x20040001),        //lbz $r1 = 0 (0x0)[$r1];;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x34000f0c),        //lws $r0 = 60 (0x3c)[$r12];;
     _32(0x3804020c),        //ld $r1 = 8 (0x8)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x087ff5c0),        //cb.dnez $r0? 16974 <second+0x44>;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130280c),        //addd $r12 = $r12, 160 (0xa0);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130c80c),        //addd $r12 = $r12, -224 (0xffffff20);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x61001e0c),        //addd $r0 = $r12, 120 (0x78);;
     _32(0x600c0014),        //make $r3 = 20 (0x14);;
     _32(0x60080005),        //make $r2 = 5 (0x5);;
     _96(0x00000000800000fce004f200),        //make $r1 = 259016 (0x3f3c8);;
     _32(0x1fffff6f),        //call 16820 <first>;;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _32(0x600c0014),        //make $r3 = 20 (0x14);;
     _32(0x60080005),        //make $r2 = 5 (0x5);;
     _96(0x00000000800000fce004f200),        //make $r1 = 259016 (0x3f3c8);;
     _32(0x1fffffac),        //call 16930 <second>;;
     _32(0x61001e0c),        //addd $r0 = $r12, 120 (0x78);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x00000000800000fce000f400),        //make $r0 = 259024 (0x3f3d0);;
     _32(0x180001c6),        //call 171b0 <strcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000240),        //cb.dnez $r0? 16ac4 <main+0x84>;;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x00000000800000fce000f400),        //make $r0 = 259024 (0x3f3d0);;
     _32(0x180001be),        //call 171b0 <strcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16ac8 <main+0x88>;;
     _32(0x18000003),        //call 16ad0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16af0 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16ef0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980023af),        //call 1f9a0 <_exit>
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
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(first, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(second, 0b00010110100100110000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101001000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101011010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110101011110000, num_instr, mI);
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
