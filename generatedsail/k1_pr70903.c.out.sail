// executing pr70903.c.out.dumped test 
val k1_pr70903.c.out.dumped: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pr70903.c.out.dumped() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x2805000c),        //so 0 (0x0)[$r12] = $r0r1r2r3;;
     _32(0x3810000c),        //ld $r4 = 0 (0x0)[$r12];;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _64(0x0000003fe014ffc0),        //make $r5 = 65535 (0xffff);;
     _32(0x6a000005),        //copyd $r0 = $r5;;
     _32(0x6a040004),        //copyd $r1 = $r4;;
     _32(0x2805080c),        //so 32 (0x20)[$r12] = $r0r1r2r3;;
     _32(0x2010084c),        //lbz $r4 = 33 (0x21)[$r12];;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0x60037004),        //insf $r0 = $r4, 7 (0x7), 0 (0x0);;
     _32(0x2805100c),        //so 64 (0x40)[$r12] = $r0r1r2r3;;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x7810ffc0),        //zxwd $r4 = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0x6103f004),        //insf $r0 = $r4, 31 (0x1f), 0 (0x0);;
     _32(0x601000ff),        //make $r4 = 255 (0xff);;
     _32(0x6303f804),        //insf $r0 = $r4, 63 (0x3f), 32 (0x20);;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0x1fffffdb),        //call 16820 <foo>;;
     _32(0x2805080c),        //so 32 (0x20)[$r12] = $r0r1r2r3;;
     _32(0x3000090c),        //lwz $r0 = 36 (0x24)[$r12];;
     _64(0x00000007f101b7c0),        //compw.eq $r0 = $r0, 255 (0xff);;
     _32(0x0c000080),        //cb.wnez $r0? 168d0 <main+0x38>;;
     _32(0x18000007),        //call 168e8 <abort>;;
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
     _32(0x980000f3),        //call 16cc0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 187f0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100010011000; //0x16898
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100011101000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
