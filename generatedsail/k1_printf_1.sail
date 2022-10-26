// executing printf_1 test 
val k1_printf_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_printf_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x180000ee),        //call 16bf0 <printf>;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x180000ea),        //call 16bf0 <printf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b140),        //compw.eq $r0 = $r0, 5 (0x5);;
     _32(0x0c000080),        //cb.wnez $r0? 16860 <main+0x40>;;
     _32(0x1800008b),        //call 16a88 <abort>;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x180001db),        //call 16fd8 <puts>;;
     _96(0x00000000800000fce000f200),        //make $r0 = 259016 (0x3f3c8);;
     _32(0x180000dd),        //call 16bf0 <printf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b180),        //compw.eq $r0 = $r0, 6 (0x6);;
     _32(0x0c000080),        //cb.wnez $r0? 16894 <main+0x74>;;
     _32(0x1800007e),        //call 16a88 <abort>;;
     _32(0x60000061),        //make $r0 = 97 (0x61);;
     _32(0x180000ee),        //call 16c50 <putchar>;;
     _96(0x00000000800000fce000f400),        //make $r0 = 259024 (0x3f3d0);;
     _32(0x180000d2),        //call 16bf0 <printf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 168c0 <main+0xa0>;;
     _32(0x18000073),        //call 16a88 <abort>;;
     _96(0x00000000800000fce000f600),        //make $r0 = 259032 (0x3f3d8);;
     _32(0x180000c9),        //call 16bf0 <printf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 168dc <main+0xbc>;;
     _32(0x1800006c),        //call 16a88 <abort>;;
     _96(0x00000000800000fce004f000),        //make $r1 = 259008 (0x3f3c0);;
     _96(0x00000000800000fce000f800),        //make $r0 = 259040 (0x3f3e0);;
     _32(0x180000bf),        //call 16bf0 <printf>;;
     _96(0x00000000800000fce004f000),        //make $r1 = 259008 (0x3f3c0);;
     _96(0x00000000800000fce000f800),        //make $r0 = 259040 (0x3f3e0);;
     _32(0x180000b8),        //call 16bf0 <printf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b140),        //compw.eq $r0 = $r0, 5 (0x5);;
     _32(0x0c000080),        //cb.wnez $r0? 16928 <main+0x108>;;
     _32(0x18000059),        //call 16a88 <abort>;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x180001a9),        //call 16fd8 <puts>;;
     _96(0x00000000800000fce004f200),        //make $r1 = 259016 (0x3f3c8);;
     _96(0x00000000800000fce000f800),        //make $r0 = 259040 (0x3f3e0);;
     _32(0x180000a8),        //call 16bf0 <printf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b180),        //compw.eq $r0 = $r0, 6 (0x6);;
     _32(0x0c000080),        //cb.wnez $r0? 16968 <main+0x148>;;
     _32(0x18000049),        //call 16a88 <abort>;;
     _32(0x60000061),        //make $r0 = 97 (0x61);;
     _32(0x180000b9),        //call 16c50 <putchar>;;
     _96(0x00000000800000fce004f400),        //make $r1 = 259024 (0x3f3d0);;
     _96(0x00000000800000fce000f800),        //make $r0 = 259040 (0x3f3e0);;
     _32(0x1800009a),        //call 16bf0 <printf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 169a0 <main+0x180>;;
     _32(0x1800003b),        //call 16a88 <abort>;;
     _96(0x00000000800000fce004f600),        //make $r1 = 259032 (0x3f3d8);;
     _96(0x00000000800000fce000f800),        //make $r0 = 259040 (0x3f3e0);;
     _32(0x1800008e),        //call 16bf0 <printf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 169c8 <main+0x1a8>;;
     _32(0x18000031),        //call 16a88 <abort>;;
     _32(0x60000078),        //make $r0 = 120 (0x78);;
     _32(0x180000a1),        //call 16c50 <putchar>;;
     _32(0x60040078),        //make $r1 = 120 (0x78);;
     _96(0x00000000800000fce000fa00),        //make $r0 = 259048 (0x3f3e8);;
     _32(0x18000084),        //call 16bf0 <printf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 169f8 <main+0x1d8>;;
     _32(0x18000025),        //call 16a88 <abort>;;
     _96(0x00000000800000fce000f200),        //make $r0 = 259016 (0x3f3c8);;
     _32(0x18000175),        //call 16fd8 <puts>;;
     _96(0x00000000800000fce004f200),        //make $r1 = 259016 (0x3f3c8);;
     _96(0x00000000800000fce000fc00),        //make $r0 = 259056 (0x3f3f0);;
     _32(0x18000074),        //call 16bf0 <printf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b1c0),        //compw.eq $r0 = $r0, 7 (0x7);;
     _32(0x0c000080),        //cb.wnez $r0? 16a38 <main+0x218>;;
     _32(0x18000015),        //call 16a88 <abort>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _96(0x00000000800000fce000fe00),        //make $r0 = 259064 (0x3f3f8);;
     _32(0x1800006a),        //call 16bf0 <printf>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _96(0x00000000800000fce000fe00),        //make $r0 = 259064 (0x3f3f8);;
     _32(0x18000065),        //call 16bf0 <printf>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b080),        //compw.eq $r0 = $r0, 2 (0x2);;
     _32(0x0c000080),        //cb.wnez $r0? 16a74 <main+0x254>;;
     _32(0x18000006),        //call 16a88 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000205),        //call 172a8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98002cb5),        //call 21d70 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101010001000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
