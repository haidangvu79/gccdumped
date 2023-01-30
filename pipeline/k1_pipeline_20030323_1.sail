// executing pipeline 20030323_1.c.out.dumped test 
val k1_pipeline_20030323_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20030323_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let NSReturnAddress: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2739020c),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0x6138020c),        //addd $r14 = $r12, 8 (0x8);;
     _32(0x2601040e),        //sw 16 (0x10)[$r14] = $r0;;
     _32(0x3000040e),        //lwz $r0 = 16 (0x10)[$r14];;
     _64(0x00000003f901b0c0),        //compw.gtu $r0 = $r0, 99 (0x63);;
     _32(0x0c003400),        //cb.wnez $r0? 16b84 <NSReturnAddress+0x364>;;
     _32(0x3000040e),        //lwz $r0 = 16 (0x10)[$r14];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _96(0x00000000800000fce100f000),        //addd $r0 = $r0, 259008 (0x3f3c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x0fd80000),        //igoto $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x100000c8),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x100000c6),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x100000c4),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x100000c2),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x100000c0),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x100000be),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x100000bc),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x100000ba),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x100000b8),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x100000b6),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x100000b4),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x100000b2),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x100000b0),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x100000ae),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x100000ac),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x100000aa),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x100000a8),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x100000a6),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x100000a4),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x100000a2),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x100000a0),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000009e),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000009c),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000009a),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000098),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000096),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000094),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000092),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000090),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000008e),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000008c),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000008a),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000088),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000086),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000084),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000082),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000080),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000007e),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000007c),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000007a),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000078),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000076),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000074),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000072),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000070),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000006e),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000006c),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000006a),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000068),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000066),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000064),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000062),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000060),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000005e),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000005c),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000005a),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000058),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000056),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000054),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000052),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000050),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000004e),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000004c),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000004a),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000048),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000046),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000044),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000042),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000040),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000003e),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000003c),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000003a),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000038),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000036),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000034),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000032),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000030),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000002e),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000002c),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000002a),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000028),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000026),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000024),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000022),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000020),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000001e),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000001c),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000001a),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000018),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000016),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000014),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000012),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000010),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000000e),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000000c),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1000000a),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000008),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000006),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000004),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x10000002),        //goto 16b88 <NSReturnAddress+0x368>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x6130fe0e),        //addd $r12 = $r14, -8 (0xfffffff8);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x0fd00000)        //ret ;;
 |];

let __libc_fini_array: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _96(0x800000d8a749040ce0480000),        //make $r18 = 221184 (0x36000)
     _32(0x00000000),        //sd 16 (0x10)[$r12] = $r18;;
     _96(0x800000d8a739020ce5380012),        //sbfd $r14 = $r18, 221184 (0x36000)
     _32(0x00000000),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0xfa3a20ce),        //srad $r14 = $r14, 3 (0x3)
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x0880014e),        //cb.deqz $r14? 16bec <__libc_fini_array+0x44>;;
     _32(0x6138ffce),        //addd $r14 = $r14, -1 (0xffffffff);;
     _32(0x3802f392),        //ld.xs $r0 = $r14[$r18];;
     _32(0x0fdc0000),        //icall $r0;;
     _32(0x087fff4e),        //cb.dnez $r14? 16bdc <__libc_fini_array+0x34>;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3848040c),        //ld $r18 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let __libc_init_array: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _96(0x800000d8a849020ce04c0000),        //make $r19 = 221184 (0x36000)
     _32(0x00000000),        //sq 8 (0x8)[$r12] = $r18r19;;
     _32(0xe0380000),        //make $r14 = 0 (0x0)
     _96(0x880000d8a739000ce5480013),        //sbfd $r18 = $r19, 221184 (0x36000)
     _32(0x08000000),        //sd 0 (0x0)[$r12] = $r14;;
     _32(0xfa4a20d2),        //srad $r18 = $r18, 3 (0x3)
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x08800192),        //cb.deqz $r18? 16c54 <__libc_init_array+0x4c>;;
     _32(0xe138004e),        //addd $r14 = $r14, 1 (0x1)
     _32(0x3802f393),        //ld.xs $r0 = $r14[$r19];;
     _32(0x0fdc0000),        //icall $r0;;
     _32(0x7001a392),        //compd.ne $r0 = $r18, $r14;;
     _32(0x087fff00),        //cb.dnez $r0? 16c40 <__libc_init_array+0x38>;;
     _32(0xe0380000),        //make $r14 = 0 (0x0)
     _96(0x08000000880000d8e04c0000),        //make $r19 = 221184 (0x36000);;
     _96(0x00000000800000d8e5480013),        //sbfd $r18 = $r19, 221184 (0x36000);;
     _32(0x7a4a20d2),        //srad $r18 = $r18, 3 (0x3);;
     _32(0x08800192),        //cb.deqz $r18? 16c8c <__libc_init_array+0x84>;;
     _32(0xe138004e),        //addd $r14 = $r14, 1 (0x1)
     _32(0x3802f393),        //ld.xs $r0 = $r14[$r19];;
     _32(0x0fdc0000),        //icall $r0;;
     _32(0x7001a392),        //compd.ne $r0 = $r18, $r14;;
     _32(0x087fff00),        //cb.dnez $r0? 16c78 <__libc_init_array+0x70>;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0xe130080c),        //addd $r12 = $r12, 32 (0x20)
     _32(0x3c48020c),        //lq $r18r19 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101110100000; //0x16ba0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(NSReturnAddress, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101110100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__libc_fini_array, 0b00010110101110101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(__libc_init_array, 0b00010110110000001000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016ba0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
