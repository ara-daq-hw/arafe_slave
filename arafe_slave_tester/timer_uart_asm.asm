	.cdecls C, LIST, "msp430.h"
	.cdecls C, LIST, "timer_uart.h"

	.global rx_char
	.global	tx_char_pending
	.global timer_uart_tx_event
timer_uart_tx_event	.tag	event_t
	; Receive ISR.
TIMER0_RX_ISR:


	; Transmit ISR.
TIMER0_TX_ISR:
	; Rotate the LSB into carry.
	rrc.w	&tx_char_pending
	; Is it set?
	jnc		timer0_tx_isr_clear
	; It was set. We need to clear P1DIR bit 4 (tristate transmitter)
	; Nop-nop for even set/clear timing. They have a jz before setting.
	nop
	nop
	bic.b	#(BIT4), &P1DIR
	; Continue on.
	reti
timer0_tx_isr_clear:
	; Carry bit not set. Was the *whole word* zero? (stop bit)
	jz 		timer0_tx_isr_done
	; No, so that wasn't the stop bit. Set P1DIR (drive transmitter)
	bis.b	#(BIT4), &P1DIR
	; Continue on.
	reti
timer0_tx_isr_done:
	; turn off the timer
	mov.w 	#(TASSEL_2 + ID_3 + TACLR + MC_0), &TA0CTL
	; disable the capture/control block
	clr.w	&TACCTL0
	; push tx character done...
	tst.w		&timer_uart_tx_event.next
	jnz			timer0_tx_isr_complete
	mov.w		r4, &timer_uart_tx_event.next
	mov.w		#timer_uart_tx_event, r4
	; and wake up
	bic.w	#(LPM0), 0(SP)
timer0_tx_isr_complete:
	reti

	.sect	TIMER0_A0_VECTOR
	.short	TIMER0_TX_ISR


