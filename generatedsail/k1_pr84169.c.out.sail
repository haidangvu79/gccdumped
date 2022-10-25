// executing pr84169.c.out.dumped test 
val k1_pr84169.: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pr84169.() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo: list_I = 
 [|
     _32(0x6130d80c),        //addd $r12 = $r12, -160 (0xffffff60);;
     _32(0x2739060c),        //sd 24 (0x18)[$r12] = $r14;;
     _32(0x2849080c),        //sq 32 (0x20)[$r12] = $r18r19;;
     _32(0x28510c0c),        //sq 48 (0x30)[$r12] = $r20r21;;
     _32(0x2801240c),        //sq 144 (0x90)[$r12] = $r0r1;;
     _32(0x2809200c),        //sq 128 (0x80)[$r12] = $r2r3;;
     _32(0x28111c0c),        //sq 112 (0x70)[$r12] = $r4r5;;
     _32(0x2819180c),        //sq 96 (0x60)[$r12] = $r6r7;;
     _32(0x2821140c),        //sq 80 (0x50)[$r12] = $r8r9;;
     _32(0x2829100c),        //sq 64 (0x40)[$r12] = $r10r11;;
     _32(0x3c00100c),        //lq $r0r1 = 64 (0x40)[$r12];;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x6a400000),        //copyd $r16 = $r0;;
     _32(0x7a022fc0),        //srad $r0 = $r0, 63 (0x3f);;
     _32(0x6a440000),        //copyd $r17 = $r0;;
     _32(0x7b022f10),        //srld $r0 = $r16, 60 (0x3c);;
     _32(0x793e2111),        //slld $r15 = $r17, 4 (0x4);;
     _32(0x7a3d03c0),        //ord $r15 = $r0, $r15;;
     _32(0x793a2110),        //slld $r14 = $r16, 4 (0x4);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x7f51d00e),        //sbfcd.i $r20 = $r14, $r0;;
     _32(0x7f55c04f),        //sbfcd $r21 = $r15, $r1;;
     _32(0x6a000014),        //copyd $r0 = $r20;;
     _32(0x6a040015),        //copyd $r1 = $r21;;
     _32(0x2801100c),        //sq 64 (0x40)[$r12] = $r0r1;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x3c000000),        //lq $r0r1 = 0 (0x0)[$r0];;
     _32(0x3c08100c),        //lq $r2r3 = 64 (0x40)[$r12];;
     _32(0x7e49d080),        //addcd.i $r18 = $r0, $r2;;
     _32(0x7e4dc0c1),        //addcd $r19 = $r1, $r3;;
     _32(0x6a000012),        //copyd $r0 = $r18;;
     _32(0x6a040013),        //copyd $r1 = $r19;;
     _32(0x3838060c),        //ld $r14 = 24 (0x18)[$r12];;
     _32(0x3c48080c),        //lq $r18r19 = 32 (0x20)[$r12];;
     _32(0x3c500c0c),        //lq $r20r21 = 48 (0x30)[$r12];;
     _32(0x6130280c),        //addd $r12 = $r12, 160 (0xa0);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x60280004),        //make $r10 = 4 (0x4);;
     _32(0x602c0000),        //make $r11 = 0 (0x0);;
     _32(0x60200000),        //make $r8 = 0 (0x0);;
     _32(0x60240000),        //make $r9 = 0 (0x0);;
     _32(0x60180000),        //make $r6 = 0 (0x0);;
     _32(0x601c0000),        //make $r7 = 0 (0x0);;
     _32(0x60100000),        //make $r4 = 0 (0x0);;
     _32(0x60140000),        //make $r5 = 0 (0x0);;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x600c0000),        //make $r3 = 0 (0x0);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x1fffffc7),        //call 16820 <foo>;;
     _32(0x2801040c),        //sq 16 (0x10)[$r12] = $r0r1;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x6001f000),        //compd.ne $r0 = $r0, -64 (0xffffffc0);;
     _32(0x08000100),        //cb.dnez $r0? 16924 <main+0x5c>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x6001ffc0),        //compd.ne $r0 = $r0, -1 (0xffffffff);;
     _32(0x08800080),        //cb.deqz $r0? 16928 <main+0x60>;;
     _32(0x18000007),        //call 16940 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
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
     _32(0x980000f3),        //call 16d18 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18848 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100011001000; //0x168c8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100011001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100101000000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
