// executing pr20621_1.c.out.dumped test 
val k1_pr20621_1.: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pr20621_1.() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x6a380000),        //copyd $r14 = $r0;;
     _32(0x2605060c),        //sw 24 (0x18)[$r12] = $r1;;
     _32(0x3400060c),        //lws $r0 = 24 (0x18)[$r12];;
     _32(0x3002f00e),        //lwz.xs $r0 = $r0[$r14];;
     _32(0x3838040c),        //ld $r14 = 16 (0x10)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _64(0x07ffffbfe130f80c),        //addd $r12 = $r12, -65568 (0xfffffffffffeffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _96(0x0000000080000117e0042600),        //make $r1 = 285848 (0x45c98);;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x6a0c0001),        //copyd $r3 = $r1;;
     _64(0x00000040e0040000),        //make $r1 = 65536 (0x10000);;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _32(0x6a040003),        //copyd $r1 = $r3;;
     _32(0x1800005c),        //call 169f0 <memcpy>;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x1fffffe5),        //call 16820 <foo>;;
     _32(0x7838ffc0),        //zxwd $r14 = $r0;;
     _96(0x0000000080000117e0042600),        //make $r1 = 285848 (0x45c98);;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x6a0c0001),        //copyd $r3 = $r1;;
     _64(0x00000040e0040000),        //make $r1 = 65536 (0x10000);;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _32(0x6a040003),        //copyd $r1 = $r3;;
     _32(0x1800004e),        //call 169f0 <memcpy>;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x1fffffd7),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7101100e),        //addw $r0 = $r14, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838040c),        //ld $r14 = 16 (0x10)[$r12];;
     _64(0x00000040e130080c),        //addd $r12 = $r12, 65568 (0x10020);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100001001000; //0x16848
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100001001000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
