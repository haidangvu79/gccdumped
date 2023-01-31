// executing pipeline 20011121_1 test 
val k1_pipeline_20011121_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20011121_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let main: list_I = 
 [|
     _32(0x6130e80c),        //addd $r12 = $r12, -96 (0xffffffa0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741020c),        //sd 8 (0x8)[$r12] = $r16;;
     _32(0x60000064),        //make $r0 = 100 (0x64);;
     _32(0x2401164c),        //sb 89 (0x59)[$r12] = $r0;;
     _32(0x6100040c),        //addd $r0 = $r12, 16 (0x10);;
     _96(0x0000000080000117e0042200),        //make $r1 = 285832 (0x45c88);;
     _32(0x38080001),        //ld $r2 = 0 (0x0)[$r1];;
     _32(0x27090000),        //sd 0 (0x0)[$r0] = $r2;;
     _32(0x38080201),        //ld $r2 = 8 (0x8)[$r1];;
     _32(0x27090200),        //sd 8 (0x8)[$r0] = $r2;;
     _32(0x38080401),        //ld $r2 = 16 (0x10)[$r1];;
     _32(0x27090400),        //sd 16 (0x10)[$r0] = $r2;;
     _32(0x38080601),        //ld $r2 = 24 (0x18)[$r1];;
     _32(0x27090600),        //sd 24 (0x18)[$r0] = $r2;;
     _32(0x38080801),        //ld $r2 = 32 (0x20)[$r1];;
     _32(0x27090800),        //sd 32 (0x20)[$r0] = $r2;;
     _32(0x38080a01),        //ld $r2 = 40 (0x28)[$r1];;
     _32(0x27090a00),        //sd 40 (0x28)[$r0] = $r2;;
     _32(0x38080c01),        //ld $r2 = 48 (0x30)[$r1];;
     _32(0x27090c00),        //sd 48 (0x30)[$r0] = $r2;;
     _32(0x38080e01),        //ld $r2 = 56 (0x38)[$r1];;
     _32(0x27090e00),        //sd 56 (0x38)[$r0] = $r2;;
     _32(0x38081001),        //ld $r2 = 64 (0x40)[$r1];;
     _32(0x27091000),        //sd 64 (0x40)[$r0] = $r2;;
     _32(0x20041201),        //lbz $r1 = 72 (0x48)[$r1];;
     _32(0x24051200),        //sb 72 (0x48)[$r0] = $r1;;
     _32(0x2000164c),        //lbz $r0 = 89 (0x59)[$r12];;
     _32(0x68037000),        //sxbd $r0 = $r0;;
     _64(0x00000003f101b100),        //compw.eq $r0 = $r0, 100 (0x64);;
     _32(0x0c000080),        //cb.wnez $r0? 168ac <main+0x8c>;;
     _32(0x18000004),        //call 168b8 <abort>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x1800000a),        //call 168d8 <exit>;;
     _32(0x00000000)        //errop ;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16cd8 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 189b0 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
 |];

let adr_start:bits(addr_bits) = 0b00010110100000100000; //0x16820
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100010111000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100011011000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016820;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
