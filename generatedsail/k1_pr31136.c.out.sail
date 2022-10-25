// executing pr31136.c.out.dumped test 
val k1_pr31136.c.out.dumped: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pr31136.c.out.dumped() = {
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
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _32(0x28000001),        //lhz $r0 = 0 (0x0)[$r1];;
     _32(0x6008001f),        //make $r2 = 31 (0x1f);;
     _32(0x60039102),        //insf $r0 = $r2, 9 (0x9), 4 (0x4);;
     _32(0x25010001),        //sh 0 (0x0)[$r1] = $r0;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x64039100),        //extfz $r0 = $r0, 9 (0x9), 4 (0x4);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x780003c0),        //andw $r0 = $r0, 15 (0xf);;
     _32(0x78083fc0),        //zxbd $r2 = $r0;;
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _32(0x28000001),        //lhz $r0 = 0 (0x0)[$r1];;
     _32(0x60033002),        //insf $r0 = $r2, 3 (0x3), 0 (0x0);;
     _32(0x25010001),        //sh 0 (0x0)[$r1] = $r0;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x64033000),        //extfz $r0 = $r0, 3 (0x3), 0 (0x0);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x78000fc0),        //andw $r0 = $r0, 63 (0x3f);;
     _32(0x78083fc0),        //zxbd $r2 = $r0;;
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _32(0x28000001),        //lhz $r0 = 0 (0x0)[$r1];;
     _32(0x60039102),        //insf $r0 = $r2, 9 (0x9), 4 (0x4);;
     _32(0x25010001),        //sh 0 (0x0)[$r1] = $r0;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x28000000),        //lhz $r0 = 0 (0x0)[$r0];;
     _64(0x00000000f800fc00),        //andw $r0 = $r0, 1008 (0x3f0);;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _64(0x00000007f101b400),        //compw.eq $r0 = $r0, 240 (0xf0);;
     _32(0x0c000080),        //cb.wnez $r0? 168e4 <main+0xc4>;;
     _32(0x18000006),        //call 168f8 <abort>;;
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
     _32(0x980000f3),        //call 16cd0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18800 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100011111000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
