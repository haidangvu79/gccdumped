// executing pipeline pr28982a.c.out.dumped test 
val k1_pipeline_pr28982a: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr28982a() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo: list_I = 
 [|
     _32(0x6130980c),        //addd $r12 = $r12, -416 (0xfffffe60);;
     _32(0x2601040c),        //sw 16 (0x10)[$r12] = $r0;;
     _96(0x000000008000011be0002600),        //make $r0 = 289944 (0x46c98);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x2601180c),        //sw 96 (0x60)[$r12] = $r0;;
     _96(0x000000008000011be0002600),        //make $r0 = 289944 (0x46c98);;
     _32(0x30000100),        //lwz $r0 = 4 (0x4)[$r0];;
     _32(0x2601170c),        //sw 92 (0x5c)[$r12] = $r0;;
     _96(0x000000008000011be0002600),        //make $r0 = 289944 (0x46c98);;
     _32(0x30000200),        //lwz $r0 = 8 (0x8)[$r0];;
     _32(0x2601160c),        //sw 88 (0x58)[$r12] = $r0;;
     _96(0x000000008000011be0002600),        //make $r0 = 289944 (0x46c98);;
     _32(0x30000300),        //lwz $r0 = 12 (0xc)[$r0];;
     _32(0x2601150c),        //sw 84 (0x54)[$r12] = $r0;;
     _96(0x000000008000011be0002600),        //make $r0 = 289944 (0x46c98);;
     _32(0x30000400),        //lwz $r0 = 16 (0x10)[$r0];;
     _32(0x2601140c),        //sw 80 (0x50)[$r12] = $r0;;
     _96(0x000000008000011be0002600),        //make $r0 = 289944 (0x46c98);;
     _32(0x30000500),        //lwz $r0 = 20 (0x14)[$r0];;
     _32(0x2601130c),        //sw 76 (0x4c)[$r12] = $r0;;
     _96(0x000000008000011be0002600),        //make $r0 = 289944 (0x46c98);;
     _32(0x30000600),        //lwz $r0 = 24 (0x18)[$r0];;
     _32(0x2601120c),        //sw 72 (0x48)[$r12] = $r0;;
     _96(0x000000008000011be0002600),        //make $r0 = 289944 (0x46c98);;
     _32(0x30000700),        //lwz $r0 = 28 (0x1c)[$r0];;
     _32(0x2601110c),        //sw 68 (0x44)[$r12] = $r0;;
     _96(0x000000008000011be0002600),        //make $r0 = 289944 (0x46c98);;
     _32(0x30000800),        //lwz $r0 = 32 (0x20)[$r0];;
     _32(0x2601100c),        //sw 64 (0x40)[$r12] = $r0;;
     _96(0x000000008000011be0002600),        //make $r0 = 289944 (0x46c98);;
     _32(0x30000900),        //lwz $r0 = 36 (0x24)[$r0];;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _96(0x000000008000011be0002600),        //make $r0 = 289944 (0x46c98);;
     _32(0x30000a00),        //lwz $r0 = 40 (0x28)[$r0];;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _96(0x000000008000011be0002600),        //make $r0 = 289944 (0x46c98);;
     _32(0x30000b00),        //lwz $r0 = 44 (0x2c)[$r0];;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _96(0x000000008000011be0002600),        //make $r0 = 289944 (0x46c98);;
     _32(0x30000c00),        //lwz $r0 = 48 (0x30)[$r0];;
     _32(0x26010c0c),        //sw 48 (0x30)[$r12] = $r0;;
     _96(0x000000008000011be0002600),        //make $r0 = 289944 (0x46c98);;
     _32(0x30000d00),        //lwz $r0 = 52 (0x34)[$r0];;
     _32(0x26010b0c),        //sw 44 (0x2c)[$r12] = $r0;;
     _96(0x000000008000011be0002600),        //make $r0 = 289944 (0x46c98);;
     _32(0x30000e00),        //lwz $r0 = 56 (0x38)[$r0];;
     _32(0x26010a0c),        //sw 40 (0x28)[$r12] = $r0;;
     _96(0x000000008000011be0002600),        //make $r0 = 289944 (0x46c98);;
     _32(0x30000f00),        //lwz $r0 = 60 (0x3c)[$r0];;
     _32(0x2601090c),        //sw 36 (0x24)[$r12] = $r0;;
     _96(0x000000008000011be0002600),        //make $r0 = 289944 (0x46c98);;
     _32(0x30001000),        //lwz $r0 = 64 (0x40)[$r0];;
     _32(0x2601080c),        //sw 32 (0x20)[$r12] = $r0;;
     _96(0x000000008000011be0002600),        //make $r0 = 289944 (0x46c98);;
     _32(0x30001100),        //lwz $r0 = 68 (0x44)[$r0];;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _96(0x000000008000011be0002600),        //make $r0 = 289944 (0x46c98);;
     _32(0x30001200),        //lwz $r0 = 72 (0x48)[$r0];;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _96(0x000000008000011be0002600),        //make $r0 = 289944 (0x46c98);;
     _32(0x30001300),        //lwz $r0 = 76 (0x4c)[$r0];;
     _32(0x2601050c),        //sw 20 (0x14)[$r12] = $r0;;
     _96(0x000000008000011be0009e00),        //make $r0 = 290424 (0x46e78);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x2701660c),        //sd 408 (0x198)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601650c),        //sw 404 (0x194)[$r12] = $r0;;
     _96(0x000000008000011be0009e00),        //make $r0 = 290424 (0x46e78);;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _32(0x2701620c),        //sd 392 (0x188)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601610c),        //sw 388 (0x184)[$r12] = $r0;;
     _96(0x000000008000011be0009e00),        //make $r0 = 290424 (0x46e78);;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x27015e0c),        //sd 376 (0x178)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26015d0c),        //sw 372 (0x174)[$r12] = $r0;;
     _96(0x000000008000011be0009e00),        //make $r0 = 290424 (0x46e78);;
     _32(0x38000600),        //ld $r0 = 24 (0x18)[$r0];;
     _32(0x27015a0c),        //sd 360 (0x168)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601590c),        //sw 356 (0x164)[$r12] = $r0;;
     _96(0x000000008000011be0009e00),        //make $r0 = 290424 (0x46e78);;
     _32(0x38000800),        //ld $r0 = 32 (0x20)[$r0];;
     _32(0x2701560c),        //sd 344 (0x158)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601550c),        //sw 340 (0x154)[$r12] = $r0;;
     _96(0x000000008000011be0009e00),        //make $r0 = 290424 (0x46e78);;
     _32(0x38000a00),        //ld $r0 = 40 (0x28)[$r0];;
     _32(0x2701520c),        //sd 328 (0x148)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601510c),        //sw 324 (0x144)[$r12] = $r0;;
     _96(0x000000008000011be0009e00),        //make $r0 = 290424 (0x46e78);;
     _32(0x38000c00),        //ld $r0 = 48 (0x30)[$r0];;
     _32(0x27014e0c),        //sd 312 (0x138)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26014d0c),        //sw 308 (0x134)[$r12] = $r0;;
     _96(0x000000008000011be0009e00),        //make $r0 = 290424 (0x46e78);;
     _32(0x38000e00),        //ld $r0 = 56 (0x38)[$r0];;
     _32(0x27014a0c),        //sd 296 (0x128)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601490c),        //sw 292 (0x124)[$r12] = $r0;;
     _96(0x000000008000011be0009e00),        //make $r0 = 290424 (0x46e78);;
     _32(0x38001000),        //ld $r0 = 64 (0x40)[$r0];;
     _32(0x2701460c),        //sd 280 (0x118)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601450c),        //sw 276 (0x114)[$r12] = $r0;;
     _96(0x000000008000011be0009e00),        //make $r0 = 290424 (0x46e78);;
     _32(0x38001200),        //ld $r0 = 72 (0x48)[$r0];;
     _32(0x2701420c),        //sd 264 (0x108)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601410c),        //sw 260 (0x104)[$r12] = $r0;;
     _96(0x000000008000011be0009e00),        //make $r0 = 290424 (0x46e78);;
     _32(0x38001400),        //ld $r0 = 80 (0x50)[$r0];;
     _32(0x27013e0c),        //sd 248 (0xf8)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26013d0c),        //sw 244 (0xf4)[$r12] = $r0;;
     _96(0x000000008000011be0009e00),        //make $r0 = 290424 (0x46e78);;
     _32(0x38001600),        //ld $r0 = 88 (0x58)[$r0];;
     _32(0x27013a0c),        //sd 232 (0xe8)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601390c),        //sw 228 (0xe4)[$r12] = $r0;;
     _96(0x000000008000011be0009e00),        //make $r0 = 290424 (0x46e78);;
     _32(0x38001800),        //ld $r0 = 96 (0x60)[$r0];;
     _32(0x2701360c),        //sd 216 (0xd8)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601350c),        //sw 212 (0xd4)[$r12] = $r0;;
     _96(0x000000008000011be0009e00),        //make $r0 = 290424 (0x46e78);;
     _32(0x38001a00),        //ld $r0 = 104 (0x68)[$r0];;
     _32(0x2701320c),        //sd 200 (0xc8)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601310c),        //sw 196 (0xc4)[$r12] = $r0;;
     _96(0x000000008000011be0009e00),        //make $r0 = 290424 (0x46e78);;
     _32(0x38001c00),        //ld $r0 = 112 (0x70)[$r0];;
     _32(0x27012e0c),        //sd 184 (0xb8)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26012d0c),        //sw 180 (0xb4)[$r12] = $r0;;
     _96(0x000000008000011be0009e00),        //make $r0 = 290424 (0x46e78);;
     _32(0x38001e00),        //ld $r0 = 120 (0x78)[$r0];;
     _32(0x27012a0c),        //sd 168 (0xa8)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601290c),        //sw 164 (0xa4)[$r12] = $r0;;
     _96(0x000000008000011be0009e00),        //make $r0 = 290424 (0x46e78);;
     _32(0x38002000),        //ld $r0 = 128 (0x80)[$r0];;
     _32(0x2701260c),        //sd 152 (0x98)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601250c),        //sw 148 (0x94)[$r12] = $r0;;
     _96(0x000000008000011be0009e00),        //make $r0 = 290424 (0x46e78);;
     _32(0x38002200),        //ld $r0 = 136 (0x88)[$r0];;
     _32(0x2701220c),        //sd 136 (0x88)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601210c),        //sw 132 (0x84)[$r12] = $r0;;
     _96(0x000000008000011be0009e00),        //make $r0 = 290424 (0x46e78);;
     _32(0x38002400),        //ld $r0 = 144 (0x90)[$r0];;
     _32(0x27011e0c),        //sd 120 (0x78)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26011d0c),        //sw 116 (0x74)[$r12] = $r0;;
     _96(0x000000008000011be0009e00),        //make $r0 = 290424 (0x46e78);;
     _32(0x38002600),        //ld $r0 = 152 (0x98)[$r0];;
     _32(0x27011a0c),        //sd 104 (0x68)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601190c),        //sw 100 (0x64)[$r12] = $r0;;
     _32(0x100000c9),        //goto 16f0c <foo+0x6ec>;;
     _32(0x3800660c),        //ld $r0 = 408 (0x198)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x3004650c),        //lwz $r1 = 404 (0x194)[$r12];;
     _32(0x5c027001),        //faddw $r0 = $r1, $r0;;
     _32(0x2601650c),        //sw 404 (0x194)[$r12] = $r0;;
     _32(0x3400180c),        //lws $r0 = 96 (0x60)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x3804660c),        //ld $r1 = 408 (0x198)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x2701660c),        //sd 408 (0x198)[$r12] = $r0;;
     _32(0x3800620c),        //ld $r0 = 392 (0x188)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x3004610c),        //lwz $r1 = 388 (0x184)[$r12];;
     _32(0x5c027001),        //faddw $r0 = $r1, $r0;;
     _32(0x2601610c),        //sw 388 (0x184)[$r12] = $r0;;
     _32(0x3400170c),        //lws $r0 = 92 (0x5c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x3804620c),        //ld $r1 = 392 (0x188)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x2701620c),        //sd 392 (0x188)[$r12] = $r0;;
     _32(0x38005e0c),        //ld $r0 = 376 (0x178)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x30045d0c),        //lwz $r1 = 372 (0x174)[$r12];;
     _32(0x5c027001),        //faddw $r0 = $r1, $r0;;
     _32(0x26015d0c),        //sw 372 (0x174)[$r12] = $r0;;
     _32(0x3400160c),        //lws $r0 = 88 (0x58)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x38045e0c),        //ld $r1 = 376 (0x178)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x27015e0c),        //sd 376 (0x178)[$r12] = $r0;;
     _32(0x38005a0c),        //ld $r0 = 360 (0x168)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x3004590c),        //lwz $r1 = 356 (0x164)[$r12];;
     _32(0x5c027001),        //faddw $r0 = $r1, $r0;;
     _32(0x2601590c),        //sw 356 (0x164)[$r12] = $r0;;
     _32(0x3400150c),        //lws $r0 = 84 (0x54)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x38045a0c),        //ld $r1 = 360 (0x168)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x27015a0c),        //sd 360 (0x168)[$r12] = $r0;;
     _32(0x3800560c),        //ld $r0 = 344 (0x158)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x3004550c),        //lwz $r1 = 340 (0x154)[$r12];;
     _32(0x5c027001),        //faddw $r0 = $r1, $r0;;
     _32(0x2601550c),        //sw 340 (0x154)[$r12] = $r0;;
     _32(0x3400140c),        //lws $r0 = 80 (0x50)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x3804560c),        //ld $r1 = 344 (0x158)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x2701560c),        //sd 344 (0x158)[$r12] = $r0;;
     _32(0x3800520c),        //ld $r0 = 328 (0x148)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x3004510c),        //lwz $r1 = 324 (0x144)[$r12];;
     _32(0x5c027001),        //faddw $r0 = $r1, $r0;;
     _32(0x2601510c),        //sw 324 (0x144)[$r12] = $r0;;
     _32(0x3400130c),        //lws $r0 = 76 (0x4c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x3804520c),        //ld $r1 = 328 (0x148)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x2701520c),        //sd 328 (0x148)[$r12] = $r0;;
     _32(0x38004e0c),        //ld $r0 = 312 (0x138)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x30044d0c),        //lwz $r1 = 308 (0x134)[$r12];;
     _32(0x5c027001),        //faddw $r0 = $r1, $r0;;
     _32(0x26014d0c),        //sw 308 (0x134)[$r12] = $r0;;
     _32(0x3400120c),        //lws $r0 = 72 (0x48)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x38044e0c),        //ld $r1 = 312 (0x138)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x27014e0c),        //sd 312 (0x138)[$r12] = $r0;;
     _32(0x38004a0c),        //ld $r0 = 296 (0x128)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x3004490c),        //lwz $r1 = 292 (0x124)[$r12];;
     _32(0x5c027001),        //faddw $r0 = $r1, $r0;;
     _32(0x2601490c),        //sw 292 (0x124)[$r12] = $r0;;
     _32(0x3400110c),        //lws $r0 = 68 (0x44)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x38044a0c),        //ld $r1 = 296 (0x128)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x27014a0c),        //sd 296 (0x128)[$r12] = $r0;;
     _32(0x3800460c),        //ld $r0 = 280 (0x118)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x3004450c),        //lwz $r1 = 276 (0x114)[$r12];;
     _32(0x5c027001),        //faddw $r0 = $r1, $r0;;
     _32(0x2601450c),        //sw 276 (0x114)[$r12] = $r0;;
     _32(0x3400100c),        //lws $r0 = 64 (0x40)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x3804460c),        //ld $r1 = 280 (0x118)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x2701460c),        //sd 280 (0x118)[$r12] = $r0;;
     _32(0x3800420c),        //ld $r0 = 264 (0x108)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x3004410c),        //lwz $r1 = 260 (0x104)[$r12];;
     _32(0x5c027001),        //faddw $r0 = $r1, $r0;;
     _32(0x2601410c),        //sw 260 (0x104)[$r12] = $r0;;
     _32(0x34000f0c),        //lws $r0 = 60 (0x3c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x3804420c),        //ld $r1 = 264 (0x108)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x2701420c),        //sd 264 (0x108)[$r12] = $r0;;
     _32(0x38003e0c),        //ld $r0 = 248 (0xf8)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x30043d0c),        //lwz $r1 = 244 (0xf4)[$r12];;
     _32(0x5c027001),        //faddw $r0 = $r1, $r0;;
     _32(0x26013d0c),        //sw 244 (0xf4)[$r12] = $r0;;
     _32(0x34000e0c),        //lws $r0 = 56 (0x38)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x38043e0c),        //ld $r1 = 248 (0xf8)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x27013e0c),        //sd 248 (0xf8)[$r12] = $r0;;
     _32(0x38003a0c),        //ld $r0 = 232 (0xe8)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x3004390c),        //lwz $r1 = 228 (0xe4)[$r12];;
     _32(0x5c027001),        //faddw $r0 = $r1, $r0;;
     _32(0x2601390c),        //sw 228 (0xe4)[$r12] = $r0;;
     _32(0x34000d0c),        //lws $r0 = 52 (0x34)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x38043a0c),        //ld $r1 = 232 (0xe8)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x27013a0c),        //sd 232 (0xe8)[$r12] = $r0;;
     _32(0x3800360c),        //ld $r0 = 216 (0xd8)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x3004350c),        //lwz $r1 = 212 (0xd4)[$r12];;
     _32(0x5c027001),        //faddw $r0 = $r1, $r0;;
     _32(0x2601350c),        //sw 212 (0xd4)[$r12] = $r0;;
     _32(0x34000c0c),        //lws $r0 = 48 (0x30)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x3804360c),        //ld $r1 = 216 (0xd8)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x2701360c),        //sd 216 (0xd8)[$r12] = $r0;;
     _32(0x3800320c),        //ld $r0 = 200 (0xc8)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x3004310c),        //lwz $r1 = 196 (0xc4)[$r12];;
     _32(0x5c027001),        //faddw $r0 = $r1, $r0;;
     _32(0x2601310c),        //sw 196 (0xc4)[$r12] = $r0;;
     _32(0x34000b0c),        //lws $r0 = 44 (0x2c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x3804320c),        //ld $r1 = 200 (0xc8)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x2701320c),        //sd 200 (0xc8)[$r12] = $r0;;
     _32(0x38002e0c),        //ld $r0 = 184 (0xb8)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x30042d0c),        //lwz $r1 = 180 (0xb4)[$r12];;
     _32(0x5c027001),        //faddw $r0 = $r1, $r0;;
     _32(0x26012d0c),        //sw 180 (0xb4)[$r12] = $r0;;
     _32(0x34000a0c),        //lws $r0 = 40 (0x28)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x38042e0c),        //ld $r1 = 184 (0xb8)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x27012e0c),        //sd 184 (0xb8)[$r12] = $r0;;
     _32(0x38002a0c),        //ld $r0 = 168 (0xa8)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x3004290c),        //lwz $r1 = 164 (0xa4)[$r12];;
     _32(0x5c027001),        //faddw $r0 = $r1, $r0;;
     _32(0x2601290c),        //sw 164 (0xa4)[$r12] = $r0;;
     _32(0x3400090c),        //lws $r0 = 36 (0x24)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x38042a0c),        //ld $r1 = 168 (0xa8)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x27012a0c),        //sd 168 (0xa8)[$r12] = $r0;;
     _32(0x3800260c),        //ld $r0 = 152 (0x98)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x3004250c),        //lwz $r1 = 148 (0x94)[$r12];;
     _32(0x5c027001),        //faddw $r0 = $r1, $r0;;
     _32(0x2601250c),        //sw 148 (0x94)[$r12] = $r0;;
     _32(0x3400080c),        //lws $r0 = 32 (0x20)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x3804260c),        //ld $r1 = 152 (0x98)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x2701260c),        //sd 152 (0x98)[$r12] = $r0;;
     _32(0x3800220c),        //ld $r0 = 136 (0x88)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x3004210c),        //lwz $r1 = 132 (0x84)[$r12];;
     _32(0x5c027001),        //faddw $r0 = $r1, $r0;;
     _32(0x2601210c),        //sw 132 (0x84)[$r12] = $r0;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x3804220c),        //ld $r1 = 136 (0x88)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x2701220c),        //sd 136 (0x88)[$r12] = $r0;;
     _32(0x38001e0c),        //ld $r0 = 120 (0x78)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x30041d0c),        //lwz $r1 = 116 (0x74)[$r12];;
     _32(0x5c027001),        //faddw $r0 = $r1, $r0;;
     _32(0x26011d0c),        //sw 116 (0x74)[$r12] = $r0;;
     _32(0x3400060c),        //lws $r0 = 24 (0x18)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x38041e0c),        //ld $r1 = 120 (0x78)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x27011e0c),        //sd 120 (0x78)[$r12] = $r0;;
     _32(0x38001a0c),        //ld $r0 = 104 (0x68)[$r12];;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x3004190c),        //lwz $r1 = 100 (0x64)[$r12];;
     _32(0x5c027001),        //faddw $r0 = $r1, $r0;;
     _32(0x2601190c),        //sw 100 (0x64)[$r12] = $r0;;
     _32(0x3400050c),        //lws $r0 = 20 (0x14)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x38041a0c),        //ld $r1 = 104 (0x68)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x27011a0c),        //sd 104 (0x68)[$r12] = $r0;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x7104ffc0),        //addw $r1 = $r0, -1 (0xffffffff);;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x087fcd40),        //cb.dnez $r0? 16bec <foo+0x3cc>;;
     _96(0x000000008000011be0048a00),        //make $r1 = 290344 (0x46e28);;
     _32(0x3000650c),        //lwz $r0 = 404 (0x194)[$r12];;
     _32(0x26010001),        //sw 0 (0x0)[$r1] = $r0;;
     _96(0x000000008000011be0048a00),        //make $r1 = 290344 (0x46e28);;
     _32(0x3000610c),        //lwz $r0 = 388 (0x184)[$r12];;
     _32(0x26010101),        //sw 4 (0x4)[$r1] = $r0;;
     _96(0x000000008000011be0048a00),        //make $r1 = 290344 (0x46e28);;
     _32(0x30005d0c),        //lwz $r0 = 372 (0x174)[$r12];;
     _32(0x26010201),        //sw 8 (0x8)[$r1] = $r0;;
     _96(0x000000008000011be0048a00),        //make $r1 = 290344 (0x46e28);;
     _32(0x3000590c),        //lwz $r0 = 356 (0x164)[$r12];;
     _32(0x26010301),        //sw 12 (0xc)[$r1] = $r0;;
     _96(0x000000008000011be0048a00),        //make $r1 = 290344 (0x46e28);;
     _32(0x3000550c),        //lwz $r0 = 340 (0x154)[$r12];;
     _32(0x26010401),        //sw 16 (0x10)[$r1] = $r0;;
     _96(0x000000008000011be0048a00),        //make $r1 = 290344 (0x46e28);;
     _32(0x3000510c),        //lwz $r0 = 324 (0x144)[$r12];;
     _32(0x26010501),        //sw 20 (0x14)[$r1] = $r0;;
     _96(0x000000008000011be0048a00),        //make $r1 = 290344 (0x46e28);;
     _32(0x30004d0c),        //lwz $r0 = 308 (0x134)[$r12];;
     _32(0x26010601),        //sw 24 (0x18)[$r1] = $r0;;
     _96(0x000000008000011be0048a00),        //make $r1 = 290344 (0x46e28);;
     _32(0x3000490c),        //lwz $r0 = 292 (0x124)[$r12];;
     _32(0x26010701),        //sw 28 (0x1c)[$r1] = $r0;;
     _96(0x000000008000011be0048a00),        //make $r1 = 290344 (0x46e28);;
     _32(0x3000450c),        //lwz $r0 = 276 (0x114)[$r12];;
     _32(0x26010801),        //sw 32 (0x20)[$r1] = $r0;;
     _96(0x000000008000011be0048a00),        //make $r1 = 290344 (0x46e28);;
     _32(0x3000410c),        //lwz $r0 = 260 (0x104)[$r12];;
     _32(0x26010901),        //sw 36 (0x24)[$r1] = $r0;;
     _96(0x000000008000011be0048a00),        //make $r1 = 290344 (0x46e28);;
     _32(0x30003d0c),        //lwz $r0 = 244 (0xf4)[$r12];;
     _32(0x26010a01),        //sw 40 (0x28)[$r1] = $r0;;
     _96(0x000000008000011be0048a00),        //make $r1 = 290344 (0x46e28);;
     _32(0x3000390c),        //lwz $r0 = 228 (0xe4)[$r12];;
     _32(0x26010b01),        //sw 44 (0x2c)[$r1] = $r0;;
     _96(0x000000008000011be0048a00),        //make $r1 = 290344 (0x46e28);;
     _32(0x3000350c),        //lwz $r0 = 212 (0xd4)[$r12];;
     _32(0x26010c01),        //sw 48 (0x30)[$r1] = $r0;;
     _96(0x000000008000011be0048a00),        //make $r1 = 290344 (0x46e28);;
     _32(0x3000310c),        //lwz $r0 = 196 (0xc4)[$r12];;
     _32(0x26010d01),        //sw 52 (0x34)[$r1] = $r0;;
     _96(0x000000008000011be0048a00),        //make $r1 = 290344 (0x46e28);;
     _32(0x30002d0c),        //lwz $r0 = 180 (0xb4)[$r12];;
     _32(0x26010e01),        //sw 56 (0x38)[$r1] = $r0;;
     _96(0x000000008000011be0048a00),        //make $r1 = 290344 (0x46e28);;
     _32(0x3000290c),        //lwz $r0 = 164 (0xa4)[$r12];;
     _32(0x26010f01),        //sw 60 (0x3c)[$r1] = $r0;;
     _96(0x000000008000011be0048a00),        //make $r1 = 290344 (0x46e28);;
     _32(0x3000250c),        //lwz $r0 = 148 (0x94)[$r12];;
     _32(0x26011001),        //sw 64 (0x40)[$r1] = $r0;;
     _96(0x000000008000011be0048a00),        //make $r1 = 290344 (0x46e28);;
     _32(0x3000210c),        //lwz $r0 = 132 (0x84)[$r12];;
     _32(0x26011101),        //sw 68 (0x44)[$r1] = $r0;;
     _96(0x000000008000011be0048a00),        //make $r1 = 290344 (0x46e28);;
     _32(0x30001d0c),        //lwz $r0 = 116 (0x74)[$r12];;
     _32(0x26011201),        //sw 72 (0x48)[$r1] = $r0;;
     _96(0x000000008000011be0048a00),        //make $r1 = 290344 (0x46e28);;
     _32(0x3000190c),        //lwz $r0 = 100 (0x64)[$r12];;
     _32(0x26011301),        //sw 76 (0x4c)[$r1] = $r0;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130680c),        //addd $r12 = $r12, 416 (0x1a0);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000014),        //goto 1711c <main+0x64>;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _96(0x000000008000011be1043a00),        //addd $r1 = $r0, 290024 (0x46ce8);;
     _96(0x000000008000011be0089e00),        //make $r2 = 290424 (0x46e78);;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x2707f002),        //sd.xs $r0[$r2] = $r1;;
     _96(0x000000008000011be0082600),        //make $r2 = 289944 (0x46c98);;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x2607f002),        //sw.xs $r0[$r2] = $r1;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f401b4c0),        //compw.le $r0 = $r0, 19 (0x13);;
     _32(0x0c7ffa80),        //cb.wnez $r0? 170d0 <main+0x18>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x1000000b),        //goto 17160 <main+0xa8>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x48070000),        //floatw.rn $r1 = $r0, 0 (0x0);;
     _96(0x000000008000011be0083a00),        //make $r2 = 290024 (0x46ce8);;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x2607f002),        //sw.xs $r0[$r2] = $r1;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000002f401b3c0),        //compw.le $r0 = $r0, 79 (0x4f);;
     _32(0x0c7ffcc0),        //cb.wnez $r0? 17138 <main+0x80>;;
     _32(0x60000004),        //make $r0 = 4 (0x4);;
     _32(0x1ffffdab),        //call 16820 <foo>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000014),        //goto 171d0 <main+0x118>;;
     _96(0x000000008000011be0048a00),        //make $r1 = 290344 (0x46e28);;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x300af001),        //lwz.xs $r2 = $r0[$r1];;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x79023080),        //sllw $r0 = $r0, 2 (0x2);;
     _32(0x71011040),        //addw $r0 = $r0, $r1;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x48030000),        //floatw.rn $r0 = $r0, 0 (0x0);;
     _32(0x72030002),        //fcompw.oeq $r0 = $r2, $r0;;
     _32(0x080000c0),        //cb.dnez $r0? 171c4 <main+0x10c>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x10000009),        //goto 171e4 <main+0x12c>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f401b4c0),        //compw.le $r0 = $r0, 19 (0x13);;
     _32(0x0c7ffa80),        //cb.wnez $r0? 17184 <main+0xcc>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010111000010111000; //0x170b8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010111000010111000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000170b8;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
