// executing 20100430_1.c.out.dumped test 
val k1_20100430_1.c.out.dumped: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20100430_1.c.out.dumped() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let dummy: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2501060c),        //sh 24 (0x18)[$r12] = $r0;;
     _96(0x0000000080000106e0047000),        //make $r1 = 268736 (0x419c0);;
     _32(0x2800060c),        //lhz $r0 = 24 (0x18)[$r12];;
     _32(0x25010001),        //sh 0 (0x0)[$r1] = $r0;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let foo: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000027),        //goto 168fc <foo+0xb4>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x10000013),        //goto 168b8 <foo+0x70>;;
     _32(0x3808040c),        //ld $r2 = 16 (0x10)[$r12];;
     _32(0x3400060c),        //lws $r0 = 24 (0x18)[$r12];;
     _32(0x3404070c),        //lws $r1 = 28 (0x1c)[$r12];;
     _32(0x790e2040),        //slld $r3 = $r0, 1 (0x1);;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x75010001),        //sbfd $r0 = $r1, $r0;;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x75010001),        //sbfd $r0 = $r1, $r0;;
     _32(0x71010003),        //addd $r0 = $r3, $r0;;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1fffffde),        //call 16820 <dummy>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3808040c),        //ld $r2 = 16 (0x10)[$r12];;
     _32(0x3404070c),        //lws $r1 = 28 (0x1c)[$r12];;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x75010001),        //sbfd $r0 = $r1, $r0;;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x75010001),        //sbfd $r0 = $r1, $r0;;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x610001c0),        //addd $r0 = $r0, 7 (0x7);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x7201b001),        //compw.lt $r0 = $r1, $r0;;
     _32(0x0c7ff840),        //cb.wnez $r0? 16870 <foo+0x28>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x20000100),        //lbz $r0 = 4 (0x4)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x7201b001),        //compw.lt $r0 = $r1, $r0;;
     _32(0x0c7ff540),        //cb.wnez $r0? 16864 <foo+0x1c>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _64(0x07ffffffe130180c),        //addd $r12 = $r12, -928 (0xfffffffffffffc60);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x2401070c),        //sb 28 (0x1c)[$r12] = $r0;;
     _32(0x60000008),        //make $r0 = 8 (0x8);;
     _32(0x24013f8c),        //sb 254 (0xfe)[$r12] = $r0;;
     _32(0x20003f8c),        //lbz $r0 = 254 (0xfe)[$r12];;
     _32(0x240107cc),        //sb 31 (0x1f)[$r12] = $r0;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x1fffffbd),        //call 16848 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _64(0x00000000e130e80c),        //addd $r12 = $r12, 928 (0x3a0);;
     _32(0x0fd00000)        //ret ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100101000; //0x16928
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(dummy, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100001001000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100101000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
