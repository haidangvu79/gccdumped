// executing pipeline 20190820_1.c.out.dumped test 
val k1_pipeline_20190820_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20190820_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let put_dec_full4: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2605060c),        //sw 24 (0x18)[$r12] = $r1;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x100000a3db0036c0),        //mulw $r0 = $r0, 5243 (0x147b);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7b0234c0),        //srlw $r0 = $r0, 19 (0x13);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x10000003db003100),        //mulw $r0 = $r0, 100 (0x64);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x75011040),        //sbfw $r0 = $r0, $r1;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _96(0x0000000080000117e0042600),        //make $r1 = 285848 (0x45c98);;
     _32(0x2806f001),        //lhz.xs $r1 = $r0[$r1];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x25050000),        //sh 0 (0x0)[$r0] = $r1;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61000080),        //addd $r0 = $r0, 2 (0x2);;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _96(0x0000000080000117e0042600),        //make $r1 = 285848 (0x45c98);;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x2806f001),        //lhz.xs $r1 = $r0[$r1];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x25050000),        //sh 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let put_dec_helper4: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x2605060c),        //sw 24 (0x18)[$r12] = $r1;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _64(0x100d1b71c40075c0),        //muld $r0 = $r0, 879609303 (0x346dc5d7);;
     _32(0x7b022ac0),        //srld $r0 = $r0, 43 (0x2b);;
     _32(0x2601070c),        //sw 28 (0x1c)[$r12] = $r0;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _64(0x10000138db003400),        //mulw $r0 = $r0, 10000 (0x2710);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004060c),        //lwz $r1 = 24 (0x18)[$r12];;
     _32(0x75011040),        //sbfw $r0 = $r0, $r1;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x1fffffc9),        //call 16820 <put_dec_full4>;;
     _32(0x3000070c),        //lwz $r0 = 28 (0x1c)[$r12];;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let put_dec: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7b023400),        //srlw $r0 = $r0, 16 (0x10);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x7b022800),        //srld $r0 = $r0, 32 (0x20);;
     _32(0x26010e0c),        //sw 56 (0x38)[$r12] = $r0;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _32(0x7b023400),        //srlw $r0 = $r0, 16 (0x10);;
     _32(0x26010c0c),        //sw 48 (0x30)[$r12] = $r0;;
     _32(0x30040c0c),        //lwz $r1 = 48 (0x30)[$r12];;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x79023080),        //sllw $r0 = $r0, 2 (0x2);;
     _32(0x71011040),        //addw $r0 = $r0, $r1;;
     _32(0x790230c0),        //sllw $r0 = $r0, 3 (0x3);;
     _32(0x71011040),        //addw $r0 = $r0, $r1;;
     _32(0x79023100),        //sllw $r0 = $r0, 4 (0x4);;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _32(0x30040d0c),        //lwz $r1 = 52 (0x34)[$r12];;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x790230c0),        //sllw $r0 = $r0, 3 (0x3);;
     _32(0x75011001),        //sbfw $r0 = $r1, $r0;;
     _32(0x790230c0),        //sllw $r0 = $r0, 3 (0x3);;
     _32(0x71011040),        //addw $r0 = $r0, $r1;;
     _32(0x790231c0),        //sllw $r0 = $r0, 7 (0x7);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71011002),        //addw $r0 = $r2, $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _64(0x100000addb003000),        //mulw $r0 = $r0, 5536 (0x15a0);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6403f000),        //zxhd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x26010b0c),        //sw 44 (0x2c)[$r12] = $r0;;
     _32(0x30040b0c),        //lwz $r1 = 44 (0x2c)[$r12];;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x1fffffb4),        //call 168b0 <put_dec_helper4>;;
     _32(0x26010b0c),        //sw 44 (0x2c)[$r12] = $r0;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _64(0x100000efdb0035c0),        //mulw $r0 = $r0, 7671 (0x1df7);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _64(0x10000128db003600),        //mulw $r0 = $r0, 9496 (0x2518);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7808ffc0),        //zxwd $r2 = $r0;;
     _32(0x30040f0c),        //lwz $r1 = 60 (0x3c)[$r12];;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x71011040),        //addw $r0 = $r0, $r1;;
     _32(0x79023040),        //sllw $r0 = $r0, 1 (0x1);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71011002),        //addw $r0 = $r2, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x30040b0c),        //lwz $r1 = 44 (0x2c)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x26010b0c),        //sw 44 (0x2c)[$r12] = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x61000100),        //addd $r0 = $r0, 4 (0x4);;
     _32(0x30040b0c),        //lwz $r1 = 44 (0x2c)[$r12];;
     _32(0x1fffff9a),        //call 168b0 <put_dec_helper4>;;
     _32(0x26010b0c),        //sw 44 (0x2c)[$r12] = $r0;;
     _32(0x30000c0c),        //lwz $r0 = 48 (0x30)[$r12];;
     _64(0x10000094db003340),        //mulw $r0 = $r0, 4749 (0x128d);;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _64(0x10000001db003280),        //mulw $r0 = $r0, 42 (0x2a);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x30040b0c),        //lwz $r1 = 44 (0x2c)[$r12];;
     _32(0x71011001),        //addw $r0 = $r1, $r0;;
     _32(0x26010b0c),        //sw 44 (0x2c)[$r12] = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x61000200),        //addd $r0 = $r0, 8 (0x8);;
     _32(0x30040b0c),        //lwz $r1 = 44 (0x2c)[$r12];;
     _32(0x1fffff88),        //call 168b0 <put_dec_helper4>;;
     _32(0x26010b0c),        //sw 44 (0x2c)[$r12] = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let number: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x2709040c),        //sd 16 (0x10)[$r12] = $r2;;
     _32(0x270d020c),        //sd 8 (0x8)[$r12] = $r3;;
     _32(0x2000030c),        //lbz $r0 = 12 (0xc)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x78001000),        //andw $r0 = $r0, 64 (0x40);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x088001c0),        //cb.deqz $r0? 16af8 <number+0x48>;;
     _32(0x2000034c),        //lbz $r0 = 13 (0xd)[$r12];;
     _64(0x00000000f101b280),        //compw.eq $r0 = $r0, 10 (0xa);;
     _32(0x0c0000c0),        //cb.wnez $r0? 16af8 <number+0x48>;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x10000002),        //goto 16afc <number+0x4c>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601160c),        //sw 88 (0x58)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x61010000),        //compd.eq $r0 = $r0, 0 (0x0);;
     _32(0x240115cc),        //sb 87 (0x57)[$r12] = $r0;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x6903f200),        //extfs $r0 = $r0, 31 (0x1f), 8 (0x8);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x2601140c),        //sw 80 (0x50)[$r12] = $r0;;
     _32(0x2800038c),        //lhz $r0 = 14 (0xe)[$r12];;
     _32(0x6803f000),        //sxhd $r0 = $r0;;
     _32(0x2601130c),        //sw 76 (0x4c)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2601170c),        //sw 92 (0x5c)[$r12] = $r0;;
     _32(0x2000034c),        //lbz $r0 = 13 (0xd)[$r12];;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x7701a040),        //compd.geu $r0 = $r0, $r1;;
     _32(0x08000480),        //cb.dnez $r0? 16b88 <number+0xd8>;;
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x20080000),        //lbz $r2 = 0 (0x0)[$r0];;
     _32(0x3000170c),        //lwz $r0 = 92 (0x5c)[$r12];;
     _32(0x71040040),        //addw $r1 = $r0, 1 (0x1);;
     _32(0x2605170c),        //sw 92 (0x5c)[$r12] = $r1;;
     _32(0x200410cc),        //lbz $r1 = 67 (0x43)[$r12];;
     _32(0x7a051081),        //orw $r1 = $r1, $r2;;
     _32(0x78043fc1),        //zxbd $r1 = $r1;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x6108180c),        //addd $r2 = $r12, 96 (0x60);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x2405f200),        //sb -56 (0xffffffc8)[$r0] = $r1;;
     _32(0x10000036),        //goto 16c5c <number+0x1ac>;;
     _32(0x2000034c),        //lbz $r0 = 13 (0xd)[$r12];;
     _64(0x00000000f101b280),        //compw.eq $r0 = $r0, 10 (0xa);;
     _32(0x0c000ac0),        //cb.wnez $r0? 16c40 <number+0x190>;;
     _32(0x2000034c),        //lbz $r0 = 13 (0xd)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x2601120c),        //sw 72 (0x48)[$r12] = $r0;;
     _32(0x60000003),        //make $r0 = 3 (0x3);;
     _32(0x2601110c),        //sw 68 (0x44)[$r12] = $r0;;
     _32(0x2000034c),        //lbz $r0 = 13 (0xd)[$r12];;
     _64(0x00000000f001b400),        //compw.ne $r0 = $r0, 16 (0x10);;
     _32(0x0c000100),        //cb.wnez $r0? 16bcc <number+0x11c>;;
     _32(0x60000004),        //make $r0 = 4 (0x4);;
     _32(0x2601110c),        //sw 68 (0x44)[$r12] = $r0;;
     _32(0x10000002),        //goto 16bd0 <number+0x120>;;
     _32(0x1800004b),        //call 16cf8 <abort>;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x3004120c),        //lwz $r1 = 72 (0x48)[$r12];;
     _32(0x78011001),        //andw $r0 = $r1, $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x200ae001),        //lbz $r2 = $r0[$r1];;
     _32(0x3000170c),        //lwz $r0 = 92 (0x5c)[$r12];;
     _32(0x71040040),        //addw $r1 = $r0, 1 (0x1);;
     _32(0x2605170c),        //sw 92 (0x5c)[$r12] = $r1;;
     _32(0x200410cc),        //lbz $r1 = 67 (0x43)[$r12];;
     _32(0x7a051081),        //orw $r1 = $r1, $r2;;
     _32(0x78043fc1),        //zxbd $r1 = $r1;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x6108180c),        //addd $r2 = $r12, 96 (0x60);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x2405f200),        //sb -56 (0xffffffc8)[$r0] = $r1;;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x3000110c),        //lwz $r0 = 68 (0x44)[$r12];;
     _32(0x7b026001),        //srld $r0 = $r1, $r0;;
     _32(0x2701040c),        //sd 16 (0x10)[$r12] = $r0;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x087ff980),        //cb.dnez $r0? 16bd0 <number+0x120>;;
     _32(0x10000008),        //goto 16c5c <number+0x1ac>;;
     _32(0x61000a0c),        //addd $r0 = $r12, 40 (0x28);;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x1fffff34),        //call 16918 <put_dec>;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x61000a0c),        //addd $r0 = $r12, 40 (0x28);;
     _32(0x75010040),        //sbfd $r0 = $r0, $r1;;
     _32(0x2601170c),        //sw 92 (0x5c)[$r12] = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130180c),        //addd $r12 = $r12, 96 (0x60);;
     _32(0x0fd00000)        //ret ;;
 |];

let pointer_string: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x27050c0c),        //sd 48 (0x30)[$r12] = $r1;;
     _32(0x27090a0c),        //sd 40 (0x28)[$r12] = $r2;;
     _32(0x270d080c),        //sd 32 (0x20)[$r12] = $r3;;
     _32(0x60000010),        //make $r0 = 16 (0x10);;
     _32(0x2401094c),        //sb 37 (0x25)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x2401090c),        //sb 36 (0x24)[$r12] = $r0;;
     _32(0x380c080c),        //ld $r3 = 32 (0x20)[$r12];;
     _32(0x60080064),        //make $r2 = 100 (0x64);;
     _32(0x38040c0c),        //ld $r1 = 48 (0x30)[$r12];;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x1fffff81),        //call 16ab0 <number>;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x380c040c),        //ld $r3 = 16 (0x10)[$r12];;
     _32(0x60080000),        //make $r2 = 0 (0x0);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffe5),        //call 16c70 <pointer_string>;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
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
     _32(0x980000f3),        //call 170d0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18c00 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110110011000000; //0x16cc0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(put_dec_full4, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(put_dec_helper4, 0b00010110100010110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(put_dec, 0b00010110100100011000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(number, 0b00010110101010110000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(pointer_string, 0b00010110110001110000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110110011000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110110011111000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016cc0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
