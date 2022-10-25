// executing 990628_1.c.out.dumped test 
val k1_990628_1.: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_990628_1.() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let num_records: list_I = 
 [|
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x0fd00000)        //ret ;;
 |];

let fetch: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60080194),        //make $r2 = 404 (0x194);;
     _32(0x60040055),        //make $r1 = 85 (0x55);;
     _96(0x0000000080000117e0003200),        //make $r0 = 285896 (0x45cc8);;
     _32(0x180003a6),        //call 176e0 <memset>;;
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000106e0007000),        //make $r0 = 268736 (0x419c0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000000f401b040),        //compw.le $r0 = $r0, 1 (0x1);;
     _32(0x0c0000c0),        //cb.wnez $r0? 16898 <fetch+0x70>;;
     _32(0x60040064),        //make $r1 = 100 (0x64);;
     _32(0x10000002),        //goto 1689c <fetch+0x74>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _96(0x0000000080000117e0009a00),        //make $r0 = 286312 (0x45e68);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let load_data: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x1fffffd5),        //call 16820 <num_records>;;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x3400050c),        //lws $r0 = 20 (0x14)[$r12];;
     _32(0x44006500),        //muld $r0 = $r0, 404 (0x194);;
     _32(0x18000099),        //call 16b40 <malloc>;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x0000000080000117e0009800),        //make $r0 = 286304 (0x45e60);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0009800),        //make $r0 = 286304 (0x45e60);;
     _32(0x380c0000),        //ld $r3 = 0 (0x0)[$r0];;
     _32(0x3400050c),        //lws $r0 = 20 (0x14)[$r12];;
     _32(0x44006500),        //muld $r0 = $r0, 404 (0x194);;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x600400aa),        //make $r1 = 170 (0xaa);;
     _32(0x6a000003),        //copyd $r0 = $r3;;
     _32(0x18000372),        //call 176e0 <memset>;;
     _32(0x1fffffc3),        //call 16828 <fetch>;;
     _96(0x0000000080000117e0009800),        //make $r0 = 286304 (0x45e60);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x1000000d),        //goto 16968 <load_data+0xa8>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61046500),        //addd $r1 = $r0, 404 (0x194);;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _96(0x0000000080000117e0043200),        //make $r1 = 285896 (0x45cc8);;
     _32(0x6a0c0000),        //copyd $r3 = $r0;;
     _32(0x60000194),        //make $r0 = 404 (0x194);;
     _32(0x6a080000),        //copyd $r2 = $r0;;
     _32(0x6a000003),        //copyd $r0 = $r3;;
     _32(0x180002ec),        //call 17510 <memcpy>;;
     _32(0x1fffffb1),        //call 16828 <fetch>;;
     _96(0x0000000080000117e0009a00),        //make $r0 = 286312 (0x45e68);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x08fffc00),        //cb.deqz $r0? 16938 <load_data+0x78>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1fffffc7),        //call 168c0 <load_data>;;
     _96(0x0000000080000117e0009800),        //make $r0 = 286304 (0x45e60);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x02aaaaaaf101b540),        //compw.eq $r0 = $r0, 1431655765 (0x55555555);;
     _32(0x0c000080),        //cb.wnez $r0? 169cc <main+0x34>;;
     _32(0x18000004),        //call 169d8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 169f8 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000487),        //call 17c00 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x9800092f),        //call 18ea8 <_exit>
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
     _32(0x980004e3),        //call 17d98 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16a34 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x9800091d),        //call 18ea8 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100110011000; //0x16998
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(num_records, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(fetch, 0b00010110100000101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(load_data, 0b00010110100011000000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100110011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100111011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit, 0b00010110100111111000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
