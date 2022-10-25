// executing 20010209_1.c.out.dumped test 
val k1_20010209_1.: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20010209_1.() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let bar_2126: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x2701020c),        //sd 8 (0x8)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000016),        //goto 16890 <bar.2126+0x70>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x0e000200),        //cb.wlez $r0? 16860 <bar.2126+0x40>;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x6100ff00),        //addd $r0 = $r0, -4 (0xfffffffc);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x10000002),        //goto 16864 <bar.2126+0x44>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3404070c),        //lws $r1 = 28 (0x1c)[$r12];;
     _32(0x79062081),        //slld $r1 = $r1, 2 (0x2);;
     _32(0x3808040c),        //ld $r2 = 16 (0x10)[$r12];;
     _32(0x71050042),        //addd $r1 = $r2, $r1;;
     _32(0x3008070c),        //lwz $r2 = 28 (0x1c)[$r12];;
     _32(0x71011002),        //addw $r0 = $r2, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x26010001),        //sw 0 (0x0)[$r1] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x7201b001),        //compw.lt $r0 = $r1, $r0;;
     _32(0x0c7ff940),        //cb.wnez $r0? 1683c <bar.2126+0x1c>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x6100ff00),        //addd $r0 = $r0, -4 (0xfffffffc);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let foo: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x2749080c),        //sd 32 (0x20)[$r12] = $r18;;
     _32(0x6138040c),        //addd $r14 = $r12, 16 (0x10);;
     _32(0x6120140e),        //addd $r8 = $r14, 80 (0x50);;
     _32(0x2721060e),        //sd 24 (0x18)[$r14] = $r8;;
     _32(0x6a20000c),        //copyd $r8 = $r12;;
     _32(0x6a480008),        //copyd $r18 = $r8;;
     _96(0x0000000080000117e0202200),        //make $r8 = 285832 (0x45c88);;
     _32(0x30240008),        //lwz $r9 = 0 (0x0)[$r8];;
     _32(0x6923f009),        //sxwd $r8 = $r9;;
     _32(0x6120ffc8),        //addd $r8 = $r8, -1 (0xffffffff);;
     _32(0x27210a0e),        //sd 40 (0x28)[$r14] = $r8;;
     _32(0x6923f009),        //sxwd $r8 = $r9;;
     _32(0x6a080008),        //copyd $r2 = $r8;;
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0x7b222ec2),        //srld $r8 = $r2, 59 (0x3b);;
     _32(0x791e2143),        //slld $r7 = $r3, 5 (0x5);;
     _32(0x7a1d01c8),        //ord $r7 = $r8, $r7;;
     _32(0x791a2142),        //slld $r6 = $r2, 5 (0x5);;
     _32(0x690bf009),        //sxwd $r2 = $r9;;
     _32(0x6a000002),        //copyd $r0 = $r2;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x7b0a2ec0),        //srld $r2 = $r0, 59 (0x3b);;
     _32(0x79162141),        //slld $r5 = $r1, 5 (0x5);;
     _32(0x7a150142),        //ord $r5 = $r2, $r5;;
     _32(0x79122140),        //slld $r4 = $r0, 5 (0x5);;
     _32(0x6903f009),        //sxwd $r0 = $r9;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x610000c0),        //addd $r0 = $r0, 3 (0x3);;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x7b022140),        //srld $r0 = $r0, 5 (0x5);;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x75310300),        //sbfd $r12 = $r0, $r12;;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x610000c0),        //addd $r0 = $r0, 3 (0x3);;
     _32(0x7b022080),        //srld $r0 = $r0, 2 (0x2);;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x2701080e),        //sd 32 (0x20)[$r14] = $r0;;
     _32(0x6100060e),        //addd $r0 = $r14, 24 (0x18);;
     _32(0x27010c0e),        //sd 48 (0x30)[$r14] = $r0;;
     _32(0x3800080e),        //ld $r0 = 32 (0x20)[$r14];;
     _32(0x1fffffa2),        //call 16820 <bar.2126>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6a300012),        //copyd $r12 = $r18;;
     _32(0x6130fc0e),        //addd $r12 = $r14, -16 (0xfffffff0);;
     _32(0x3838040c),        //ld $r14 = 16 (0x10)[$r12];;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3848080c),        //ld $r18 = 32 (0x20)[$r12];;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x60040006),        //make $r1 = 6 (0x6);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x1fffffc0),        //call 168e0 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b3c0),        //compw.eq $r0 = $r0, 15 (0xf);;
     _32(0x0c000080),        //cb.wnez $r0? 169f8 <main+0x38>;;
     _32(0x18000003),        //call 16a00 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16a20 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16e20 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18af8 <_exit>
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
     _32(0x98000161),        //call 16fb8 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16a5c <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18af8 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100111000000; //0x169c0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar_2126, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100011100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100111000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101000000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit, 0b00010110101000100000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
