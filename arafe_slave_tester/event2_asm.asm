event_queue_interruptible_asm	.macro	MYEVENT
			tst.w	&:MYEVENT:.next
			jz		event_queue_interruptible_done?
			mov.w	r4, &:MYEVENT:.next
			mov.w	&:MYEVENT:, r4
event_queue_interruptible_done?:
			.endm
