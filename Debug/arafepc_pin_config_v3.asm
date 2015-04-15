;******************************************************************************
;* MSP430 C/C++ Codegen                                             PC v4.3.5 *
;* Date/Time created: Wed Apr 15 12:50:13 2015                                *
;******************************************************************************
	.compiler_opts --abi=eabi --diag_wrap=off --hll_source=on --mem_model:code=small --mem_model:data=small --object_format=elf --silicon_version=msp --symdebug:dwarf --symdebug:dwarf_version=3 

$C$DW$CU	.dwtag  DW_TAG_compile_unit
	.dwattr $C$DW$CU, DW_AT_name("../arafepc_pin_config_v3.c")
	.dwattr $C$DW$CU, DW_AT_producer("TI MSP430 C/C++ Codegen PC v4.3.5 Copyright (c) 2003-2014 Texas Instruments Incorporated")
	.dwattr $C$DW$CU, DW_AT_TI_version(0x01)
	.dwattr $C$DW$CU, DW_AT_comp_dir("C:\Users\barawn\ara\arafe_slave_v2\Debug")
$C$DW$1	.dwtag  DW_TAG_variable, DW_AT_name("P1OUT")
	.dwattr $C$DW$1, DW_AT_TI_symbol_name("P1OUT")
	.dwattr $C$DW$1, DW_AT_type(*$C$DW$T$21)
	.dwattr $C$DW$1, DW_AT_declaration
	.dwattr $C$DW$1, DW_AT_external
	.dwattr $C$DW$1, DW_AT_decl_file("c:\ti\ccsv6\ccs_base\msp430\include\msp430g2153.h")
	.dwattr $C$DW$1, DW_AT_decl_line(0x1ca)
	.dwattr $C$DW$1, DW_AT_decl_column(0x01)
$C$DW$2	.dwtag  DW_TAG_variable, DW_AT_name("P2OUT")
	.dwattr $C$DW$2, DW_AT_TI_symbol_name("P2OUT")
	.dwattr $C$DW$2, DW_AT_type(*$C$DW$T$21)
	.dwattr $C$DW$2, DW_AT_declaration
	.dwattr $C$DW$2, DW_AT_external
	.dwattr $C$DW$2, DW_AT_decl_file("c:\ti\ccsv6\ccs_base\msp430\include\msp430g2153.h")
	.dwattr $C$DW$2, DW_AT_decl_line(0x1d4)
	.dwattr $C$DW$2, DW_AT_decl_column(0x01)
$C$DW$3	.dwtag  DW_TAG_variable, DW_AT_name("P3OUT")
	.dwattr $C$DW$3, DW_AT_TI_symbol_name("P3OUT")
	.dwattr $C$DW$3, DW_AT_type(*$C$DW$T$21)
	.dwattr $C$DW$3, DW_AT_declaration
	.dwattr $C$DW$3, DW_AT_external
	.dwattr $C$DW$3, DW_AT_decl_file("c:\ti\ccsv6\ccs_base\msp430\include\msp430g2153.h")
	.dwattr $C$DW$3, DW_AT_decl_line(0x1e3)
	.dwattr $C$DW$3, DW_AT_decl_column(0x01)
	.global	enable_port_arr
	.sect	".infoD"
	.align	2
	.elfsym	enable_port_arr,SYM_SIZE(8)
enable_port_arr:
	.bits	P2OUT,16		; enable_port_arr[0] @ 0
	.bits	P3OUT,16		; enable_port_arr[1] @ 16
	.bits	P2OUT,16		; enable_port_arr[2] @ 32
	.bits	P3OUT,16		; enable_port_arr[3] @ 48

$C$DW$4	.dwtag  DW_TAG_variable, DW_AT_name("enable_port_arr")
	.dwattr $C$DW$4, DW_AT_TI_symbol_name("enable_port_arr")
	.dwattr $C$DW$4, DW_AT_location[DW_OP_addr enable_port_arr]
	.dwattr $C$DW$4, DW_AT_type(*$C$DW$T$27)
	.dwattr $C$DW$4, DW_AT_external
	.dwattr $C$DW$4, DW_AT_decl_file("../arafepc_pin_config_v3.c")
	.dwattr $C$DW$4, DW_AT_decl_line(0x3a)
	.dwattr $C$DW$4, DW_AT_decl_column(0x19)
	.global	enable_bit_arr
	.sect	".infoD"
	.align	2
	.elfsym	enable_bit_arr,SYM_SIZE(4)
enable_bit_arr:
	.bits	32,8			; enable_bit_arr[0] @ 0
	.bits	16,8			; enable_bit_arr[1] @ 8
	.bits	4,8			; enable_bit_arr[2] @ 16
	.bits	1,8			; enable_bit_arr[3] @ 24

$C$DW$5	.dwtag  DW_TAG_variable, DW_AT_name("enable_bit_arr")
	.dwattr $C$DW$5, DW_AT_TI_symbol_name("enable_bit_arr")
	.dwattr $C$DW$5, DW_AT_location[DW_OP_addr enable_bit_arr]
	.dwattr $C$DW$5, DW_AT_type(*$C$DW$T$30)
	.dwattr $C$DW$5, DW_AT_external
	.dwattr $C$DW$5, DW_AT_decl_file("../arafepc_pin_config_v3.c")
	.dwattr $C$DW$5, DW_AT_decl_line(0x3f)
	.dwattr $C$DW$5, DW_AT_decl_column(0x0f)
	.global	att_port_arr
	.sect	".infoD"
	.align	2
	.elfsym	att_port_arr,SYM_SIZE(16)
att_port_arr:
	.bits	P3OUT,16		; att_port_arr[0] @ 0
	.bits	P2OUT,16		; att_port_arr[1] @ 16
	.bits	P3OUT,16		; att_port_arr[2] @ 32
	.bits	P2OUT,16		; att_port_arr[3] @ 48
	.bits	P3OUT,16		; att_port_arr[4] @ 64
	.bits	P2OUT,16		; att_port_arr[5] @ 80
	.bits	P3OUT,16		; att_port_arr[6] @ 96
	.bits	P2OUT,16		; att_port_arr[7] @ 112

$C$DW$6	.dwtag  DW_TAG_variable, DW_AT_name("att_port_arr")
	.dwattr $C$DW$6, DW_AT_TI_symbol_name("att_port_arr")
	.dwattr $C$DW$6, DW_AT_location[DW_OP_addr att_port_arr]
	.dwattr $C$DW$6, DW_AT_type(*$C$DW$T$28)
	.dwattr $C$DW$6, DW_AT_external
	.dwattr $C$DW$6, DW_AT_decl_file("../arafepc_pin_config_v3.c")
	.dwattr $C$DW$6, DW_AT_decl_line(0x41)
	.dwattr $C$DW$6, DW_AT_decl_column(0x19)
	.global	att_bit_arr
	.sect	".infoD"
	.align	2
	.elfsym	att_bit_arr,SYM_SIZE(8)
att_bit_arr:
	.bits	64,8			; att_bit_arr[0] @ 0
	.bits	16,8			; att_bit_arr[1] @ 8
	.bits	8,8			; att_bit_arr[2] @ 16
	.bits	2,8			; att_bit_arr[3] @ 24
	.bits	32,8			; att_bit_arr[4] @ 32
	.bits	8,8			; att_bit_arr[5] @ 40
	.bits	4,8			; att_bit_arr[6] @ 48
	.bits	1,8			; att_bit_arr[7] @ 56

$C$DW$7	.dwtag  DW_TAG_variable, DW_AT_name("att_bit_arr")
	.dwattr $C$DW$7, DW_AT_TI_symbol_name("att_bit_arr")
	.dwattr $C$DW$7, DW_AT_location[DW_OP_addr att_bit_arr]
	.dwattr $C$DW$7, DW_AT_type(*$C$DW$T$31)
	.dwattr $C$DW$7, DW_AT_external
	.dwattr $C$DW$7, DW_AT_decl_file("../arafepc_pin_config_v3.c")
	.dwattr $C$DW$7, DW_AT_decl_line(0x44)
	.dwattr $C$DW$7, DW_AT_decl_column(0x0f)
	.global	en_5v_port
	.sect	".infoD"
	.align	2
	.elfsym	en_5v_port,SYM_SIZE(2)
en_5v_port:
	.bits	P3OUT,16		; en_5v_port @ 0

$C$DW$8	.dwtag  DW_TAG_variable, DW_AT_name("en_5v_port")
	.dwattr $C$DW$8, DW_AT_TI_symbol_name("en_5v_port")
	.dwattr $C$DW$8, DW_AT_location[DW_OP_addr en_5v_port]
	.dwattr $C$DW$8, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$8, DW_AT_external
	.dwattr $C$DW$8, DW_AT_decl_file("../arafepc_pin_config_v3.c")
	.dwattr $C$DW$8, DW_AT_decl_line(0x48)
	.dwattr $C$DW$8, DW_AT_decl_column(0x19)
	.global	en_5v_bit
	.sect	".infoD"
	.align	1
	.elfsym	en_5v_bit,SYM_SIZE(1)
en_5v_bit:
	.bits	128,8			; en_5v_bit @ 0

$C$DW$9	.dwtag  DW_TAG_variable, DW_AT_name("en_5v_bit")
	.dwattr $C$DW$9, DW_AT_TI_symbol_name("en_5v_bit")
	.dwattr $C$DW$9, DW_AT_location[DW_OP_addr en_5v_bit]
	.dwattr $C$DW$9, DW_AT_type(*$C$DW$T$29)
	.dwattr $C$DW$9, DW_AT_external
	.dwattr $C$DW$9, DW_AT_decl_file("../arafepc_pin_config_v3.c")
	.dwattr $C$DW$9, DW_AT_decl_line(0x4a)
	.dwattr $C$DW$9, DW_AT_decl_column(0x0f)
	.global	spiclk_port
	.sect	".infoD"
	.align	2
	.elfsym	spiclk_port,SYM_SIZE(2)
spiclk_port:
	.bits	P1OUT,16		; spiclk_port @ 0

$C$DW$10	.dwtag  DW_TAG_variable, DW_AT_name("spiclk_port")
	.dwattr $C$DW$10, DW_AT_TI_symbol_name("spiclk_port")
	.dwattr $C$DW$10, DW_AT_location[DW_OP_addr spiclk_port]
	.dwattr $C$DW$10, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$10, DW_AT_external
	.dwattr $C$DW$10, DW_AT_decl_file("../arafepc_pin_config_v3.c")
	.dwattr $C$DW$10, DW_AT_decl_line(0x4d)
	.dwattr $C$DW$10, DW_AT_decl_column(0x19)
	.global	spiclk_bit
	.sect	".infoD"
	.align	1
	.elfsym	spiclk_bit,SYM_SIZE(1)
spiclk_bit:
	.bits	64,8			; spiclk_bit @ 0

$C$DW$11	.dwtag  DW_TAG_variable, DW_AT_name("spiclk_bit")
	.dwattr $C$DW$11, DW_AT_TI_symbol_name("spiclk_bit")
	.dwattr $C$DW$11, DW_AT_location[DW_OP_addr spiclk_bit]
	.dwattr $C$DW$11, DW_AT_type(*$C$DW$T$29)
	.dwattr $C$DW$11, DW_AT_external
	.dwattr $C$DW$11, DW_AT_decl_file("../arafepc_pin_config_v3.c")
	.dwattr $C$DW$11, DW_AT_decl_line(0x4f)
	.dwattr $C$DW$11, DW_AT_decl_column(0x0f)
	.global	spidata_port
	.sect	".infoD"
	.align	2
	.elfsym	spidata_port,SYM_SIZE(2)
spidata_port:
	.bits	P1OUT,16		; spidata_port @ 0

$C$DW$12	.dwtag  DW_TAG_variable, DW_AT_name("spidata_port")
	.dwattr $C$DW$12, DW_AT_TI_symbol_name("spidata_port")
	.dwattr $C$DW$12, DW_AT_location[DW_OP_addr spidata_port]
	.dwattr $C$DW$12, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$12, DW_AT_external
	.dwattr $C$DW$12, DW_AT_decl_file("../arafepc_pin_config_v3.c")
	.dwattr $C$DW$12, DW_AT_decl_line(0x51)
	.dwattr $C$DW$12, DW_AT_decl_column(0x19)
	.global	spidata_bit
	.sect	".infoD"
	.align	1
	.elfsym	spidata_bit,SYM_SIZE(1)
spidata_bit:
	.bits	128,8			; spidata_bit @ 0

$C$DW$13	.dwtag  DW_TAG_variable, DW_AT_name("spidata_bit")
	.dwattr $C$DW$13, DW_AT_TI_symbol_name("spidata_bit")
	.dwattr $C$DW$13, DW_AT_location[DW_OP_addr spidata_bit]
	.dwattr $C$DW$13, DW_AT_type(*$C$DW$T$29)
	.dwattr $C$DW$13, DW_AT_external
	.dwattr $C$DW$13, DW_AT_decl_file("../arafepc_pin_config_v3.c")
	.dwattr $C$DW$13, DW_AT_decl_line(0x53)
	.dwattr $C$DW$13, DW_AT_decl_column(0x0f)
;	c:\ti\ccsv6\tools\compiler\msp430_4.3.5\bin\opt430.exe --gen_opt_info=2 C:\\Users\\barawn\\AppData\\Local\\Temp\\055602 C:\\Users\\barawn\\AppData\\Local\\Temp\\055604 --opt_info_filename=arafepc_pin_config_v3.nfo 
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	P1OUT
	.global	P2OUT
	.global	P3OUT

;******************************************************************************
;* BUILD ATTRIBUTES                                                           *
;******************************************************************************
	.battr "TI", Tag_File, 1, Tag_LPM_INFO(1)
	.battr "TI", Tag_File, 1, Tag_HW_MPY32_INFO(1)
	.battr "TI", Tag_File, 1, Tag_PORTS_INIT_INFO("012345678901ABCDEFGHIJ01110000000000000000000000000000000000000000")
	.battr "mspabi", Tag_File, 1, Tag_enum_size(3)

;******************************************************************************
;* TYPE INFORMATION                                                           *
;******************************************************************************
$C$DW$T$2	.dwtag  DW_TAG_unspecified_type
	.dwattr $C$DW$T$2, DW_AT_name("void")
$C$DW$T$4	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$4, DW_AT_encoding(DW_ATE_boolean)
	.dwattr $C$DW$T$4, DW_AT_name("bool")
	.dwattr $C$DW$T$4, DW_AT_byte_size(0x01)
$C$DW$T$5	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$5, DW_AT_encoding(DW_ATE_signed_char)
	.dwattr $C$DW$T$5, DW_AT_name("signed char")
	.dwattr $C$DW$T$5, DW_AT_byte_size(0x01)
$C$DW$T$19	.dwtag  DW_TAG_typedef, DW_AT_name("int8_t")
	.dwattr $C$DW$T$19, DW_AT_type(*$C$DW$T$5)
	.dwattr $C$DW$T$19, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$19, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$19, DW_AT_decl_line(0x2a)
	.dwattr $C$DW$T$19, DW_AT_decl_column(0x1e)
$C$DW$T$20	.dwtag  DW_TAG_typedef, DW_AT_name("int_least8_t")
	.dwattr $C$DW$T$20, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$T$20, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$20, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$20, DW_AT_decl_line(0x37)
	.dwattr $C$DW$T$20, DW_AT_decl_column(0x17)
$C$DW$T$6	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$6, DW_AT_encoding(DW_ATE_unsigned_char)
	.dwattr $C$DW$T$6, DW_AT_name("unsigned char")
	.dwattr $C$DW$T$6, DW_AT_byte_size(0x01)
$C$DW$T$21	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$21, DW_AT_type(*$C$DW$T$6)
$C$DW$T$23	.dwtag  DW_TAG_typedef, DW_AT_name("uint8_t")
	.dwattr $C$DW$T$23, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$T$23, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$23, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$23, DW_AT_decl_line(0x2b)
	.dwattr $C$DW$T$23, DW_AT_decl_column(0x1d)
$C$DW$T$24	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$24, DW_AT_type(*$C$DW$T$23)
$C$DW$T$25	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$25, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$T$25, DW_AT_address_class(0x10)
$C$DW$T$26	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$26, DW_AT_type(*$C$DW$T$25)

$C$DW$T$27	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$27, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$T$27, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$27, DW_AT_byte_size(0x08)
$C$DW$14	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$14, DW_AT_upper_bound(0x03)
	.dwendtag $C$DW$T$27


$C$DW$T$28	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$28, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$T$28, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$28, DW_AT_byte_size(0x10)
$C$DW$15	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$15, DW_AT_upper_bound(0x07)
	.dwendtag $C$DW$T$28

$C$DW$T$29	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$29, DW_AT_type(*$C$DW$T$23)

$C$DW$T$30	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$30, DW_AT_type(*$C$DW$T$29)
	.dwattr $C$DW$T$30, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$30, DW_AT_byte_size(0x04)
$C$DW$16	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$16, DW_AT_upper_bound(0x03)
	.dwendtag $C$DW$T$30


$C$DW$T$31	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$31, DW_AT_type(*$C$DW$T$29)
	.dwattr $C$DW$T$31, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$31, DW_AT_byte_size(0x08)
$C$DW$17	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$17, DW_AT_upper_bound(0x07)
	.dwendtag $C$DW$T$31

$C$DW$T$32	.dwtag  DW_TAG_typedef, DW_AT_name("uint_least8_t")
	.dwattr $C$DW$T$32, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$32, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$32, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$32, DW_AT_decl_line(0x38)
	.dwattr $C$DW$T$32, DW_AT_decl_column(0x16)
$C$DW$T$7	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$7, DW_AT_encoding(DW_ATE_signed_char)
	.dwattr $C$DW$T$7, DW_AT_name("wchar_t")
	.dwattr $C$DW$T$7, DW_AT_byte_size(0x02)
$C$DW$T$8	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$8, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$8, DW_AT_name("short")
	.dwattr $C$DW$T$8, DW_AT_byte_size(0x02)
$C$DW$T$9	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$9, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$9, DW_AT_name("unsigned short")
	.dwattr $C$DW$T$9, DW_AT_byte_size(0x02)
$C$DW$T$10	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$10, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$10, DW_AT_name("int")
	.dwattr $C$DW$T$10, DW_AT_byte_size(0x02)
$C$DW$T$33	.dwtag  DW_TAG_typedef, DW_AT_name("int16_t")
	.dwattr $C$DW$T$33, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$T$33, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$33, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$33, DW_AT_decl_line(0x2c)
	.dwattr $C$DW$T$33, DW_AT_decl_column(0x1d)
$C$DW$T$34	.dwtag  DW_TAG_typedef, DW_AT_name("int_fast16_t")
	.dwattr $C$DW$T$34, DW_AT_type(*$C$DW$T$33)
	.dwattr $C$DW$T$34, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$34, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$34, DW_AT_decl_line(0x47)
	.dwattr $C$DW$T$34, DW_AT_decl_column(0x17)
$C$DW$T$35	.dwtag  DW_TAG_typedef, DW_AT_name("int_fast8_t")
	.dwattr $C$DW$T$35, DW_AT_type(*$C$DW$T$33)
	.dwattr $C$DW$T$35, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$35, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$35, DW_AT_decl_line(0x45)
	.dwattr $C$DW$T$35, DW_AT_decl_column(0x17)
$C$DW$T$36	.dwtag  DW_TAG_typedef, DW_AT_name("int_least16_t")
	.dwattr $C$DW$T$36, DW_AT_type(*$C$DW$T$33)
	.dwattr $C$DW$T$36, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$36, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$36, DW_AT_decl_line(0x3a)
	.dwattr $C$DW$T$36, DW_AT_decl_column(0x17)
$C$DW$T$37	.dwtag  DW_TAG_typedef, DW_AT_name("intptr_t")
	.dwattr $C$DW$T$37, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$T$37, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$37, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$37, DW_AT_decl_line(0x56)
	.dwattr $C$DW$T$37, DW_AT_decl_column(0x1a)
$C$DW$T$11	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$11, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$11, DW_AT_name("unsigned int")
	.dwattr $C$DW$T$11, DW_AT_byte_size(0x02)
$C$DW$T$38	.dwtag  DW_TAG_typedef, DW_AT_name("uint16_t")
	.dwattr $C$DW$T$38, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$38, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$38, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$38, DW_AT_decl_line(0x2d)
	.dwattr $C$DW$T$38, DW_AT_decl_column(0x1c)
$C$DW$T$39	.dwtag  DW_TAG_typedef, DW_AT_name("uint_fast16_t")
	.dwattr $C$DW$T$39, DW_AT_type(*$C$DW$T$38)
	.dwattr $C$DW$T$39, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$39, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$39, DW_AT_decl_line(0x48)
	.dwattr $C$DW$T$39, DW_AT_decl_column(0x16)
$C$DW$T$40	.dwtag  DW_TAG_typedef, DW_AT_name("uint_fast8_t")
	.dwattr $C$DW$T$40, DW_AT_type(*$C$DW$T$38)
	.dwattr $C$DW$T$40, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$40, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$40, DW_AT_decl_line(0x46)
	.dwattr $C$DW$T$40, DW_AT_decl_column(0x16)
$C$DW$T$41	.dwtag  DW_TAG_typedef, DW_AT_name("uint_least16_t")
	.dwattr $C$DW$T$41, DW_AT_type(*$C$DW$T$38)
	.dwattr $C$DW$T$41, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$41, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$41, DW_AT_decl_line(0x3b)
	.dwattr $C$DW$T$41, DW_AT_decl_column(0x16)
$C$DW$T$42	.dwtag  DW_TAG_typedef, DW_AT_name("uintptr_t")
	.dwattr $C$DW$T$42, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$42, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$42, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$42, DW_AT_decl_line(0x57)
	.dwattr $C$DW$T$42, DW_AT_decl_column(0x1a)
$C$DW$T$12	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$12, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$12, DW_AT_name("long")
	.dwattr $C$DW$T$12, DW_AT_byte_size(0x04)
$C$DW$T$43	.dwtag  DW_TAG_typedef, DW_AT_name("int32_t")
	.dwattr $C$DW$T$43, DW_AT_type(*$C$DW$T$12)
	.dwattr $C$DW$T$43, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$43, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$43, DW_AT_decl_line(0x2e)
	.dwattr $C$DW$T$43, DW_AT_decl_column(0x1d)
$C$DW$T$44	.dwtag  DW_TAG_typedef, DW_AT_name("int_fast32_t")
	.dwattr $C$DW$T$44, DW_AT_type(*$C$DW$T$43)
	.dwattr $C$DW$T$44, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$44, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$44, DW_AT_decl_line(0x4a)
	.dwattr $C$DW$T$44, DW_AT_decl_column(0x17)
$C$DW$T$45	.dwtag  DW_TAG_typedef, DW_AT_name("int_least32_t")
	.dwattr $C$DW$T$45, DW_AT_type(*$C$DW$T$43)
	.dwattr $C$DW$T$45, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$45, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$45, DW_AT_decl_line(0x3c)
	.dwattr $C$DW$T$45, DW_AT_decl_column(0x17)
$C$DW$T$13	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$13, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$13, DW_AT_name("unsigned long")
	.dwattr $C$DW$T$13, DW_AT_byte_size(0x04)
$C$DW$T$46	.dwtag  DW_TAG_typedef, DW_AT_name("uint32_t")
	.dwattr $C$DW$T$46, DW_AT_type(*$C$DW$T$13)
	.dwattr $C$DW$T$46, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$46, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$46, DW_AT_decl_line(0x2f)
	.dwattr $C$DW$T$46, DW_AT_decl_column(0x1c)
$C$DW$T$47	.dwtag  DW_TAG_typedef, DW_AT_name("uint_fast32_t")
	.dwattr $C$DW$T$47, DW_AT_type(*$C$DW$T$46)
	.dwattr $C$DW$T$47, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$47, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$47, DW_AT_decl_line(0x4b)
	.dwattr $C$DW$T$47, DW_AT_decl_column(0x16)
$C$DW$T$48	.dwtag  DW_TAG_typedef, DW_AT_name("uint_least32_t")
	.dwattr $C$DW$T$48, DW_AT_type(*$C$DW$T$46)
	.dwattr $C$DW$T$48, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$48, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$48, DW_AT_decl_line(0x3d)
	.dwattr $C$DW$T$48, DW_AT_decl_column(0x16)
$C$DW$T$14	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$14, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$14, DW_AT_name("long long")
	.dwattr $C$DW$T$14, DW_AT_byte_size(0x08)
$C$DW$T$49	.dwtag  DW_TAG_typedef, DW_AT_name("int64_t")
	.dwattr $C$DW$T$49, DW_AT_type(*$C$DW$T$14)
	.dwattr $C$DW$T$49, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$49, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$49, DW_AT_decl_line(0x32)
	.dwattr $C$DW$T$49, DW_AT_decl_column(0x21)
$C$DW$T$50	.dwtag  DW_TAG_typedef, DW_AT_name("int_fast64_t")
	.dwattr $C$DW$T$50, DW_AT_type(*$C$DW$T$49)
	.dwattr $C$DW$T$50, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$50, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$50, DW_AT_decl_line(0x4e)
	.dwattr $C$DW$T$50, DW_AT_decl_column(0x17)
$C$DW$T$51	.dwtag  DW_TAG_typedef, DW_AT_name("int_least64_t")
	.dwattr $C$DW$T$51, DW_AT_type(*$C$DW$T$49)
	.dwattr $C$DW$T$51, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$51, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$51, DW_AT_decl_line(0x40)
	.dwattr $C$DW$T$51, DW_AT_decl_column(0x17)
$C$DW$T$52	.dwtag  DW_TAG_typedef, DW_AT_name("intmax_t")
	.dwattr $C$DW$T$52, DW_AT_type(*$C$DW$T$14)
	.dwattr $C$DW$T$52, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$52, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$52, DW_AT_decl_line(0x5b)
	.dwattr $C$DW$T$52, DW_AT_decl_column(0x20)
$C$DW$T$15	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$15, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$15, DW_AT_name("unsigned long long")
	.dwattr $C$DW$T$15, DW_AT_byte_size(0x08)
$C$DW$T$53	.dwtag  DW_TAG_typedef, DW_AT_name("uint64_t")
	.dwattr $C$DW$T$53, DW_AT_type(*$C$DW$T$15)
	.dwattr $C$DW$T$53, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$53, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$53, DW_AT_decl_line(0x33)
	.dwattr $C$DW$T$53, DW_AT_decl_column(0x20)
$C$DW$T$54	.dwtag  DW_TAG_typedef, DW_AT_name("uint_fast64_t")
	.dwattr $C$DW$T$54, DW_AT_type(*$C$DW$T$53)
	.dwattr $C$DW$T$54, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$54, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$54, DW_AT_decl_line(0x4f)
	.dwattr $C$DW$T$54, DW_AT_decl_column(0x16)
$C$DW$T$55	.dwtag  DW_TAG_typedef, DW_AT_name("uint_least64_t")
	.dwattr $C$DW$T$55, DW_AT_type(*$C$DW$T$53)
	.dwattr $C$DW$T$55, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$55, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$55, DW_AT_decl_line(0x41)
	.dwattr $C$DW$T$55, DW_AT_decl_column(0x16)
$C$DW$T$56	.dwtag  DW_TAG_typedef, DW_AT_name("uintmax_t")
	.dwattr $C$DW$T$56, DW_AT_type(*$C$DW$T$15)
	.dwattr $C$DW$T$56, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$56, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$56, DW_AT_decl_line(0x5c)
	.dwattr $C$DW$T$56, DW_AT_decl_column(0x20)
$C$DW$T$16	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$16, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$16, DW_AT_name("float")
	.dwattr $C$DW$T$16, DW_AT_byte_size(0x04)
$C$DW$T$17	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$17, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$17, DW_AT_name("double")
	.dwattr $C$DW$T$17, DW_AT_byte_size(0x08)
$C$DW$T$18	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$18, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$18, DW_AT_name("long double")
	.dwattr $C$DW$T$18, DW_AT_byte_size(0x08)
$C$DW$T$58	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$58, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$T$58, DW_AT_address_class(0x10)
$C$DW$T$59	.dwtag  DW_TAG_typedef, DW_AT_name("__builtin_va_list")
	.dwattr $C$DW$T$59, DW_AT_type(*$C$DW$T$58)
	.dwattr $C$DW$T$59, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$59, DW_AT_decl_file("../arafepc_pin_config_v3.c")
	.dwattr $C$DW$T$59, DW_AT_decl_line(0x53)
	.dwattr $C$DW$T$59, DW_AT_decl_column(0x0f)
	.dwattr $C$DW$CU, DW_AT_language(DW_LANG_C)
	.dwendtag $C$DW$CU

