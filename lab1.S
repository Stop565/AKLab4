.global lab1
.syntax unified

#define ZK #8220

lab1:
	push {lr}

// F = (X1 | X2/2)/8 - 2(_X3^1 | X4)

	ldr r4, =xxx
	ldm r4!, {r0, r1, r2, r3}
	
	asrs r2, #1
	lsr r3, r3, #1
	IT CS
	orrCS r3, #0x80000000
	
	orr r1, r3
	orr r0, r2
	
	mov r8, #3
	
	.d8:
	asrs r0, #1
	lsr r1, r1, #1
	IT CS
	orrCS r1, #0x80000000
	subs r8, #1
	bne .d8
	
	ldm r4!, {r2, r3, r5, r6}
	
	eor r2, #0xFFFFFFFF
	eor r3, #0xFFFFFFFF
	
	eor r3, #1
	
	orr r3, r6
	orr r2, r5
	
	lsls r3, #1
	lsl r2, r2, #1
	adc r2, #0
		
	subs r3, r1, r3
	sbc r2, r0, r2
	
	ITTT VS
	lsrVS r2, r2, #1
	lsrVS r3, r3, #1
	orrVS r2, #0x80000000
	
	cmp r3, 0

	ITT EQ
	movEQ r3, ZK
	lslEQ r3, r3, #16
	
	mov r2, ZK
	
	and r0, r2, #0xC0000000
	cmp r0, #0x80000000
	
	ITT EQ
	asrEQ r2, r2, #1
	lsrEQ r3, r3, #1
	
	IT VC

	stmVC r4!, {r2, r3}

	pop {pc}

