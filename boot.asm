	.cdecls C, LIST, "boot.h"
	.global	main
	.global _c_int00
	.global __STACK_END
	; Super-minimal initializer.

_c_int00:
	mov.w	#__STACK_END, SP
	br		#(main)

	.sect 	RESET_VECTOR
	.short	_c_int00
