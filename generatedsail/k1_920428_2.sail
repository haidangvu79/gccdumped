// executing 920428_2 test 
val k1_920428_2: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_920428_2() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let f_2125: list_I = 
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
     _64(0x00000000f005b081),        //compw.ne $r1 = $r1, 2 (0x2);;
     _32(0x0c000201),        //cb.wnez $r1? 16870 <f.2125+0x50>;;
     _96(0x000000008000005ae0083b00),        //make $r2 = 92396 (0x168ec);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x38300200),        //ld $r12 = 8 (0x8)[$r0];;
     _32(0x6a380001),        //copyd $r14 = $r1;;
     _32(0x0fd80002),        //igoto $r2;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x6130000e),        //addd $r12 = $r14, 0 (0x0);;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let s: list_I = 
 [|
     _32(0x6130c80c),        //addd $r12 = $r12, -224 (0xffffff20);;
     _32(0x2739060c),        //sd 24 (0x18)[$r12] = $r14;;
     _32(0x2849080c),        //sq 32 (0x20)[$r12] = $r18r19;;
     _32(0x28550c0c),        //so 48 (0x30)[$r12] = $r20r21r22r23;;
     _32(0x2865140c),        //so 80 (0x50)[$r12] = $r24r25r26r27;;
     _32(0x28751c0c),        //so 112 (0x70)[$r12] = $r28r29r30r31;;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741240c),        //sd 144 (0x90)[$r12] = $r16;;
     _32(0x2601260c),        //sw 152 (0x98)[$r12] = $r0;;
     _32(0x6100300c),        //addd $r0 = $r12, 192 (0xc0);;
     _32(0x2701280c),        //sd 160 (0xa0)[$r12] = $r0;;
     _32(0x27312a0c),        //sd 168 (0xa8)[$r12] = $r12;;
     _32(0x6100380c),        //addd $r0 = $r12, 224 (0xe0);;
     _32(0x27012e0c),        //sd 184 (0xb8)[$r12] = $r0;;
     _32(0x3000260c),        //lwz $r0 = 152 (0x98)[$r12];;
     _32(0x0e000240),        //cb.wlez $r0? 168f0 <s+0x60>;;
     _32(0x6100280c),        //addd $r0 = $r12, 160 (0xa0);;
     _32(0x2701300c),        //sd 192 (0xc0)[$r12] = $r0;;
     _32(0x3000260c),        //lwz $r0 = 152 (0x98)[$r12];;
     _32(0x1fffffd1),        //call 16820 <f.2125>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x10000004),        //goto 168f8 <s+0x68>;;
     _32(0x10000002),        //goto 168f4 <s+0x64>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x3838060c),        //ld $r14 = 24 (0x18)[$r12];;
     _32(0x3c48080c),        //lq $r18r19 = 32 (0x20)[$r12];;
     _32(0x3c540c0c),        //lo $r20r21r22r23 = 48 (0x30)[$r12];;
     _32(0x3c64140c),        //lo $r24r25r26r27 = 80 (0x50)[$r12];;
     _32(0x3c741c0c),        //lo $r28r29r30r31 = 112 (0x70)[$r12];;
     _32(0x3840240c),        //ld $r16 = 144 (0x90)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130380c),        //addd $r12 = $r12, 224 (0xe0);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let x: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffd8),        //call 16890 <s>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c000340),        //cb.wnez $r0? 16974 <x+0x54>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffffd2),        //call 16890 <s>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000240),        //cb.dnez $r0? 16974 <x+0x54>;;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x1fffffce),        //call 16890 <s>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c0000c0),        //cb.wnez $r0? 16974 <x+0x54>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x10000002),        //goto 16978 <x+0x58>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
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
     _32(0x1fffffe1),        //call 16920 <x>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 169b4 <main+0x24>;;
     _32(0x18000004),        //call 169c0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 169e0 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16de0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18ab8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0xf838ffc0),        //zxwd $r14 = $r0
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x98000161),        //call 16f78 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16a1c <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18ab8 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100110010000; //0x16990
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f_2125, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(s, 0b00010110100010010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(x, 0b00010110100100100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100110010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100111000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit, 0b00010110100111100000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
