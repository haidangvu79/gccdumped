// executing pipeline pr59643.c.out.dumped test 
val k1_pipeline_pr59643: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr59643() = {
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
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x27050a0c),        //sd 40 (0x28)[$r12] = $r1;;
     _32(0x2709080c),        //sd 32 (0x20)[$r12] = $r2;;
     _32(0x270d060c),        //sd 24 (0x18)[$r12] = $r3;;
     _32(0x2711040c),        //sd 16 (0x10)[$r12] = $r4;;
     _32(0x26150e0c),        //sw 56 (0x38)[$r12] = $r5;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x1000002c),        //goto 168f4 <foo+0xd4>;;
     _32(0x34000f0c),        //lws $r0 = 60 (0x3c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x38040a0c),        //ld $r1 = 40 (0x28)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x34000f0c),        //lws $r0 = 60 (0x3c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x3808080c),        //ld $r2 = 32 (0x20)[$r12];;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x50067001),        //faddd $r1 = $r1, $r0;;
     _32(0x34000f0c),        //lws $r0 = 60 (0x3c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6100fe00),        //addd $r0 = $r0, -8 (0xfffffff8);;
     _32(0x38080c0c),        //ld $r2 = 48 (0x30)[$r12];;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x50067001),        //faddd $r1 = $r1, $r0;;
     _32(0x34000f0c),        //lws $r0 = 60 (0x3c)[$r12];;
     _32(0x61000040),        //addd $r0 = $r0, 1 (0x1);;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x38080c0c),        //ld $r2 = 48 (0x30)[$r12];;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x50067001),        //faddd $r1 = $r1, $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x58097001),        //fmuld $r2 = $r1, $r0;;
     _32(0x34000f0c),        //lws $r0 = 60 (0x3c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x38040c0c),        //ld $r1 = 48 (0x30)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x38040000),        //ld $r1 = 0 (0x0)[$r0];;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x58057001),        //fmuld $r1 = $r1, $r0;;
     _32(0x34000f0c),        //lws $r0 = 60 (0x3c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x380c0c0c),        //ld $r3 = 48 (0x30)[$r12];;
     _32(0x71010003),        //addd $r0 = $r3, $r0;;
     _32(0x50067042),        //faddd $r1 = $r2, $r1;;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x30000f0c),        //lwz $r0 = 60 (0x3c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _32(0x26010f0c),        //sw 60 (0x3c)[$r12] = $r0;;
     _32(0x30000e0c),        //lwz $r0 = 56 (0x38)[$r12];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x30040f0c),        //lwz $r1 = 60 (0x3c)[$r12];;
     _32(0x7201b001),        //compw.lt $r0 = $r1, $r0;;
     _32(0x0c7ff400),        //cb.wnez $r0? 16848 <foo+0x28>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _64(0x07ffffffe130380c),        //addd $r12 = $r12, -800 (0xfffffffffffffce0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000a601c70c),        //sw 796 (0x31c)[$r12] = $r0;;
     _32(0x10000032),        //goto 16a04 <main+0xe4>;;
     _64(0x18000000b000c70c),        //lwz $r0 = 796 (0x31c)[$r12];;
     _32(0x780000c0),        //andw $r0 = $r0, 3 (0x3);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x44030000),        //floatd.rn $r0 = $r0, 0 (0x0);;
     _32(0x50067000),        //faddd $r1 = $r0, $r0;;
     _64(0x18000000b400c70c),        //lws $r0 = 796 (0x31c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _64(0x00000000e108c80c),        //addd $r2 = $r12, 800 (0x320);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x2705be00),        //sd -264 (0xfffffef8)[$r0] = $r1;;
     _64(0x18000000b000c70c),        //lwz $r0 = 796 (0x31c)[$r12];;
     _32(0x780001c0),        //andw $r0 = $r0, 7 (0x7);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7100ff00),        //addw $r0 = $r0, -4 (0xfffffffc);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x44070000),        //floatd.rn $r1 = $r0, 0 (0x0);;
     _64(0x18000000b400c70c),        //lws $r0 = 796 (0x31c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _64(0x00000000e108c80c),        //addd $r2 = $r12, 800 (0x320);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _64(0x1fffffffa7057e00),        //sd -520 (0xfffffffffffffdf8)[$r0] = $r1;;
     _64(0x18000000b000c70c),        //lwz $r0 = 796 (0x31c)[$r12];;
     _32(0x780001c0),        //andw $r0 = $r0, 7 (0x7);;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x6903f000),        //sxwd $r0 = $r0;;
     _32(0x44070000),        //floatd.rn $r1 = $r0, 0 (0x0);;
     _64(0x18000000b400c70c),        //lws $r0 = 796 (0x31c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _64(0x00000000e108c80c),        //addd $r2 = $r12, 800 (0x320);;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _64(0x1fffffffa7053e00),        //sd -776 (0xfffffffffffffcf8)[$r0] = $r1;;
     _64(0x18000000b000c70c),        //lwz $r0 = 796 (0x31c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _64(0x18000000a601c70c),        //sw 796 (0x31c)[$r12] = $r0;;
     _64(0x18000000b000c70c),        //lwz $r0 = 796 (0x31c)[$r12];;
     _64(0x00000000f401b7c0),        //compw.le $r0 = $r0, 31 (0x1f);;
     _32(0x0c7ff2c0),        //cb.wnez $r0? 16940 <main+0x20>;;
     _32(0x6108060c),        //addd $r2 = $r12, 24 (0x18);;
     _32(0x6104460c),        //addd $r1 = $r12, 280 (0x118);;
     _64(0x00000000e100860c),        //addd $r0 = $r12, 536 (0x218);;
     _32(0x60140020),        //make $r5 = 32 (0x20);;
     _96(0x0200400080000000e0100000),        //make $r4 = 4613937818241073152 (0x4008000000000000);;
     _96(0x0200000080000000e00c0000),        //make $r3 = 4611686018427387904 (0x4000000000000000);;
     _32(0x1fffff77),        //call 16820 <foo>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _64(0x18000000a601c70c),        //sw 796 (0x31c)[$r12] = $r0;;
     _32(0x10000016),        //goto 16aac <main+0x18c>;;
     _64(0x18000000b400c70c),        //lws $r0 = 796 (0x31c)[$r12];;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _64(0x00000000e104c80c),        //addd $r1 = $r12, 800 (0x320);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x3804be00),        //ld $r1 = -264 (0xfffffef8)[$r0];;
     _96(0x00000000800000f8e0080200),        //make $r2 = 253960 (0x3e008);;
     _64(0x18000000b400c70c),        //lws $r0 = 796 (0x31c)[$r12];;
     _32(0x3802f002),        //ld.xs $r0 = $r0[$r2];;
     _32(0x7a030001),        //fcompd.oeq $r0 = $r1, $r0;;
     _32(0x08000080),        //cb.dnez $r0? 16a98 <main+0x178>;;
     _32(0x18000011),        //call 16ad8 <abort>;;
     _64(0x18000000b000c70c),        //lwz $r0 = 796 (0x31c)[$r12];;
     _32(0x71000040),        //addw $r0 = $r0, 1 (0x1);;
     _64(0x18000000a601c70c),        //sw 796 (0x31c)[$r12] = $r0;;
     _64(0x18000000b000c70c),        //lwz $r0 = 796 (0x31c)[$r12];;
     _64(0x00000000f401b7c0),        //compw.le $r0 = $r0, 31 (0x1f);;
     _32(0x0c7ff9c0),        //cb.wnez $r0? 16a58 <main+0x138>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _64(0x00000000e130c80c),        //addd $r12 = $r12, 800 (0x320);;
     _32(0x0fd00000)        //ret ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16eb0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 189e0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100100000; //0x16920
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110101011011000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016920;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, rcount, wcount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, rcount, wcount, adr_end_main);
print_list_data(mD);
}
