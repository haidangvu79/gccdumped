// executing pipeline pr20601_1.c.out.dumped test 
val k1_pipeline_pr20601_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr20601_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo: list_I = 
 [|
     _32(0x10000000),        //goto 16820 <foo>;;
     _32(0x7f03f000)        //nop ;;
 |];

let bar: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let baz: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _64(0x00000080f801b000),        //compw.leu $r0 = $r0, 4096 (0x1000);;
     _32(0x0c000080),        //cb.wnez $r0? 16868 <baz+0x28>;;
     _32(0x1fffffef),        //call 16820 <foo>;;
     _32(0x3004040c),        //lwz $r1 = 16 (0x10)[$r12];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x1fffffee),        //call 16828 <bar>;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let setup1: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x2601020c),        //sw 8 (0x8)[$r12] = $r0;;
     _32(0x60041000),        //make $r1 = 4096 (0x1000);;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x1fffffe6),        //call 16840 <baz>;;
     _32(0x08000180),        //cb.dnez $r0? 168c4 <setup1+0x3c>;;
     _32(0x60041000),        //make $r1 = 4096 (0x1000);;
     _96(0x0000000080000117e0002400),        //make $r0 = 285840 (0x45c90);;
     _32(0x1fffffe0),        //call 16840 <baz>;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _64(0x00000000f8008000),        //andw $r0 = $r0, 512 (0x200);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08801000),        //cb.deqz $r0? 169d4 <setup1+0x14c>;;
     _96(0x000000008000011be0005200),        //make $r0 = 290120 (0x46d48);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _96(0x000000008000011be0004a00),        //make $r0 = 290088 (0x46d28);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x000000008000011be0004a00),        //make $r0 = 290088 (0x46d28);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x000000008000011be0005200),        //make $r0 = 290120 (0x46d48);;
     _96(0x000000008000011be0042800),        //make $r1 = 289952 (0x46ca0);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x088005c0),        //cb.deqz $r0? 1699c <setup1+0x114>;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x08800440),        //cb.deqz $r0? 1699c <setup1+0x114>;;
     _96(0x000000008000011be0005200),        //make $r0 = 290120 (0x46d48);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _32(0x38040001),        //ld $r1 = 0 (0x0)[$r1];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _96(0x000000008000011be0005200),        //make $r0 = 290120 (0x46d48);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x10000008),        //goto 169b8 <setup1+0x130>;;
     _32(0x180000f5),        //call 16d70 <abort>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x087ffd00),        //cb.dnez $r0? 169a0 <setup1+0x118>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let setup2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _96(0x000000008000011be0004800),        //make $r0 = 290080 (0x46d20);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _96(0x000000008000011be0045200),        //make $r1 = 290120 (0x46d48);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x000000008000011be0002600),        //make $r0 = 289944 (0x46c98);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x000000008000011be0004a00),        //make $r0 = 290088 (0x46d28);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x10000083),        //goto 16c54 <setup2+0x26c>;;
     _96(0x000000008000011be0005200),        //make $r0 = 290120 (0x46d48);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x08800280),        //cb.deqz $r0? 16a90 <setup2+0xa8>;;
     _96(0x000000008000011be0005200),        //make $r0 = 290120 (0x46d48);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x61000080),        //addd $r0 = $r0, 2 (0x2);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x08800080),        //cb.deqz $r0? 16a90 <setup2+0xa8>;;
     _32(0x180000b9),        //call 16d70 <abort>;;
     _96(0x000000008000011be0005200),        //make $r0 = 290120 (0x46d48);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000003f105b540),        //compw.eq $r1 = $r0, 117 (0x75);;
     _32(0x0c0002c1),        //cb.wnez $r1? 16ae8 <setup2+0x100>;;
     _64(0x00000003f505b540),        //compw.gt $r1 = $r0, 117 (0x75);;
     _32(0x0c001401),        //cb.wnez $r1? 16c08 <setup2+0x220>;;
     _64(0x00000001f105b340),        //compw.eq $r1 = $r0, 45 (0x2d);;
     _32(0x0c000c01),        //cb.wnez $r1? 16b94 <setup2+0x1ac>;;
     _64(0x00000002f101b400),        //compw.eq $r0 = $r0, 80 (0x50);;
     _32(0x0c000a00),        //cb.wnez $r0? 16b80 <setup2+0x198>;;
     _32(0x10000049),        //goto 16c08 <setup2+0x220>;;
     _96(0x000000008000011be0005200),        //make $r0 = 290120 (0x46d48);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x08000080),        //cb.dnez $r0? 16b08 <setup2+0x120>;;
     _32(0x1800009b),        //call 16d70 <abort>;;
     _96(0x000000008000011be0005200),        //make $r0 = 290120 (0x46d48);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _64(0x18000004a7010201),        //sd 4104 (0x1008)[$r1] = $r0;;
     _96(0x000000008000011be0004a00),        //make $r0 = 290088 (0x46d28);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x000000008000011be0004a00),        //make $r0 = 290088 (0x46d28);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x000000008000011be0005200),        //make $r0 = 290120 (0x46d48);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _96(0x000000008000011be0045200),        //make $r1 = 290120 (0x46d48);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _32(0x10000023),        //goto 16c08 <setup2+0x220>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000004fa000000),        //orw $r0 = $r0, 4096 (0x1000);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000001e),        //goto 16c08 <setup2+0x220>;;
     _96(0x000000008000011be0004a00),        //make $r0 = 290088 (0x46d28);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x000000008000011be0004a00),        //make $r0 = 290088 (0x46d28);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x000000008000011be0005200),        //make $r0 = 290120 (0x46d48);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _96(0x000000008000011be0045200),        //make $r1 = 290120 (0x46d48);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f001b040),        //compw.ne $r0 = $r0, 1 (0x1);;
     _32(0x0c000140),        //cb.wnez $r0? 16c00 <setup2+0x218>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000001fa008000),        //orw $r0 = $r0, 1536 (0x600);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x1000002e),        //goto 16cbc <setup2+0x2d4>;;
     _96(0x000000008000011be0004a00),        //make $r0 = 290088 (0x46d28);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x000000008000011be0004a00),        //make $r0 = 290088 (0x46d28);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _96(0x000000008000011be0005200),        //make $r0 = 290120 (0x46d48);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _96(0x000000008000011be0045200),        //make $r1 = 290120 (0x46d48);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x000000008000011be0004a00),        //make $r0 = 290088 (0x46d28);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x0e0002c0),        //cb.wlez $r0? 16c90 <setup2+0x2a8>;;
     _96(0x000000008000011be0005200),        //make $r0 = 290120 (0x46d48);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000001f101b340),        //compw.eq $r0 = $r0, 45 (0x2d);;
     _32(0x0c7fdc00),        //cb.wnez $r0? 16a4c <setup2+0x64>;;
     _96(0x000000008000011be0004a00),        //make $r0 = 290088 (0x46d28);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x0e000180),        //cb.wlez $r0? 16cb8 <setup2+0x2d0>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x78000040),        //andw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16cb8 <setup2+0x2d0>;;
     _32(0x1800002f),        //call 16d70 <abort>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
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
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _96(0x000000008000011be0004800),        //make $r0 = 290080 (0x46d20);;
     _96(0x00000000800000f8e0040200),        //make $r1 = 253960 (0x3e008);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _96(0x000000008000011be0002600),        //make $r0 = 289944 (0x46c98);;
     _32(0x60040004),        //make $r1 = 4 (0x4);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x1fffff37),        //call 169e8 <setup2>;;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _96(0x00000000800000fce004f800),        //make $r1 = 259040 (0x3f3e0);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x1ffffed5),        //call 16888 <setup1>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000001f8000000),        //andw $r0 = $r0, 1024 (0x400);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x088001c0),        //cb.deqz $r0? 16d64 <main+0x94>;;
     _96(0x000000008000011be0004c00),        //make $r0 = 290096 (0x46d30);;
     _32(0x30000400),        //lwz $r0 = 16 (0x10)[$r0];;
     _32(0x08000080),        //cb.dnez $r0? 16d64 <main+0x94>;;
     _32(0x18000004),        //call 16d70 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 16d90 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 17190 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18e68 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0xf838ffc0),        //zxwd $r14 = $r0
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x98000161),        //call 17328 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce000fa00),        //make $r0 = 259048 (0x3f3e8);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 16dcc <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 18e68 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110110011010000; //0x16cd0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100000101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(baz, 0b00010110100001000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(setup1, 0b00010110100010001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(setup2, 0b00010110100111101000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110110011010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110110101110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110110110010000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016cd0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
