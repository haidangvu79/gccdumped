// executing pipeline 20030715_1.c.out.dumped test 
val k1_pipeline_20030715_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20030715_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let ap_check_cmd_context: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x2605040c),        //sw 16 (0x10)[$r12] = $r1;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let server_type: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x27050a0c),        //sd 40 (0x28)[$r12] = $r1;;
     _32(0x2709080c),        //sd 32 (0x20)[$r12] = $r2;;
     _32(0x6004001f),        //make $r1 = 31 (0x1f);;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x1ffffff2),        //call 16820 <ap_check_cmd_context>;;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x088000c0),        //cb.deqz $r0? 16870 <server_type+0x38>;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x10000020),        //goto 168ec <server_type+0xb4>;;
     _96(0x00000000800000fce004f000),        //make $r1 = 259008 (0x3f3c0);;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x1800006e),        //call 16a38 <strcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x080001c0),        //cb.dnez $r0? 168a4 <server_type+0x6c>;;
     _96(0x0000000080000117e0003600),        //make $r0 = 285912 (0x45cd8);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x10000012),        //goto 168e8 <server_type+0xb0>;;
     _96(0x00000000800000fce004f200),        //make $r1 = 259016 (0x3f3c8);;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x18000061),        //call 16a38 <strcmp>;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x080001c0),        //cb.dnez $r0? 168d8 <server_type+0xa0>;;
     _96(0x0000000080000117e0003600),        //make $r0 = 285912 (0x45cd8);;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x26050000),        //sw 0 (0x0)[$r0] = $r1;;
     _32(0x10000005),        //goto 168e8 <server_type+0xb0>;;
     _96(0x00000000800000fce000f600),        //make $r0 = 259032 (0x3f3d8);;
     _32(0x10000002),        //goto 168ec <server_type+0xb4>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _96(0x00000000800000fce008f200),        //make $r2 = 259016 (0x3f3c8);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffc6),        //call 16838 <server_type>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100000000; //0x16900
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(ap_check_cmd_context, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(server_type, 0b00010110100000111000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100000000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016900;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
