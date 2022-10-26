// executing pr82388 test 
val k1_pr82388: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pr82388() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo: list_I = 
 [|
     _32(0x6130900c),        //addd $r12 = $r12, -448 (0xfffffe40);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x6100120c),        //addd $r0 = $r12, 72 (0x48);;
     _32(0x60040168),        //make $r1 = 360 (0x168);;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x18000061),        //call 169c0 <memset>;;
     _32(0x3800690c),        //ld $r0 = 420 (0x1a4)[$r12];;
     _32(0x27016c0c),        //sd 432 (0x1b0)[$r12] = $r0;;
     _32(0x30006b0c),        //lwz $r0 = 428 (0x1ac)[$r12];;
     _32(0x26016e0c),        //sw 440 (0x1b8)[$r12] = $r0;;
     _32(0x38006c0c),        //ld $r0 = 432 (0x1b0)[$r12];;
     _32(0x30046e0c),        //lwz $r1 = 440 (0x1b8)[$r12];;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130700c),        //addd $r12 = $r12, 448 (0x1c0);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1fffffeb),        //call 16820 <foo>;;
     _32(0x6a0c0000),        //copyd $r3 = $r0;;
     _32(0x6a080001),        //copyd $r2 = $r1;;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _32(0x270d0000),        //sd 0 (0x0)[$r0] = $r3;;
     _32(0x30040200),        //lwz $r1 = 8 (0x8)[$r0];;
     _32(0x6107f002),        //insf $r1 = $r2, 31 (0x1f), 0 (0x0);;
     _32(0x26050200),        //sw 8 (0x8)[$r0] = $r1;;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100001101000; //0x16868
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100001101000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
