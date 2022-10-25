// executing pr34971.c.out.dumped test 
val k1_pr34971.c.out.dumped: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pr34971.c.out.dumped() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let test1: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x66037000),        //extfz $r0 = $r0, 39 (0x27), 0 (0x0);;
     _32(0x79022200),        //slld $r0 = $r0, 8 (0x8);;
     _96(0x0000000787ffffffe800ffc0),        //andd $r0 = $r0, 1099511627775 (0xffffffffff);;
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _32(0x38040001),        //ld $r1 = 0 (0x0)[$r1];;
     _32(0x66077001),        //extfz $r1 = $r1, 39 (0x27), 0 (0x0);;
     _32(0x7b062801),        //srld $r1 = $r1, 32 (0x20);;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _96(0x0000000787ffffffe800ffc0),        //andd $r0 = $r0, 1099511627775 (0xffffffffff);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16890 <test1+0x70>;;
     _32(0x18000023),        //call 16918 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _32(0x38000001),        //ld $r0 = 0 (0x0)[$r1];;
     _64(0x00400000e0080040),        //make $r2 = 4294967297 (0x100000001);;
     _32(0x62037002),        //insf $r0 = $r2, 39 (0x27), 0 (0x0);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _32(0x60000101),        //make $r0 = 257 (0x101);;
     _32(0x1fffffd2),        //call 16820 <test1>;;
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _32(0x38000001),        //ld $r0 = 0 (0x0)[$r1];;
     _64(0x00400000e0080000),        //make $r2 = 4294967296 (0x100000000);;
     _32(0x62037002),        //insf $r0 = $r2, 39 (0x27), 0 (0x0);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffffc8),        //call 16820 <test1>;;
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
     _32(0x980000f3),        //call 16cf0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18820 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100010101000; //0x168a8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test1, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100100011000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
