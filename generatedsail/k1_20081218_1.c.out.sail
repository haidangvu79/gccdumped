// executing 20081218_1.c.out.dumped test 
val k1_20081218_1.: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20081218_1.() = {
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
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60080208),        //make $r2 = 520 (0x208);;
     _32(0x60040026),        //make $r1 = 38 (0x26);;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x180000b4),        //call 16b10 <memset>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let bar: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60080208),        //make $r2 = 520 (0x208);;
     _32(0x60040036),        //make $r1 = 54 (0x36);;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x180000a2),        //call 16b10 <memset>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _64(0x000d8d8de0048d80),        //make $r1 = 909522486 (0x36363636);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _64(0x000d8dcde0048d80),        //make $r1 = 909588022 (0x36373636);;
     _32(0x26050100),        //sw 4 (0x4)[$r0] = $r1;;
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
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x1fffffd1),        //call 16820 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x01313131f101b180),        //compw.eq $r0 = $r0, 640034342 (0x26262626);;
     _32(0x0c000080),        //cb.wnez $r0? 168f4 <main+0x24>;;
     _32(0x1800003e),        //call 169e8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000000e),        //goto 16934 <main+0x64>;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _96(0x0000000080000117e1002200),        //addd $r0 = $r0, 285832 (0x45c88);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000001f101b180),        //compw.eq $r0 = $r0, 38 (0x26);;
     _32(0x0c000080),        //cb.wnez $r0? 16928 <main+0x58>;;
     _32(0x18000031),        //call 169e8 <abort>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000010f801b1c0),        //compw.leu $r0 = $r0, 519 (0x207);;
     _32(0x0c7ffc00),        //cb.wnez $r0? 16900 <main+0x30>;;
     _32(0x1fffffc9),        //call 16868 <bar>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _64(0x01b1b9b1f101b580),        //compw.eq $r0 = $r0, 909588022 (0x36373636);;
     _32(0x0c000080),        //cb.wnez $r0? 16968 <main+0x98>;;
     _32(0x18000021),        //call 169e8 <abort>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _64(0x000d8d8de0048d80),        //make $r1 = 909522486 (0x36363636);;
     _32(0x26050100),        //sw 4 (0x4)[$r0] = $r1;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000000e),        //goto 169c0 <main+0xf0>;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _96(0x0000000080000117e1002200),        //addd $r0 = $r0, 285832 (0x45c88);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000001f101b580),        //compw.eq $r0 = $r0, 54 (0x36);;
     _32(0x0c000080),        //cb.wnez $r0? 169b4 <main+0xe4>;;
     _32(0x1800000e),        //call 169e8 <abort>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000010f801b1c0),        //compw.leu $r0 = $r0, 519 (0x207);;
     _32(0x0c7ffc00),        //cb.wnez $r0? 1698c <main+0xbc>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
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
     _32(0x98000169),        //call 16f98 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000833),        //call 18ac8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100011010000; //0x168d0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100001101000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100011010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100111101000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
