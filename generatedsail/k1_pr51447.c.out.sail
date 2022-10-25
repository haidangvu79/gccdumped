// executing pr51447.c.out.dumped test 
val k1_pr51447.: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pr51447.() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let bar_2128: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2739000c),        //sd 0 (0x0)[$r12] = $r14;;
     _32(0x6138000c),        //addd $r14 = $r12, 0 (0x0);;
     _32(0x2701060e),        //sd 24 (0x18)[$r14] = $r0;;
     _32(0x3800080e),        //ld $r0 = 32 (0x20)[$r14];;
     _32(0x3804080e),        //ld $r1 = 32 (0x20)[$r14];;
     _32(0x2705040e),        //sd 16 (0x10)[$r14] = $r1;;
     _96(0x0000000080000117e0082200),        //make $r2 = 285832 (0x45c88);;
     _32(0x3804060e),        //ld $r1 = 24 (0x18)[$r14];;
     _32(0x27050002),        //sd 0 (0x0)[$r2] = $r1;;
     _96(0x000000008000005ae0083300),        //make $r2 = 92364 (0x168cc);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x38300200),        //ld $r12 = 8 (0x8)[$r0];;
     _32(0x6a380001),        //copyd $r14 = $r1;;
     _32(0x0fd80002),        //igoto $r2;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130d00c),        //addd $r12 = $r12, -192 (0xffffff40);;
     _32(0x2739000c),        //sd 0 (0x0)[$r12] = $r14;;
     _32(0x2849020c),        //sq 8 (0x8)[$r12] = $r18r19;;
     _32(0x2855060c),        //so 24 (0x18)[$r12] = $r20r21r22r23;;
     _32(0x28650e0c),        //so 56 (0x38)[$r12] = $r24r25r26r27;;
     _32(0x2875160c),        //so 88 (0x58)[$r12] = $r28r29r30r31;;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x27411e0c),        //sd 120 (0x78)[$r12] = $r16;;
     _32(0x6100280c),        //addd $r0 = $r12, 160 (0xa0);;
     _32(0x2701200c),        //sd 128 (0x80)[$r12] = $r0;;
     _32(0x2731220c),        //sd 136 (0x88)[$r12] = $r12;;
     _32(0x6100300c),        //addd $r0 = $r12, 192 (0xc0);;
     _32(0x2701260c),        //sd 152 (0x98)[$r12] = $r0;;
     _32(0x6100200c),        //addd $r0 = $r12, 128 (0x80);;
     _32(0x2701280c),        //sd 160 (0xa0)[$r12] = $r0;;
     _96(0x000000008000005ae0003300),        //make $r0 = 92364 (0x168cc);;
     _32(0x1fffffd8),        //call 16820 <bar.2128>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1000000c),        //goto 168f8 <main+0x80>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x000000008000005ae0043300),        //make $r1 = 92364 (0x168cc);;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 168f4 <main+0x7c>;;
     _32(0x1800000c),        //call 16920 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0x3c48020c),        //lq $r18r19 = 8 (0x8)[$r12];;
     _32(0x3c54060c),        //lo $r20r21r22r23 = 24 (0x18)[$r12];;
     _32(0x3c640e0c),        //lo $r24r25r26r27 = 56 (0x38)[$r12];;
     _32(0x3c74160c),        //lo $r28r29r30r31 = 88 (0x58)[$r12];;
     _32(0x38401e0c),        //ld $r16 = 120 (0x78)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130300c),        //addd $r12 = $r12, 192 (0xc0);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16cf8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18828 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100001111000; //0x16878
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar_2128, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100001111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100100100000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
