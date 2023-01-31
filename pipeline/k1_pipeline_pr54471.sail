// executing pipeline pr54471.c.out.dumped test 
val k1_pipeline_pr54471: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr54471() = {
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
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741000c),        //sd 0 (0x0)[$r12] = $r16;;
     _32(0x2801040c),        //sq 16 (0x10)[$r12] = $r0r1;;
     _32(0x2609020c),        //sw 8 (0x8)[$r12] = $r2;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x28010c0c),        //sq 48 (0x30)[$r12] = $r0r1;;
     _32(0x3c00040c),        //lq $r0r1 = 16 (0x10)[$r12];;
     _32(0x2801080c),        //sq 32 (0x20)[$r12] = $r0r1;;
     _32(0x1000000f),        //goto 16884 <foo+0x64>;;
     _32(0x3c08080c),        //lq $r2r3 = 32 (0x20)[$r12];;
     _32(0x3c100c0c),        //lq $r4r5 = 48 (0x30)[$r12];;
     _32(0x59041084),        //muludt $r0r1 = $r4, $r2;;
     _32(0x500400c4),        //maddd $r1 = $r4, $r3;;
     _32(0x50040085),        //maddd $r1 = $r5, $r2;;
     _32(0x28010c0c),        //sq 48 (0x30)[$r12] = $r0r1;;
     _32(0x3c00080c),        //lq $r0r1 = 32 (0x20)[$r12];;
     _32(0x590c1000),        //muludt $r2r3 = $r0, $r0;;
     _32(0x500c0040),        //maddd $r3 = $r0, $r1;;
     _32(0x500c0001),        //maddd $r3 = $r1, $r0;;
     _32(0x2809080c),        //sq 32 (0x20)[$r12] = $r2r3;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x7100ffc0),        //addw $r0 = $r0, -1 (0xffffffff);;
     _32(0x2601020c),        //sw 8 (0x8)[$r12] = $r0;;
     _32(0x3000020c),        //lwz $r0 = 8 (0x8)[$r12];;
     _32(0x0c7ffc40),        //cb.wnez $r0? 1684c <foo+0x2c>;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _64(0x000036bce0019ac0),        //compd.ne $r0 = $r0, 14348907 (0xdaf26b);;
     _32(0x080000c0),        //cb.dnez $r0? 168a4 <foo+0x84>;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x08800080),        //cb.deqz $r0? 168a8 <foo+0x88>;;
     _32(0x18000015),        //call 168f8 <abort>;;
     _32(0x3c000c0c),        //lq $r0r1 = 48 (0x30)[$r12];;
     _32(0x3840000c),        //ld $r16 = 0 (0x0)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x60080004),        //make $r2 = 4 (0x4);;
     _32(0x60000003),        //make $r0 = 3 (0x3);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x1fffffd2),        //call 16820 <foo>;;
     _32(0x2801040c),        //sq 16 (0x10)[$r12] = $r0r1;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000),        //ret ;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x980000f3),        //call 16cd0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 18800 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100011000000; //0x168c0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100011000000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100011111000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000168c0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
