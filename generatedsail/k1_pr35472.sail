// executing pr35472 test 
val k1_pr35472: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pr35472() = {
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
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6004ffff),        //make $r1 = -1 (0xffffffff);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let test: list_I = 
 [|
     _32(0x6130d80c),        //addd $r12 = $r12, -160 (0xffffff60);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x6100180c),        //addd $r0 = $r12, 96 (0x60);;
     _32(0x60080040),        //make $r2 = 64 (0x40);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x1800008c),        //call 16aa0 <memset>;;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x60080040),        //make $r2 = 64 (0x40);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x18000088),        //call 16aa0 <memset>;;
     _32(0x6104080c),        //addd $r1 = $r12, 32 (0x20);;
     _32(0x6100180c),        //addd $r0 = $r12, 96 (0x60);;
     _32(0x1fffffe5),        //call 16820 <foo>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x3804180c),        //ld $r1 = 96 (0x60)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x38041a0c),        //ld $r1 = 104 (0x68)[$r12];;
     _32(0x27050200),        //sd 8 (0x8)[$r0] = $r1;;
     _32(0x38041c0c),        //ld $r1 = 112 (0x70)[$r12];;
     _32(0x27050400),        //sd 16 (0x10)[$r0] = $r1;;
     _32(0x38041e0c),        //ld $r1 = 120 (0x78)[$r12];;
     _32(0x27050600),        //sd 24 (0x18)[$r0] = $r1;;
     _32(0x3804200c),        //ld $r1 = 128 (0x80)[$r12];;
     _32(0x27050800),        //sd 32 (0x20)[$r0] = $r1;;
     _32(0x3804220c),        //ld $r1 = 136 (0x88)[$r12];;
     _32(0x27050a00),        //sd 40 (0x28)[$r0] = $r1;;
     _32(0x3804240c),        //ld $r1 = 144 (0x90)[$r12];;
     _32(0x27050c00),        //sd 48 (0x30)[$r0] = $r1;;
     _32(0x3804260c),        //ld $r1 = 152 (0x98)[$r12];;
     _32(0x27050e00),        //sd 56 (0x38)[$r0] = $r1;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x38040a0c),        //ld $r1 = 40 (0x28)[$r12];;
     _32(0x27050200),        //sd 8 (0x8)[$r0] = $r1;;
     _32(0x38040c0c),        //ld $r1 = 48 (0x30)[$r12];;
     _32(0x27050400),        //sd 16 (0x10)[$r0] = $r1;;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x27050600),        //sd 24 (0x18)[$r0] = $r1;;
     _32(0x3804100c),        //ld $r1 = 64 (0x40)[$r12];;
     _32(0x27050800),        //sd 32 (0x20)[$r0] = $r1;;
     _32(0x3804120c),        //ld $r1 = 72 (0x48)[$r12];;
     _32(0x27050a00),        //sd 40 (0x28)[$r0] = $r1;;
     _32(0x3804140c),        //ld $r1 = 80 (0x50)[$r12];;
     _32(0x27050c00),        //sd 48 (0x30)[$r0] = $r1;;
     _32(0x3804160c),        //ld $r1 = 88 (0x58)[$r12];;
     _32(0x27050e00),        //sd 56 (0x38)[$r0] = $r1;;
     _32(0x3000080c),        //lwz $r0 = 32 (0x20)[$r12];;
     _64(0x07fffffff101b7c0),        //compw.eq $r0 = $r0, 4294967295 (0xffffffff);;
     _32(0x0c000080),        //cb.wnez $r0? 16944 <test+0xec>;;
     _32(0x18000010),        //call 16980 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130280c),        //addd $r12 = $r12, 160 (0xa0);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1fffffbd),        //call 16858 <test>;;
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
     _32(0x98000167),        //call 16f28 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000831),        //call 18a58 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100101011000; //0x16958
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test, 0b00010110100001011000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100101011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100110000000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
