// executing pipeline 20141107_1.c.out.dumped test 
val k1_pipeline_20141107_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20141107_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let f: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x2601060c),        //sw 24 (0x18)[$r12] = $r0;;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x2401040c),        //sb 16 (0x10)[$r12] = $r0;;
     _32(0x3000060c),        //lwz $r0 = 24 (0x18)[$r12];;
     _32(0x0c000340),        //cb.wnez $r0? 16868 <f+0x48>;;
     _32(0x2000040c),        //lbz $r0 = 16 (0x10)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _64(0x00000000f001b000),        //compw.ne $r0 = $r0, 0 (0x0);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7c000040),        //xorw $r0 = $r0, 1 (0x1);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x2401040c),        //sb 16 (0x10)[$r12] = $r0;;
     _32(0x2000040c),        //lbz $r0 = 16 (0x10)[$r12];;
     _32(0x78000040),        //andw $r0 = $r0, 1 (0x1);;
     _32(0x2401040c),        //sb 16 (0x10)[$r12] = $r0;;
     _32(0x2000040c),        //lbz $r0 = 16 (0x10)[$r12];;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let checkf: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x26010a0c),        //sw 40 (0x28)[$r12] = $r0;;
     _32(0x7a000001),        //copyw $r0 = $r1;;
     _32(0x2401080c),        //sb 32 (0x20)[$r12] = $r0;;
     _32(0x2000080c),        //lbz $r0 = 32 (0x20)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7a040000),        //copyw $r1 = $r0;;
     _32(0x30000a0c),        //lwz $r0 = 40 (0x28)[$r12];;
     _32(0x1fffffe0),        //call 16820 <f>;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x24010e0c),        //sb 56 (0x38)[$r12] = $r0;;
     _32(0x20000e0c),        //lbz $r0 = 56 (0x38)[$r12];;
     _32(0x24010c0c),        //sb 48 (0x30)[$r12] = $r0;;
     _32(0x20000c0c),        //lbz $r0 = 48 (0x30)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x30000a0c),        //lwz $r0 = 40 (0x28)[$r12];;
     _64(0x00000000f101b000),        //compw.eq $r0 = $r0, 0 (0x0);;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7001b001),        //compw.ne $r0 = $r1, $r0;;
     _32(0x78003fc0),        //zxbd $r0 = $r0;;
     _32(0x7804ffc0),        //zxwd $r1 = $r0;;
     _32(0x2000080c),        //lbz $r0 = 32 (0x20)[$r12];;
     _32(0x7800ffc0),        //zxwd $r0 = $r0;;
     _32(0x7101b001),        //compw.eq $r0 = $r1, $r0;;
     _32(0x0c000080),        //cb.wnez $r0? 168f4 <checkf+0x7c>;;
     _32(0x1800001a),        //call 16958 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffd7),        //call 16878 <checkf>;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1fffffd4),        //call 16878 <checkf>;;
     _32(0x60040001),        //make $r1 = 1 (0x1);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffffd1),        //call 16878 <checkf>;;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x1fffffce),        //call 16878 <checkf>;;
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
     _32(0x980000f3),        //call 16d30 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18860 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100100001000; //0x16908
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(checkf, 0b00010110100001111000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100100001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100101011000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016908;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
