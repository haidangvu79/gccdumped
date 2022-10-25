// executing 20131127_1.c.out.dumped test 
val k1_20131127_1.: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20131127_1.() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let fn1: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x27050c0c),        //sd 48 (0x30)[$r12] = $r1;;
     _32(0x30040200),        //lwz $r1 = 8 (0x8)[$r0];;
     _32(0x26050e0c),        //sw 56 (0x38)[$r12] = $r1;;
     _32(0x28000300),        //lhz $r0 = 12 (0xc)[$r0];;
     _32(0x25010f0c),        //sh 60 (0x3c)[$r12] = $r0;;
     _32(0x38080c0c),        //ld $r2 = 48 (0x30)[$r12];;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x6607f000),        //extfz $r1 = $r0, 47 (0x2f), 0 (0x0);;
     _32(0x6a000002),        //copyd $r0 = $r2;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let fn2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1fffffed),        //call 16820 <fn1>;;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _96(0x00000000800000f8e0000400),        //make $r0 = 253968 (0x3e010);;
     _32(0x27090000),        //sd 0 (0x0)[$r0] = $r2;;
     _64(0x003fffffe808ffc1),        //andd $r2 = $r1, 4294967295 (0xffffffff);;
     _32(0x300c0200),        //lwz $r3 = 8 (0x8)[$r0];;
     _32(0x780c0003),        //andw $r3 = $r3, 0 (0x0);;
     _32(0x7a091083),        //orw $r2 = $r3, $r2;;
     _32(0x26090200),        //sw 8 (0x8)[$r0] = $r2;;
     _32(0x7b062801),        //srld $r1 = $r1, 32 (0x20);;
     _64(0x0000003fe80cffc1),        //andd $r3 = $r1, 65535 (0xffff);;
     _32(0x28040300),        //lhz $r1 = 12 (0xc)[$r0];;
     _32(0x78040001),        //andw $r1 = $r1, 0 (0x0);;
     _32(0x7a080001),        //copyw $r2 = $r1;;
     _32(0x7a040003),        //copyw $r1 = $r3;;
     _32(0x7a051042),        //orw $r1 = $r2, $r1;;
     _32(0x25050300),        //sh 12 (0xc)[$r0] = $r1;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x25050000),        //sh 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _96(0x0000000080000117e0042a00),        //make $r1 = 285864 (0x45ca8);;
     _32(0x38080001),        //ld $r2 = 0 (0x0)[$r1];;
     _32(0x27090000),        //sd 0 (0x0)[$r0] = $r2;;
     _32(0x30080201),        //lwz $r2 = 8 (0x8)[$r1];;
     _32(0x26090200),        //sw 8 (0x8)[$r0] = $r2;;
     _32(0x28040301),        //lhz $r1 = 12 (0xc)[$r1];;
     _32(0x25050300),        //sh 12 (0xc)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1fffffcf),        //call 16860 <fn2>;;
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _32(0x08800080),        //cb.deqz $r0? 16940 <main+0x28>;;
     _32(0x18000007),        //call 16958 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16d30 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18860 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100011000; //0x16918
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fn1, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fn2, 0b00010110100001100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100101011000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
