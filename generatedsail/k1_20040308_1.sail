// executing 20040308_1 test 
val k1_20040308_1: unit -> unit effect {barr, eamem, escape, exmem, rmem, rmemt, rreg, undef, wmv, wmvt, wreg,wmem}
function k1_20040308_1() = {
mI:mem_I = [||];
mD:mem_D = [||];
icount:int = 0;
rcount:int = 0;
wcount:int = 0;
//initialize platform
(mI,mD,icount,rcount,wcount) = init_k1_model();
let foo: list_I = 
 [|
     _32(0x6130d80c),        //addd $r12 = $r12, -160 (0xffffff60);;
     _32(0x2739040c),        //sd 16 (0x10)[$r12] = $r14;;
     _32(0x2849080c),        //sq 32 (0x20)[$r12] = $r18r19;;
     _32(0x28550c0c),        //so 48 (0x30)[$r12] = $r20r21r22r23;;
     _32(0x2865140c),        //so 80 (0x50)[$r12] = $r24r25r26r27;;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x28711c0c),        //sq 112 (0x70)[$r12] = $r28r29;;
     _32(0x2779200c),        //sd 128 (0x80)[$r12] = $r30;;
     _32(0x6138040c),        //addd $r14 = $r12, 16 (0x10);;
     _32(0x26011e0e),        //sw 120 (0x78)[$r14] = $r0;;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x6a780000),        //copyd $r30 = $r0;;
     _32(0x303c1e0e),        //lwz $r15 = 120 (0x78)[$r14];;
     _32(0x6903f00f),        //sxwd $r0 = $r15;;
     _32(0x6a500000),        //copyd $r20 = $r0;;
     _32(0x60540000),        //make $r21 = 0 (0x0);;
     _32(0x7b022ed4),        //srld $r0 = $r20, 59 (0x3b);;
     _32(0x79662155),        //slld $r25 = $r21, 5 (0x5);;
     _32(0x7a650640),        //ord $r25 = $r0, $r25;;
     _32(0x79622154),        //slld $r24 = $r20, 5 (0x5);;
     _32(0x6903f00f),        //sxwd $r0 = $r15;;
     _32(0x6100ffc0),        //addd $r0 = $r0, -1 (0xffffffff);;
     _32(0x2701220e),        //sd 136 (0x88)[$r14] = $r0;;
     _32(0x6903f00f),        //sxwd $r0 = $r15;;
     _32(0x6a480000),        //copyd $r18 = $r0;;
     _32(0x604c0000),        //make $r19 = 0 (0x0);;
     _32(0x7b022ed2),        //srld $r0 = $r18, 59 (0x3b);;
     _32(0x795e2153),        //slld $r23 = $r19, 5 (0x5);;
     _32(0x7a5d05c0),        //ord $r23 = $r0, $r23;;
     _32(0x795a2152),        //slld $r22 = $r18, 5 (0x5);;
     _32(0x6903f00f),        //sxwd $r0 = $r15;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x61480040),        //addd $r18 = $r0, 1 (0x1);;
     _32(0x6903f00f),        //sxwd $r0 = $r15;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x61000140),        //addd $r0 = $r0, 5 (0x5);;
     _32(0x6a400000),        //copyd $r16 = $r0;;
     _32(0x60440000),        //make $r17 = 0 (0x0);;
     _32(0x7b022f50),        //srld $r0 = $r16, 61 (0x3d);;
     _32(0x791620d1),        //slld $r5 = $r17, 3 (0x3);;
     _32(0x7a150140),        //ord $r5 = $r0, $r5;;
     _32(0x791220d0),        //slld $r4 = $r16, 3 (0x3);;
     _32(0x6000001f),        //make $r0 = 31 (0x1f);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x7e21d004),        //addcd.i $r8 = $r4, $r0;;
     _32(0x7e25c045),        //addcd $r9 = $r5, $r1;;
     _32(0x6870f808),        //andd $r28 = $r8, -32 (0xffffffe0);;
     _32(0x6874ffc9),        //andd $r29 = $r9, -1 (0xffffffff);;
     _32(0x6903f00f),        //sxwd $r0 = $r15;;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x61000140),        //addd $r0 = $r0, 5 (0x5);;
     _32(0x6a280000),        //copyd $r10 = $r0;;
     _32(0x602c0000),        //make $r11 = 0 (0x0);;
     _32(0x7b022f4a),        //srld $r0 = $r10, 61 (0x3d);;
     _32(0x790e20cb),        //slld $r3 = $r11, 3 (0x3);;
     _32(0x7a0d00c0),        //ord $r3 = $r0, $r3;;
     _32(0x790a20ca),        //slld $r2 = $r10, 3 (0x3);;
     _32(0x6000001f),        //make $r0 = 31 (0x1f);;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x7e19d002),        //addcd.i $r6 = $r2, $r0;;
     _32(0x7e1dc043),        //addcd $r7 = $r3, $r1;;
     _32(0x6868f806),        //andd $r26 = $r6, -32 (0xffffffe0);;
     _32(0x686cffc7),        //andd $r27 = $r7, -1 (0xffffffff);;
     _32(0x6903f00f),        //sxwd $r0 = $r15;;
     _32(0x61000080),        //addd $r0 = $r0, 2 (0x2);;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x610000c0),        //addd $r0 = $r0, 3 (0x3);;
     _32(0x610007c0),        //addd $r0 = $r0, 31 (0x1f);;
     _32(0x7b022140),        //srld $r0 = $r0, 5 (0x5);;
     _32(0x79022140),        //slld $r0 = $r0, 5 (0x5);;
     _32(0x75310300),        //sbfd $r12 = $r0, $r12;;
     _32(0x6a00000c),        //copyd $r0 = $r12;;
     _32(0x610000c0),        //addd $r0 = $r0, 3 (0x3);;
     _32(0x7b022080),        //srld $r0 = $r0, 2 (0x2);;
     _32(0x79022080),        //slld $r0 = $r0, 2 (0x2);;
     _32(0x2701200e),        //sd 128 (0x80)[$r14] = $r0;;
     _32(0x3800200e),        //ld $r0 = 128 (0x80)[$r14];;
     _32(0x60040000),        //make $r1 = 0 (0x0);;
     _32(0x2607e480),        //sw $r18[$r0] = $r1;;
     _32(0x6a30001e),        //copyd $r12 = $r30;;
     _32(0x7f03f000),        //nop ;;
     _32(0x6130fc0e),        //addd $r12 = $r14, -16 (0xfffffff0);;
     _32(0x3838040c),        //ld $r14 = 16 (0x10)[$r12];;
     _32(0x3c48080c),        //lq $r18r19 = 32 (0x20)[$r12];;
     _32(0x3c540c0c),        //lo $r20r21r22r23 = 48 (0x30)[$r12];;
     _32(0x3c64140c),        //lo $r24r25r26r27 = 80 (0x50)[$r12];;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x3c701c0c),        //lq $r28r29 = 112 (0x70)[$r12];;
     _32(0x3878200c),        //ld $r30 = 128 (0x80)[$r12];;
     _32(0x6130280c),        //addd $r12 = $r12, 160 (0xa0);;
     _32(0x0fd00000),        //ret ;;
     _32(0x7f03f000)        //nop ;;
 |];

let main: list_I = 
 [|
     _32(0x6130f80c),        //addd $r12 = $r12, -32 (0xffffffe0);;
     _32(0x0fc400d0),        //get $r16 = $ra;;
     _32(0x2741060c),        //sd 24 (0x18)[$r12] = $r16;;
     _32(0x60000004),        //make $r0 = 4 (0x4);;
     _32(0x1fffff9e),        //call 16820 <foo>;;
     _32(0x60000000),        //make $r0 = 0 (0x0);;
     _32(0x3840060c),        //ld $r16 = 24 (0x18)[$r12];;
     _32(0x0fc000d0),        //set $ra = $r16;;
     _32(0x6130080c),        //addd $r12 = $r12, 32 (0x20);;
     _32(0x0fd00000)        //ret ;;
 |];

let adr_start:bits(addr_bits) = 0b00010110100110011000; //0x16998
count:int=0;
//write program in instruction memory
mI: mem_I = [||];
num_instr: int = 0;
(adr_end:bits(addr_bits),num_instr,mI)  = Write_ProgI(foo, 0b00010110100000100000, num_instr, mI);
(adr_end_main:bits(addr_bits),num_instr,mI)  = Write_ProgI(main, 0b00010110100110011000, num_instr, mI);
//print_list_instr(mI);
mD = Execute_Program(adr_start,adr_end_main,num_instr,mI,mD,icount,rcount,wcount);
}
