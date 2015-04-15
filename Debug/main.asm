;******************************************************************************
;* MSP430 C/C++ Codegen                                             PC v4.3.5 *
;* Date/Time created: Wed Apr 15 14:48:03 2015                                *
;******************************************************************************
	.compiler_opts --abi=eabi --diag_wrap=off --hll_source=on --mem_model:code=small --mem_model:data=small --object_format=elf --silicon_version=msp --symdebug:dwarf --symdebug:dwarf_version=3 

$C$DW$CU	.dwtag  DW_TAG_compile_unit
	.dwattr $C$DW$CU, DW_AT_name("../main.c")
	.dwattr $C$DW$CU, DW_AT_producer("TI MSP430 C/C++ Codegen PC v4.3.5 Copyright (c) 2003-2014 Texas Instruments Incorporated")
	.dwattr $C$DW$CU, DW_AT_TI_version(0x01)
	.dwattr $C$DW$CU, DW_AT_comp_dir("C:\Users\barawn\ara\arafe_slave_v2\Debug")
	.noinit	".TI.noinit"

$C$DW$1	.dwtag  DW_TAG_subprogram, DW_AT_name("__bis_SR_register")
	.dwattr $C$DW$1, DW_AT_TI_symbol_name("__bis_SR_register")
	.dwattr $C$DW$1, DW_AT_type(*$C$DW$T$9)
	.dwattr $C$DW$1, DW_AT_declaration
	.dwattr $C$DW$1, DW_AT_external
$C$DW$2	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$2, DW_AT_type(*$C$DW$T$9)
	.dwendtag $C$DW$1


$C$DW$3	.dwtag  DW_TAG_subprogram, DW_AT_name("__delay_cycles")
	.dwattr $C$DW$3, DW_AT_TI_symbol_name("__delay_cycles")
	.dwattr $C$DW$3, DW_AT_declaration
	.dwattr $C$DW$3, DW_AT_external
$C$DW$4	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$4, DW_AT_type(*$C$DW$T$13)
	.dwendtag $C$DW$3

$C$DW$5	.dwtag  DW_TAG_variable, DW_AT_name("DCOCTL")
	.dwattr $C$DW$5, DW_AT_TI_symbol_name("DCOCTL")
	.dwattr $C$DW$5, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$5, DW_AT_declaration
	.dwattr $C$DW$5, DW_AT_external
	.dwattr $C$DW$5, DW_AT_decl_file("c:\ti\ccsv6\ccs_base\msp430\include\msp430g2153.h")
	.dwattr $C$DW$5, DW_AT_decl_line(0x11f)
	.dwattr $C$DW$5, DW_AT_decl_column(0x01)
$C$DW$6	.dwtag  DW_TAG_variable, DW_AT_name("BCSCTL1")
	.dwattr $C$DW$6, DW_AT_TI_symbol_name("BCSCTL1")
	.dwattr $C$DW$6, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$6, DW_AT_declaration
	.dwattr $C$DW$6, DW_AT_external
	.dwattr $C$DW$6, DW_AT_decl_file("c:\ti\ccsv6\ccs_base\msp430\include\msp430g2153.h")
	.dwattr $C$DW$6, DW_AT_decl_line(0x120)
	.dwattr $C$DW$6, DW_AT_decl_column(0x01)
$C$DW$7	.dwtag  DW_TAG_variable, DW_AT_name("CACTL1")
	.dwattr $C$DW$7, DW_AT_TI_symbol_name("CACTL1")
	.dwattr $C$DW$7, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$7, DW_AT_declaration
	.dwattr $C$DW$7, DW_AT_external
	.dwattr $C$DW$7, DW_AT_decl_file("c:\ti\ccsv6\ccs_base\msp430\include\msp430g2153.h")
	.dwattr $C$DW$7, DW_AT_decl_line(0x16f)
	.dwattr $C$DW$7, DW_AT_decl_column(0x01)
$C$DW$8	.dwtag  DW_TAG_variable, DW_AT_name("CACTL2")
	.dwattr $C$DW$8, DW_AT_TI_symbol_name("CACTL2")
	.dwattr $C$DW$8, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$8, DW_AT_declaration
	.dwattr $C$DW$8, DW_AT_external
	.dwattr $C$DW$8, DW_AT_decl_file("c:\ti\ccsv6\ccs_base\msp430\include\msp430g2153.h")
	.dwattr $C$DW$8, DW_AT_decl_line(0x170)
	.dwattr $C$DW$8, DW_AT_decl_column(0x01)
$C$DW$9	.dwtag  DW_TAG_variable, DW_AT_name("CAPD")
	.dwattr $C$DW$9, DW_AT_TI_symbol_name("CAPD")
	.dwattr $C$DW$9, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$9, DW_AT_declaration
	.dwattr $C$DW$9, DW_AT_external
	.dwattr $C$DW$9, DW_AT_decl_file("c:\ti\ccsv6\ccs_base\msp430\include\msp430g2153.h")
	.dwattr $C$DW$9, DW_AT_decl_line(0x171)
	.dwattr $C$DW$9, DW_AT_decl_column(0x01)
$C$DW$10	.dwtag  DW_TAG_variable, DW_AT_name("FCTL1")
	.dwattr $C$DW$10, DW_AT_TI_symbol_name("FCTL1")
	.dwattr $C$DW$10, DW_AT_type(*$C$DW$T$62)
	.dwattr $C$DW$10, DW_AT_declaration
	.dwattr $C$DW$10, DW_AT_external
	.dwattr $C$DW$10, DW_AT_decl_file("c:\ti\ccsv6\ccs_base\msp430\include\msp430g2153.h")
	.dwattr $C$DW$10, DW_AT_decl_line(0x198)
	.dwattr $C$DW$10, DW_AT_decl_column(0x01)
$C$DW$11	.dwtag  DW_TAG_variable, DW_AT_name("FCTL2")
	.dwattr $C$DW$11, DW_AT_TI_symbol_name("FCTL2")
	.dwattr $C$DW$11, DW_AT_type(*$C$DW$T$62)
	.dwattr $C$DW$11, DW_AT_declaration
	.dwattr $C$DW$11, DW_AT_external
	.dwattr $C$DW$11, DW_AT_decl_file("c:\ti\ccsv6\ccs_base\msp430\include\msp430g2153.h")
	.dwattr $C$DW$11, DW_AT_decl_line(0x199)
	.dwattr $C$DW$11, DW_AT_decl_column(0x01)
$C$DW$12	.dwtag  DW_TAG_variable, DW_AT_name("FCTL3")
	.dwattr $C$DW$12, DW_AT_TI_symbol_name("FCTL3")
	.dwattr $C$DW$12, DW_AT_type(*$C$DW$T$62)
	.dwattr $C$DW$12, DW_AT_declaration
	.dwattr $C$DW$12, DW_AT_external
	.dwattr $C$DW$12, DW_AT_decl_file("c:\ti\ccsv6\ccs_base\msp430\include\msp430g2153.h")
	.dwattr $C$DW$12, DW_AT_decl_line(0x19a)
	.dwattr $C$DW$12, DW_AT_decl_column(0x01)
$C$DW$13	.dwtag  DW_TAG_variable, DW_AT_name("P1DIR")
	.dwattr $C$DW$13, DW_AT_TI_symbol_name("P1DIR")
	.dwattr $C$DW$13, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$13, DW_AT_declaration
	.dwattr $C$DW$13, DW_AT_external
	.dwattr $C$DW$13, DW_AT_decl_file("c:\ti\ccsv6\ccs_base\msp430\include\msp430g2153.h")
	.dwattr $C$DW$13, DW_AT_decl_line(0x1cb)
	.dwattr $C$DW$13, DW_AT_decl_column(0x01)
$C$DW$14	.dwtag  DW_TAG_variable, DW_AT_name("P1SEL")
	.dwattr $C$DW$14, DW_AT_TI_symbol_name("P1SEL")
	.dwattr $C$DW$14, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$14, DW_AT_declaration
	.dwattr $C$DW$14, DW_AT_external
	.dwattr $C$DW$14, DW_AT_decl_file("c:\ti\ccsv6\ccs_base\msp430\include\msp430g2153.h")
	.dwattr $C$DW$14, DW_AT_decl_line(0x1cf)
	.dwattr $C$DW$14, DW_AT_decl_column(0x01)
$C$DW$15	.dwtag  DW_TAG_variable, DW_AT_name("P1SEL2")
	.dwattr $C$DW$15, DW_AT_TI_symbol_name("P1SEL2")
	.dwattr $C$DW$15, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$15, DW_AT_declaration
	.dwattr $C$DW$15, DW_AT_external
	.dwattr $C$DW$15, DW_AT_decl_file("c:\ti\ccsv6\ccs_base\msp430\include\msp430g2153.h")
	.dwattr $C$DW$15, DW_AT_decl_line(0x1d0)
	.dwattr $C$DW$15, DW_AT_decl_column(0x01)
$C$DW$16	.dwtag  DW_TAG_variable, DW_AT_name("P2OUT")
	.dwattr $C$DW$16, DW_AT_TI_symbol_name("P2OUT")
	.dwattr $C$DW$16, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$16, DW_AT_declaration
	.dwattr $C$DW$16, DW_AT_external
	.dwattr $C$DW$16, DW_AT_decl_file("c:\ti\ccsv6\ccs_base\msp430\include\msp430g2153.h")
	.dwattr $C$DW$16, DW_AT_decl_line(0x1d4)
	.dwattr $C$DW$16, DW_AT_decl_column(0x01)
$C$DW$17	.dwtag  DW_TAG_variable, DW_AT_name("P2DIR")
	.dwattr $C$DW$17, DW_AT_TI_symbol_name("P2DIR")
	.dwattr $C$DW$17, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$17, DW_AT_declaration
	.dwattr $C$DW$17, DW_AT_external
	.dwattr $C$DW$17, DW_AT_decl_file("c:\ti\ccsv6\ccs_base\msp430\include\msp430g2153.h")
	.dwattr $C$DW$17, DW_AT_decl_line(0x1d5)
	.dwattr $C$DW$17, DW_AT_decl_column(0x01)
$C$DW$18	.dwtag  DW_TAG_variable, DW_AT_name("P2SEL")
	.dwattr $C$DW$18, DW_AT_TI_symbol_name("P2SEL")
	.dwattr $C$DW$18, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$18, DW_AT_declaration
	.dwattr $C$DW$18, DW_AT_external
	.dwattr $C$DW$18, DW_AT_decl_file("c:\ti\ccsv6\ccs_base\msp430\include\msp430g2153.h")
	.dwattr $C$DW$18, DW_AT_decl_line(0x1d9)
	.dwattr $C$DW$18, DW_AT_decl_column(0x01)
$C$DW$19	.dwtag  DW_TAG_variable, DW_AT_name("P3OUT")
	.dwattr $C$DW$19, DW_AT_TI_symbol_name("P3OUT")
	.dwattr $C$DW$19, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$19, DW_AT_declaration
	.dwattr $C$DW$19, DW_AT_external
	.dwattr $C$DW$19, DW_AT_decl_file("c:\ti\ccsv6\ccs_base\msp430\include\msp430g2153.h")
	.dwattr $C$DW$19, DW_AT_decl_line(0x1e3)
	.dwattr $C$DW$19, DW_AT_decl_column(0x01)
$C$DW$20	.dwtag  DW_TAG_variable, DW_AT_name("P3DIR")
	.dwattr $C$DW$20, DW_AT_TI_symbol_name("P3DIR")
	.dwattr $C$DW$20, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$20, DW_AT_declaration
	.dwattr $C$DW$20, DW_AT_external
	.dwattr $C$DW$20, DW_AT_decl_file("c:\ti\ccsv6\ccs_base\msp430\include\msp430g2153.h")
	.dwattr $C$DW$20, DW_AT_decl_line(0x1e4)
	.dwattr $C$DW$20, DW_AT_decl_column(0x01)
$C$DW$21	.dwtag  DW_TAG_variable, DW_AT_name("TA1CTL")
	.dwattr $C$DW$21, DW_AT_TI_symbol_name("TA1CTL")
	.dwattr $C$DW$21, DW_AT_type(*$C$DW$T$62)
	.dwattr $C$DW$21, DW_AT_declaration
	.dwattr $C$DW$21, DW_AT_external
	.dwattr $C$DW$21, DW_AT_decl_file("c:\ti\ccsv6\ccs_base\msp430\include\msp430g2153.h")
	.dwattr $C$DW$21, DW_AT_decl_line(0x260)
	.dwattr $C$DW$21, DW_AT_decl_column(0x01)
$C$DW$22	.dwtag  DW_TAG_variable, DW_AT_name("TA1CCTL0")
	.dwattr $C$DW$22, DW_AT_TI_symbol_name("TA1CCTL0")
	.dwattr $C$DW$22, DW_AT_type(*$C$DW$T$62)
	.dwattr $C$DW$22, DW_AT_declaration
	.dwattr $C$DW$22, DW_AT_external
	.dwattr $C$DW$22, DW_AT_decl_file("c:\ti\ccsv6\ccs_base\msp430\include\msp430g2153.h")
	.dwattr $C$DW$22, DW_AT_decl_line(0x261)
	.dwattr $C$DW$22, DW_AT_decl_column(0x01)
$C$DW$23	.dwtag  DW_TAG_variable, DW_AT_name("TA1CCR0")
	.dwattr $C$DW$23, DW_AT_TI_symbol_name("TA1CCR0")
	.dwattr $C$DW$23, DW_AT_type(*$C$DW$T$62)
	.dwattr $C$DW$23, DW_AT_declaration
	.dwattr $C$DW$23, DW_AT_external
	.dwattr $C$DW$23, DW_AT_decl_file("c:\ti\ccsv6\ccs_base\msp430\include\msp430g2153.h")
	.dwattr $C$DW$23, DW_AT_decl_line(0x265)
	.dwattr $C$DW$23, DW_AT_decl_column(0x01)
$C$DW$24	.dwtag  DW_TAG_variable, DW_AT_name("WDTCTL")
	.dwattr $C$DW$24, DW_AT_TI_symbol_name("WDTCTL")
	.dwattr $C$DW$24, DW_AT_type(*$C$DW$T$62)
	.dwattr $C$DW$24, DW_AT_declaration
	.dwattr $C$DW$24, DW_AT_external
	.dwattr $C$DW$24, DW_AT_decl_file("c:\ti\ccsv6\ccs_base\msp430\include\msp430g2153.h")
	.dwattr $C$DW$24, DW_AT_decl_line(0x33b)
	.dwattr $C$DW$24, DW_AT_decl_column(0x01)
$C$DW$25	.dwtag  DW_TAG_variable, DW_AT_name("CALDCO_8MHZ")
	.dwattr $C$DW$25, DW_AT_TI_symbol_name("CALDCO_8MHZ")
	.dwattr $C$DW$25, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$25, DW_AT_declaration
	.dwattr $C$DW$25, DW_AT_external
	.dwattr $C$DW$25, DW_AT_decl_file("c:\ti\ccsv6\ccs_base\msp430\include\msp430g2153.h")
	.dwattr $C$DW$25, DW_AT_decl_line(0x36e)
	.dwattr $C$DW$25, DW_AT_decl_column(0x01)
$C$DW$26	.dwtag  DW_TAG_variable, DW_AT_name("CALBC1_8MHZ")
	.dwattr $C$DW$26, DW_AT_TI_symbol_name("CALBC1_8MHZ")
	.dwattr $C$DW$26, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$26, DW_AT_declaration
	.dwattr $C$DW$26, DW_AT_external
	.dwattr $C$DW$26, DW_AT_decl_file("c:\ti\ccsv6\ccs_base\msp430\include\msp430g2153.h")
	.dwattr $C$DW$26, DW_AT_decl_line(0x36f)
	.dwattr $C$DW$26, DW_AT_decl_column(0x01)
$C$DW$27	.dwtag  DW_TAG_variable, DW_AT_name("enable_port_arr")
	.dwattr $C$DW$27, DW_AT_TI_symbol_name("enable_port_arr")
	.dwattr $C$DW$27, DW_AT_type(*$C$DW$T$53)
	.dwattr $C$DW$27, DW_AT_declaration
	.dwattr $C$DW$27, DW_AT_external
	.dwattr $C$DW$27, DW_AT_decl_file("..\arafepc_pin_config.h")
	.dwattr $C$DW$27, DW_AT_decl_line(0x0f)
	.dwattr $C$DW$27, DW_AT_decl_column(0x20)
$C$DW$28	.dwtag  DW_TAG_variable, DW_AT_name("enable_bit_arr")
	.dwattr $C$DW$28, DW_AT_TI_symbol_name("enable_bit_arr")
	.dwattr $C$DW$28, DW_AT_type(*$C$DW$T$47)
	.dwattr $C$DW$28, DW_AT_declaration
	.dwattr $C$DW$28, DW_AT_external
	.dwattr $C$DW$28, DW_AT_decl_file("..\arafepc_pin_config.h")
	.dwattr $C$DW$28, DW_AT_decl_line(0x10)
	.dwattr $C$DW$28, DW_AT_decl_column(0x16)
$C$DW$29	.dwtag  DW_TAG_variable, DW_AT_name("att_port_arr")
	.dwattr $C$DW$29, DW_AT_TI_symbol_name("att_port_arr")
	.dwattr $C$DW$29, DW_AT_type(*$C$DW$T$54)
	.dwattr $C$DW$29, DW_AT_declaration
	.dwattr $C$DW$29, DW_AT_external
	.dwattr $C$DW$29, DW_AT_decl_file("..\arafepc_pin_config.h")
	.dwattr $C$DW$29, DW_AT_decl_line(0x11)
	.dwattr $C$DW$29, DW_AT_decl_column(0x20)
$C$DW$30	.dwtag  DW_TAG_variable, DW_AT_name("att_bit_arr")
	.dwattr $C$DW$30, DW_AT_TI_symbol_name("att_bit_arr")
	.dwattr $C$DW$30, DW_AT_type(*$C$DW$T$48)
	.dwattr $C$DW$30, DW_AT_declaration
	.dwattr $C$DW$30, DW_AT_external
	.dwattr $C$DW$30, DW_AT_decl_file("..\arafepc_pin_config.h")
	.dwattr $C$DW$30, DW_AT_decl_line(0x12)
	.dwattr $C$DW$30, DW_AT_decl_column(0x16)
$C$DW$31	.dwtag  DW_TAG_variable, DW_AT_name("en_5v_port")
	.dwattr $C$DW$31, DW_AT_TI_symbol_name("en_5v_port")
	.dwattr $C$DW$31, DW_AT_type(*$C$DW$T$52)
	.dwattr $C$DW$31, DW_AT_declaration
	.dwattr $C$DW$31, DW_AT_external
	.dwattr $C$DW$31, DW_AT_decl_file("..\arafepc_pin_config.h")
	.dwattr $C$DW$31, DW_AT_decl_line(0x13)
	.dwattr $C$DW$31, DW_AT_decl_column(0x20)
$C$DW$32	.dwtag  DW_TAG_variable, DW_AT_name("en_5v_bit")
	.dwattr $C$DW$32, DW_AT_TI_symbol_name("en_5v_bit")
	.dwattr $C$DW$32, DW_AT_type(*$C$DW$T$27)
	.dwattr $C$DW$32, DW_AT_declaration
	.dwattr $C$DW$32, DW_AT_external
	.dwattr $C$DW$32, DW_AT_decl_file("..\arafepc_pin_config.h")
	.dwattr $C$DW$32, DW_AT_decl_line(0x14)
	.dwattr $C$DW$32, DW_AT_decl_column(0x16)
$C$DW$33	.dwtag  DW_TAG_variable, DW_AT_name("spiclk_port")
	.dwattr $C$DW$33, DW_AT_TI_symbol_name("spiclk_port")
	.dwattr $C$DW$33, DW_AT_type(*$C$DW$T$52)
	.dwattr $C$DW$33, DW_AT_declaration
	.dwattr $C$DW$33, DW_AT_external
	.dwattr $C$DW$33, DW_AT_decl_file("..\arafepc_pin_config.h")
	.dwattr $C$DW$33, DW_AT_decl_line(0x15)
	.dwattr $C$DW$33, DW_AT_decl_column(0x20)
$C$DW$34	.dwtag  DW_TAG_variable, DW_AT_name("spiclk_bit")
	.dwattr $C$DW$34, DW_AT_TI_symbol_name("spiclk_bit")
	.dwattr $C$DW$34, DW_AT_type(*$C$DW$T$27)
	.dwattr $C$DW$34, DW_AT_declaration
	.dwattr $C$DW$34, DW_AT_external
	.dwattr $C$DW$34, DW_AT_decl_file("..\arafepc_pin_config.h")
	.dwattr $C$DW$34, DW_AT_decl_line(0x16)
	.dwattr $C$DW$34, DW_AT_decl_column(0x16)
$C$DW$35	.dwtag  DW_TAG_variable, DW_AT_name("spidata_port")
	.dwattr $C$DW$35, DW_AT_TI_symbol_name("spidata_port")
	.dwattr $C$DW$35, DW_AT_type(*$C$DW$T$52)
	.dwattr $C$DW$35, DW_AT_declaration
	.dwattr $C$DW$35, DW_AT_external
	.dwattr $C$DW$35, DW_AT_decl_file("..\arafepc_pin_config.h")
	.dwattr $C$DW$35, DW_AT_decl_line(0x17)
	.dwattr $C$DW$35, DW_AT_decl_column(0x20)
$C$DW$36	.dwtag  DW_TAG_variable, DW_AT_name("spidata_bit")
	.dwattr $C$DW$36, DW_AT_TI_symbol_name("spidata_bit")
	.dwattr $C$DW$36, DW_AT_type(*$C$DW$T$27)
	.dwattr $C$DW$36, DW_AT_declaration
	.dwattr $C$DW$36, DW_AT_external
	.dwattr $C$DW$36, DW_AT_decl_file("..\arafepc_pin_config.h")
	.dwattr $C$DW$36, DW_AT_decl_line(0x18)
	.dwattr $C$DW$36, DW_AT_decl_column(0x16)
	.global	rx_char
rx_char:	.usect	".TI.noinit",1,1
$C$DW$37	.dwtag  DW_TAG_variable, DW_AT_name("rx_char")
	.dwattr $C$DW$37, DW_AT_TI_symbol_name("rx_char")
	.dwattr $C$DW$37, DW_AT_location[DW_OP_addr rx_char]
	.dwattr $C$DW$37, DW_AT_type(*$C$DW$T$25)
	.dwattr $C$DW$37, DW_AT_external
	.dwattr $C$DW$37, DW_AT_decl_file("../main.c")
	.dwattr $C$DW$37, DW_AT_decl_line(0x09)
	.dwattr $C$DW$37, DW_AT_decl_column(0x09)
	.global	tx_char_pending
tx_char_pending:	.usect	".TI.noinit",2,2
$C$DW$38	.dwtag  DW_TAG_variable, DW_AT_name("tx_char_pending")
	.dwattr $C$DW$38, DW_AT_TI_symbol_name("tx_char_pending")
	.dwattr $C$DW$38, DW_AT_location[DW_OP_addr tx_char_pending]
	.dwattr $C$DW$38, DW_AT_type(*$C$DW$T$63)
	.dwattr $C$DW$38, DW_AT_external
	.dwattr $C$DW$38, DW_AT_decl_file("../main.c")
	.dwattr $C$DW$38, DW_AT_decl_line(0x10)
	.dwattr $C$DW$38, DW_AT_decl_column(0x0a)
ack_byte:	.usect	".TI.noinit",1,1
$C$DW$39	.dwtag  DW_TAG_variable, DW_AT_name("ack_byte")
	.dwattr $C$DW$39, DW_AT_TI_symbol_name("ack_byte")
	.dwattr $C$DW$39, DW_AT_type(*$C$DW$T$25)
	.dwattr $C$DW$39, DW_AT_location[DW_OP_addr ack_byte]
	.dwattr $C$DW$39, DW_AT_decl_file("../main.c")
	.dwattr $C$DW$39, DW_AT_decl_line(0x13)
	.dwattr $C$DW$39, DW_AT_decl_column(0x10)
	.global	rx_preamble
	.sect	".infoD"
	.align	2
	.elfsym	rx_preamble,SYM_SIZE(4)
rx_preamble:
	.bits	33,8			; rx_preamble[0] @ 0
	.bits	77,8			; rx_preamble[1] @ 8
	.bits	33,8			; rx_preamble[2] @ 16

$C$DW$40	.dwtag  DW_TAG_variable, DW_AT_name("rx_preamble")
	.dwattr $C$DW$40, DW_AT_TI_symbol_name("rx_preamble")
	.dwattr $C$DW$40, DW_AT_location[DW_OP_addr rx_preamble]
	.dwattr $C$DW$40, DW_AT_type(*$C$DW$T$84)
	.dwattr $C$DW$40, DW_AT_external
	.dwattr $C$DW$40, DW_AT_decl_file("../main.c")
	.dwattr $C$DW$40, DW_AT_decl_line(0x16)
	.dwattr $C$DW$40, DW_AT_decl_column(0x0c)
	.global	tx_preamble
	.sect	".infoD"
	.align	2
	.elfsym	tx_preamble,SYM_SIZE(4)
tx_preamble:
	.bits	33,8			; tx_preamble[0] @ 0
	.bits	83,8			; tx_preamble[1] @ 8
	.bits	33,8			; tx_preamble[2] @ 16
	.bits	0,8			; tx_preamble[3] @ 24

$C$DW$41	.dwtag  DW_TAG_variable, DW_AT_name("tx_preamble")
	.dwattr $C$DW$41, DW_AT_TI_symbol_name("tx_preamble")
	.dwattr $C$DW$41, DW_AT_location[DW_OP_addr tx_preamble]
	.dwattr $C$DW$41, DW_AT_type(*$C$DW$T$85)
	.dwattr $C$DW$41, DW_AT_external
	.dwattr $C$DW$41, DW_AT_decl_file("../main.c")
	.dwattr $C$DW$41, DW_AT_decl_line(0x1a)
	.dwattr $C$DW$41, DW_AT_decl_column(0x0c)
	.global	device_info
	.sect	".infoC"
	.align	2
	.elfsym	device_info,SYM_SIZE(16)
device_info:
	.bits	0,8			; device_info[0] @ 0
	.bits	0,8			; device_info[1] @ 8
	.bits	255,8			; device_info[2] @ 16
	.bits	255,8			; device_info[3] @ 24
	.bits	0,8			; device_info[4] @ 32
	.bits	0,8			; device_info[5] @ 40
	.bits	0,8			; device_info[6] @ 48
	.bits	0,8			; device_info[7] @ 56
	.bits	0,8			; device_info[8] @ 64
	.bits	0,8			; device_info[9] @ 72
	.bits	0,8			; device_info[10] @ 80
	.bits	0,8			; device_info[11] @ 88
	.bits	18,8			; device_info[12] @ 96
	.bits	52,8			; device_info[13] @ 104
	.bits	86,8			; device_info[14] @ 112
	.bits	120,8			; device_info[15] @ 120

$C$DW$42	.dwtag  DW_TAG_variable, DW_AT_name("device_info")
	.dwattr $C$DW$42, DW_AT_TI_symbol_name("device_info")
	.dwattr $C$DW$42, DW_AT_location[DW_OP_addr device_info]
	.dwattr $C$DW$42, DW_AT_type(*$C$DW$T$49)
	.dwattr $C$DW$42, DW_AT_external
	.dwattr $C$DW$42, DW_AT_decl_file("../main.c")
	.dwattr $C$DW$42, DW_AT_decl_line(0x2a)
	.dwattr $C$DW$42, DW_AT_decl_column(0x0f)
	.global	device_info_buffer
device_info_buffer:	.usect	".TI.noinit",16,16
$C$DW$43	.dwtag  DW_TAG_variable, DW_AT_name("device_info_buffer")
	.dwattr $C$DW$43, DW_AT_TI_symbol_name("device_info_buffer")
	.dwattr $C$DW$43, DW_AT_location[DW_OP_addr device_info_buffer]
	.dwattr $C$DW$43, DW_AT_type(*$C$DW$T$46)
	.dwattr $C$DW$43, DW_AT_external
	.dwattr $C$DW$43, DW_AT_decl_file("../main.c")
	.dwattr $C$DW$43, DW_AT_decl_line(0x35)
	.dwattr $C$DW$43, DW_AT_decl_column(0x09)
	.global	cmd
cmd:	.usect	".TI.noinit",1,1
$C$DW$44	.dwtag  DW_TAG_variable, DW_AT_name("cmd")
	.dwattr $C$DW$44, DW_AT_TI_symbol_name("cmd")
	.dwattr $C$DW$44, DW_AT_location[DW_OP_addr cmd]
	.dwattr $C$DW$44, DW_AT_type(*$C$DW$T$25)
	.dwattr $C$DW$44, DW_AT_external
	.dwattr $C$DW$44, DW_AT_decl_file("../main.c")
	.dwattr $C$DW$44, DW_AT_decl_line(0x38)
	.dwattr $C$DW$44, DW_AT_decl_column(0x09)
	.global	arg
arg:	.usect	".TI.noinit",1,1
$C$DW$45	.dwtag  DW_TAG_variable, DW_AT_name("arg")
	.dwattr $C$DW$45, DW_AT_TI_symbol_name("arg")
	.dwattr $C$DW$45, DW_AT_location[DW_OP_addr arg]
	.dwattr $C$DW$45, DW_AT_type(*$C$DW$T$25)
	.dwattr $C$DW$45, DW_AT_external
	.dwattr $C$DW$45, DW_AT_decl_file("../main.c")
	.dwattr $C$DW$45, DW_AT_decl_line(0x3a)
	.dwattr $C$DW$45, DW_AT_decl_column(0x09)
;	c:\ti\ccsv6\tools\compiler\msp430_4.3.5\bin\opt430.exe --gen_opt_info=2 C:\\Users\\barawn\\AppData\\Local\\Temp\\049762 C:\\Users\\barawn\\AppData\\Local\\Temp\\049764 --opt_info_filename=main.nfo 
	.sect	".text:command_action"
	.align	2
	.clink

$C$DW$46	.dwtag  DW_TAG_subprogram, DW_AT_name("command_action")
	.dwattr $C$DW$46, DW_AT_low_pc(command_action)
	.dwattr $C$DW$46, DW_AT_high_pc(0x00)
	.dwattr $C$DW$46, DW_AT_TI_symbol_name("command_action")
	.dwattr $C$DW$46, DW_AT_TI_begin_file("../main.c")
	.dwattr $C$DW$46, DW_AT_TI_begin_line(0x140)
	.dwattr $C$DW$46, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$46, DW_AT_decl_file("../main.c")
	.dwattr $C$DW$46, DW_AT_decl_line(0x140)
	.dwattr $C$DW$46, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$46, DW_AT_TI_max_frame_size(0x06)
	.dwpsn	file "../main.c",line 320,column 30,is_stmt,address command_action,isa 0

	.dwfde $C$DW$CIE, command_action

;*****************************************************************************
;* FUNCTION NAME: command_action                                             *
;*                                                                           *
;*   Regs Modified     : SP,SR,r9,r10,r11,r12,r13,r14,r15                    *
;*   Regs Used         : SP,SR,r9,r10,r11,r12,r13,r14,r15                    *
;*   Local Frame Size  : 0 Args + 0 Auto + 4 Save = 4 byte                   *
;*****************************************************************************
command_action:
;* --------------------------------------------------------------------------*
;* r14   assigned to $O$C1
;* r13   assigned to $O$K57
;* r14   assigned to $O$K59
;* r10   assigned to clk_port
$C$DW$47	.dwtag  DW_TAG_variable, DW_AT_name("clk_port")
	.dwattr $C$DW$47, DW_AT_TI_symbol_name("clk_port")
	.dwattr $C$DW$47, DW_AT_type(*$C$DW$T$51)
	.dwattr $C$DW$47, DW_AT_location[DW_OP_reg10]
;* r11   assigned to data_port
$C$DW$48	.dwtag  DW_TAG_variable, DW_AT_name("data_port")
	.dwattr $C$DW$48, DW_AT_TI_symbol_name("data_port")
	.dwattr $C$DW$48, DW_AT_type(*$C$DW$T$51)
	.dwattr $C$DW$48, DW_AT_location[DW_OP_reg11]
;* r15   assigned to ch
$C$DW$49	.dwtag  DW_TAG_variable, DW_AT_name("ch")
	.dwattr $C$DW$49, DW_AT_TI_symbol_name("ch")
	.dwattr $C$DW$49, DW_AT_type(*$C$DW$T$25)
	.dwattr $C$DW$49, DW_AT_location[DW_OP_reg15]
;* r9    assigned to counter
$C$DW$50	.dwtag  DW_TAG_variable, DW_AT_name("counter")
	.dwattr $C$DW$50, DW_AT_TI_symbol_name("counter")
	.dwattr $C$DW$50, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$50, DW_AT_location[DW_OP_reg9]
;* r14   assigned to addr
$C$DW$51	.dwtag  DW_TAG_variable, DW_AT_name("addr")
	.dwattr $C$DW$51, DW_AT_TI_symbol_name("addr")
	.dwattr $C$DW$51, DW_AT_type(*$C$DW$T$51)
	.dwattr $C$DW$51, DW_AT_location[DW_OP_reg14]
;* r15   assigned to addr
$C$DW$52	.dwtag  DW_TAG_variable, DW_AT_name("addr")
	.dwattr $C$DW$52, DW_AT_TI_symbol_name("addr")
	.dwattr $C$DW$52, DW_AT_type(*$C$DW$T$51)
	.dwattr $C$DW$52, DW_AT_location[DW_OP_reg15]
;* r12   assigned to addr
$C$DW$53	.dwtag  DW_TAG_variable, DW_AT_name("addr")
	.dwattr $C$DW$53, DW_AT_TI_symbol_name("addr")
	.dwattr $C$DW$53, DW_AT_type(*$C$DW$T$51)
	.dwattr $C$DW$53, DW_AT_location[DW_OP_reg12]
	.dwcfi	cfa_offset, 2
	.dwcfi	save_reg_to_mem, 16, -2
        PUSH.W    r10                   ; [] 
	.dwcfi	cfa_offset, 4
	.dwcfi	save_reg_to_mem, 10, -4
        PUSH.W    r9                    ; [] 
	.dwcfi	cfa_offset, 6
	.dwcfi	save_reg_to_mem, 9, -6
	.dwpsn	file "../main.c",line 325,column 2,is_stmt,isa 0
        MOV.W     #3,r15                ; [] |325| 
        AND.B     &cmd+0,r15            ; [] |325| 
	.dwpsn	file "../main.c",line 328,column 2,is_stmt,isa 0
        BIT.B     #8,&cmd+0             ; [] |328| 
        JEQ       $C$L4                 ; [] |328| 
                                          ; [] |328| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../main.c",line 338,column 9,is_stmt,isa 0
        BIT.B     #4,&cmd+0             ; [] |338| 
        JNE       $C$L2                 ; [] |338| 
                                          ; [] |338| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../main.c",line 339,column 3,is_stmt,isa 0
        MOV.B     r15,r14               ; [] |339| 
        RLA.W     r14                   ; [] |339| 
        MOV.W     enable_port_arr+0(r14),r14 ; [] |339| 
	.dwpsn	file "../main.c",line 340,column 3,is_stmt,isa 0
        TST.B     &arg+0                ; [] |340| 
        JNE       $C$L1                 ; [] |340| 
                                          ; [] |340| 
;* --------------------------------------------------------------------------*
	.dwcfi	remember_state
	.dwpsn	file "../main.c",line 341,column 8,is_stmt,isa 0
        MOV.B     r15,r15               ; [] |341| 
        AND.B     enable_bit_arr+0(r15),0(r14) ; [] |341| 
$C$DW$54	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$54, DW_AT_low_pc(0x00)
	.dwattr $C$DW$54, DW_AT_TI_return
        BR        #__mspabi_func_epilog_2 ; [] 
        ; [] 
	.dwcfi	restore_state
;* --------------------------------------------------------------------------*
$C$L1:    
	.dwcfi	remember_state
	.dwpsn	file "../main.c",line 340,column 12,is_stmt,isa 0
        MOV.B     r15,r15               ; [] |340| 
        OR.B      enable_bit_arr+0(r15),0(r14) ; [] |340| 
$C$DW$55	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$55, DW_AT_low_pc(0x00)
	.dwattr $C$DW$55, DW_AT_TI_return
        BR        #__mspabi_func_epilog_2 ; [] 
        ; [] 
	.dwcfi	restore_state
;* --------------------------------------------------------------------------*
$C$L2:    
	.dwpsn	file "../main.c",line 344,column 3,is_stmt,isa 0
        BIT.B     #1,r15                ; [] |344| 
        JEQ       $C$L7                 ; [] |344| 
                                          ; [] |344| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../main.c",line 345,column 4,is_stmt,isa 0
        MOV.W     &en_5v_port+0,r15     ; [] |345| 
	.dwpsn	file "../main.c",line 346,column 4,is_stmt,isa 0
        TST.B     &arg+0                ; [] |346| 
        JNE       $C$L3                 ; [] |346| 
                                          ; [] |346| 
;* --------------------------------------------------------------------------*
	.dwcfi	remember_state
	.dwpsn	file "../main.c",line 346,column 38,is_stmt,isa 0
        BIC.B     &en_5v_bit+0,0(r15)   ; [] |346| 
$C$DW$56	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$56, DW_AT_low_pc(0x00)
	.dwattr $C$DW$56, DW_AT_TI_return
        BR        #__mspabi_func_epilog_2 ; [] 
        ; [] 
	.dwcfi	restore_state
;* --------------------------------------------------------------------------*
$C$L3:    
	.dwcfi	remember_state
	.dwpsn	file "../main.c",line 346,column 13,is_stmt,isa 0
        OR.B      &en_5v_bit+0,0(r15)   ; [] |346| 
$C$DW$57	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$57, DW_AT_low_pc(0x00)
	.dwattr $C$DW$57, DW_AT_TI_return
        BR        #__mspabi_func_epilog_2 ; [] 
        ; [] 
	.dwcfi	restore_state
;* --------------------------------------------------------------------------*
$C$L4:    
	.dwpsn	file "../main.c",line 330,column 3,is_stmt,isa 0
        MOV.B     &cmd+0,r14            ; [] |330| 
        AND.W     #7,r14                ; [] |330| 
        MOV.W     r14,r13               ; [] |330| 
        RLA.W     r13                   ; [] |330| 
        MOV.W     att_port_arr+0(r13),r12 ; [] |330| 
	.dwpsn	file "../main.c",line 331,column 3,is_stmt,isa 0
        BIC.B     att_bit_arr+0(r14),0(r12) ; [] |331| 
	.dwpsn	file "../main.c",line 356,column 2,is_stmt,isa 0
        MOV.W     &spiclk_port+0,r10    ; [] |356| 
	.dwpsn	file "../main.c",line 357,column 2,is_stmt,isa 0
        MOV.W     &spidata_port+0,r11   ; [] |357| 
        MOV.B     &spiclk_bit+0,r13     ; [] 
        INV.W     r13                   ; [] 
        MOV.B     &spidata_bit+0,r14    ; [] 
        INV.W     r14                   ; [] 
        MOV.W     #6,r9                 ; [] 
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP $C$L5
;*
;*   Loop source line                : 359
;*   Loop closing brace source line  : 365
;*   Known Minimum Trip Count        : 6
;*   Known Maximum Trip Count        : 6
;*   Known Max Trip Count Factor     : 6
;* --------------------------------------------------------------------------*
$C$L5:    
	.dwpsn	file "../main.c",line 360,column 3,is_stmt,isa 0
        AND.B     r13,0(r10)            ; [] |360| 
	.dwpsn	file "../main.c",line 361,column 3,is_stmt,isa 0
        AND.B     r14,0(r11)            ; [] |361| 
	.dwpsn	file "../main.c",line 362,column 3,is_stmt,isa 0
        BIT.B     #32,&arg+0            ; [] |362| 
        JEQ       $C$L6                 ; [] |362| 
                                          ; [] |362| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../main.c",line 362,column 19,is_stmt,isa 0
        OR.B      &spidata_bit+0,0(r11) ; [] |362| 
;* --------------------------------------------------------------------------*
$C$L6:    
	.dwpsn	file "../main.c",line 363,column 3,is_stmt,isa 0
        OR.B      &spiclk_bit+0,0(r10)  ; [] |363| 
	.dwpsn	file "../main.c",line 364,column 3,is_stmt,isa 0
        RLA.B     &arg+0                ; [] |364| 
	.dwpsn	file "../main.c",line 359,column 17,is_stmt,isa 0
        SUB.W     #1,r9                 ; [] |359| 
        JNE       $C$L5                 ; [] |359| 
                                          ; [] |359| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../main.c",line 366,column 2,is_stmt,isa 0
        AND.B     r13,0(r10)            ; [] |366| 
	.dwpsn	file "../main.c",line 367,column 2,is_stmt,isa 0
        AND.B     r14,0(r11)            ; [] |367| 
	.dwpsn	file "../main.c",line 336,column 3,is_stmt,isa 0
        MOV.B     r15,r15               ; [] |336| 
        OR.B      att_bit_arr+0(r15),0(r12) ; [] |336| 
;* --------------------------------------------------------------------------*
$C$L7:    
$C$DW$58	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$58, DW_AT_low_pc(0x00)
	.dwattr $C$DW$58, DW_AT_TI_return
        BR        #__mspabi_func_epilog_2 ; [] 
        ; [] 
	.dwattr $C$DW$46, DW_AT_TI_end_file("../main.c")
	.dwattr $C$DW$46, DW_AT_TI_end_line(0x15d)
	.dwattr $C$DW$46, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$46

	.sect	".text:tx_char"
	.align	2
	.clink

$C$DW$59	.dwtag  DW_TAG_subprogram, DW_AT_name("tx_char")
	.dwattr $C$DW$59, DW_AT_low_pc(tx_char)
	.dwattr $C$DW$59, DW_AT_high_pc(0x00)
	.dwattr $C$DW$59, DW_AT_TI_symbol_name("tx_char")
	.dwattr $C$DW$59, DW_AT_TI_begin_file("../main.c")
	.dwattr $C$DW$59, DW_AT_TI_begin_line(0xf2)
	.dwattr $C$DW$59, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$59, DW_AT_decl_file("../main.c")
	.dwattr $C$DW$59, DW_AT_decl_line(0xf2)
	.dwattr $C$DW$59, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$59, DW_AT_TI_max_frame_size(0x02)
	.dwpsn	file "../main.c",line 242,column 39,is_stmt,address tx_char,isa 0

	.dwfde $C$DW$CIE, tx_char
$C$DW$60	.dwtag  DW_TAG_formal_parameter, DW_AT_name("tx")
	.dwattr $C$DW$60, DW_AT_TI_symbol_name("tx")
	.dwattr $C$DW$60, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$60, DW_AT_location[DW_OP_reg12]

;*****************************************************************************
;* FUNCTION NAME: tx_char                                                    *
;*                                                                           *
;*   Regs Modified     : SP,SR,r12                                           *
;*   Regs Used         : SP,SR,r12                                           *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                   *
;*****************************************************************************
tx_char:
;* --------------------------------------------------------------------------*
;* r12   assigned to tx
$C$DW$61	.dwtag  DW_TAG_variable, DW_AT_name("tx")
	.dwattr $C$DW$61, DW_AT_TI_symbol_name("tx")
	.dwattr $C$DW$61, DW_AT_type(*$C$DW$T$38)
	.dwattr $C$DW$61, DW_AT_location[DW_OP_reg12]
	.dwcfi	cfa_offset, 2
	.dwcfi	save_reg_to_mem, 16, -2
	.dwpsn	file "../main.c",line 244,column 2,is_stmt,isa 0
        MOV.W     #0,&TA1CTL+0          ; [] |244| 
	.dwpsn	file "../main.c",line 245,column 2,is_stmt,isa 0
        MOV.W     #104,&TA1CCR0+0       ; [] |245| 
	.dwpsn	file "../main.c",line 246,column 2,is_stmt,isa 0
        MOV.W     #16,&TA1CCTL0+0       ; [] |246| 
	.dwpsn	file "../main.c",line 248,column 2,is_stmt,isa 0
        MOV.W     #724,&TA1CTL+0        ; [] |248| 
	.dwpsn	file "../main.c",line 251,column 2,is_stmt,isa 0
        MOV.B     r12,r12               ; [] |251| 
        RLA.W     r12                   ; [] |251| 
        OR.W      #512,r12              ; [] |251| 
        MOV.W     r12,&tx_char_pending+0 ; [] |251| 
	.dwpsn	file "../main.c",line 253,column 2,is_stmt,isa 0
        BIS.W     #24,SR                ; [] |253| 
$C$DW$62	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$62, DW_AT_low_pc(0x00)
	.dwattr $C$DW$62, DW_AT_TI_return
        RET       ; [] 
        ; [] 
	.dwattr $C$DW$59, DW_AT_TI_end_file("../main.c")
	.dwattr $C$DW$59, DW_AT_TI_end_line(0xfe)
	.dwattr $C$DW$59, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$59

	.sect	".text:handle_command"
	.align	2
	.clink

$C$DW$63	.dwtag  DW_TAG_subprogram, DW_AT_name("handle_command")
	.dwattr $C$DW$63, DW_AT_low_pc(handle_command)
	.dwattr $C$DW$63, DW_AT_high_pc(0x00)
	.dwattr $C$DW$63, DW_AT_TI_symbol_name("handle_command")
	.dwattr $C$DW$63, DW_AT_TI_begin_file("../main.c")
	.dwattr $C$DW$63, DW_AT_TI_begin_line(0x12d)
	.dwattr $C$DW$63, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$63, DW_AT_decl_file("../main.c")
	.dwattr $C$DW$63, DW_AT_decl_line(0x12d)
	.dwattr $C$DW$63, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$63, DW_AT_TI_max_frame_size(0x02)
	.dwpsn	file "../main.c",line 301,column 30,is_stmt,address handle_command,isa 0

	.dwfde $C$DW$CIE, handle_command

;*****************************************************************************
;* FUNCTION NAME: handle_command                                             *
;*                                                                           *
;*   Regs Modified     : SR,r4,r5,r11,r12,r13,r14,r15                        *
;*   Regs Used         : SR,r4,r5,r11,r12,r13,r14,r15                        *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                   *
;*****************************************************************************
handle_command:
;* --------------------------------------------------------------------------*
;* r14   assigned to counter
$C$DW$64	.dwtag  DW_TAG_variable, DW_AT_name("counter")
	.dwattr $C$DW$64, DW_AT_TI_symbol_name("counter")
	.dwattr $C$DW$64, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$64, DW_AT_location[DW_OP_reg14]
;* r14   assigned to src
$C$DW$65	.dwtag  DW_TAG_variable, DW_AT_name("src")
	.dwattr $C$DW$65, DW_AT_TI_symbol_name("src")
	.dwattr $C$DW$65, DW_AT_type(*$C$DW$T$28)
	.dwattr $C$DW$65, DW_AT_location[DW_OP_reg14]
;* r15   assigned to dst
$C$DW$66	.dwtag  DW_TAG_variable, DW_AT_name("dst")
	.dwattr $C$DW$66, DW_AT_TI_symbol_name("dst")
	.dwattr $C$DW$66, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$66, DW_AT_location[DW_OP_reg15]
;* r15   assigned to $O$U50
	.dwcfi	cfa_offset, 2
	.dwcfi	save_reg_to_mem, 16, -2
	.dwpsn	file "../main.c",line 302,column 2,is_stmt,isa 0
        BIT.B     #65408,&cmd+0         ; [] |302| 
        JNE       $C$L11                ; [] |302| 
                                          ; [] |302| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../main.c",line 305,column 9,is_stmt,isa 0
        BIT.B     #64,&cmd+0            ; [] |305| 
        JNE       $C$L10                ; [] |305| 
                                          ; [] |305| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../main.c",line 307,column 9,is_stmt,isa 0
        BIT.B     #32,&cmd+0            ; [] |307| 
        JNE       $C$L8                 ; [] |307| 
                                          ; [] |307| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../main.c",line 310,column 3,is_stmt,isa 0
$C$DW$67	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$67, DW_AT_low_pc(0x00)
	.dwattr $C$DW$67, DW_AT_name("command_action")
	.dwattr $C$DW$67, DW_AT_TI_call
        CALL      #command_action       ; [] |310| 
                                          ; [] |310| 
	.dwpsn	file "../main.c",line 311,column 3,is_stmt,isa 0
        JMP       $C$L12                ; [] |311| 
                                          ; [] |311| 
;* --------------------------------------------------------------------------*
$C$L8:    
	.dwpsn	file "../main.c",line 286,column 2,is_stmt,isa 0
        MOV.W     #42325,&FCTL2+0       ; [] |286| 
	.dwpsn	file "../main.c",line 287,column 2,is_stmt,isa 0
        MOV.W     #42240,&FCTL3+0       ; [] |287| 
	.dwpsn	file "../main.c",line 288,column 2,is_stmt,isa 0
        MOV.W     #42242,&FCTL1+0       ; [] |288| 
	.dwpsn	file "../main.c",line 289,column 2,is_stmt,isa 0
        MOV.B     #0,&device_info+0     ; [] |289| 
	.dwpsn	file "../main.c",line 290,column 2,is_stmt,isa 0
        MOV.W     #42304,&FCTL1+0       ; [] |290| 
	.dwpsn	file "../main.c",line 291,column 2,is_stmt,isa 0
        MOV.W     #device_info+0,r15    ; [] |291| 
        MOV.W     #device_info_buffer+0,r14 ; [] |291| 
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP $C$L9
;*
;*   Loop source line                : 273
;*   Loop closing brace source line  : 275
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
$C$L9:    
	.dwpsn	file "../main.c",line 274,column 3,is_stmt,isa 0
        ADD.W     #1,r15                ; [] |274| 
        MOV.B     @r14+,-1(r15)         ; [] |274| 
	.dwpsn	file "../main.c",line 273,column 2,is_stmt,isa 0
        BIT.W     #15,r14               ; [] |273| 
        JNE       $C$L9                 ; [] |273| 
                                          ; [] |273| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../main.c",line 292,column 2,is_stmt,isa 0
        MOV.W     #42240,&FCTL1+0       ; [] |292| 
	.dwpsn	file "../main.c",line 293,column 2,is_stmt,isa 0
        MOV.W     #42256,&FCTL3+0       ; [] |293| 
	.dwpsn	file "../main.c",line 294,column 1,is_stmt,isa 0
        JMP       $C$L13                ; [] |294| 
                                          ; [] |294| 
;* --------------------------------------------------------------------------*
$C$L10:    
	.dwpsn	file "../main.c",line 306,column 3,is_stmt,isa 0
        MOV.B     &cmd+0,r15            ; [] |306| 
        AND.W     #15,r15               ; [] |306| 
        MOV.B     device_info+0(r15),&ack_byte+0 ; [] |306| 
	.dwpsn	file "../main.c",line 307,column 2,is_stmt,isa 0
        JMP       $C$L13                ; [] |307| 
                                          ; [] |307| 
;* --------------------------------------------------------------------------*
$C$L11:    
	.dwpsn	file "../main.c",line 303,column 3,is_stmt,isa 0
        MOV.B     &cmd+0,r15            ; [] |303| 
        AND.W     #15,r15               ; [] |303| 
        MOV.B     &arg+0,device_info_buffer+0(r15) ; [] |303| 
;* --------------------------------------------------------------------------*
$C$L12:    
	.dwpsn	file "../main.c",line 304,column 3,is_stmt,isa 0
        MOV.B     #0,&ack_byte+0        ; [] |304| 
;* --------------------------------------------------------------------------*
$C$L13:    
	.dwpsn	file "../main.c",line 263,column 2,is_stmt,isa 0
        ; Begin 80000 cycle delay
        .newblock
        PUSH     r13
        MOV.W    #26664, r13
$1:     SUB.W    #1, r13
        JNE      $1
        POP      r13
        NOP
        ; End 80000 cycle delay ; [] |263| 
        MOV.W     #tx_preamble+2,r15    ; [] 
        MOV.W     #3,r14                ; [] 
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP $C$L14
;*
;*   Loop source line                : 264
;*   Loop closing brace source line  : 266
;*   Known Minimum Trip Count        : 3
;*   Known Maximum Trip Count        : 3
;*   Known Max Trip Count Factor     : 3
;* --------------------------------------------------------------------------*
$C$L14:    
	.dwpsn	file "../main.c",line 265,column 3,is_stmt,isa 0
        MOV.B     @r15,r12              ; [] |265| 
$C$DW$68	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$68, DW_AT_low_pc(0x00)
	.dwattr $C$DW$68, DW_AT_name("tx_char")
	.dwattr $C$DW$68, DW_AT_TI_call
        CALL      #tx_char              ; [] |265| 
                                          ; [] |265| 
	.dwpsn	file "../main.c",line 264,column 31,is_stmt,isa 0
        SUB.W     #1,r15                ; [] |264| 
        SUB.W     #1,r14                ; [] |264| 
        JNE       $C$L14                ; [] |264| 
                                          ; [] |264| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../main.c",line 267,column 2,is_stmt,isa 0
        MOV.B     &cmd+0,r12            ; [] |267| 
$C$DW$69	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$69, DW_AT_low_pc(0x00)
	.dwattr $C$DW$69, DW_AT_name("tx_char")
	.dwattr $C$DW$69, DW_AT_TI_call
        CALL      #tx_char              ; [] |267| 
                                          ; [] |267| 
	.dwpsn	file "../main.c",line 268,column 2,is_stmt,isa 0
        MOV.B     &ack_byte+0,r12       ; [] |268| 
$C$DW$70	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$70, DW_AT_low_pc(0x00)
	.dwattr $C$DW$70, DW_AT_name("tx_char")
	.dwattr $C$DW$70, DW_AT_TI_call
        CALL      #tx_char              ; [] |268| 
                                          ; [] |268| 
	.dwpsn	file "../main.c",line 269,column 2,is_stmt,isa 0
        MOV.B     #255,r12              ; [] |269| 
$C$DW$71	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$71, DW_AT_low_pc(0x00)
	.dwattr $C$DW$71, DW_AT_name("tx_char")
	.dwattr $C$DW$71, DW_AT_TI_call
	.dwattr $C$DW$71, DW_AT_TI_return
        BR        #tx_char              ; [] |269| 
                                          ; [] |269| 
	.dwattr $C$DW$63, DW_AT_TI_end_file("../main.c")
	.dwattr $C$DW$63, DW_AT_TI_end_line(0x13a)
	.dwattr $C$DW$63, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$63

	.sect	".text:main"
	.align	2
	.clink
	.global	main

$C$DW$72	.dwtag  DW_TAG_subprogram, DW_AT_name("main")
	.dwattr $C$DW$72, DW_AT_low_pc(main)
	.dwattr $C$DW$72, DW_AT_high_pc(0x00)
	.dwattr $C$DW$72, DW_AT_TI_symbol_name("main")
	.dwattr $C$DW$72, DW_AT_external
	.dwattr $C$DW$72, DW_AT_TI_begin_file("../main.c")
	.dwattr $C$DW$72, DW_AT_TI_begin_line(0xa2)
	.dwattr $C$DW$72, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$72, DW_AT_decl_file("../main.c")
	.dwattr $C$DW$72, DW_AT_decl_line(0xa2)
	.dwattr $C$DW$72, DW_AT_decl_column(0x06)
	.dwattr $C$DW$72, DW_AT_TI_max_frame_size(0x02)
	.dwpsn	file "../main.c",line 162,column 17,is_stmt,address main,isa 0

	.dwfde $C$DW$CIE, main

;*****************************************************************************
;* FUNCTION NAME: main                                                       *
;*                                                                           *
;*   Regs Modified     : SR,r4,r5,r11,r12,r13,r14,r15                        *
;*   Regs Used         : SR,r4,r5,r11,r12,r13,r14,r15                        *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                   *
;*****************************************************************************
main:
;* --------------------------------------------------------------------------*
;* r15   assigned to $O$Y0
;* r14   assigned to preamble_match$1
$C$DW$73	.dwtag  DW_TAG_variable, DW_AT_name("preamble_match")
	.dwattr $C$DW$73, DW_AT_TI_symbol_name("preamble_match$1")
	.dwattr $C$DW$73, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$73, DW_AT_location[DW_OP_reg14]
;* r14   assigned to dst
$C$DW$74	.dwtag  DW_TAG_variable, DW_AT_name("dst")
	.dwattr $C$DW$74, DW_AT_TI_symbol_name("dst")
	.dwattr $C$DW$74, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$74, DW_AT_location[DW_OP_reg14]
;* r15   assigned to src
$C$DW$75	.dwtag  DW_TAG_variable, DW_AT_name("src")
	.dwattr $C$DW$75, DW_AT_TI_symbol_name("src")
	.dwattr $C$DW$75, DW_AT_type(*$C$DW$T$28)
	.dwattr $C$DW$75, DW_AT_location[DW_OP_reg15]
;* r15   assigned to $O$U41
	.dwcfi	cfa_offset, 2
	.dwcfi	save_reg_to_mem, 16, -2
	.dwpsn	file "../main.c",line 165,column 2,is_stmt,isa 0
        MOV.W     #23168,&WDTCTL+0      ; [] |165| 
	.dwpsn	file "../main.c",line 105,column 2,is_stmt,isa 0
        MOV.W     #128,r15              ; [] |105| 
        OR.B      &CALBC1_8MHZ+0,r15    ; [] |105| 
        MOV.B     r15,&BCSCTL1+0        ; [] |105| 
	.dwpsn	file "../main.c",line 106,column 2,is_stmt,isa 0
        MOV.B     &CALDCO_8MHZ+0,&DCOCTL+0 ; [] |106| 
	.dwpsn	file "../main.c",line 154,column 5,is_stmt,isa 0
        MOV.B     #218,&P1DIR+0         ; [] |154| 
	.dwpsn	file "../main.c",line 155,column 5,is_stmt,isa 0
        MOV.B     #8,&P1SEL+0           ; [] |155| 
	.dwpsn	file "../main.c",line 156,column 5,is_stmt,isa 0
        MOV.B     #8,&P1SEL2+0          ; [] |156| 
	.dwpsn	file "../main.c",line 157,column 5,is_stmt,isa 0
        MOV.B     #0,&P2SEL+0           ; [] |157| 
	.dwpsn	file "../main.c",line 90,column 2,is_stmt,isa 0
        MOV.B     &device_info+2,&P2OUT+0 ; [] |90| 
	.dwpsn	file "../main.c",line 91,column 2,is_stmt,isa 0
        MOV.B     #255,&P2DIR+0         ; [] |91| 
	.dwpsn	file "../main.c",line 92,column 2,is_stmt,isa 0
        MOV.B     &device_info+3,&P3OUT+0 ; [] |92| 
	.dwpsn	file "../main.c",line 93,column 2,is_stmt,isa 0
        MOV.B     #255,&P3DIR+0         ; [] |93| 
	.dwpsn	file "../main.c",line 94,column 2,is_stmt,isa 0
        MOV.B     #8,&cmd+0             ; [] |94| 
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP $C$L15
;*
;*   Loop source line                : 95
;*   Loop closing brace source line  : 99
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
$C$L15:    
	.dwpsn	file "../main.c",line 96,column 3,is_stmt,isa 0
        SUB.B     #1,&cmd+0             ; [] |96| 
        MOV.B     &cmd+0,r15            ; [] |96| 
	.dwpsn	file "../main.c",line 97,column 3,is_stmt,isa 0
        MOV.B     r15,r15               ; [] |97| 
        MOV.B     device_info+0(r15),&arg+0 ; [] |97| 
	.dwpsn	file "../main.c",line 98,column 3,is_stmt,isa 0
$C$DW$76	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$76, DW_AT_low_pc(0x00)
	.dwattr $C$DW$76, DW_AT_name("command_action")
	.dwattr $C$DW$76, DW_AT_TI_call
        CALL      #command_action       ; [] |98| 
                                          ; [] |98| 
	.dwpsn	file "../main.c",line 95,column 2,is_stmt,isa 0
        TST.B     &cmd+0                ; [] |95| 
        JNE       $C$L15                ; [] |95| 
                                          ; [] |95| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../main.c",line 100,column 2,is_stmt,isa 0
        MOV.W     #device_info_buffer+0,r14 ; [] |100| 
        MOV.W     #device_info+0,r15    ; [] |100| 
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP $C$L16
;*
;*   Loop source line                : 273
;*   Loop closing brace source line  : 275
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
$C$L16:    
	.dwpsn	file "../main.c",line 274,column 3,is_stmt,isa 0
        ADD.W     #1,r14                ; [] |274| 
        MOV.B     @r15+,-1(r14)         ; [] |274| 
	.dwpsn	file "../main.c",line 273,column 2,is_stmt,isa 0
        BIT.W     #15,r15               ; [] |273| 
        JNE       $C$L16                ; [] |273| 
                                          ; [] |273| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../main.c",line 116,column 5,is_stmt,isa 0
        MOV.B     #5,&CAPD+0            ; [] |116| 
	.dwpsn	file "../main.c",line 117,column 5,is_stmt,isa 0
        MOV.B     #20,&CACTL2+0         ; [] |117| 
	.dwpsn	file "../main.c",line 118,column 5,is_stmt,isa 0
        MOV.B     #8,&CACTL1+0          ; [] |118| 
	.dwpsn	file "../main.c",line 173,column 2,is_stmt,isa 0
        MOV.B     #0,r14                ; [] |173| 
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP $C$L17
;*
;*   Loop source line                : 175
;*   Loop closing brace source line  : 228
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
$C$L17:    
        MOV.B     r14,r15               ; [] 
        ADD.W     #rx_preamble+0,r15    ; [] 
	.dwpsn	file "../main.c",line 176,column 13,is_stmt,isa 0
        JMP       $C$L19                ; [] |176| 
                                          ; [] |176| 
;* --------------------------------------------------------------------------*
$C$L18:    
	.dwpsn	file "../main.c",line 181,column 8,is_stmt,isa 0
        TST.B     r14                   ; [] |181| 
        JEQ       $C$L20                ; [] |181| 
                                          ; [] |181| 
;* --------------------------------------------------------------------------*
        MOV.W     #rx_preamble+0,r15    ; [] 
	.dwpsn	file "../main.c",line 182,column 9,is_stmt,isa 0
        MOV.B     #0,r14                ; [] |182| 
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP $C$L19
;* --------------------------------------------------------------------------*
$C$L19:    
	.dwpsn	file "../main.c",line 177,column 7,is_stmt,isa 0
        CMP.B     @r15,&rx_char+0       ; [] |177| 
        JNE       $C$L18                ; [] |177| 
                                          ; [] |177| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../main.c",line 178,column 8,is_stmt,isa 0
        ADD.W     #1,r15                ; [] |178| 
        ADD.B     #1,r14                ; [] |178| 
;* --------------------------------------------------------------------------*
$C$L20:    
	.dwpsn	file "../main.c",line 238,column 2,is_stmt,isa 0
        MOV.B     #14,&CACTL1+0         ; [] |238| 
	.dwpsn	file "../main.c",line 239,column 2,is_stmt,isa 0
        BIS.W     #248,SR               ; [] |239| 
	.dwpsn	file "../main.c",line 176,column 13,is_stmt,isa 0
        CMP.B     #3,r14                ; [] |176| 
        JLO       $C$L19                ; [] |176| 
                                          ; [] |176| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../main.c",line 188,column 6,is_stmt,isa 0
        MOV.B     &rx_char+0,&cmd+0     ; [] |188| 
	.dwpsn	file "../main.c",line 238,column 2,is_stmt,isa 0
        MOV.B     #14,&CACTL1+0         ; [] |238| 
	.dwpsn	file "../main.c",line 239,column 2,is_stmt,isa 0
        BIS.W     #248,SR               ; [] |239| 
	.dwpsn	file "../main.c",line 190,column 6,is_stmt,isa 0
        MOV.B     &rx_char+0,&arg+0     ; [] |190| 
	.dwpsn	file "../main.c",line 238,column 2,is_stmt,isa 0
        MOV.B     #14,&CACTL1+0         ; [] |238| 
	.dwpsn	file "../main.c",line 239,column 2,is_stmt,isa 0
        BIS.W     #248,SR               ; [] |239| 
	.dwpsn	file "../main.c",line 192,column 6,is_stmt,isa 0
        CMP.B     #255,&rx_char+0       ; [] |192| 
        JNE       $C$L21                ; [] |192| 
                                          ; [] |192| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../main.c",line 192,column 26,is_stmt,isa 0
$C$DW$77	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$77, DW_AT_low_pc(0x00)
	.dwattr $C$DW$77, DW_AT_name("handle_command")
	.dwattr $C$DW$77, DW_AT_TI_call
        CALL      #handle_command       ; [] |192| 
                                          ; [] |192| 
;* --------------------------------------------------------------------------*
$C$L21:    
	.dwpsn	file "../main.c",line 193,column 6,is_stmt,isa 0
        MOV.B     #0,r14                ; [] |193| 
	.dwpsn	file "../main.c",line 175,column 12,is_stmt,isa 0
        JMP       $C$L17                ; [] |175| 
                                          ; [] |175| 
	.dwattr $C$DW$72, DW_AT_TI_end_file("../main.c")
	.dwattr $C$DW$72, DW_AT_TI_end_line(0xe5)
	.dwattr $C$DW$72, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$72

;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	DCOCTL
	.global	BCSCTL1
	.global	CACTL1
	.global	CACTL2
	.global	CAPD
	.global	FCTL1
	.global	FCTL2
	.global	FCTL3
	.global	P1DIR
	.global	P1SEL
	.global	P1SEL2
	.global	P2OUT
	.global	P2DIR
	.global	P2SEL
	.global	P3OUT
	.global	P3DIR
	.global	TA1CTL
	.global	TA1CCTL0
	.global	TA1CCR0
	.global	WDTCTL
	.global	CALDCO_8MHZ
	.global	CALBC1_8MHZ
	.global	enable_port_arr
	.global	enable_bit_arr
	.global	att_port_arr
	.global	att_bit_arr
	.global	en_5v_port
	.global	en_5v_bit
	.global	spiclk_port
	.global	spiclk_bit
	.global	spidata_port
	.global	spidata_bit
	.global	__mspabi_func_epilog_2

;******************************************************************************
;* BUILD ATTRIBUTES                                                           *
;******************************************************************************
	.battr "TI", Tag_File, 1, Tag_LPM_INFO(2)
	.battr "TI", Tag_File, 1, Tag_HW_MPY32_INFO(1)
	.battr "TI", Tag_File, 1, Tag_PORTS_INIT_INFO("012345678901ABCDEFGHIJ01110000000000000000000111000000000000000000")
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
$C$DW$T$30	.dwtag  DW_TAG_typedef, DW_AT_name("int8_t")
	.dwattr $C$DW$T$30, DW_AT_type(*$C$DW$T$5)
	.dwattr $C$DW$T$30, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$30, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$30, DW_AT_decl_line(0x2a)
	.dwattr $C$DW$T$30, DW_AT_decl_column(0x1e)
$C$DW$T$31	.dwtag  DW_TAG_typedef, DW_AT_name("int_least8_t")
	.dwattr $C$DW$T$31, DW_AT_type(*$C$DW$T$30)
	.dwattr $C$DW$T$31, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$31, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$31, DW_AT_decl_line(0x37)
	.dwattr $C$DW$T$31, DW_AT_decl_column(0x17)
$C$DW$T$6	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$6, DW_AT_encoding(DW_ATE_unsigned_char)
	.dwattr $C$DW$T$6, DW_AT_name("unsigned char")
	.dwattr $C$DW$T$6, DW_AT_byte_size(0x01)
$C$DW$T$32	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$32, DW_AT_type(*$C$DW$T$6)
$C$DW$T$38	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$38, DW_AT_type(*$C$DW$T$6)
$C$DW$T$25	.dwtag  DW_TAG_typedef, DW_AT_name("uint8_t")
	.dwattr $C$DW$T$25, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$T$25, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$25, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$25, DW_AT_decl_line(0x2b)
	.dwattr $C$DW$T$25, DW_AT_decl_column(0x1d)
$C$DW$T$26	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$26, DW_AT_type(*$C$DW$T$25)
	.dwattr $C$DW$T$26, DW_AT_address_class(0x10)

$C$DW$T$46	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$46, DW_AT_type(*$C$DW$T$25)
	.dwattr $C$DW$T$46, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$46, DW_AT_byte_size(0x10)
$C$DW$78	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$78, DW_AT_upper_bound(0x0f)
	.dwendtag $C$DW$T$46

$C$DW$T$27	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$27, DW_AT_type(*$C$DW$T$25)
$C$DW$T$28	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$28, DW_AT_type(*$C$DW$T$27)
	.dwattr $C$DW$T$28, DW_AT_address_class(0x10)

$C$DW$T$47	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$47, DW_AT_type(*$C$DW$T$27)
	.dwattr $C$DW$T$47, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$47, DW_AT_byte_size(0x04)
$C$DW$79	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$79, DW_AT_upper_bound(0x03)
	.dwendtag $C$DW$T$47


$C$DW$T$48	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$48, DW_AT_type(*$C$DW$T$27)
	.dwattr $C$DW$T$48, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$48, DW_AT_byte_size(0x08)
$C$DW$80	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$80, DW_AT_upper_bound(0x07)
	.dwendtag $C$DW$T$48


$C$DW$T$49	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$49, DW_AT_type(*$C$DW$T$27)
	.dwattr $C$DW$T$49, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$49, DW_AT_byte_size(0x10)
$C$DW$81	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$81, DW_AT_upper_bound(0x0f)
	.dwendtag $C$DW$T$49

$C$DW$T$50	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$50, DW_AT_type(*$C$DW$T$25)
$C$DW$T$51	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$51, DW_AT_type(*$C$DW$T$50)
	.dwattr $C$DW$T$51, DW_AT_address_class(0x10)
$C$DW$T$52	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$52, DW_AT_type(*$C$DW$T$51)

$C$DW$T$53	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$53, DW_AT_type(*$C$DW$T$52)
	.dwattr $C$DW$T$53, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$53, DW_AT_byte_size(0x08)
$C$DW$82	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$82, DW_AT_upper_bound(0x03)
	.dwendtag $C$DW$T$53


$C$DW$T$54	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$54, DW_AT_type(*$C$DW$T$52)
	.dwattr $C$DW$T$54, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$54, DW_AT_byte_size(0x10)
$C$DW$83	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$83, DW_AT_upper_bound(0x07)
	.dwendtag $C$DW$T$54

$C$DW$T$55	.dwtag  DW_TAG_typedef, DW_AT_name("uint_least8_t")
	.dwattr $C$DW$T$55, DW_AT_type(*$C$DW$T$25)
	.dwattr $C$DW$T$55, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$55, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$55, DW_AT_decl_line(0x38)
	.dwattr $C$DW$T$55, DW_AT_decl_column(0x16)
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
$C$DW$T$57	.dwtag  DW_TAG_typedef, DW_AT_name("int16_t")
	.dwattr $C$DW$T$57, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$T$57, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$57, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$57, DW_AT_decl_line(0x2c)
	.dwattr $C$DW$T$57, DW_AT_decl_column(0x1d)
$C$DW$T$58	.dwtag  DW_TAG_typedef, DW_AT_name("int_fast16_t")
	.dwattr $C$DW$T$58, DW_AT_type(*$C$DW$T$57)
	.dwattr $C$DW$T$58, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$58, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$58, DW_AT_decl_line(0x47)
	.dwattr $C$DW$T$58, DW_AT_decl_column(0x17)
$C$DW$T$59	.dwtag  DW_TAG_typedef, DW_AT_name("int_fast8_t")
	.dwattr $C$DW$T$59, DW_AT_type(*$C$DW$T$57)
	.dwattr $C$DW$T$59, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$59, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$59, DW_AT_decl_line(0x45)
	.dwattr $C$DW$T$59, DW_AT_decl_column(0x17)
$C$DW$T$60	.dwtag  DW_TAG_typedef, DW_AT_name("int_least16_t")
	.dwattr $C$DW$T$60, DW_AT_type(*$C$DW$T$57)
	.dwattr $C$DW$T$60, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$60, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$60, DW_AT_decl_line(0x3a)
	.dwattr $C$DW$T$60, DW_AT_decl_column(0x17)
$C$DW$T$61	.dwtag  DW_TAG_typedef, DW_AT_name("intptr_t")
	.dwattr $C$DW$T$61, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$T$61, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$61, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$61, DW_AT_decl_line(0x56)
	.dwattr $C$DW$T$61, DW_AT_decl_column(0x1a)
$C$DW$T$11	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$11, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$11, DW_AT_name("unsigned int")
	.dwattr $C$DW$T$11, DW_AT_byte_size(0x02)
$C$DW$T$62	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$62, DW_AT_type(*$C$DW$T$11)
$C$DW$T$63	.dwtag  DW_TAG_typedef, DW_AT_name("uint16_t")
	.dwattr $C$DW$T$63, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$63, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$63, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$63, DW_AT_decl_line(0x2d)
	.dwattr $C$DW$T$63, DW_AT_decl_column(0x1c)
$C$DW$T$64	.dwtag  DW_TAG_typedef, DW_AT_name("uint_fast16_t")
	.dwattr $C$DW$T$64, DW_AT_type(*$C$DW$T$63)
	.dwattr $C$DW$T$64, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$64, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$64, DW_AT_decl_line(0x48)
	.dwattr $C$DW$T$64, DW_AT_decl_column(0x16)
$C$DW$T$65	.dwtag  DW_TAG_typedef, DW_AT_name("uint_fast8_t")
	.dwattr $C$DW$T$65, DW_AT_type(*$C$DW$T$63)
	.dwattr $C$DW$T$65, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$65, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$65, DW_AT_decl_line(0x46)
	.dwattr $C$DW$T$65, DW_AT_decl_column(0x16)
$C$DW$T$66	.dwtag  DW_TAG_typedef, DW_AT_name("uint_least16_t")
	.dwattr $C$DW$T$66, DW_AT_type(*$C$DW$T$63)
	.dwattr $C$DW$T$66, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$66, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$66, DW_AT_decl_line(0x3b)
	.dwattr $C$DW$T$66, DW_AT_decl_column(0x16)
$C$DW$T$67	.dwtag  DW_TAG_typedef, DW_AT_name("uintptr_t")
	.dwattr $C$DW$T$67, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$67, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$67, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$67, DW_AT_decl_line(0x57)
	.dwattr $C$DW$T$67, DW_AT_decl_column(0x1a)
$C$DW$T$12	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$12, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$12, DW_AT_name("long")
	.dwattr $C$DW$T$12, DW_AT_byte_size(0x04)
$C$DW$T$68	.dwtag  DW_TAG_typedef, DW_AT_name("int32_t")
	.dwattr $C$DW$T$68, DW_AT_type(*$C$DW$T$12)
	.dwattr $C$DW$T$68, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$68, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$68, DW_AT_decl_line(0x2e)
	.dwattr $C$DW$T$68, DW_AT_decl_column(0x1d)
$C$DW$T$69	.dwtag  DW_TAG_typedef, DW_AT_name("int_fast32_t")
	.dwattr $C$DW$T$69, DW_AT_type(*$C$DW$T$68)
	.dwattr $C$DW$T$69, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$69, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$69, DW_AT_decl_line(0x4a)
	.dwattr $C$DW$T$69, DW_AT_decl_column(0x17)
$C$DW$T$70	.dwtag  DW_TAG_typedef, DW_AT_name("int_least32_t")
	.dwattr $C$DW$T$70, DW_AT_type(*$C$DW$T$68)
	.dwattr $C$DW$T$70, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$70, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$70, DW_AT_decl_line(0x3c)
	.dwattr $C$DW$T$70, DW_AT_decl_column(0x17)
$C$DW$T$13	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$13, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$13, DW_AT_name("unsigned long")
	.dwattr $C$DW$T$13, DW_AT_byte_size(0x04)
$C$DW$T$71	.dwtag  DW_TAG_typedef, DW_AT_name("uint32_t")
	.dwattr $C$DW$T$71, DW_AT_type(*$C$DW$T$13)
	.dwattr $C$DW$T$71, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$71, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$71, DW_AT_decl_line(0x2f)
	.dwattr $C$DW$T$71, DW_AT_decl_column(0x1c)
$C$DW$T$72	.dwtag  DW_TAG_typedef, DW_AT_name("uint_fast32_t")
	.dwattr $C$DW$T$72, DW_AT_type(*$C$DW$T$71)
	.dwattr $C$DW$T$72, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$72, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$72, DW_AT_decl_line(0x4b)
	.dwattr $C$DW$T$72, DW_AT_decl_column(0x16)
$C$DW$T$73	.dwtag  DW_TAG_typedef, DW_AT_name("uint_least32_t")
	.dwattr $C$DW$T$73, DW_AT_type(*$C$DW$T$71)
	.dwattr $C$DW$T$73, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$73, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$73, DW_AT_decl_line(0x3d)
	.dwattr $C$DW$T$73, DW_AT_decl_column(0x16)
$C$DW$T$14	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$14, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$14, DW_AT_name("long long")
	.dwattr $C$DW$T$14, DW_AT_byte_size(0x08)
$C$DW$T$74	.dwtag  DW_TAG_typedef, DW_AT_name("int64_t")
	.dwattr $C$DW$T$74, DW_AT_type(*$C$DW$T$14)
	.dwattr $C$DW$T$74, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$74, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$74, DW_AT_decl_line(0x32)
	.dwattr $C$DW$T$74, DW_AT_decl_column(0x21)
$C$DW$T$75	.dwtag  DW_TAG_typedef, DW_AT_name("int_fast64_t")
	.dwattr $C$DW$T$75, DW_AT_type(*$C$DW$T$74)
	.dwattr $C$DW$T$75, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$75, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$75, DW_AT_decl_line(0x4e)
	.dwattr $C$DW$T$75, DW_AT_decl_column(0x17)
$C$DW$T$76	.dwtag  DW_TAG_typedef, DW_AT_name("int_least64_t")
	.dwattr $C$DW$T$76, DW_AT_type(*$C$DW$T$74)
	.dwattr $C$DW$T$76, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$76, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$76, DW_AT_decl_line(0x40)
	.dwattr $C$DW$T$76, DW_AT_decl_column(0x17)
$C$DW$T$77	.dwtag  DW_TAG_typedef, DW_AT_name("intmax_t")
	.dwattr $C$DW$T$77, DW_AT_type(*$C$DW$T$14)
	.dwattr $C$DW$T$77, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$77, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$77, DW_AT_decl_line(0x5b)
	.dwattr $C$DW$T$77, DW_AT_decl_column(0x20)
$C$DW$T$15	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$15, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$15, DW_AT_name("unsigned long long")
	.dwattr $C$DW$T$15, DW_AT_byte_size(0x08)
$C$DW$T$78	.dwtag  DW_TAG_typedef, DW_AT_name("uint64_t")
	.dwattr $C$DW$T$78, DW_AT_type(*$C$DW$T$15)
	.dwattr $C$DW$T$78, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$78, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$78, DW_AT_decl_line(0x33)
	.dwattr $C$DW$T$78, DW_AT_decl_column(0x20)
$C$DW$T$79	.dwtag  DW_TAG_typedef, DW_AT_name("uint_fast64_t")
	.dwattr $C$DW$T$79, DW_AT_type(*$C$DW$T$78)
	.dwattr $C$DW$T$79, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$79, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$79, DW_AT_decl_line(0x4f)
	.dwattr $C$DW$T$79, DW_AT_decl_column(0x16)
$C$DW$T$80	.dwtag  DW_TAG_typedef, DW_AT_name("uint_least64_t")
	.dwattr $C$DW$T$80, DW_AT_type(*$C$DW$T$78)
	.dwattr $C$DW$T$80, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$80, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$80, DW_AT_decl_line(0x41)
	.dwattr $C$DW$T$80, DW_AT_decl_column(0x16)
$C$DW$T$81	.dwtag  DW_TAG_typedef, DW_AT_name("uintmax_t")
	.dwattr $C$DW$T$81, DW_AT_type(*$C$DW$T$15)
	.dwattr $C$DW$T$81, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$81, DW_AT_decl_file("c:/ti/ccsv6/tools/compiler/msp430_4.3.5/include/stdint.h")
	.dwattr $C$DW$T$81, DW_AT_decl_line(0x5c)
	.dwattr $C$DW$T$81, DW_AT_decl_column(0x20)
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
$C$DW$T$83	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$83, DW_AT_type(*$C$DW$T$6)

$C$DW$T$84	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$84, DW_AT_type(*$C$DW$T$83)
	.dwattr $C$DW$T$84, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$84, DW_AT_byte_size(0x03)
$C$DW$84	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$84, DW_AT_upper_bound(0x02)
	.dwendtag $C$DW$T$84


$C$DW$T$85	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$85, DW_AT_type(*$C$DW$T$83)
	.dwattr $C$DW$T$85, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$85, DW_AT_byte_size(0x04)
$C$DW$85	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$85, DW_AT_upper_bound(0x03)
	.dwendtag $C$DW$T$85

$C$DW$T$86	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$86, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$T$86, DW_AT_address_class(0x10)
$C$DW$T$87	.dwtag  DW_TAG_typedef, DW_AT_name("__builtin_va_list")
	.dwattr $C$DW$T$87, DW_AT_type(*$C$DW$T$86)
	.dwattr $C$DW$T$87, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$87, DW_AT_decl_file("../main.c")
	.dwattr $C$DW$T$87, DW_AT_decl_line(0x170)
	.dwattr $C$DW$T$87, DW_AT_decl_column(0x01)
	.dwattr $C$DW$CU, DW_AT_language(DW_LANG_C)

;***************************************************************
;* DWARF CIE ENTRIES                                           *
;***************************************************************

$C$DW$CIE	.dwcie 16
	.dwcfi	cfa_register, 1
	.dwcfi	cfa_offset, 0
	.dwcfi	same_value, 0
	.dwcfi	same_value, 1
	.dwcfi	undefined, 2
	.dwcfi	same_value, 3
	.dwcfi	same_value, 4
	.dwcfi	same_value, 5
	.dwcfi	same_value, 6
	.dwcfi	same_value, 7
	.dwcfi	same_value, 8
	.dwcfi	same_value, 9
	.dwcfi	same_value, 10
	.dwcfi	undefined, 11
	.dwcfi	undefined, 12
	.dwcfi	undefined, 13
	.dwcfi	undefined, 14
	.dwcfi	undefined, 15
	.dwcfi	undefined, 16
	.dwendentry

;***************************************************************
;* DWARF REGISTER MAP                                          *
;***************************************************************

$C$DW$86	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("PC")
	.dwattr $C$DW$86, DW_AT_location[DW_OP_reg0]
$C$DW$87	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("SP")
	.dwattr $C$DW$87, DW_AT_location[DW_OP_reg1]
$C$DW$88	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("SR")
	.dwattr $C$DW$88, DW_AT_location[DW_OP_reg2]
$C$DW$89	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("CG")
	.dwattr $C$DW$89, DW_AT_location[DW_OP_reg3]
$C$DW$90	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("r4")
	.dwattr $C$DW$90, DW_AT_location[DW_OP_reg4]
$C$DW$91	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("r5")
	.dwattr $C$DW$91, DW_AT_location[DW_OP_reg5]
$C$DW$92	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("r6")
	.dwattr $C$DW$92, DW_AT_location[DW_OP_reg6]
$C$DW$93	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("r7")
	.dwattr $C$DW$93, DW_AT_location[DW_OP_reg7]
$C$DW$94	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("r8")
	.dwattr $C$DW$94, DW_AT_location[DW_OP_reg8]
$C$DW$95	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("r9")
	.dwattr $C$DW$95, DW_AT_location[DW_OP_reg9]
$C$DW$96	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("r10")
	.dwattr $C$DW$96, DW_AT_location[DW_OP_reg10]
$C$DW$97	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("r11")
	.dwattr $C$DW$97, DW_AT_location[DW_OP_reg11]
$C$DW$98	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("r12")
	.dwattr $C$DW$98, DW_AT_location[DW_OP_reg12]
$C$DW$99	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("r13")
	.dwattr $C$DW$99, DW_AT_location[DW_OP_reg13]
$C$DW$100	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("r14")
	.dwattr $C$DW$100, DW_AT_location[DW_OP_reg14]
$C$DW$101	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("r15")
	.dwattr $C$DW$101, DW_AT_location[DW_OP_reg15]
$C$DW$102	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("CIE_RETA")
	.dwattr $C$DW$102, DW_AT_location[DW_OP_reg16]
	.dwendtag $C$DW$CU

