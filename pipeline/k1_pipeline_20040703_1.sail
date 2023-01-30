// executing pipeline 20040703_1 test 
val k1_pipeline_20040703_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20040703_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let num_positive: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2801040c),        //sq 16 (0x10)[$r12] = $r0r1;;
     _32(0x2609020c),        //sw 8 (0x8)[$r12] = $r2;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _64(0x00000001f801b000),        //compw.leu $r0 = $r0, 32 (0x20);;
     _32(0x0c000480),        //cb.wnez $r0? 16880 <num_positive+0x60>;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x7100f800),        //addw $r0 = $r0, -32 (0xffffffe0);;
     _32(0x2601020c),        //sw 8 (0x8)[$r12] = $r0;;
     _32(0x3004040c),        //lwz $r1 = 16 (0x10)[$r12];;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x60080001),        //make $r2 = 1 (0x1);;
     _32(0x79027002),        //sllw $r0 = $r2, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x78011001),        //andw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b000),        //compw.eq $r0 = $r0, 0 (0x0);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x1000000e),        //goto 168b4 <num_positive+0x94>;;
     _32(0x3004050c),        //lwz $r1 = 20 (0x14)[$r12];;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x60080001),        //make $r2 = 1 (0x1);;
     _32(0x79027002),        //sllw $r0 = $r2, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x78011001),        //andw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b000),        //compw.eq $r0 = $r0, 0 (0x0);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let num_trim: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2801040c),        //sq 16 (0x10)[$r12] = $r0r1;;
     _32(0x2609020c),        //sw 8 (0x8)[$r12] = $r2;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _64(0x00000001f801b000),        //compw.leu $r0 = $r0, 32 (0x20);;
     _32(0x0c0004c0),        //cb.wnez $r0? 16924 <num_trim+0x64>;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x7100f800),        //addw $r0 = $r0, -32 (0xffffffe0);;
     _32(0x2601020c),        //sw 8 (0x8)[$r12] = $r0;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _64(0x00000000f901b7c0),        //compw.gtu $r0 = $r0, 31 (0x1f);;
     _32(0x0c000700),        //cb.wnez $r0? 16964 <num_trim+0xa4>;;
     _32(0x3004040c),        //lwz $r1 = 16 (0x10)[$r12];;
     _32(0x60080001),        //make $r2 = 1 (0x1);;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x79027002),        //sllw $r0 = $r2, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x78011001),        //andw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x10000011),        //goto 16964 <num_trim+0xa4>;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _64(0x00000000f901b7c0),        //compw.gtu $r0 = $r0, 31 (0x1f);;
     _32(0x0c0002c0),        //cb.wnez $r0? 1695c <num_trim+0x9c>;;
     _32(0x3004050c),        //lwz $r1 = 20 (0x14)[$r12];;
     _32(0x60080001),        //make $r2 = 1 (0x1);;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x79027002),        //sllw $r0 = $r2, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x78011001),        //andw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _32(0x3c00040c),        //lq $r0r1 = 16 (0x10)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let num_rshift: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x28010a0c),        //sq 40 (0x28)[$r12] = $r0r1;;
     _32(0x2609080c),        //sw 32 (0x20)[$r12] = $r2;;
     _32(0x260d060c),        //sw 24 (0x18)[$r12] = $r3;;
     _32(0x3008080c),        //lwz $r2 = 32 (0x20)[$r12];;
     _32(0x3c000a0c),        //lq $r0r1 = 40 (0x28)[$r12];;
     _32(0x1fffffa4),        //call 16820 <num_positive>;;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _32(0x080000c0),        //cb.dnez $r0? 169a8 <num_rshift+0x38>;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _32(0x0c800100),        //cb.weqz $r0? 169b4 <num_rshift+0x44>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x10000003),        //goto 169bc <num_rshift+0x4c>;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x3000080c),        //lwz $r0 = 32 (0x20)[$r12];;
     _32(0x7601b001),        //compw.ltu $r0 = $r1, $r0;;
     _32(0x0c000180),        //cb.wnez $r0? 169e0 <num_rshift+0x70>;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x26010b0c),        //sw 44 (0x2c)[$r12] = $r0;;
     _32(0x30000b0c),        //lwz $r0 = 44 (0x2c)[$r12];;
     _32(0x26010a0c),        //sw 40 (0x28)[$r12] = $r0;;
     _32(0x10000045),        //goto 16af0 <num_rshift+0x180>;;
     _32(0x3000080c),        //lwz $r0 = 32 (0x20)[$r12];;
     _64(0x00000000f901b7c0),        //compw.gtu $r0 = $r0, 31 (0x1f);;
     _32(0x0c000300),        //cb.wnez $r0? 16a1c <num_rshift+0xac>;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x26010a0c),        //sw 40 (0x28)[$r12] = $r0;;
     _32(0x30040b0c),        //lwz $r1 = 44 (0x2c)[$r12];;
     _32(0x30080f0c),        //lwz $r2 = 60 (0x3c)[$r12];;
     _32(0x3000080c),        //lwz $r0 = 32 (0x20)[$r12];;
     _32(0x79027002),        //sllw $r0 = $r2, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a011001),        //orw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x26010b0c),        //sw 44 (0x2c)[$r12] = $r0;;
     _32(0x1000000f),        //goto 16a54 <num_rshift+0xe4>;;
     _32(0x3000080c),        //lwz $r0 = 32 (0x20)[$r12];;
     _64(0x00000001f901b7c0),        //compw.gtu $r0 = $r0, 63 (0x3f);;
     _32(0x0c0002c0),        //cb.wnez $r0? 16a54 <num_rshift+0xe4>;;
     _32(0x30040a0c),        //lwz $r1 = 40 (0x28)[$r12];;
     _32(0x3000080c),        //lwz $r0 = 32 (0x20)[$r12];;
     _32(0x7100f800),        //addw $r0 = $r0, -32 (0xffffffe0);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x30080f0c),        //lwz $r2 = 60 (0x3c)[$r12];;
     _32(0x79027002),        //sllw $r0 = $r2, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a011001),        //orw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x26010a0c),        //sw 40 (0x28)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f801b7c0),        //compw.leu $r0 = $r0, 31 (0x1f);;
     _32(0x0c000200),        //cb.wnez $r0? 16a80 <num_rshift+0x110>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7100f800),        //addw $r0 = $r0, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x30000a0c),        //lwz $r0 = 40 (0x28)[$r12];;
     _32(0x26010b0c),        //sw 44 (0x2c)[$r12] = $r0;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x26010a0c),        //sw 40 (0x28)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0c8006c0),        //cb.weqz $r0? 16af0 <num_rshift+0x180>;;
     _32(0x30040b0c),        //lwz $r1 = 44 (0x2c)[$r12];;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7b027001),        //srlw $r0 = $r1, $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x30080a0c),        //lwz $r2 = 40 (0x28)[$r12];;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x75000800),        //sbfw $r0 = $r0, 32 (0x20);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x79027002),        //sllw $r0 = $r2, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a011001),        //orw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x26010b0c),        //sw 44 (0x2c)[$r12] = $r0;;
     _32(0x30040a0c),        //lwz $r1 = 40 (0x28)[$r12];;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7b027001),        //srlw $r0 = $r1, $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x75000800),        //sbfw $r0 = $r0, 32 (0x20);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x30080f0c),        //lwz $r2 = 60 (0x3c)[$r12];;
     _32(0x79027002),        //sllw $r0 = $r2, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a011001),        //orw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x26010a0c),        //sw 40 (0x28)[$r12] = $r0;;
     _32(0x3008080c),        //lwz $r2 = 32 (0x20)[$r12];;
     _32(0x3c000a0c),        //lq $r0r1 = 40 (0x28)[$r12];;
     _32(0x1fffff72),        //call 168c0 <num_trim>;;
     _32(0x28010a0c),        //sq 40 (0x28)[$r12] = $r0r1;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x3c000a0c),        //lq $r0r1 = 40 (0x28)[$r12];;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let num_lshift: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x28010a0c),        //sq 40 (0x28)[$r12] = $r0r1;;
     _32(0x2609080c),        //sw 32 (0x20)[$r12] = $r2;;
     _32(0x260d060c),        //sw 24 (0x18)[$r12] = $r3;;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x3000080c),        //lwz $r0 = 32 (0x20)[$r12];;
     _32(0x7601b001),        //compw.ltu $r0 = $r1, $r0;;
     _32(0x0c000440),        //cb.wnez $r0? 16b88 <num_lshift+0x68>;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _32(0x08000200),        //cb.dnez $r0? 16b6c <num_lshift+0x4c>;;
     _32(0x30040b0c),        //lwz $r1 = 44 (0x2c)[$r12];;
     _32(0x30000a0c),        //lwz $r0 = 40 (0x28)[$r12];;
     _32(0x7a011001),        //orw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x088000c0),        //cb.deqz $r0? 16b6c <num_lshift+0x4c>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x10000002),        //goto 16b70 <num_lshift+0x50>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010b0c),        //sw 44 (0x2c)[$r12] = $r0;;
     _32(0x30000b0c),        //lwz $r0 = 44 (0x2c)[$r12];;
     _32(0x26010a0c),        //sw 40 (0x28)[$r12] = $r0;;
     _32(0x1000003e),        //goto 16c7c <num_lshift+0x15c>;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x2601170c),        //sw 92 (0x5c)[$r12] = $r0;;
     _32(0x3c000a0c),        //lq $r0r1 = 40 (0x28)[$r12];;
     _32(0x2801120c),        //sq 72 (0x48)[$r12] = $r0r1;;
     _32(0x3000170c),        //lwz $r0 = 92 (0x5c)[$r12];;
     _64(0x00000000f801b7c0),        //compw.leu $r0 = $r0, 31 (0x1f);;
     _32(0x0c000200),        //cb.wnez $r0? 16bc4 <num_lshift+0xa4>;;
     _32(0x3000170c),        //lwz $r0 = 92 (0x5c)[$r12];;
     _32(0x7100f800),        //addw $r0 = $r0, -32 (0xffffffe0);;
     _32(0x2601170c),        //sw 92 (0x5c)[$r12] = $r0;;
     _32(0x30000b0c),        //lwz $r0 = 44 (0x2c)[$r12];;
     _32(0x26010a0c),        //sw 40 (0x28)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010b0c),        //sw 44 (0x2c)[$r12] = $r0;;
     _32(0x3000170c),        //lwz $r0 = 92 (0x5c)[$r12];;
     _32(0x0c8004c0),        //cb.weqz $r0? 16c14 <num_lshift+0xf4>;;
     _32(0x30040a0c),        //lwz $r1 = 40 (0x28)[$r12];;
     _32(0x3000170c),        //lwz $r0 = 92 (0x5c)[$r12];;
     _32(0x79027001),        //sllw $r0 = $r1, $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x30080b0c),        //lwz $r2 = 44 (0x2c)[$r12];;
     _32(0x3000170c),        //lwz $r0 = 92 (0x5c)[$r12];;
     _32(0x75000800),        //sbfw $r0 = $r0, 32 (0x20);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7b027002),        //srlw $r0 = $r2, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a011001),        //orw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x26010a0c),        //sw 40 (0x28)[$r12] = $r0;;
     _32(0x30040b0c),        //lwz $r1 = 44 (0x2c)[$r12];;
     _32(0x3000170c),        //lwz $r0 = 92 (0x5c)[$r12];;
     _32(0x79027001),        //sllw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x26010b0c),        //sw 44 (0x2c)[$r12] = $r0;;
     _32(0x3008080c),        //lwz $r2 = 32 (0x20)[$r12];;
     _32(0x3c000a0c),        //lq $r0r1 = 40 (0x28)[$r12];;
     _32(0x1fffff29),        //call 168c0 <num_trim>;;
     _32(0x28010a0c),        //sq 40 (0x28)[$r12] = $r0r1;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _32(0x08800100),        //cb.deqz $r0? 16c38 <num_lshift+0x118>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x10000012),        //goto 16c7c <num_lshift+0x15c>;;
     _32(0x300c060c),        //lwz $r3 = 24 (0x18)[$r12];;
     _32(0x3008080c),        //lwz $r2 = 32 (0x20)[$r12];;
     _32(0x3c000a0c),        //lq $r0r1 = 40 (0x28)[$r12];;
     _32(0x1fffff4b),        //call 16970 <num_rshift>;;
     _32(0x28010e0c),        //sq 56 (0x38)[$r12] = $r0r1;;
     _32(0x3004130c),        //lwz $r1 = 76 (0x4c)[$r12];;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x7001b001),        //compw.ne $r0 = $r1, $r0;;
     _32(0x0c000140),        //cb.wnez $r0? 16c6c <num_lshift+0x14c>;;
     _32(0x3004120c),        //lwz $r1 = 72 (0x48)[$r12];;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c0000c0),        //cb.wnez $r0? 16c74 <num_lshift+0x154>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x10000002),        //goto 16c78 <num_lshift+0x158>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x3c000a0c),        //lq $r0r1 = 40 (0x28)[$r12];;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _96(0x00000000800000f8e0000400),        //make $r0 = 253968 (0x3e010);;
     _32(0x30040000),        //lwz $r1 = 0 (0x0)[$r0];;
     _96(0x00000000800000f8e0000600),        //make $r0 = 253976 (0x3e018);;
     _32(0x7a0c0001),        //copyw $r3 = $r1;;
     _32(0x60080040),        //make $r2 = 64 (0x40);;
     _32(0x3c000000),        //lq $r0r1 = 0 (0x0)[$r0];;
     _32(0x1fffff97),        //call 16b20 <num_lshift>;;
     _32(0x2801040c),        //sq 16 (0x10)[$r12] = $r0r1;;
     _32(0x3000050c),        //lwz $r0 = 20 (0x14)[$r12];;
     _64(0x00001800f101b000),        //compw.eq $r0 = $r0, 196608 (0x30000);;
     _32(0x0c000080),        //cb.wnez $r0? 16ce0 <main+0x50>;;
     _32(0x18000009),        //call 16d00 <abort>;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x08800080),        //cb.deqz $r0? 16cec <main+0x5c>;;
     _32(0x18000006),        //call 16d00 <abort>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x08800080),        //cb.deqz $r0? 16cf8 <main+0x68>;;
     _32(0x18000003),        //call 16d00 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 16d20 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 17120 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18df8 <_exit>
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
     _32(0x98000161),        //call 172b8 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000f000),        //make $r0 = 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16d5c <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18df8 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110110010010000; //0x16c90
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(num_positive, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(num_trim, 0b00010110100011000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(num_rshift, 0b00010110100101110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(num_lshift, 0b00010110101100100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110110010010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110110100000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit, 0b00010110110100100000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016c90;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
