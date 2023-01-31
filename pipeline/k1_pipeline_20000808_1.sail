// executing pipeline 20000808_1 test 
val k1_pipeline_20000808_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_pipeline_20000808_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let bar: list_I = 
 [|
     _32(0x7f03f000),        //nop ;;
     _32(0x0fd00000)        //ret ;;
 |];

let f: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x28011c0c),        //sq 112 (0x70)[$r12] = $r0r1;;
     _32(0x2809180c),        //sq 96 (0x60)[$r12] = $r2r3;;
     _32(0x2811140c),        //sq 80 (0x50)[$r12] = $r4r5;;
     _32(0x2819100c),        //sq 64 (0x40)[$r12] = $r6r7;;
     _32(0x28210c0c),        //sq 48 (0x30)[$r12] = $r8r9;;
     _32(0x2829080c),        //sq 32 (0x20)[$r12] = $r10r11;;
     _32(0x38001c0c),        //ld $r0 = 112 (0x70)[$r12];;
     _32(0x080007c0),        //cb.dnez $r0? 168cc <f+0xa4>;;
     _32(0x38001e0c),        //ld $r0 = 120 (0x78)[$r12];;
     _32(0x60010040),        //compd.ne $r0 = $r0, 1 (0x1);;
     _32(0x08000700),        //cb.dnez $r0? 168cc <f+0xa4>;;
     _32(0x3800180c),        //ld $r0 = 96 (0x60)[$r12];;
     _32(0x6001ffc0),        //compd.ne $r0 = $r0, -1 (0xffffffff);;
     _32(0x08000640),        //cb.dnez $r0? 168cc <f+0xa4>;;
     _32(0x38001a0c),        //ld $r0 = 104 (0x68)[$r12];;
     _32(0x080005c0),        //cb.dnez $r0? 168cc <f+0xa4>;;
     _32(0x3800140c),        //ld $r0 = 80 (0x50)[$r12];;
     _32(0x60010040),        //compd.ne $r0 = $r0, 1 (0x1);;
     _32(0x08000500),        //cb.dnez $r0? 168cc <f+0xa4>;;
     _32(0x3800160c),        //ld $r0 = 88 (0x58)[$r12];;
     _32(0x6001ffc0),        //compd.ne $r0 = $r0, -1 (0xffffffff);;
     _32(0x08000440),        //cb.dnez $r0? 168cc <f+0xa4>;;
     _32(0x3800100c),        //ld $r0 = 64 (0x40)[$r12];;
     _32(0x6001ffc0),        //compd.ne $r0 = $r0, -1 (0xffffffff);;
     _32(0x08000380),        //cb.dnez $r0? 168cc <f+0xa4>;;
     _32(0x3800120c),        //ld $r0 = 72 (0x48)[$r12];;
     _32(0x60010040),        //compd.ne $r0 = $r0, 1 (0x1);;
     _32(0x080002c0),        //cb.dnez $r0? 168cc <f+0xa4>;;
     _32(0x38000c0c),        //ld $r0 = 48 (0x30)[$r12];;
     _32(0x08000240),        //cb.dnez $r0? 168cc <f+0xa4>;;
     _32(0x38000e0c),        //ld $r0 = 56 (0x38)[$r12];;
     _32(0x6001ffc0),        //compd.ne $r0 = $r0, -1 (0xffffffff);;
     _32(0x08000180),        //cb.dnez $r0? 168cc <f+0xa4>;;
     _32(0x3800080c),        //ld $r0 = 32 (0x20)[$r12];;
     _32(0x60010040),        //compd.ne $r0 = $r0, 1 (0x1);;
     _32(0x080000c0),        //cb.dnez $r0? 168cc <f+0xa4>;;
     _32(0x38000a0c),        //ld $r0 = 40 (0x28)[$r12];;
     _32(0x08800080),        //cb.deqz $r0? 168d0 <f+0xa8>;;
     _32(0x18000035),        //call 169a0 <abort>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130200c),        //addd $r12 = $r12, 128 (0x80);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let foo: list_I = 
 [|
     _32(0x6130e00c),        //addd $r12 = $r12, -128 (0xffffff80);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1fffffcb),        //call 16820 <bar>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x27011c0c),        //sd 112 (0x70)[$r12] = $r0;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x27011e0c),        //sd 120 (0x78)[$r12] = $r0;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x2701180c),        //sd 96 (0x60)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x27011a0c),        //sd 104 (0x68)[$r12] = $r0;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2701140c),        //sd 80 (0x50)[$r12] = $r0;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x2701160c),        //sd 88 (0x58)[$r12] = $r0;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x2701100c),        //sd 64 (0x40)[$r12] = $r0;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2701120c),        //sd 72 (0x48)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x27010c0c),        //sd 48 (0x30)[$r12] = $r0;;
     _32(0x6000ffff),        //make $r0 = -1 (0xffffffff);;
     _32(0x27010e0c),        //sd 56 (0x38)[$r12] = $r0;;
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x2701080c),        //sd 32 (0x20)[$r12] = $r0;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x27010a0c),        //sd 40 (0x28)[$r12] = $r0;;
     _32(0x3c28080c),        //lq $r10r11 = 32 (0x20)[$r12];;
     _32(0x3c200c0c),        //lq $r8r9 = 48 (0x30)[$r12];;
     _32(0x3c18100c),        //lq $r6r7 = 64 (0x40)[$r12];;
     _32(0x3c10140c),        //lq $r4r5 = 80 (0x50)[$r12];;
     _32(0x3c08180c),        //lq $r2r3 = 96 (0x60)[$r12];;
     _32(0x3c001c0c),        //lq $r0r1 = 112 (0x70)[$r12];;
     _32(0x1fffffae),        //call 16828 <f>;;
     _32(0x7f03f000),        //nop ;;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130200c),        //addd $r12 = $r12, 128 (0x80);;
     _32(0x0fd00000)        //ret ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x1fffffd5),        //call 168e8 <foo>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x18000009)        //call 169c0 <exit>;;
 |];

let abort: list_I = 
 [|
     _32(0x8fc400d0),        //get $r16 = $ra
     _32(0xe130f80c),        //addd $r12 = $r12, -32 (0xffffffe0)
     _32(0x60000006),        //make $r0 = 6 (0x6);;
     _32(0x98000105),        //call 16dc0 <raise>
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x98000839),        //call 18a98 <_exit>
     _32(0x60000001),        //make $r0 = 1 (0x1);;
     _32(0x00000000)        //errop ;;
 |];

let exit_: list_I = 
 [|
 |];

let adr_start:bits(addr_bits) = 0b00010110100110001000; //0x16988
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(bar, 0b00010110100000100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(f, 0b00010110100000101000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100011101000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100110001000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(abort, 0b00010110100110100000, num_instr, mI);
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(exit_, 0b00010110100111000000, num_instr, mI);
adr_end_main = adr_end_main - 4;
//print_list_instr(mI);
//create and initialize the VLIW pipeline
k1pipeline:vliw_k1_pipeline = create_vliw_k1_pipeline();
//initialize VLIW counters and data structures (PFB, bundles, syllables, etc.)
(bdl:bundle, nb_syllables:int, nb_bundles:int)=initialize_vliw();
//set PC to the first address of the program
PC = 0x0000000000016988;
cycles:int=0;
bdl_formed:bool=false;
//execute vliw pipeline
(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed) = execute_vliw_pipeline(k1pipeline, mI, mD, bdl, nb_bundles, cycles, icount, bdl_formed, num_instr, adr_end_main);
print_list_data(mD);
}
