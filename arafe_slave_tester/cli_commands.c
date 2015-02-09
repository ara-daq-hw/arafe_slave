/*
 * cli_commands.c
 *
 *  Created on: Nov 20, 2014
 *      Author: barawn
 */

#include <stdio.h>
#include "cli_commands.h"
#include "usci_uart.h"

#include "arafe.h"

//==================================================================================================
// Device-specific output functions
//==================================================================================================

#include <stdio.h>

void cli_puts(char *str){
	usci_uart_puts(str);
}

void cli_putc(char chr){
    usci_uart_tx(chr);
}

void cli_print_prompt(void){
    cli_puts("\r\n>");
}

void cli_print_error(int error){
    usci_uart_printf("Returned with error code %d\r\n", error); // Example using stdio.h
}

void cli_print_notfound(char *strcmd){
    cli_puts("commands:\r\n");
    cli_puts("5v control sig trig\r\n");
}

/*
 * Command list:
 *
 * dump
 * read #
 * write #
 * flash
 * control #0 #1 where #0 = 0,1,2,3 and #1 = 0,1 (for on, off)
 * 5v # where #=0,1
 * sig #0 #1 where #0=0,1,2,3 and #1 = 0-31.
 * trig #0 #1 where #0=0,1,2,3 and #1 = 0-31.
 *
 */

bool check_2_arguments(uint16_t argc, char *argv[], uint8_t arg2_limit, char *errstr) {
	if (argc < 3) goto err_msg;
	arafe_command = (*argv[1] - '0');
	if (arafe_command > 3) goto err_msg;
	arafe_argument = (*argv[2] - '0');
	if (arafe_argument > arg2_limit) goto err_msg;
	return true;
err_msg:
	usci_uart_puts(errstr);
	return false;
}

int cmd_5v(uint16_t argc, char *argv[]) {
	if (argc < 2) goto err_msg;
	arafe_argument = (*argv[1] - '0');
	if (arafe_argument > 1) goto err_msg;
	arafe_command = ARAFE_COMMAND_5V;
	arafe_send_command();
	return 0;
err_msg:
	usci_uart_puts("5v 0/1\r\n");
	return 0;
}

int cmd_control(uint16_t argc, char *argv[]) {
	// Input checking.
	if (check_2_arguments(argc, argv, 1, "control 0-3 0/1\r\n")) arafe_send_command();
	return 0;
}

int cmd_sig(uint16_t argc, char *argv[]) {
	if (check_2_arguments(argc, argv, 31, "sig 0-3 0-31\r\n")) arafe_send_command();
	return 0;
}

int cmd_trig(uint16_t argc, char *argv[]) {
	if (check_2_arguments(argc, argv, 31, "trig 0-3 0-31\r\n")) arafe_send_command();
	return 0;
}

int cmd_dump(uint16_t argc, char *argv[]) {
	// This is more complicated. Deal with it later.
	return 0;
}

int cmd_flash(uint16_t argc, char *argv[]) {
	// This is 'dangerous'. Deal with it last.
	return 0;
}

int cmd_read(uint16_t argc, char *argv[]) {
	// later...
	return 0;
}

int cmd_write(uint16_t argc, char *argv[]) {
	// later...
	return 0;
}

//--------------------------------------------------------------------------------------------------
/*int cmdArgList(uint16_t argc, char *argv[]){
    cli_puts("Argument List:\r\n");
    int i;
    for(i=0;i<argc;i++){
        cli_putc('[');
        cli_puts(argv[i]);
        cli_puts("]\r\n");
    }
    return(0);
}
*/
