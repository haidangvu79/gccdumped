// executing pr53688 test 
val k1_pr53688: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pr53688() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let init: list_I = 
 [|
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _96(0x027a3292805093d3e004d180),        //make $r1 = 5712343617604898630 (0x4f465241424f4f46);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x6004004f),        //make $r1 = 79 (0x4f);;
     _32(0x24050200),        //sb 8 (0x8)[$r0] = $r1;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _96(0x02aa82198010d154e00414c0),        //make $r1 = 6147487297207357523 (0x5550432043455053);;
     _32(0x27050240),        //sd 9 (0x9)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x1fffffeb),        //call 16820 <init>;;
     _96(0x0000000080000117e0002800),        //make $r0 = 285856 (0x45ca0);;
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _32(0x38080001),        //ld $r2 = 0 (0x0)[$r1];;
     _32(0x27090000),        //sd 0 (0x0)[$r0] = $r2;;
     _32(0x20040201),        //lbz $r1 = 8 (0x8)[$r1];;
     _32(0x24050200),        //sb 8 (0x8)[$r0] = $r1;;
     _32(0x60000009),        //make $r0 = 9 (0x9);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _96(0x0000000080000117e0002800),        //make $r0 = 285856 (0x45ca0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x600800f5),        //make $r2 = 245 (0xf5);;
     _32(0x60040020),        //make $r1 = 32 (0x20);;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x1800006f),        //call 16a90 <memset>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x38000240),        //ld $r0 = 9 (0x9)[$r0];;
     _96(0x0000000080000117e0042800),        //make $r1 = 285856 (0x45ca0);;
     _32(0x27010281),        //sd 10 (0xa)[$r1] = $r0;;
     _32(0x60000012),        //make $r0 = 18 (0x12);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _96(0x0000000080000117e0002800),        //make $r0 = 285856 (0x45ca0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x600800ee),        //make $r2 = 238 (0xee);;
     _32(0x60040020),        //make $r1 = 32 (0x20);;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x18000059),        //call 16a90 <memset>;;
     _96(0x0000000080000117e0002800),        //make $r0 = 285856 (0x45ca0);;
     _32(0x20000280),        //lbz $r0 = 10 (0xa)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000002f101b4c0),        //compw.eq $r0 = $r0, 83 (0x53);;
     _32(0x0c000080),        //cb.wnez $r0? 16954 <main+0xec>;;
     _32(0x18000006),        //call 16968 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000169),        //call 16f18 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000833),        //call 18a48 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100001101000; //0x16868
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(init, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100001101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100101101000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
