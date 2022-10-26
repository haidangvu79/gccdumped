// executing pr43236 test 
val k1_pr43236: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pr43236() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let main: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x6100160c),        //addd $r0 = $r12, 88 (0x58);;
     _32(0x6008001e),        //make $r2 = 30 (0x1e);;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x1800009e),        //call 16ab0 <memset>;;
     _32(0x61000e0c),        //addd $r0 = $r12, 56 (0x38);;
     _32(0x6008001e),        //make $r2 = 30 (0x1e);;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x1800009a),        //call 16ab0 <memset>;;
     _32(0x60000014),        //make $r0 = 20 (0x14);;
     _32(0x26011f0c),        //sw 124 (0x7c)[$r12] = $r0;;
     _32(0x1000000b),        //goto 16880 <main+0x60>;;
     _32(0x34001f0c),        //lws $r0 = 124 (0x7c)[$r12];;
     _32(0x6104200c),        //addd $r1 = $r12, 128 (0x80);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x2405f600),        //sb -40 (0xffffffd8)[$r0] = $r1;;
     _32(0x34001f0c),        //lws $r0 = 124 (0x7c)[$r12];;
     _32(0x6104200c),        //addd $r1 = $r12, 128 (0x80);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x2405ee00),        //sb -72 (0xffffffb8)[$r0] = $r1;;
     _32(0x30001f0c),        //lwz $r0 = 124 (0x7c)[$r12];;
     _32(0x7104ffc0),        //addw $r1 = $r0, -1 (0xffffffff);;
     _32(0x26051f0c),        //sw 124 (0x7c)[$r12] = $r1;;
     _64(0x00000000f501b280),        //compw.gt $r0 = $r0, 10 (0xa);;
     _32(0x0c7ffc40),        //cb.wnez $r0? 16858 <main+0x38>;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x6008001e),        //make $r2 = 30 (0x1e);;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x18000083),        //call 16ab0 <memset>;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x61000280),        //addd $r0 = $r0, 10 (0xa);;
     _32(0x6008000a),        //make $r2 = 10 (0xa);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x1800007e),        //call 16ab0 <memset>;;
     _32(0x6104060c),        //addd $r1 = $r12, 24 (0x18);;
     _32(0x6100160c),        //addd $r0 = $r12, 88 (0x58);;
     _32(0x6008001e),        //make $r2 = 30 (0x1e);;
     _32(0x18000058),        //call 16a28 <memcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x080001c0),        //cb.dnez $r0? 168ec <main+0xcc>;;
     _32(0x6104060c),        //addd $r1 = $r12, 24 (0x18);;
     _32(0x61000e0c),        //addd $r0 = $r12, 56 (0x38);;
     _32(0x6008001e),        //make $r2 = 30 (0x1e);;
     _32(0x18000052),        //call 16a28 <memcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 168f0 <main+0xd0>;;
     _32(0x18000007),        //call 16908 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130200c),        //addd $r12 = $r12, 128 (0x80);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000189),        //call 16f38 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000853),        //call 18a68 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100100001000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
