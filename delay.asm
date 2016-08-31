	.global opt_delay

opt_delay:
	dec.w	r12
	jnz		opt_delay
	ret
