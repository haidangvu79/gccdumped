// executing pipeline pr49886 test 
val k1_pipeline_pr49886: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr49886() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let never_ever: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x18000157)        //call 16d90 <abort>;;
 |];

let mark_cell: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x08803d40),        //cb.deqz $r0? 16c30 <mark_cell+0x3f8>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x08800680),        //cb.deqz $r0? 168cc <mark_cell+0x94>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x60010100),        //compd.ne $r0 = $r0, 4 (0x4);;
     _32(0x08000580),        //cb.dnez $r0? 168cc <mark_cell+0x94>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x088004c0),        //cb.deqz $r0? 168cc <mark_cell+0x94>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000100f8000000),        //andw $r0 = $r0, 262144 (0x40000);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000300),        //cb.dnez $r0? 168cc <mark_cell+0x94>;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x7a000002),        //copyw $r0 = $r2;;
     _32(0x1fffffd6),        //call 16820 <never_ever>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x08800680),        //cb.deqz $r0? 16938 <mark_cell+0x100>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x60010100),        //compd.ne $r0 = $r0, 4 (0x4);;
     _32(0x08000580),        //cb.dnez $r0? 16938 <mark_cell+0x100>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x088004c0),        //cb.deqz $r0? 16938 <mark_cell+0x100>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000080f8000000),        //andw $r0 = $r0, 131072 (0x20000);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000300),        //cb.dnez $r0? 16938 <mark_cell+0x100>;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000080),        //addw $r0 = $r0, 2 (0x2);;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x7a000002),        //copyw $r0 = $r2;;
     _32(0x1fffffbb),        //call 16820 <never_ever>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x08800680),        //cb.deqz $r0? 169a4 <mark_cell+0x16c>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x60010100),        //compd.ne $r0 = $r0, 4 (0x4);;
     _32(0x08000580),        //cb.dnez $r0? 169a4 <mark_cell+0x16c>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x088004c0),        //cb.deqz $r0? 169a4 <mark_cell+0x16c>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000040f8000000),        //andw $r0 = $r0, 65536 (0x10000);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000300),        //cb.dnez $r0? 169a4 <mark_cell+0x16c>;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x710000c0),        //addw $r0 = $r0, 3 (0x3);;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x7a000002),        //copyw $r0 = $r2;;
     _32(0x1fffffa0),        //call 16820 <never_ever>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x08800680),        //cb.deqz $r0? 16a10 <mark_cell+0x1d8>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x60010100),        //compd.ne $r0 = $r0, 4 (0x4);;
     _32(0x08000580),        //cb.dnez $r0? 16a10 <mark_cell+0x1d8>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x088004c0),        //cb.deqz $r0? 16a10 <mark_cell+0x1d8>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000020f8000000),        //andw $r0 = $r0, 32768 (0x8000);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000300),        //cb.dnez $r0? 16a10 <mark_cell+0x1d8>;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000100),        //addw $r0 = $r0, 4 (0x4);;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x7a000002),        //copyw $r0 = $r2;;
     _32(0x1fffff85),        //call 16820 <never_ever>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x08800680),        //cb.deqz $r0? 16a7c <mark_cell+0x244>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x60010100),        //compd.ne $r0 = $r0, 4 (0x4);;
     _32(0x08000580),        //cb.dnez $r0? 16a7c <mark_cell+0x244>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x088004c0),        //cb.deqz $r0? 16a7c <mark_cell+0x244>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000010f8000000),        //andw $r0 = $r0, 16384 (0x4000);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000300),        //cb.dnez $r0? 16a7c <mark_cell+0x244>;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000140),        //addw $r0 = $r0, 5 (0x5);;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x7a000002),        //copyw $r0 = $r2;;
     _32(0x1fffff6a),        //call 16820 <never_ever>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x08800680),        //cb.deqz $r0? 16ae8 <mark_cell+0x2b0>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x60010100),        //compd.ne $r0 = $r0, 4 (0x4);;
     _32(0x08000580),        //cb.dnez $r0? 16ae8 <mark_cell+0x2b0>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x088004c0),        //cb.deqz $r0? 16ae8 <mark_cell+0x2b0>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000008f8000000),        //andw $r0 = $r0, 8192 (0x2000);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000300),        //cb.dnez $r0? 16ae8 <mark_cell+0x2b0>;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000180),        //addw $r0 = $r0, 6 (0x6);;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x7a000002),        //copyw $r0 = $r2;;
     _32(0x1fffff4f),        //call 16820 <never_ever>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x08800680),        //cb.deqz $r0? 16b54 <mark_cell+0x31c>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x60010100),        //compd.ne $r0 = $r0, 4 (0x4);;
     _32(0x08000580),        //cb.dnez $r0? 16b54 <mark_cell+0x31c>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x088004c0),        //cb.deqz $r0? 16b54 <mark_cell+0x31c>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000004f8000000),        //andw $r0 = $r0, 4096 (0x1000);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000300),        //cb.dnez $r0? 16b54 <mark_cell+0x31c>;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x710001c0),        //addw $r0 = $r0, 7 (0x7);;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x7a000002),        //copyw $r0 = $r2;;
     _32(0x1fffff34),        //call 16820 <never_ever>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x08800680),        //cb.deqz $r0? 16bc0 <mark_cell+0x388>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x60010100),        //compd.ne $r0 = $r0, 4 (0x4);;
     _32(0x08000580),        //cb.dnez $r0? 16bc0 <mark_cell+0x388>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x088004c0),        //cb.deqz $r0? 16bc0 <mark_cell+0x388>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000002f8000000),        //andw $r0 = $r0, 2048 (0x800);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000300),        //cb.dnez $r0? 16bc0 <mark_cell+0x388>;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000200),        //addw $r0 = $r0, 8 (0x8);;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x7a000002),        //copyw $r0 = $r2;;
     _32(0x1fffff19),        //call 16820 <never_ever>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x08800700),        //cb.deqz $r0? 16c34 <mark_cell+0x3fc>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x60010100),        //compd.ne $r0 = $r0, 4 (0x4);;
     _32(0x08000600),        //cb.dnez $r0? 16c34 <mark_cell+0x3fc>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x08800540),        //cb.deqz $r0? 16c34 <mark_cell+0x3fc>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000001f8000000),        //andw $r0 = $r0, 1024 (0x400);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000380),        //cb.dnez $r0? 16c34 <mark_cell+0x3fc>;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000240),        //addw $r0 = $r0, 9 (0x9);;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x7a000002),        //copyw $r0 = $r2;;
     _32(0x1ffffefe),        //call 16820 <never_ever>;;
     _32(0x10000002),        //goto 16c34 <mark_cell+0x3fc>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let foo: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x1ffffef5),        //call 16838 <mark_cell>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let getnull: list_I = 
 [|
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000000a),        //goto 16cd8 <main+0x50>;;
     _32(0x1ffffff3),        //call 16c80 <getnull>;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x1fffffe0),        //call 16c48 <foo>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000003f401b0c0),        //compw.le $r0 = $r0, 99 (0x63);;
     _32(0x0c7ffd00),        //cb.wnez $r0? 16cb4 <main+0x2c>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let bar_1: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _32(0x61040040),        //addd $r1 = $r0, 1 (0x1);;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x27050200),        //sd 8 (0x8)[$r0] = $r1;;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x1ffffec2),        //call 16838 <mark_cell>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let bar_2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _32(0x61040080),        //addd $r1 = $r0, 2 (0x2);;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x27050200),        //sd 8 (0x8)[$r0] = $r1;;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x1ffffeb0),        //call 16838 <mark_cell>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 17168 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18c98 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110110010001000; //0x16c88
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(never_ever, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(mark_cell, 0b00010110100000111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110110001001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(getnull, 0b00010110110010000000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110110010001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar_1, 0b00010110110100000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar_2, 0b00010110110101001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110110110010000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016c88;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
