// executing pipeline pr49390.c.out.dumped test 
val k1_pipeline_pr49390: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr49390() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x27050c0c),        //sd 48 (0x30)[$r12] = $r1;;
     _32(0x26090a0c),        //sw 40 (0x28)[$r12] = $r2;;
     _32(0x260d080c),        //sw 32 (0x20)[$r12] = $r3;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _64(0x00000000f001b100),        //compw.ne $r0 = $r0, 4 (0x4);;
     _32(0x0c0001c0),        //cb.wnez $r0? 16864 <foo+0x44>;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _96(0x0000000080000117e0042900),        //make $r1 = 285860 (0x45ca4);;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 16868 <foo+0x48>;;
     _32(0x18000109),        //call 16c88 <abort>;;
     _32(0x30040a0c),        //lwz $r1 = 40 (0x28)[$r12];;
     _32(0x3000080c),        //lwz $r0 = 32 (0x20)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x60044000),        //make $r1 = 16384 (0x4000);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let bar: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let baz: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let test: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _96(0x0000000080000117e0002600),        //make $r0 = 285848 (0x45c98);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x08000100),        //cb.dnez $r0? 169b0 <test+0x38>;;
     _32(0x61000a0c),        //addd $r0 = $r12, 40 (0x28);;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x1000001b),        //goto 16a18 <test+0xa0>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _64(0x00000007f800fc00),        //andw $r0 = $r0, 8176 (0x1ff0);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800300),        //cb.deqz $r0? 169f4 <test+0x7c>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _64(0x00000007f800ffc0),        //andw $r0 = $r0, 8191 (0x1fff);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000008f5000000),        //sbfw $r0 = $r0, 8192 (0x2000);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f901b7c0),        //compw.gtu $r0 = $r0, 31 (0x1f);;
     _32(0x0c000280),        //cb.wnez $r0? 16a18 <test+0xa0>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _32(0x7a0c0000),        //copyw $r3 = $r0;;
     _32(0x7a080001),        //copyw $r2 = $r1;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffff83),        //call 16820 <foo>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x1fffffb9),        //call 16900 <baz>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08801ac0),        //cb.deqz $r0? 16bd0 <test+0x258>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x28000080),        //lhz $r0 = 2 (0x2)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x78000080),        //andw $r0 = $r0, 2 (0x2);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x088000c0),        //cb.deqz $r0? 16a54 <test+0xdc>;;
     _32(0x60000020),        //make $r0 = 32 (0x20);;
     _32(0x10000002),        //goto 16a58 <test+0xe0>;;
     _32(0x60000004),        //make $r0 = 4 (0x4);;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _64(0x00000007f800ffc0),        //andw $r0 = $r0, 8191 (0x1fff);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x0c000240),        //cb.wnez $r0? 16a98 <test+0x120>;;
     _32(0x30000b0c),        //lwz $r0 = 44 (0x2c)[$r12];;
     _32(0x30040e0c),        //lwz $r1 = 56 (0x38)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x26010b0c),        //sw 44 (0x2c)[$r12] = $r0;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x1000000f),        //goto 16ad0 <test+0x158>;;
     _32(0x30040f0c),        //lwz $r1 = 60 (0x3c)[$r12];;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _32(0x7701b001),        //compw.geu $r0 = $r1, $r0;;
     _32(0x0c0002c0),        //cb.wnez $r0? 16ad0 <test+0x158>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _32(0x7a0c0000),        //copyw $r3 = $r0;;
     _32(0x7a080001),        //copyw $r2 = $r1;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x60000002),        //make $r0 = 2 (0x2);;
     _32(0x1fffff56),        //call 16820 <foo>;;
     _32(0x10000044),        //goto 16bdc <test+0x264>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x28000080),        //lhz $r0 = 2 (0x2)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x78000040),        //andw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800480),        //cb.deqz $r0? 16b38 <test+0x1c0>;;
     _32(0x30040f0c),        //lwz $r1 = 60 (0x3c)[$r12];;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _32(0x7001b001),        //compw.ne $r0 = $r1, $r0;;
     _32(0x0c000380),        //cb.wnez $r0? 16b38 <test+0x1c0>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x1fffff6b),        //call 168b8 <bar>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _32(0x7a0c0000),        //copyw $r3 = $r0;;
     _32(0x7a080001),        //copyw $r2 = $r1;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x60000003),        //make $r0 = 3 (0x3);;
     _32(0x1fffff3c),        //call 16820 <foo>;;
     _32(0x1000002a),        //goto 16bdc <test+0x264>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _64(0x00000007e800ffc0),        //andd $r0 = $r0, 8191 (0x1fff);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x30040100),        //lwz $r1 = 4 (0x4)[$r0];;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7601b001),        //compw.ltu $r0 = $r1, $r0;;
     _32(0x0c000640),        //cb.wnez $r0? 16bd8 <test+0x260>;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x30040100),        //lwz $r1 = 4 (0x4)[$r0];;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7001b001),        //compw.ne $r0 = $r1, $r0;;
     _32(0x0c0001c0),        //cb.wnez $r0? 16ba8 <test+0x230>;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x30040200),        //lwz $r1 = 8 (0x8)[$r0];;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _32(0x7601b001),        //compw.ltu $r0 = $r1, $r0;;
     _32(0x0c000340),        //cb.wnez $r0? 16bd8 <test+0x260>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _32(0x7a0c0000),        //copyw $r3 = $r0;;
     _32(0x7a080001),        //copyw $r2 = $r1;;
     _32(0x38040c0c),        //ld $r1 = 48 (0x30)[$r12];;
     _32(0x60000004),        //make $r0 = 4 (0x4);;
     _32(0x1fffff16),        //call 16820 <foo>;;
     _32(0x10000003),        //goto 16bd8 <test+0x260>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x10000002),        //goto 16bdc <test+0x264>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x0000000080000117e0042600),        //make $r1 = 285848 (0x45c98);;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x0000000080000117e0002800),        //make $r0 = 285856 (0x45ca0);;
     _32(0x60042000),        //make $r1 = 8192 (0x2000);;
     _32(0x26050200),        //sw 8 (0x8)[$r0] = $r1;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _96(0x0000000080000117e0042800),        //make $r1 = 285856 (0x45ca0);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x1fffff4b),        //call 16978 <test>;;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000200f101b000),        //compw.eq $r0 = $r0, 16384 (0x4000);;
     _32(0x0c000080),        //cb.wnez $r0? 16c74 <main+0x84>;;
     _32(0x18000006),        //call 16c88 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 17060 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18b90 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101111110000; //0x16bf0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100010111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(baz, 0b00010110100100000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test, 0b00010110100101111000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101111110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110110010001000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016bf0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
