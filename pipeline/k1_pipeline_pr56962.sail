// executing pipeline pr56962 test 
val k1_pipeline_pr56962: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_pr56962() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let bar: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741040c),        //sd 16 (0x10)[$r12] = $r16;;
     _32(0x2701060c),        //sd 24 (0x18)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _96(0x0000000080000117e0045c00),        //make $r1 = 286064 (0x45d70);;
     _32(0x7101a040),        //compd.eq $r0 = $r0, $r1;;
     _32(0x08000080),        //cb.dnez $r0? 1684c <bar+0x2c>;;
     _32(0x18000064),        //call 169d8 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840040c),        //ld $r16 = 16 (0x10)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let foo: list_I = 
 [|
     _32(0x6130f00c),        //addd $r12 = $r12, -64 (0xffffffc0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x2705060c),        //sd 24 (0x18)[$r12] = $r1;;
     _32(0x2709040c),        //sd 16 (0x10)[$r12] = $r2;;
     _32(0x3800040c),        //ld $r0 = 16 (0x10)[$r12];;
     _32(0x790a2080),        //slld $r2 = $r0, 2 (0x2);;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x71090040),        //addd $r2 = $r0, $r1;;
     _32(0x3804060c),        //ld $r1 = 24 (0x18)[$r12];;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x79022040),        //slld $r0 = $r0, 1 (0x1);;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x71010002),        //addd $r0 = $r2, $r0;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x71050040),        //addd $r1 = $r0, $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x38000000),        //ld $r0 = 0 (0x0)[$r0];;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x38040e0c),        //ld $r1 = 56 (0x38)[$r12];;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x71050040),        //addd $r1 = $r0, $r1;;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x3804080c),        //ld $r1 = 32 (0x20)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x1fffffb5),        //call 16820 <bar>;;
     _32(0x3804040c),        //ld $r1 = 16 (0x10)[$r12];;
     _32(0x3800060c),        //ld $r0 = 24 (0x18)[$r12];;
     _32(0x71010001),        //addd $r0 = $r1, $r0;;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x6a000001),        //copyd $r0 = $r1;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x790220c0),        //slld $r0 = $r0, 3 (0x3);;
     _32(0x6a040000),        //copyd $r1 = $r0;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x71010040),        //addd $r0 = $r0, $r1;;
     _32(0x38080c0c),        //ld $r2 = 48 (0x30)[$r12];;
     _32(0x38040a0c),        //ld $r1 = 40 (0x28)[$r12];;
     _32(0x71050042),        //addd $r1 = $r2, $r1;;
     _32(0x27050000),        //sd 0 (0x0)[$r0] = $r1;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840020c),        //ld $r16 = 8 (0x8)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130100c),        //addd $r12 = $r12, 64 (0x40);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60080001),        //make $r2 = 1 (0x1);;
     _32(0x60040018),        //make $r1 = 24 (0x18);;
     _96(0x0000000080000117e0002200),        //make $r0 = 285832 (0x45c88);;
     _32(0x1fffffa8),        //call 16860 <foo>;;
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
     _32(0x980000f3),        //call 16db0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x980007bd),        //call 188e0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100110100000; //0x169a0
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100001100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100110100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100111011000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x00000000000169a0;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
