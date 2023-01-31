// executing pipeline 20010122_1 test 
val k1_pipeline_20010122_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20010122_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let test1: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x0fc400c0),        //get $r0 = $ra;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let test2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2739020c),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0x0fc400ce),        //get $r14 = $ra;;
     _32(0x1800013d),        //call 16d50 <dummy>;;
     _32(0x2739060c),        //sd 24 (0x18)[$r12] = $r14;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test3: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x0fc400c0),        //get $r0 = $ra;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x1800012f),        //call 16d50 <dummy>;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test4: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2739020c),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0x6138020c),        //addd $r14 = $r12, 8 (0x8);;
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x7b022140),        //srld $r0 = $r0, 5 (0x5);;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x2701040e),        //sd 16 (0x10)[$r14] = $r0;;
     _32(0x3800040e),        //ld $r0 = 16 (0x10)[$r14];;
     _32(0x18000008),        //call 16900 <test4a>;;
     _32(0x6130fe0e),        //addd $r12 = $r14, -8 (0xfffffff8);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test4a: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2739000c),        //sd 0 (0x0)[$r12] = $r14;;
     _32(0x6138000c),        //addd $r14 = $r12, 0 (0x0);;
     _32(0x2701040e),        //sd 16 (0x10)[$r14] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701060e),        //sd 24 (0x18)[$r14] = $r0;;
     _32(0x3800060e),        //ld $r0 = 24 (0x18)[$r14];;
     _32(0x6130000e),        //addd $r12 = $r14, 0 (0x0);;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test5: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2739020c),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0x6138020c),        //addd $r14 = $r12, 8 (0x8);;
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x7b022140),        //srld $r0 = $r0, 5 (0x5);;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x2701040e),        //sd 16 (0x10)[$r14] = $r0;;
     _32(0x3800040e),        //ld $r0 = 16 (0x10)[$r14];;
     _32(0x18000008),        //call 16990 <test5a>;;
     _32(0x6130fe0e),        //addd $r12 = $r14, -8 (0xfffffff8);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test5a: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2739000c),        //sd 0 (0x0)[$r12] = $r14;;
     _32(0x6138000c),        //addd $r14 = $r12, 0 (0x0);;
     _32(0x2701040e),        //sd 16 (0x10)[$r14] = $r0;;
     _32(0x180000ea),        //call 16d50 <dummy>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701060e),        //sd 24 (0x18)[$r14] = $r0;;
     _32(0x3800060e),        //ld $r0 = 24 (0x18)[$r14];;
     _32(0x6130000e),        //addd $r12 = $r14, 0 (0x0);;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let test6: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2739020c),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0x6138020c),        //addd $r14 = $r12, 8 (0x8);;
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x7b022140),        //srld $r0 = $r0, 5 (0x5);;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x2701040e),        //sd 16 (0x10)[$r14] = $r0;;
     _32(0x3800040e),        //ld $r0 = 16 (0x10)[$r14];;
     _32(0x18000008),        //call 16a20 <test6a>;;
     _32(0x6130fe0e),        //addd $r12 = $r14, -8 (0xfffffff8);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test6a: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2739000c),        //sd 0 (0x0)[$r12] = $r14;;
     _32(0x6138000c),        //addd $r14 = $r12, 0 (0x0);;
     _32(0x2701040e),        //sd 16 (0x10)[$r14] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2701060e),        //sd 24 (0x18)[$r14] = $r0;;
     _32(0x180000c4),        //call 16d50 <dummy>;;
     _32(0x3800060e),        //ld $r0 = 24 (0x18)[$r14];;
     _32(0x6130000e),        //addd $r12 = $r14, 0 (0x0);;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838000c),        //ld $r14 = 0 (0x0)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let call_func1: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fce0040200),        //make $r1 = 258056 (0x3f008);;
     _32(0x3400060c),        //lws $r0 = 24 (0x18)[$r12];;
     _32(0x3802f001),        //ld.xs $r0 = $r0[$r1];;
     _32(0x0fdc0000),        //icall $r0;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x000000008000011be0084200),        //make $r2 = 290056 (0x46d08);;
     _32(0x3400060c),        //lws $r0 = 24 (0x18)[$r12];;
     _32(0x2707f002),        //sd.xs $r0[$r2] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test7: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x0fc400c0),        //get $r0 = $ra;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x000000008000010ae0008000),        //make $r0 = 272896 (0x42a00);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let test8: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x0fc400ce),        //get $r14 = $ra;;
     _32(0x18000093),        //call 16d50 <dummy>;;
     _32(0x6a04000e),        //copyd $r1 = $r14;;
     _96(0x000000008000010ae0008000),        //make $r0 = 272896 (0x42a00);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838040c),        //ld $r14 = 16 (0x10)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test9: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x0fc400c0),        //get $r0 = $ra;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _96(0x000000008000010ae0008000),        //make $r0 = 272896 (0x42a00);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x1800007d),        //call 16d50 <dummy>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test10: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2739020c),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0x6138020c),        //addd $r14 = $r12, 8 (0x8);;
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x7b022140),        //srld $r0 = $r0, 5 (0x5);;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x2701040e),        //sd 16 (0x10)[$r14] = $r0;;
     _32(0x3800040e),        //ld $r0 = 16 (0x10)[$r14];;
     _32(0x18000008),        //call 16bc8 <test10a>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130fe0e),        //addd $r12 = $r14, -8 (0xfffffff8);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let test10a: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2739020c),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0x6138020c),        //addd $r14 = $r12, 8 (0x8);;
     _32(0x2701040e),        //sd 16 (0x10)[$r14] = $r0;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _96(0x000000008000010ae0008000),        //make $r0 = 272896 (0x42a00);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130fe0e),        //addd $r12 = $r14, -8 (0xfffffff8);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let test11: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2739020c),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0x6138020c),        //addd $r14 = $r12, 8 (0x8);;
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x7b022140),        //srld $r0 = $r0, 5 (0x5);;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x2701040e),        //sd 16 (0x10)[$r14] = $r0;;
     _32(0x3800040e),        //ld $r0 = 16 (0x10)[$r14];;
     _32(0x18000008),        //call 16c60 <test11a>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130fe0e),        //addd $r12 = $r14, -8 (0xfffffff8);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let test11a: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2739020c),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0x6138020c),        //addd $r14 = $r12, 8 (0x8);;
     _32(0x2701040e),        //sd 16 (0x10)[$r14] = $r0;;
     _32(0x18000036),        //call 16d50 <dummy>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _96(0x000000008000010ae0008000),        //make $r0 = 272896 (0x42a00);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130fe0e),        //addd $r12 = $r14, -8 (0xfffffff8);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test12: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2739020c),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0x6138020c),        //addd $r14 = $r12, 8 (0x8);;
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x7b022140),        //srld $r0 = $r0, 5 (0x5);;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x2701040e),        //sd 16 (0x10)[$r14] = $r0;;
     _32(0x3800040e),        //ld $r0 = 16 (0x10)[$r14];;
     _32(0x18000008),        //call 16d00 <test12a>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130fe0e),        //addd $r12 = $r14, -8 (0xfffffff8);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let test12a: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2739020c),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0x6138020c),        //addd $r14 = $r12, 8 (0x8);;
     _32(0x2701040e),        //sd 16 (0x10)[$r14] = $r0;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _96(0x000000008000010ae0008000),        //make $r0 = 272896 (0x42a00);;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x18000009),        //call 16d50 <dummy>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130fe0e),        //addd $r12 = $r14, -8 (0xfffffff8);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let dummy: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2739020c),        //sd 8 (0x8)[$r12] = $r14;;
     _32(0x6138020c),        //addd $r14 = $r12, 8 (0x8);;
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x7b022140),        //srld $r0 = $r0, 5 (0x5);;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x2701040e),        //sd 16 (0x10)[$r14] = $r0;;
     _32(0x3800040e),        //ld $r0 = 16 (0x10)[$r14];;
     _32(0x6130fe0e),        //addd $r12 = $r14, -8 (0xfffffff8);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3838020c),        //ld $r14 = 8 (0x8)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let call_func2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fce0040e00),        //make $r1 = 258104 (0x3f038);;
     _32(0x3400060c),        //lws $r0 = 24 (0x18)[$r12];;
     _32(0x3802f001),        //ld.xs $r0 = $r0[$r1];;
     _32(0x0fdc0000),        //icall $r0;;
     _96(0x000000008000010ae0008000),        //make $r0 = 272896 (0x42a00);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x000000008000011be0084e00),        //make $r2 = 290104 (0x46d38);;
     _32(0x3400060c),        //lws $r0 = 24 (0x18)[$r12];;
     _32(0x2707f002),        //sd.xs $r0[$r2] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000006),        //goto 16e24 <main+0x2c>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x1fffff13),        //call 16a60 <call_func1>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f401b140),        //compw.le $r0 = $r0, 5 (0x5);;
     _32(0x0c7ffe00),        //cb.wnez $r0? 16e10 <main+0x18>;;
     _96(0x000000008000011be0004200),        //make $r0 = 290056 (0x46d08);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x000000008000011be0004200),        //make $r0 = 290056 (0x46d08);;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _32(0x7001a001),        //compd.ne $r0 = $r1, $r0;;
     _32(0x080002c0),        //cb.dnez $r0? 16e84 <main+0x8c>;;
     _96(0x000000008000011be0004200),        //make $r0 = 290056 (0x46d08);;
     _32(0x38040200),        //ld $r1 = 8 (0x8)[$r0];;
     _96(0x000000008000011be0004200),        //make $r0 = 290056 (0x46d08);;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16e88 <main+0x90>;;
     _32(0x1800006f),        //call 17040 <abort>;;
     _96(0x000000008000011be0004200),        //make $r0 = 290056 (0x46d08);;
     _32(0x38040600),        //ld $r1 = 24 (0x18)[$r0];;
     _96(0x000000008000011be0004200),        //make $r0 = 290056 (0x46d08);;
     _32(0x38000800),        //ld $r0 = 32 (0x20)[$r0];;
     _32(0x7001a001),        //compd.ne $r0 = $r1, $r0;;
     _32(0x080002c0),        //cb.dnez $r0? 16ed8 <main+0xe0>;;
     _96(0x000000008000011be0004200),        //make $r0 = 290056 (0x46d08);;
     _32(0x38040800),        //ld $r1 = 32 (0x20)[$r0];;
     _96(0x000000008000011be0004200),        //make $r0 = 290056 (0x46d08);;
     _32(0x38000a00),        //ld $r0 = 40 (0x28)[$r0];;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16edc <main+0xe4>;;
     _32(0x1800005a),        //call 17040 <abort>;;
     _96(0x000000008000011be0004200),        //make $r0 = 290056 (0x46d08);;
     _32(0x38000600),        //ld $r0 = 24 (0x18)[$r0];;
     _32(0x08800300),        //cb.deqz $r0? 16f1c <main+0x124>;;
     _96(0x000000008000011be0004200),        //make $r0 = 290056 (0x46d08);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x000000008000011be0004200),        //make $r0 = 290056 (0x46d08);;
     _32(0x38000600),        //ld $r0 = 24 (0x18)[$r0];;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16f1c <main+0x124>;;
     _32(0x1800004a),        //call 17040 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x10000006),        //goto 16f3c <main+0x144>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x1fffff9b),        //call 16d98 <call_func2>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x00000000f401b140),        //compw.le $r0 = $r0, 5 (0x5);;
     _32(0x0c7ffe00),        //cb.wnez $r0? 16f28 <main+0x130>;;
     _96(0x000000008000011be0004e00),        //make $r0 = 290104 (0x46d38);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x000000008000011be0004e00),        //make $r0 = 290104 (0x46d38);;
     _32(0x38000200),        //ld $r0 = 8 (0x8)[$r0];;
     _32(0x7001a001),        //compd.ne $r0 = $r1, $r0;;
     _32(0x080002c0),        //cb.dnez $r0? 16f9c <main+0x1a4>;;
     _96(0x000000008000011be0004e00),        //make $r0 = 290104 (0x46d38);;
     _32(0x38040200),        //ld $r1 = 8 (0x8)[$r0];;
     _96(0x000000008000011be0004e00),        //make $r0 = 290104 (0x46d38);;
     _32(0x38000400),        //ld $r0 = 16 (0x10)[$r0];;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16fa0 <main+0x1a8>;;
     _32(0x18000029),        //call 17040 <abort>;;
     _96(0x000000008000011be0004e00),        //make $r0 = 290104 (0x46d38);;
     _32(0x38040600),        //ld $r1 = 24 (0x18)[$r0];;
     _96(0x000000008000011be0004e00),        //make $r0 = 290104 (0x46d38);;
     _32(0x38000800),        //ld $r0 = 32 (0x20)[$r0];;
     _32(0x7001a001),        //compd.ne $r0 = $r1, $r0;;
     _32(0x080002c0),        //cb.dnez $r0? 16ff0 <main+0x1f8>;;
     _96(0x000000008000011be0004e00),        //make $r0 = 290104 (0x46d38);;
     _32(0x38040800),        //ld $r1 = 32 (0x20)[$r0];;
     _96(0x000000008000011be0004e00),        //make $r0 = 290104 (0x46d38);;
     _32(0x38000a00),        //ld $r0 = 40 (0x28)[$r0];;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16ff4 <main+0x1fc>;;
     _32(0x18000014),        //call 17040 <abort>;;
     _96(0x000000008000011be0004e00),        //make $r0 = 290104 (0x46d38);;
     _32(0x38000600),        //ld $r0 = 24 (0x18)[$r0];;
     _32(0x08800300),        //cb.deqz $r0? 17034 <main+0x23c>;;
     _96(0x000000008000011be0004e00),        //make $r0 = 290104 (0x46d38);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x000000008000011be0004e00),        //make $r0 = 290104 (0x46d38);;
     _32(0x38000600),        //ld $r0 = 24 (0x18)[$r0];;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 17034 <main+0x23c>;;
     _32(0x18000004),        //call 17040 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 17060 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 17460 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 19138 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
 |];

let adr_start:bits(addr_bits) = 0b00010110110111111000; //0x16df8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test1, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test2, 0b00010110100001001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test3, 0b00010110100010000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test4, 0b00010110100010110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test4a, 0b00010110100100000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test5, 0b00010110100101000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test5a, 0b00010110100110010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test6, 0b00010110100111010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test6a, 0b00010110101000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(call_func1, 0b00010110101001100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test7, 0b00010110101010111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test8, 0b00010110101011110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test9, 0b00010110101100111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test10, 0b00010110101101111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test10a, 0b00010110101111001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test11, 0b00010110110000010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test11a, 0b00010110110001100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test12, 0b00010110110010110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test12a, 0b00010110110100000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(dummy, 0b00010110110101010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(call_func2, 0b00010110110110011000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110110111111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010111000001000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010111000001100000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016df8;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
