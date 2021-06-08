.global lab2
.syntax unified

lab2:
	push {lr}
	mov r0, #2
	mov r1, #3
	
	add r7, r1, r0
	
	mul r7, r1, r0

x3:
	sub r7, r1, r0
	
	ITEE MI
	
	subMI r7, r1, r0
	
	mulPL r7, r1, r0
	
	lsrsPL r7, r0, #1
	
	bl first
	
	bVS x3
	
	add r7, r1, r0
	
	pop {pc}


first:
	push {lr}
	
x10:
	mov r7, #1
	lsrs r7, #1
	
	bl second
	
	IT NE

	lsrNE r7, #1

	bPL x10
	
	sub r7, r1, r0
	
	adds r7, r1, r0
	
	pop {pc}
	

second:
	push {lr}
	
	and r7, r1, r0
	
	orr r7, r1, r0
	
	pop {pc}
