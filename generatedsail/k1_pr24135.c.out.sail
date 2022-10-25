// executing pr24135.c.out.dumped test 
val k1_pr24135.: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pr24135.() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let y_2129: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2739000c),        //sd 0 (0x0)[$r12] = $r14;;
     _32(0x6138000c),        //addd $r14 = $r12, 0 (0x0);;
     _32(0x2601060e),        //sw 24 (0x18)[$r14] = $r0;;
     _32(0x3800080e),        //ld $r0 = 32 (0x20)[$r14];;
     _32(0x3804080e),        //ld $r1 = 32 (0x20)[$r14];;
     _32(0x2705040e),        //sd 16 (0x10)[$r14] = $r1;;
     _32(0x3004060e),        //lwz $r1 = 24 (0x18)[$r14];;
     _64(0x00000000f105b041),        //compw.eq $r1 = $r1, 1 (0x1);;
     _32(0x0c000181),        //cb.wnez $r1? 16868 <y.2129+0x48>;;
     _32(0x3004060e),        //lwz $r1 = 24 (0x18)[$r14];;
     _64(0x00000000f105b081),        //compw.eq $r1 = $r1, 2 (0x2);;
     _32(0x0c000241),        //cb.wnez $r1? 16884 <y.2129+0x64>;;
     _32(0x1000000f),        //goto 168a0 <y.2129+0x80>;;
     _96(0x000000008000005ae0084500),        //make $r2 = 92436 (0x16914);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x38300200),        //ld $r12 = 8 (0x8)[$r0];;
     _32(0x6a380001),        //copyd $r14 = $r1;;
     _32(0x0fd80002),        //igoto $r2;;
     _96(0x000000008000005ae0084500),        //make $r2 = 92436 (0x16914);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x38300200),        //ld $r12 = 8 (0x8)[$r0];;
     _32(0x6a380001),        //copyd $r14 = $r1;;
     _32(0x0fd80002),        //igoto $r2;;
     _32(0x6130000e),        //addd $r12 = $r14, 0 (0x0);;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let x: list_I = 
 [|
     _32(0x6130c80c),        //addd $r12 = $r12, -224 (0xffffff20);;
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x2849060c),        //sq 24 (0x18)[$r12] = $r18r19;;
     _32(0x28550a0c),        //so 40 (0x28)[$r12] = $r20r21r22r23;;
     _32(0x2865120c),        //so 72 (0x48)[$r12] = $r24r25r26r27;;
     _32(0x28751a0c),        //so 104 (0x68)[$r12] = $r28r29r30r31;;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741220c),        //sd 136 (0x88)[$r12] = $r16;;
     _32(0x2601260c),        //sw 152 (0x98)[$r12] = $r0;;
     _32(0x2605240c),        //sw 144 (0x90)[$r12] = $r1;;
     _32(0x6100300c),        //addd $r0 = $r12, 192 (0xc0);;
     _32(0x2701280c),        //sd 160 (0xa0)[$r12] = $r0;;
     _32(0x27312a0c),        //sd 168 (0xa8)[$r12] = $r12;;
     _32(0x6100380c),        //addd $r0 = $r12, 224 (0xe0);;
     _32(0x27012e0c),        //sd 184 (0xb8)[$r12] = $r0;;
     _32(0x3000260c),        //lwz $r0 = 152 (0x98)[$r12];;
     _32(0x71000080),        //addw $r0 = $r0, 2 (0x2);;
     _32(0x2601260c),        //sw 152 (0x98)[$r12] = $r0;;
     _32(0x6100280c),        //addd $r0 = $r12, 160 (0xa0);;
     _32(0x2701300c),        //sd 192 (0xc0)[$r12] = $r0;;
     _32(0x3000240c),        //lwz $r0 = 144 (0x90)[$r12];;
     _32(0x1fffffc5),        //call 16820 <y.2129>;;
     _32(0x10000001),        //goto 16914 <x+0x5c>;;
     _32(0x3000260c),        //lwz $r0 = 152 (0x98)[$r12];;
     _32(0x3838040c),        //ld $r14 = 16 (0x10)[$r12];;
     _32(0x3c48060c),        //lq $r18r19 = 24 (0x18)[$r12];;
     _32(0x3c540a0c),        //lo $r20r21r22r23 = 40 (0x28)[$r12];;
     _32(0x3c64120c),        //lo $r24r25r26r27 = 72 (0x48)[$r12];;
     _32(0x3c741a0c),        //lo $r28r29r30r31 = 104 (0x68)[$r12];;
     _32(0x3840220c),        //ld $r16 = 136 (0x88)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130380c),        //addd $r12 = $r12, 224 (0xe0);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x10000019),        //goto 169b8 <main+0x78>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000000f),        //goto 1699c <main+0x5c>;;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x1fffffd3),        //call 168b8 <x>;;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71000080),        //addw $r0 = $r0, 2 (0x2);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004050c),        //lwz $r1 = 20 (0x14)[$r12];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 16990 <main+0x50>;;
     _32(0x18000015),        //call 169e0 <abort>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f401b080),        //compw.le $r0 = $r0, 2 (0x2);;
     _32(0x0c7ffbc0),        //cb.wnez $r0? 16964 <main+0x24>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f401b080),        //compw.le $r0 = $r0, 2 (0x2);;
     _32(0x0c7ff940),        //cb.wnez $r0? 16958 <main+0x18>;;
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
     _32(0x980000f3),        //call 16db8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 188e8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100101000000; //0x16940
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(y_2129, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(x, 0b00010110100010111000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100101000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100111100000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
