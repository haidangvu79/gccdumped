// executing simd_6 test 
val k1_simd_6: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_simd_6() = {
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
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _96(0x07f807f8803fc03fe008c000),        //make $r2 = 18374966859414961920 (0xff00ff00ff00ff00);;
     _32(0x7b0e5200),        //srlhqs $r3 = $r0, 8 (0x8);;
     _32(0x78110081),        //andd $r4 = $r1, $r2;;
     _32(0x560c10c4),        //mulhq $r3 = $r4, $r3;;
     _32(0x56001001),        //mulhq $r0 = $r1, $r0;;
     _32(0x7e010002),        //andnd $r0 = $r2, $r0;;
     _32(0x7a010003),        //ord $r0 = $r3, $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00403830814100c0e0008040),        //make $r0 = 578437695752307201 (0x807060504030201);;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _96(0x0018181880c0c0c0e000c0c0),        //make $r0 = 217020518514230019 (0x303030303030303);;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _96(0x00c0a89083c30241e00080c0),        //make $r0 = 1735313087256921603 (0x1815120f0c090603);;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x38040c0c),        //ld $r1 = 48 (0x30)[$r12];;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x1fffffdf),        //call 16820 <foo>;;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x61040a0c),        //addd $r1 = $r12, 40 (0x28);;
     _32(0x6100080c),        //addd $r0 = $r12, 32 (0x20);;
     _32(0x60080008),        //make $r2 = 8 (0x8);;
     _32(0x18000052),        //call 16a00 <memcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 168c8 <main+0x68>;;
     _32(0x18000007),        //call 168e0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000115),        //call 16d40 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007df),        //call 18870 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100001100000; //0x16860
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100001100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100011100000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
