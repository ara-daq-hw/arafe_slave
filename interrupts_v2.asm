	.cdecls C, LIST, "msp430.h"
	.cdecls C, LIST, "boot.h"
	.global rx_char
	.global	tx_char_pending

	; Optimized Timer1_A0 ISR. Uses no registers.
TIMER1_TX_ISR:
	; Rotate the LSB into carry.
	rrc.w	&tx_char_pending
	; Is it set?
	jnc		timer1_tx_isr_clear
	; It was set. We need to clear P1SEL bit 4 (turn OFF transmitter)
	; Nop-nop for even set/clear timing. They have a jz before setting.
	nop
	nop
	bic.b	#(BIT4), &P1SEL
	; Continue on.
	reti
timer1_tx_isr_clear:
	; Carry bit not set. Was the *whole word* zero? (stop bit)
	jz 		timer1_tx_isr_done
	; No, so that wasn't the stop bit. Set P1SEL (turn ON transmitter)
	bis.b	#(BIT4), &P1SEL
	; Continue on.
	reti
timer1_tx_isr_done:
	; turn off the timer
	mov.w 	#(TASSEL_2 + ID_3 + TACLR + MC_0), &TACTL
	; disable the capture/control block
	clr.w	&TACCTL0
	; and wake up
	bic.w	#(LPM0), 0(SP)
	reti
	; Optimized Timer1_A1 ISR. Uses no registers.
TIMER1_RX_ISR:
	; Clear TA1V. (Cheapest way possible)
	bit		#(0x01), &TAIV
	; Snag the comparator result right away into carry.
	bit		#(0x01), &CACTL2
	; Branch to our current step.
	branch	COND_TIMER1_ISR_NEXT_STEP
timer1_isr_bits0_to_7:
	; Shift carry into rx_bits, and everything else down.
	rrc.b	COND_RX_BITS
	; Is the carry bit 0? If so, we're not done. (Bit 7 was set before we started).
	jnc		timer1_isr_bits0_to_7_continue
	; Switch to stop bit check.
	mov.w	#(timer1_isr_stop_bit), COND_TIMER1_ISR_NEXT_STEP
	; Continue. (104 is the bit time = 104 microseconds)
	add.w	#104, &TA1CCR1
	; and return
timer1_isr_bits0_to_7_continue:
	reti
timer1_isr_stop_bit:
	; Clear TA1CCTL1
	clr.w	&TA1CCTL1
	; Clear TA1CTL
	clr.w	&TA1CTL
	; Carry is still the stop bit. Is it 1?
	jc		timer1_isr_stop_bit_found
	; No, so it wasn't found.
	mov.b	#14, &CACTL1
	; Go back to LPM3 (set SCG1 + SCG0 + OSCOFF)
	bis.w	#0x00E0, 0(SP)
	; and return
	reti
timer1_isr_stop_bit_found:
	; Store rx_bits, it's OK.
	mov.b	COND_RX_BITS, &rx_char
	; Now wake up (clear CPUOFF).
	bic.w	#(0x0010), 0(SP)
	; and return
	reti

COMPA_ISR:
	; Clear comparator interrupt.
	bic.b	#2, &CACTL1
	; Initialize TA1CCR1 to middle of the first bit, or so.
	mov.w	#147, &TA1CCR1
	; Start the timer. (740 = 0x2E4 = TASSEL_2 + ID_3 + MC_2 + TACLR)
	mov.w	#740, &TA1CTL
	; Initialize rx_bits. Bit 7 is used to detect when we're done receiving (when it shifts into carry)
	mov.b	#(0x80), COND_RX_BITS
	; Initialize the first step in the Timer1 ISR to be looking for bits 0 to 7.
	mov.b	#(timer1_isr_bits0_to_7), COND_TIMER1_ISR_NEXT_STEP
	; Enable the interrupt.
	bis.w	#16, &TA1CCTL1
	; And clear SCG1 + SCG0 + OSCOFF (turn on the Timer oscillator, but don't wake up).
	bic.w	#0x00E0, 0(SP)
	; Return.
	reti

	.sect	TIMER1_A0_VECTOR
	.short	TIMER1_TX_ISR
	.sect 	TIMER1_A1_VECTOR
	.short	TIMER1_RX_ISR
	.sect	COMPARATORA_VECTOR
	.short	COMPA_ISR

.end
