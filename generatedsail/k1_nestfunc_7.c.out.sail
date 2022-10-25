// executing nestfunc_7.c.out.dumped test 
val k1_nestfunc_7.: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_nestfunc_7.() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let Foo_2132: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x3800180c),        //ld $r0 = 96 (0x60)[$r12];;
     _32(0x3804180c),        //ld $r1 = 96 (0x60)[$r12];;
     _32(0x27050a0c),        //sd 40 (0x28)[$r12] = $r1;;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _32(0x71040041),        //addw $r1 = $r1, 1 (0x1);;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0x26050c0c),        //sw 48 (0x30)[$r12] = $r1;;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _32(0x71040081),        //addw $r1 = $r1, 2 (0x2);;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0x26050d0c),        //sw 52 (0x34)[$r12] = $r1;;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _32(0x710400c1),        //addw $r1 = $r1, 3 (0x3);;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0x26050e0c),        //sw 56 (0x38)[$r12] = $r1;;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _32(0x71040101),        //addw $r1 = $r1, 4 (0x4);;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0x26050f0c),        //sw 60 (0x3c)[$r12] = $r1;;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _32(0x71040141),        //addw $r1 = $r1, 5 (0x5);;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0x2605100c),        //sw 64 (0x40)[$r12] = $r1;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000180),        //addw $r0 = $r0, 6 (0x6);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x2601110c),        //sw 68 (0x44)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x2701120c),        //sd 72 (0x48)[$r12] = $r0;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x2701140c),        //sd 80 (0x50)[$r12] = $r0;;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x2701160c),        //sd 88 (0x58)[$r12] = $r0;;
     _32(0x3800120c),        //ld $r0 = 72 (0x48)[$r12];;
     _32(0x3804140c),        //ld $r1 = 80 (0x50)[$r12];;
     _32(0x3808160c),        //ld $r2 = 88 (0x58)[$r12];;
     _32(0x6130200c),        //addd $r12 = $r12, 128 (0x80);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x6100180c),        //addd $r0 = $r12, 96 (0x60);;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x6000000a),        //make $r0 = 10 (0xa);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x2701100c),        //sd 64 (0x40)[$r12] = $r0;;
     _32(0x1fffffcf),        //call 16820 <Foo.2132>;;
     _32(0x6a0c0000),        //copyd $r3 = $r0;;
     _32(0x6a000002),        //copyd $r0 = $r2;;
     _32(0x270d0a0c),        //sd 40 (0x28)[$r12] = $r3;;
     _32(0x27050c0c),        //sd 48 (0x30)[$r12] = $r1;;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x30000a0c),        //lwz $r0 = 40 (0x28)[$r12];;
     _64(0x00000000f001b2c0),        //compw.ne $r0 = $r0, 11 (0xb);;
     _32(0x0c0005c0),        //cb.wnez $r0? 16964 <test+0xa4>;;
     _32(0x30000b0c),        //lwz $r0 = 44 (0x2c)[$r12];;
     _64(0x00000000f001b300),        //compw.ne $r0 = $r0, 12 (0xc);;
     _32(0x0c0004c0),        //cb.wnez $r0? 16964 <test+0xa4>;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _64(0x00000000f001b340),        //compw.ne $r0 = $r0, 13 (0xd);;
     _32(0x0c0003c0),        //cb.wnez $r0? 16964 <test+0xa4>;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _64(0x00000000f001b380),        //compw.ne $r0 = $r0, 14 (0xe);;
     _32(0x0c0002c0),        //cb.wnez $r0? 16964 <test+0xa4>;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _64(0x00000000f001b3c0),        //compw.ne $r0 = $r0, 15 (0xf);;
     _32(0x0c0001c0),        //cb.wnez $r0? 16964 <test+0xa4>;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _64(0x00000000f001b400),        //compw.ne $r0 = $r0, 16 (0x10);;
     _32(0x0c0000c0),        //cb.wnez $r0? 16964 <test+0xa4>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x10000002),        //goto 16968 <test+0xa8>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
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
     _32(0x1fffffcd),        //call 168c0 <test>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b000),        //compw.eq $r0 = $r0, 0 (0x0);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100110000000; //0x16980
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(Foo_2132, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test, 0b00010110100011000000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100110000000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
