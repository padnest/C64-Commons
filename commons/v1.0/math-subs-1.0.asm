/*
	author: padnest@gmail.com
	assembler: kick assembler 5.16

	changelog:
		- 1.0:
			- first release
*/
#importonce

.namespace Math {

	/* 	8 x 8 bit multiply (MultiplyNum1 * MultiplyNum2)
	 * 	returns a 16 bit result in A(low byte) and Y(high byte)
	 * 	requires page zero data:
			MultiplyNum1: .byte 0
			MultiplyNum2: .byte 0
			MultiplyH: .byte 0
	 */
	*=* "Math Multiply8x8"
	Multiply8x8: {
		 lda #$00
		 tay
		 sty MultiplyH
		 beq entry
	add:
		 clc
		 adc MultiplyNum1
		 tax
		 tya
		 adc MultiplyH
		 tay
		 txa
	loop:
		 asl MultiplyNum1
		 rol MultiplyH
	entry:  // entry point (A=lo, Y=hi)
		 lsr MultiplyNum2
		 bcs add
		 bne loop
		 rts
	}

}