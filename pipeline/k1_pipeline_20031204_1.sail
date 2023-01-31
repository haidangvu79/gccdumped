// executing pipeline 20031204_1.c.out.dumped test 
val k1_pipeline_20031204_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20031204_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let in_aton: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _64(0x000282c3e0000340),        //make $r0 = 168496141 (0xa0b0c0d);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let root_nfs_parse_addr: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x1000002f),        //goto 1691c <root_nfs_parse_addr+0xe4>;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000001f401b3c0),        //compw.le $r0 = $r0, 47 (0x2f);;
     _32(0x0c0001c0),        //cb.wnez $r0? 168a0 <root_nfs_parse_addr+0x68>;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000001f401b640),        //compw.le $r0 = $r0, 57 (0x39);;
     _32(0x0c7ffc80),        //cb.wnez $r0? 16864 <root_nfs_parse_addr+0x2c>;;
     _32(0x38040a0c),        //ld $r1 = 40 (0x28)[$r12];;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x7101a001),        //compd.eq $r0 = $r1, $r0;;
     _32(0x08000800),        //cb.dnez $r0? 1692c <root_nfs_parse_addr+0xf4>;;
     _32(0x38040a0c),        //ld $r1 = 40 (0x28)[$r12];;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x75010040),        //sbfd $r0 = $r0, $r1;;
     _32(0x650100c0),        //compd.gt $r0 = $r0, 3 (0x3);;
     _32(0x080006c0),        //cb.dnez $r0? 1692c <root_nfs_parse_addr+0xf4>;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000001f101b380),        //compw.eq $r0 = $r0, 46 (0x2e);;
     _32(0x0c000140),        //cb.wnez $r0? 168ec <root_nfs_parse_addr+0xb4>;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _64(0x00000000f001b0c0),        //compw.ne $r0 = $r0, 3 (0x3);;
     _32(0x0c000100),        //cb.wnez $r0? 168f8 <root_nfs_parse_addr+0xc0>;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010d0c),        //sw 52 (0x34)[$r12] = $r0;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _64(0x00000000f501b0c0),        //compw.gt $r0 = $r0, 3 (0x3);;
     _32(0x0c000100),        //cb.wnez $r0? 16914 <root_nfs_parse_addr+0xdc>;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _64(0x00000000f401b0c0),        //compw.le $r0 = $r0, 3 (0x3);;
     _32(0x0c7ff480),        //cb.wnez $r0? 16870 <root_nfs_parse_addr+0x38>;;
     _32(0x30000d0c),        //lwz $r0 = 52 (0x34)[$r12];;
     _64(0x00000000f001b100),        //compw.ne $r0 = $r0, 4 (0x4);;
     _32(0x0c000700),        //cb.wnez $r0? 169a8 <root_nfs_parse_addr+0x170>;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000001f101b680),        //compw.eq $r0 = $r0, 58 (0x3a);;
     _32(0x0c000100),        //cb.wnez $r0? 16960 <root_nfs_parse_addr+0x128>;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x080004c0),        //cb.dnez $r0? 169a8 <root_nfs_parse_addr+0x170>;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x20000000),        //lbz $r0 = 0 (0x0)[$r0];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000001f001b680),        //compw.ne $r0 = $r0, 58 (0x3a);;
     _32(0x0c000180),        //cb.wnez $r0? 1698c <root_nfs_parse_addr+0x154>;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x61040040),        //addd $r1 = $r0, 1 (0x1);;
     _32(0x27050a0c),        //sd 40 (0x28)[$r12] = $r1;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x24050000),        //sb 0 (0x0)[$r0] = $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x1fffffa4),        //call 16820 <in_aton>;;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x38040a0c),        //ld $r1 = 40 (0x28)[$r12];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x18000178),        //call 16f80 <strcpy>;;
     _32(0x10000003),        //goto 169b0 <root_nfs_parse_addr+0x178>;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
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
     _96(0x00000000800000f8e0000200),        //make $r0 = 253960 (0x3e008);;
     _32(0x1fffff96),        //call 16838 <root_nfs_parse_addr>;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _64(0x000282c3e1010340),        //compd.eq $r0 = $r0, 168496141 (0xa0b0c0d);;
     _32(0x08000080),        //cb.dnez $r0? 169fc <main+0x34>;;
     _32(0x18000006),        //call 16a10 <abort>;;
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
     _32(0x980000f3),        //call 16de8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007df),        //call 189a0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100111001000; //0x169c8
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(in_aton, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(root_nfs_parse_addr, 0b00010110100000111000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100111001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101000010000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000169c8;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
