// executing pipeline divcmp_4.c.out.dumped test 
val k1_pipeline_divcmp_4: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_divcmp_4() = {
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
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71000740),        //addw $r0 = $r0, 29 (0x1d);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f801b240),        //compw.leu $r0 = $r0, 9 (0x9);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test2: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71000240),        //addw $r0 = $r0, 9 (0x9);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f801b480),        //compw.leu $r0 = $r0, 18 (0x12);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test3: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71000740),        //addw $r0 = $r0, 29 (0x1d);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f901b240),        //compw.gtu $r0 = $r0, 9 (0x9);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test4: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x71000240),        //addw $r0 = $r0, 9 (0x9);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f901b480),        //compw.gtu $r0 = $r0, 18 (0x12);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test5: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x07fffffff301b340),        //compw.ge $r0 = $r0, 4294967277 (0xffffffed);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test6: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f501b240),        //compw.gt $r0 = $r0, 9 (0x9);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test7: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x07fffffff301b0c0),        //compw.ge $r0 = $r0, 4294967267 (0xffffffe3);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test8: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x07fffffff301b5c0),        //compw.ge $r0 = $r0, 4294967287 (0xfffffff7);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test9: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x07fffffff201b0c0),        //compw.lt $r0 = $r0, 4294967267 (0xffffffe3);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test10: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x07fffffff201b5c0),        //compw.lt $r0 = $r0, 4294967287 (0xfffffff7);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test11: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x07fffffff201b340),        //compw.lt $r0 = $r0, 4294967277 (0xffffffed);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let test12: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x00000000f401b240),        //compw.le $r0 = $r0, 9 (0x9);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x6000ffe2),        //make $r0 = -30 (0xffffffe2);;
     _32(0x1fffff7c),        //call 16820 <test1>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16a40 <main+0x20>;;
     _32(0x18000169),        //call 16fe0 <abort>;;
     _32(0x6000ffe3),        //make $r0 = -29 (0xffffffe3);;
     _32(0x1fffff77),        //call 16820 <test1>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16a5c <main+0x3c>;;
     _32(0x18000162),        //call 16fe0 <abort>;;
     _32(0x6000ffec),        //make $r0 = -20 (0xffffffec);;
     _32(0x1fffff70),        //call 16820 <test1>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16a78 <main+0x58>;;
     _32(0x1800015b),        //call 16fe0 <abort>;;
     _32(0x6000ffed),        //make $r0 = -19 (0xffffffed);;
     _32(0x1fffff69),        //call 16820 <test1>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16a8c <main+0x6c>;;
     _32(0x18000156),        //call 16fe0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff70),        //call 16850 <test2>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16aa8 <main+0x88>;;
     _32(0x1800014f),        //call 16fe0 <abort>;;
     _32(0x60000009),        //make $r0 = 9 (0x9);;
     _32(0x1fffff69),        //call 16850 <test2>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16ac4 <main+0xa4>;;
     _32(0x18000148),        //call 16fe0 <abort>;;
     _32(0x6000000a),        //make $r0 = 10 (0xa);;
     _32(0x1fffff62),        //call 16850 <test2>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16ad8 <main+0xb8>;;
     _32(0x18000143),        //call 16fe0 <abort>;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1fffff5d),        //call 16850 <test2>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16af4 <main+0xd4>;;
     _32(0x1800013c),        //call 16fe0 <abort>;;
     _32(0x6000fff7),        //make $r0 = -9 (0xfffffff7);;
     _32(0x1fffff56),        //call 16850 <test2>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16b10 <main+0xf0>;;
     _32(0x18000135),        //call 16fe0 <abort>;;
     _32(0x6000fff6),        //make $r0 = -10 (0xfffffff6);;
     _32(0x1fffff4f),        //call 16850 <test2>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16b24 <main+0x104>;;
     _32(0x18000130),        //call 16fe0 <abort>;;
     _32(0x6000ffe2),        //make $r0 = -30 (0xffffffe2);;
     _32(0x1fffff56),        //call 16880 <test3>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16b40 <main+0x120>;;
     _32(0x18000129),        //call 16fe0 <abort>;;
     _32(0x6000ffe3),        //make $r0 = -29 (0xffffffe3);;
     _32(0x1fffff4f),        //call 16880 <test3>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16b54 <main+0x134>;;
     _32(0x18000124),        //call 16fe0 <abort>;;
     _32(0x6000ffec),        //make $r0 = -20 (0xffffffec);;
     _32(0x1fffff4a),        //call 16880 <test3>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16b68 <main+0x148>;;
     _32(0x1800011f),        //call 16fe0 <abort>;;
     _32(0x6000ffed),        //make $r0 = -19 (0xffffffed);;
     _32(0x1fffff45),        //call 16880 <test3>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16b84 <main+0x164>;;
     _32(0x18000118),        //call 16fe0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff4a),        //call 168b0 <test4>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16b98 <main+0x178>;;
     _32(0x18000113),        //call 16fe0 <abort>;;
     _32(0x60000009),        //make $r0 = 9 (0x9);;
     _32(0x1fffff45),        //call 168b0 <test4>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16bac <main+0x18c>;;
     _32(0x1800010e),        //call 16fe0 <abort>;;
     _32(0x6000000a),        //make $r0 = 10 (0xa);;
     _32(0x1fffff40),        //call 168b0 <test4>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16bc8 <main+0x1a8>;;
     _32(0x18000107),        //call 16fe0 <abort>;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1fffff39),        //call 168b0 <test4>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16bdc <main+0x1bc>;;
     _32(0x18000102),        //call 16fe0 <abort>;;
     _32(0x6000fff7),        //make $r0 = -9 (0xfffffff7);;
     _32(0x1fffff34),        //call 168b0 <test4>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16bf0 <main+0x1d0>;;
     _32(0x180000fd),        //call 16fe0 <abort>;;
     _32(0x6000fff6),        //make $r0 = -10 (0xfffffff6);;
     _32(0x1fffff2f),        //call 168b0 <test4>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16c0c <main+0x1ec>;;
     _32(0x180000f6),        //call 16fe0 <abort>;;
     _32(0x6000ffe2),        //make $r0 = -30 (0xffffffe2);;
     _32(0x1fffff34),        //call 168e0 <test5>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16c20 <main+0x200>;;
     _32(0x180000f1),        //call 16fe0 <abort>;;
     _32(0x6000ffe3),        //make $r0 = -29 (0xffffffe3);;
     _32(0x1fffff2f),        //call 168e0 <test5>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16c34 <main+0x214>;;
     _32(0x180000ec),        //call 16fe0 <abort>;;
     _32(0x6000ffec),        //make $r0 = -20 (0xffffffec);;
     _32(0x1fffff2a),        //call 168e0 <test5>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16c48 <main+0x228>;;
     _32(0x180000e7),        //call 16fe0 <abort>;;
     _32(0x6000ffed),        //make $r0 = -19 (0xffffffed);;
     _32(0x1fffff25),        //call 168e0 <test5>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16c64 <main+0x244>;;
     _32(0x180000e0),        //call 16fe0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff28),        //call 16908 <test6>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16c78 <main+0x258>;;
     _32(0x180000db),        //call 16fe0 <abort>;;
     _32(0x60000009),        //make $r0 = 9 (0x9);;
     _32(0x1fffff23),        //call 16908 <test6>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16c8c <main+0x26c>;;
     _32(0x180000d6),        //call 16fe0 <abort>;;
     _32(0x6000000a),        //make $r0 = 10 (0xa);;
     _32(0x1fffff1e),        //call 16908 <test6>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16ca8 <main+0x288>;;
     _32(0x180000cf),        //call 16fe0 <abort>;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1fffff17),        //call 16908 <test6>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16cbc <main+0x29c>;;
     _32(0x180000ca),        //call 16fe0 <abort>;;
     _32(0x6000fff7),        //make $r0 = -9 (0xfffffff7);;
     _32(0x1fffff12),        //call 16908 <test6>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16cd0 <main+0x2b0>;;
     _32(0x180000c5),        //call 16fe0 <abort>;;
     _32(0x6000fff6),        //make $r0 = -10 (0xfffffff6);;
     _32(0x1fffff0d),        //call 16908 <test6>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16ce4 <main+0x2c4>;;
     _32(0x180000c0),        //call 16fe0 <abort>;;
     _32(0x6000ffe2),        //make $r0 = -30 (0xffffffe2);;
     _32(0x1fffff12),        //call 16930 <test7>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16cf8 <main+0x2d8>;;
     _32(0x180000bb),        //call 16fe0 <abort>;;
     _32(0x6000ffe3),        //make $r0 = -29 (0xffffffe3);;
     _32(0x1fffff0d),        //call 16930 <test7>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16d14 <main+0x2f4>;;
     _32(0x180000b4),        //call 16fe0 <abort>;;
     _32(0x6000ffec),        //make $r0 = -20 (0xffffffec);;
     _32(0x1fffff06),        //call 16930 <test7>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16d30 <main+0x310>;;
     _32(0x180000ad),        //call 16fe0 <abort>;;
     _32(0x6000ffed),        //make $r0 = -19 (0xffffffed);;
     _32(0x1ffffeff),        //call 16930 <test7>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16d4c <main+0x32c>;;
     _32(0x180000a6),        //call 16fe0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffff02),        //call 16958 <test8>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16d68 <main+0x348>;;
     _32(0x1800009f),        //call 16fe0 <abort>;;
     _32(0x60000009),        //make $r0 = 9 (0x9);;
     _32(0x1ffffefb),        //call 16958 <test8>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16d84 <main+0x364>;;
     _32(0x18000098),        //call 16fe0 <abort>;;
     _32(0x6000000a),        //make $r0 = 10 (0xa);;
     _32(0x1ffffef4),        //call 16958 <test8>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16da0 <main+0x380>;;
     _32(0x18000091),        //call 16fe0 <abort>;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1ffffeed),        //call 16958 <test8>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16dbc <main+0x39c>;;
     _32(0x1800008a),        //call 16fe0 <abort>;;
     _32(0x6000fff7),        //make $r0 = -9 (0xfffffff7);;
     _32(0x1ffffee6),        //call 16958 <test8>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16dd8 <main+0x3b8>;;
     _32(0x18000083),        //call 16fe0 <abort>;;
     _32(0x6000fff6),        //make $r0 = -10 (0xfffffff6);;
     _32(0x1ffffedf),        //call 16958 <test8>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16dec <main+0x3cc>;;
     _32(0x1800007e),        //call 16fe0 <abort>;;
     _32(0x6000ffe2),        //make $r0 = -30 (0xffffffe2);;
     _32(0x1ffffee4),        //call 16980 <test9>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16e08 <main+0x3e8>;;
     _32(0x18000077),        //call 16fe0 <abort>;;
     _32(0x6000ffe3),        //make $r0 = -29 (0xffffffe3);;
     _32(0x1ffffedd),        //call 16980 <test9>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16e1c <main+0x3fc>;;
     _32(0x18000072),        //call 16fe0 <abort>;;
     _32(0x6000ffec),        //make $r0 = -20 (0xffffffec);;
     _32(0x1ffffed8),        //call 16980 <test9>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16e30 <main+0x410>;;
     _32(0x1800006d),        //call 16fe0 <abort>;;
     _32(0x6000ffed),        //make $r0 = -19 (0xffffffed);;
     _32(0x1ffffed3),        //call 16980 <test9>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16e44 <main+0x424>;;
     _32(0x18000068),        //call 16fe0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1ffffed8),        //call 169a8 <test10>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16e58 <main+0x438>;;
     _32(0x18000063),        //call 16fe0 <abort>;;
     _32(0x60000009),        //make $r0 = 9 (0x9);;
     _32(0x1ffffed3),        //call 169a8 <test10>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16e6c <main+0x44c>;;
     _32(0x1800005e),        //call 16fe0 <abort>;;
     _32(0x6000000a),        //make $r0 = 10 (0xa);;
     _32(0x1ffffece),        //call 169a8 <test10>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16e80 <main+0x460>;;
     _32(0x18000059),        //call 16fe0 <abort>;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1ffffec9),        //call 169a8 <test10>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16e94 <main+0x474>;;
     _32(0x18000054),        //call 16fe0 <abort>;;
     _32(0x6000fff7),        //make $r0 = -9 (0xfffffff7);;
     _32(0x1ffffec4),        //call 169a8 <test10>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16ea8 <main+0x488>;;
     _32(0x1800004f),        //call 16fe0 <abort>;;
     _32(0x6000fff6),        //make $r0 = -10 (0xfffffff6);;
     _32(0x1ffffebf),        //call 169a8 <test10>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16ec4 <main+0x4a4>;;
     _32(0x18000048),        //call 16fe0 <abort>;;
     _32(0x6000ffe2),        //make $r0 = -30 (0xffffffe2);;
     _32(0x1ffffec2),        //call 169d0 <test11>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16ee0 <main+0x4c0>;;
     _32(0x18000041),        //call 16fe0 <abort>;;
     _32(0x6000ffe3),        //make $r0 = -29 (0xffffffe3);;
     _32(0x1ffffebb),        //call 169d0 <test11>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16efc <main+0x4dc>;;
     _32(0x1800003a),        //call 16fe0 <abort>;;
     _32(0x6000ffec),        //make $r0 = -20 (0xffffffec);;
     _32(0x1ffffeb4),        //call 169d0 <test11>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16f18 <main+0x4f8>;;
     _32(0x18000033),        //call 16fe0 <abort>;;
     _32(0x6000ffed),        //make $r0 = -19 (0xffffffed);;
     _32(0x1ffffead),        //call 169d0 <test11>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16f2c <main+0x50c>;;
     _32(0x1800002e),        //call 16fe0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1ffffeb2),        //call 169f8 <test12>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16f48 <main+0x528>;;
     _32(0x18000027),        //call 16fe0 <abort>;;
     _32(0x60000009),        //make $r0 = 9 (0x9);;
     _32(0x1ffffeab),        //call 169f8 <test12>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16f64 <main+0x544>;;
     _32(0x18000020),        //call 16fe0 <abort>;;
     _32(0x6000000a),        //make $r0 = 10 (0xa);;
     _32(0x1ffffea4),        //call 169f8 <test12>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x08800080),        //cb.deqz $r0? 16f78 <main+0x558>;;
     _32(0x1800001b),        //call 16fe0 <abort>;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x1ffffe9f),        //call 169f8 <test12>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16f94 <main+0x574>;;
     _32(0x18000014),        //call 16fe0 <abort>;;
     _32(0x6000fff7),        //make $r0 = -9 (0xfffffff7);;
     _32(0x1ffffe98),        //call 169f8 <test12>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16fb0 <main+0x590>;;
     _32(0x1800000d),        //call 16fe0 <abort>;;
     _32(0x6000fff6),        //make $r0 = -10 (0xfffffff6);;
     _32(0x1ffffe91),        //call 169f8 <test12>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f101b040),        //compw.eq $r0 = $r0, 1 (0x1);;
     _32(0x0c000080),        //cb.wnez $r0? 16fcc <main+0x5ac>;;
     _32(0x18000006),        //call 16fe0 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 173b8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18ee8 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110101000100000; //0x16a20
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test1, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test2, 0b00010110100001010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test3, 0b00010110100010000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test4, 0b00010110100010110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test5, 0b00010110100011100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test6, 0b00010110100100001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test7, 0b00010110100100110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test8, 0b00010110100101011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test9, 0b00010110100110000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test10, 0b00010110100110101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test11, 0b00010110100111010000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(test12, 0b00010110100111111000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110101000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110111111100000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016a20;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
