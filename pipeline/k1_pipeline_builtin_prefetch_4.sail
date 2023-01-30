// executing pipeline builtin_prefetch_4 test 
val k1_pipeline_builtin_prefetch_4: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_builtin_prefetch_4() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let assign_arg_ptr: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let assign_glob_ptr: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let assign_arg_idx: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2605060c),        //sw 24 (0x18)[$r12] = $r1;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let assign_glob_idx: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x00000000800000fce0000400),        //make $r0 = 258064 (0x3f010);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3400070c),        //lws $r0 = 28 (0x1c)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x00000000800000fce0000400),        //make $r0 = 258064 (0x3f010);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let preinc_arg_ptr: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61000100),        //addd $r0 = $r0, 4 (0x4);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61000100),        //addd $r0 = $r0, 4 (0x4);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let preinc_glob_ptr: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x61000100),        //addd $r0 = $r0, 4 (0x4);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x61000100),        //addd $r0 = $r0, 4 (0x4);;
     _96(0x00000000800000fce0040200),        //make $r1 = 258056 (0x3f008);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let postinc_arg_ptr: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61000100),        //addd $r0 = $r0, 4 (0x4);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61040100),        //addd $r1 = $r0, 4 (0x4);;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let postinc_glob_ptr: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x61000100),        //addd $r0 = $r0, 4 (0x4);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x61040100),        //addd $r1 = $r0, 4 (0x4);;
     _96(0x00000000800000fce0080200),        //make $r2 = 258056 (0x3f008);;
     _32(0x27050002),        //sd 0 (0x0)[$r2] = $r1;;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let predec_arg_ptr: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x6100ff00),        //addd $r0 = $r0, -4 (0xfffffffc);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x6100ff00),        //addd $r0 = $r0, -4 (0xfffffffc);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let predec_glob_ptr: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x6100ff00),        //addd $r0 = $r0, -4 (0xfffffffc);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x6100ff00),        //addd $r0 = $r0, -4 (0xfffffffc);;
     _96(0x00000000800000fce0040200),        //make $r1 = 258056 (0x3f008);;
     _32(0x27010001),        //sd 0 (0x0)[$r1] = $r0;;
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let postdec_arg_ptr: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x6100ff00),        //addd $r0 = $r0, -4 (0xfffffffc);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x6104ff00),        //addd $r1 = $r0, -4 (0xfffffffc);;
     _32(0x2705040c),        //sd 16 (0x10)[$r12] = $r1;;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let postdec_glob_ptr: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x6100ff00),        //addd $r0 = $r0, -4 (0xfffffffc);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x6104ff00),        //addd $r1 = $r0, -4 (0xfffffffc);;
     _96(0x00000000800000fce0080200),        //make $r2 = 258056 (0x3f008);;
     _32(0x27050002),        //sd 0 (0x0)[$r2] = $r1;;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let preinc_arg_idx: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2605060c),        //sw 24 (0x18)[$r12] = $r1;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3400060c),        //lws $r0 = 24 (0x18)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let preinc_glob_idx: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _96(0x00000000800000fce0000400),        //make $r0 = 258064 (0x3f010);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x00000000800000fce0000400),        //make $r0 = 258064 (0x3f010);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _96(0x00000000800000fce0000400),        //make $r0 = 258064 (0x3f010);;
     _32(0x26090000),        //sw 0 (0x0)[$r0] = $r2;;
     _96(0x00000000800000fce0000400),        //make $r0 = 258064 (0x3f010);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x00000000800000fce0000400),        //make $r0 = 258064 (0x3f010);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let postinc_arg_idx: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2605060c),        //sw 24 (0x18)[$r12] = $r1;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71040040),        //addw $r1 = $r0, 1 (0x1);;
     _32(0x2605060c),        //sw 24 (0x18)[$r12] = $r1;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let postinc_glob_idx: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _96(0x00000000800000fce0000400),        //make $r0 = 258064 (0x3f010);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x00000000800000fce0000400),        //make $r0 = 258064 (0x3f010);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71080040),        //addw $r2 = $r0, 1 (0x1);;
     _32(0x780cffc2),        //zxwd $r3 = $r2;;
     _96(0x00000000800000fce0080400),        //make $r2 = 258064 (0x3f010);;
     _32(0x260d0002),        //sw 0 (0x0)[$r2] = $r3;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x00000000800000fce0000400),        //make $r0 = 258064 (0x3f010);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let predec_arg_idx: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2605060c),        //sw 24 (0x18)[$r12] = $r1;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3400060c),        //lws $r0 = 24 (0x18)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let predec_glob_idx: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _96(0x00000000800000fce0000400),        //make $r0 = 258064 (0x3f010);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x00000000800000fce0000400),        //make $r0 = 258064 (0x3f010);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _96(0x00000000800000fce0000400),        //make $r0 = 258064 (0x3f010);;
     _32(0x26090000),        //sw 0 (0x0)[$r0] = $r2;;
     _96(0x00000000800000fce0000400),        //make $r0 = 258064 (0x3f010);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x00000000800000fce0000400),        //make $r0 = 258064 (0x3f010);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let postdec_arg_idx: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2605060c),        //sw 24 (0x18)[$r12] = $r1;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x7104ffc0),        //addw $r1 = $r0, -1 (0xffffffff);;
     _32(0x2605060c),        //sw 24 (0x18)[$r12] = $r1;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let postdec_glob_idx: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _96(0x00000000800000fce0000400),        //make $r0 = 258064 (0x3f010);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _96(0x00000000800000fce0000400),        //make $r0 = 258064 (0x3f010);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7108ffc0),        //addw $r2 = $r0, -1 (0xffffffff);;
     _32(0x780cffc2),        //zxwd $r3 = $r2;;
     _96(0x00000000800000fce0080400),        //make $r2 = 258064 (0x3f010);;
     _32(0x260d0002),        //sw 0 (0x0)[$r2] = $r3;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x00000000800000fce0000400),        //make $r0 = 258064 (0x3f010);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x3004070c),        //lwz $r1 = 28 (0x1c)[$r12];;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let getptr: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _96(0x000000008000010ae0007000),        //make $r0 = 272832 (0x429c0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x000000008000010ae0007000),        //make $r0 = 272832 (0x429c0);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x61000100),        //addd $r0 = $r0, 4 (0x4);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let funccall_arg_ptr: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x1fffffeb),        //call 16ff8 <getptr>;;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x000000008000010ae0007000),        //make $r0 = 272832 (0x429c0);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let getint: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _96(0x000000008000010ae0007200),        //make $r0 = 272840 (0x429c8);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _96(0x000000008000010ae0007200),        //make $r0 = 272840 (0x429c8);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let funccall_arg_idx: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x3000040c),        //lwz $r0 = 16 (0x10)[$r12];;
     _32(0x1fffffe8),        //call 17088 <getint>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3c0c0000),        //dtouchl 0 (0x0)[$r0];;
     _96(0x000000008000010ae0007200),        //make $r0 = 272840 (0x429c8);;
     _32(0x30000000),        //lwz $r0 = 0 (0x0)[$r0];;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
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
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x1ffffdb3),        //call 16820 <assign_arg_ptr>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 17164 <main+0x2c>;;
     _32(0x1800008a),        //call 17388 <abort>;;
     _32(0x1ffffdbd),        //call 16858 <assign_glob_ptr>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 17174 <main+0x3c>;;
     _32(0x18000086),        //call 17388 <abort>;;
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x60040004),        //make $r1 = 4 (0x4);;
     _32(0x1ffffdc6),        //call 168a0 <assign_arg_idx>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 17198 <main+0x60>;;
     _32(0x1800007d),        //call 17388 <abort>;;
     _32(0x1ffffdd4),        //call 168e8 <assign_glob_idx>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 171a8 <main+0x70>;;
     _32(0x18000079),        //call 17388 <abort>;;
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x1ffffde4),        //call 16948 <preinc_arg_ptr>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 171c8 <main+0x90>;;
     _32(0x18000071),        //call 17388 <abort>;;
     _32(0x1ffffdf2),        //call 16990 <preinc_glob_ptr>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 171d8 <main+0xa0>;;
     _32(0x1800006d),        //call 17388 <abort>;;
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x1ffffe0a),        //call 16a10 <postinc_arg_ptr>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 171f8 <main+0xc0>;;
     _32(0x18000065),        //call 17388 <abort>;;
     _32(0x1ffffe16),        //call 16a50 <postinc_glob_ptr>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 17208 <main+0xd0>;;
     _32(0x18000061),        //call 17388 <abort>;;
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x1ffffe2a),        //call 16ac0 <predec_arg_ptr>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 17228 <main+0xf0>;;
     _32(0x18000059),        //call 17388 <abort>;;
     _32(0x1ffffe38),        //call 16b08 <predec_glob_ptr>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 17238 <main+0x100>;;
     _32(0x18000055),        //call 17388 <abort>;;
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x1ffffe50),        //call 16b88 <postdec_arg_ptr>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 17258 <main+0x120>;;
     _32(0x1800004d),        //call 17388 <abort>;;
     _32(0x1ffffe5c),        //call 16bc8 <postdec_glob_ptr>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 17268 <main+0x130>;;
     _32(0x18000049),        //call 17388 <abort>;;
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x60040003),        //make $r1 = 3 (0x3);;
     _32(0x1ffffe6f),        //call 16c38 <preinc_arg_idx>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 1728c <main+0x154>;;
     _32(0x18000040),        //call 17388 <abort>;;
     _32(0x1ffffe81),        //call 16c90 <preinc_glob_idx>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 1729c <main+0x164>;;
     _32(0x1800003c),        //call 17388 <abort>;;
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x60040003),        //make $r1 = 3 (0x3);;
     _32(0x1ffffea0),        //call 16d30 <postinc_arg_idx>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 172c0 <main+0x188>;;
     _32(0x18000033),        //call 17388 <abort>;;
     _32(0x1ffffeb2),        //call 16d88 <postinc_glob_idx>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 172d0 <main+0x198>;;
     _32(0x1800002f),        //call 17388 <abort>;;
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x60040003),        //make $r1 = 3 (0x3);;
     _32(0x1ffffecd),        //call 16e18 <predec_arg_idx>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 172f4 <main+0x1bc>;;
     _32(0x18000026),        //call 17388 <abort>;;
     _32(0x1ffffedf),        //call 16e70 <predec_glob_idx>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 17304 <main+0x1cc>;;
     _32(0x18000022),        //call 17388 <abort>;;
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x60040003),        //make $r1 = 3 (0x3);;
     _32(0x1ffffefe),        //call 16f10 <postdec_arg_idx>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 17328 <main+0x1f0>;;
     _32(0x18000019),        //call 17388 <abort>;;
     _32(0x1fffff10),        //call 16f68 <postdec_glob_idx>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 17338 <main+0x200>;;
     _32(0x18000015),        //call 17388 <abort>;;
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x1fffff3c),        //call 17038 <funccall_arg_ptr>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 17358 <main+0x220>;;
     _32(0x1800000d),        //call 17388 <abort>;;
     _96(0x00000000800000fce0000200),        //make $r0 = 258056 (0x3f008);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x60040003),        //make $r1 = 3 (0x3);;
     _32(0x1fffff59),        //call 170d0 <funccall_arg_idx>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08000080),        //cb.dnez $r0? 1737c <main+0x244>;;
     _32(0x18000004),        //call 17388 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 173a8 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 177a8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 19480 <_exit>
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
     _32(0x98000161),        //call 17940 <__call_exitprocs>
     _32(0xfa00000e),        //copyw $r0 = $r14
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x0000000080000100e000f000),        //make $r0 = 263104 (0x403c0);;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x38041600),        //ld $r1 = 88 (0x58)[$r0];;
     _32(0x08800081),        //cb.deqz $r1? 173e4 <exit+0x3c>;;
     _32(0x0fdc0001),        //icall $r1;;
     _32(0x98000827),        //call 19480 <_exit>
     _32(0x7a00000e),        //copyw $r0 = $r14;;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010111000100111000; //0x17138
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(assign_arg_ptr, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(assign_glob_ptr, 0b00010110100001011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(assign_arg_idx, 0b00010110100010100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(assign_glob_idx, 0b00010110100011101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(preinc_arg_ptr, 0b00010110100101001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(preinc_glob_ptr, 0b00010110100110010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(postinc_arg_ptr, 0b00010110101000010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(postinc_glob_ptr, 0b00010110101001010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(predec_arg_ptr, 0b00010110101011000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(predec_glob_ptr, 0b00010110101100001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(postdec_arg_ptr, 0b00010110101110001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(postdec_glob_ptr, 0b00010110101111001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(preinc_arg_idx, 0b00010110110000111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(preinc_glob_idx, 0b00010110110010010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(postinc_arg_idx, 0b00010110110100110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(postinc_glob_idx, 0b00010110110110001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(predec_arg_idx, 0b00010110111000011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(predec_glob_idx, 0b00010110111001110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(postdec_arg_idx, 0b00010110111100010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(postdec_glob_idx, 0b00010110111101101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(getptr, 0b00010110111111111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(funccall_arg_ptr, 0b00010111000000111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(getint, 0b00010111000010001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(funccall_arg_idx, 0b00010111000011010000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010111000100111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010111001110001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit, 0b00010111001110101000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000017138;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
