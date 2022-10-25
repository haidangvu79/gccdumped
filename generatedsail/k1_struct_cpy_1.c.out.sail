// executing struct_cpy_1.c.out.dumped test 
val k1_struct_cpy_1.: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_struct_cpy_1.() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let ini: list_I = 
 [|
     _96(0x0000000080000106e0007c00),        //make $r0 = 268784 (0x419f0);;
     _96(0x0000000080000106e0047000),        //make $r1 = 268736 (0x419c0);;
     _32(0x38080001),        //ld $r2 = 0 (0x0)[$r1];;
     _32(0x27090a00),        //sd 40 (0x28)[$r0] = $r2;;
     _32(0x38080201),        //ld $r2 = 8 (0x8)[$r1];;
     _32(0x27090c00),        //sd 48 (0x30)[$r0] = $r2;;
     _32(0x38080401),        //ld $r2 = 16 (0x10)[$r1];;
     _32(0x27090e00),        //sd 56 (0x38)[$r0] = $r2;;
     _32(0x38080601),        //ld $r2 = 24 (0x18)[$r1];;
     _32(0x27091000),        //sd 64 (0x40)[$r0] = $r2;;
     _32(0x38080801),        //ld $r2 = 32 (0x20)[$r1];;
     _32(0x27091200),        //sd 72 (0x48)[$r0] = $r2;;
     _32(0x30040a01),        //lwz $r1 = 40 (0x28)[$r1];;
     _32(0x26051400),        //sw 80 (0x50)[$r0] = $r1;;
     _96(0x0000000080000106e0007c00),        //make $r0 = 268784 (0x419f0);;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x26050a00),        //sw 40 (0x28)[$r0] = $r1;;
     _96(0x0000000080000106e0007c00),        //make $r0 = 268784 (0x419f0);;
     _32(0x60040002),        //make $r1 = 2 (0x2);;
     _32(0x26050b00),        //sw 44 (0x2c)[$r0] = $r1;;
     _96(0x0000000080000106e0007c00),        //make $r0 = 268784 (0x419f0);;
     _32(0x60040003),        //make $r1 = 3 (0x3);;
     _32(0x26050c00),        //sw 48 (0x30)[$r0] = $r1;;
     _96(0x0000000080000106e0007c00),        //make $r0 = 268784 (0x419f0);;
     _32(0x60040004),        //make $r1 = 4 (0x4);;
     _32(0x26050d00),        //sw 52 (0x34)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1fffffd5),        //call 16820 <ini>;;
     _96(0x0000000080000106e0007c00),        //make $r0 = 268784 (0x419f0);;
     _32(0x30000a00),        //lwz $r0 = 40 (0x28)[$r0];;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c000580),        //cb.wnez $r0? 16940 <main+0x80>;;
     _96(0x0000000080000106e0007c00),        //make $r0 = 268784 (0x419f0);;
     _32(0x30000b00),        //lwz $r0 = 44 (0x2c)[$r0];;
     _64(0x00000000f001b080),        //compw.ne $r0 = $r0, 2 (0x2);;
     _32(0x0c0003c0),        //cb.wnez $r0? 16940 <main+0x80>;;
     _96(0x0000000080000106e0007c00),        //make $r0 = 268784 (0x419f0);;
     _32(0x30000c00),        //lwz $r0 = 48 (0x30)[$r0];;
     _64(0x00000000f001b0c0),        //compw.ne $r0 = $r0, 3 (0x3);;
     _32(0x0c000200),        //cb.wnez $r0? 16940 <main+0x80>;;
     _96(0x0000000080000106e0007c00),        //make $r0 = 268784 (0x419f0);;
     _32(0x30000d00),        //lwz $r0 = 52 (0x34)[$r0];;
     _64(0x00000000f101b100),        //compw.eq $r0 = $r0, 4 (0x4);;
     _32(0x0c000080),        //cb.wnez $r0? 16944 <main+0x84>;;
     _32(0x18000006),        //call 16958 <abort>;;
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
     _32(0x980000f3),        //call 16d30 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18860 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100011000000; //0x168c0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(ini, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100011000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100101011000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
