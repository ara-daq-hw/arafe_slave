	.cdecls C, LIST, "msp430.h"
	.global rx_char
	.global rx_bits

TIMER1_ISR:
	; store R15...
	push.w	r15
	; clear TA1V. Find a better way to do this...
	mov.w	#0, &TA1IV
	; store comparator...
	mov.b	&CACTL2, r15
	; pick off the LSB
	and.w	#1, r15
	; update the capture-compare register
	add.w	#104, &TA1CCR1
	; is rx_bits zero?
	tst.b	&rx_bits
	jne		timer1_isr_continue
	clr.w	&TA1CCTL1
	clr.w	&TA1CTL
	tst.w	r15
	jne		timer1_isr_stop_bit_found
	mov.b	#14, &CACTL1
	bis.w	#0x00E0, 0x0002(SP)
	jmp		timer1_isr_exit
timer1_isr_stop_bit_found:
	mov.b	&rx_bits+1, &rx_char
	bic.w	#0x0010, 0x0002(SP)
	jmp		timer1_isr_exit
timer1_isr_continue:
	tst.w	r15
	jeq		timer1_isr_next_mask
	or.b	&rx_bits, &rx_bits+1
timer1_isr_next_mask:
	rla.b	&rx_bits
timer1_isr_exit:
	pop.w	r15
	reti

COMPA_ISR:
	bic.b	#2, &CACTL1
	mov.w	#147, &TA1CCR1
	mov.w	#740, &TA1CTL
	mov.w	#1, &rx_bits
	or.w	#16, &TA1CCTL1
	bic.w	#224, 0(SP)
	reti


	.sect 	TIMER1_A1_VECTOR
	.short	TIMER1_ISR
	.sect	COMPARATORA_VECTOR
	.short	COMPA_ISR

.end
