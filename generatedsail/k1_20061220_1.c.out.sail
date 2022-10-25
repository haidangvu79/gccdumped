// executing 20061220_1.c.out.dumped test 
val k1_20061220_1.: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20061220_1.() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let nested_2127: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x600000fe),        //make $r0 = 254 (0xfe);;
     _32(0x26010001),        //sw 0 (0x0)[$r1] = $r0;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let foo: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x1fffffed),        //call 16820 <nested.2127>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let nested_2134: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _32(0x71040101),        //addw $r1 = $r1, 4 (0x4);;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let bar: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x1fffffe7),        //call 168a0 <nested.2134>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let nested2_2144: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x30040001),        //lwz $r1 = 0 (0x0)[$r1];;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x30040001),        //lwz $r1 = 0 (0x0)[$r1];;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x30040001),        //lwz $r1 = 0 (0x0)[$r1];;
     _32(0x71040101),        //addw $r1 = $r1, 4 (0x4);;
     _32(0x7808ffc1),        //zxwd $r2 = $r1;;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x26090001),        //sw 0 (0x0)[$r1] = $r2;;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x30040001),        //lwz $r1 = 0 (0x0)[$r1];;
     _32(0x38080000),        //ld $r2 = 0 (0x0)[$r0];;
     _32(0x7804ffc1),        //zxwd $r1 = $r1;;
     _32(0x26050002),        //sw 0 (0x0)[$r2] = $r1;;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let nested_2141: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x2701020c),        //sd 8 (0x8)[$r12] = $r0;;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x1fffffdb),        //call 16920 <nested2.2144>;;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x1fffffd8),        //call 16920 <nested2.2144>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let baz: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x6100100c),        //addd $r0 = $r12, 64 (0x40);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x1fffffe3),        //call 16988 <nested.2141>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1fffff89),        //call 16848 <foo>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000007f001b780),        //compw.ne $r0 = $r0, 254 (0xfe);;
     _32(0x0c0002c0),        //cb.wnez $r0? 16a60 <main+0x48>;;
     _32(0x1fffffaa),        //call 168e0 <bar>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f001b100),        //compw.ne $r0 = $r0, 4 (0x4);;
     _32(0x0c000180),        //cb.wnez $r0? 16a60 <main+0x48>;;
     _32(0x1fffffe3),        //call 169d8 <baz>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b200),        //compw.eq $r0 = $r0, 8 (0x8);;
     _32(0x0c000080),        //cb.wnez $r0? 16a64 <main+0x4c>;;
     _32(0x18000006),        //call 16a78 <abort>;;
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
     _32(0x980000f3),        //call 16e50 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18980 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101000011000; //0x16a18
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(nested_2127, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100001001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(nested_2134, 0b00010110100010100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100011100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(nested2_2144, 0b00010110100100100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(nested_2141, 0b00010110100110001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(baz, 0b00010110100111011000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101000011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101001111000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
