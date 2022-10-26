// executing shiftdi test 
val k1_shiftdi: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_shiftdi() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let g: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2605060c),        //sw 24 (0x18)[$r12] = $r1;;
     _32(0x2609020c),        //sw 8 (0x8)[$r12] = $r2;;
     _32(0x270d000c),        //sd 0 (0x0)[$r12] = $r3;;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7b026001),        //srld $r0 = $r1, $r0;;
     _64(0x003fffffe804ffc0),        //andd $r1 = $r0, 4294967295 (0xffffffff);;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x780007c0),        //andw $r0 = $r0, 31 (0x1f);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x79026001),        //slld $r0 = $r1, $r0;;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3800000c),        //ld $r0 = 0 (0x0)[$r12];;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x3008070c),        //lwz $r2 = 28 (0x1c)[$r12];;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x79026002),        //slld $r0 = $r2, $r0;;
     _32(0x7a050001),        //ord $r1 = $r1, $r0;;
     _32(0x3800000c),        //ld $r0 = 0 (0x0)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x6100060c),        //addd $r0 = $r12, 24 (0x18);;
     _32(0x6a0c0000),        //copyd $r3 = $r0;;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _96(0x06f56df783c048d1e00059c0),        //make $r0 = 16045690981116495207 (0xdeadbeef01234567);;
     _32(0x1fffffda),        //call 16820 <g>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x000048d1e00159c0),        //compd.ne $r0 = $r0, 19088743 (0x1234567);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100010001000; //0x16888
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(g, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100010001000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
