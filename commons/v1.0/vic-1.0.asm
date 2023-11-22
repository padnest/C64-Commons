/*
	author: padnest@gmail.com
	assembler: kick assembler 5.16

	changelog:
		- 1.0:
			- first release
*/
#importonce

.namespace Vic {

	.label SCREEN_ADDR = $0400
	.label SPRITE_DATA_PTR_DELTA = $03f8
	.label COLOR_RAM_ADDR = $d800
	.label SPRITES_POS_BASE_ADDR = $d000
	.label SPRITES_COLOR_BASE_ADDR = $d027 

	Sprite0: {
		.label PosX = $d000
		.label PosY = $d001
		.label Color = $d027
	}

	Sprite1: {
		.label PosX = $d002
		.label PosY = $d003
		.label Color = $d028
	}

	Sprite2: {
		.label PosX = $d004
		.label PosY = $d005
		.label Color = $d029
	}

	Sprite3: {
		.label PosX = $d006
		.label PosY = $d007
		.label Color = $d02a
	}

	Sprite4: {
		.label PosX = $d008
		.label PosY = $d009
		.label Color = $d02b
	}

	Sprite5: {
		.label PosX = $d00a
		.label PosY = $d00b
		.label Color = $d02c
	}

	Sprite6: {
		.label PosX = $d00c
		.label PosY = $d00d
		.label Color = $d02d
	}

	Sprite7: {
		.label PosX = $d00e
		.label PosY = $d00f
		.label Color = $d02e
	}

	Sprites: {
		.label PosX = $d010
		.label Enabled = $d015
		.label DoubleHeight = $d017
		.label Priority = $d01b
		.label Multicolor = $d01c
		.label DoubleWidth = $d01d
		.label SpriteCollision = $d01e
		.label BackgroundCollision = $d01f

		.label SPRITE_0 = %00000001
		.label SPRITE_1 = %00000010
		.label SPRITE_2 = %00000100
		.label SPRITE_3 = %00001000
		.label SPRITE_4 = %00010000
		.label SPRITE_5 = %00100000
		.label SPRITE_6 = %01000000
		.label SPRITE_7 = %10000000
		.label SPRITE_ALL = $ff

		.label SPRITE_0_PTR = $3f8
		.label SPRITE_1_PTR = $3f9
		.label SPRITE_2_PTR = $3fa
		.label SPRITE_3_PTR = $3fb
		.label SPRITE_4_PTR = $3fc
		.label SPRITE_5_PTR = $3fd
		.label SPRITE_6_PTR = $3fe
		.label SPRITE_7_PTR = $3ff
	}

	Color: {
		.label Border = $d020
		.label Background0 = $d021
		.label Background1 = $d022
		.label Background2 = $d023
		.label Background3 = $d024
		.label Sprites1 = $d025
		.label Sprites2 = $d026

		.label BLACK 	= 0
		.label WHITE 	= 1
		.label RED 		= 2
		.label CYAN 	= 3
		.label PURPLE 	= 4
		.label GREEN 	= 5
		.label BLUE		= 6
		.label YELLOW 	= 7
		.label ORANGE 	= 8
		.label BROWN 	= 9
		.label LIGHT_RED 	= 10
		.label DARK_GREY 	= 11
		.label MED_GREY 	= 12
		.label LIGHT_GREEN 	= 13
		.label LIGHT_BLUE 	= 14
		.label LIGHT_GRAY 	= 15

		.label BLACK_MC		= BLACK + 8
		.label WHITE_MC 	= WHITE + 8
		.label RED_MC 		= RED + 8
		.label CYAN_MC 		= CYAN + 8
		.label PURPLE_MC 	= PURPLE + 8
		.label GREEN_MC 	= GREEN + 8
		.label BLUE_MC		= BLUE + 8
		.label YELLOW_MC 	= YELLOW + 8
	}

	Screen:{
		.label Control1 = $d011
		.label RasterLine = $d012 
		.label Control2 = $d016

		.label CTRL1_VERTICAL_SCROLL_BITMASK 	= %11111000
		.label CTRL1_SCREEN_SETUP_BITMASK 		= %10000111

		.label CTRL1_SCREEN_HEIGTH_24 			= %00000000
		.label CTRL1_SCREEN_HEIGTH_25 			= %00001000
		.label CTRL1_SCREEN_DMA_OFF 			= %00000000
		.label CTRL1_SCREEN_DMA_ON	 			= %00010000
		.label CTRL1_SCREEN_MODE_TEXT 			= %00000000
		.label CTRL1_SCREEN_MODE_BITMAP			= %00100000
		.label CTRL1_EXT_BACKGROUND_OFF			= %00000000
		.label CTRL1_EXT_BACKGROUND_ON			= %01000000
		
		.label CTRL1_DEFAULT					= %00011011

		.label CTRL2_HORIZONTAL_SCROLL_BITMASK 	= %11111000
		.label CTRL2_SCREEN_SETUP_BITMASK 		= %11100111

		.label CTRL2_SCREEN_WIDTH_38 			= %00000000
		.label CTRL2_SCREEN_WIDTH_40 			= %00001000
		.label CTRL2_MULTICOLOR_OFF	 			= %00000000
		.label CTRL2_MULTICOLOR_ON	 			= %00010000

		.label CTRL2_DEFAULT					= %11001000
	}

	Memory:{
		.label Setup = $d018

		// CHR_1000 and CHR_1800 in VIC bank #0 ($0000) and #2 ($4000) select Character ROM instead.
		.label CHR_0000 = %00000000
		.label CHR_0800 = %00000010
		.label CHR_1000 = %00000100
		.label CHR_1800 = %00000110
		.label CHR_2000 = %00001000
		.label CHR_2800 = %00001010
		.label CHR_3000 = %00001100
		.label CHR_3800 = %00001110

		.label SCR_0000 = %00000000
		.label SCR_0400 = %00010000
		.label SCR_0800 = %00100000
		.label SCR_0C00 = %00110000	
		.label SCR_1000 = %01000000
		.label SCR_1400 = %01010000
		.label SCR_1800 = %01100000
		.label SCR_1C00 = %01110000
		.label SCR_2000 = %10000000
		.label SCR_2400 = %10010000
		.label SCR_2800 = %10100000
		.label SCR_2C00 = %10110000
		.label SCR_3000 = %11000000
		.label SCR_3400 = %11010000
		.label SCR_3800 = %11100000
		.label SCR_3C00 = %11110000
	}

	Interrupts:{
		.label Status = $d019
		.label Enabled = $d01a

		.label RASTER_LINE 			= %00000001
		.label SPRITE_BG_COLL 		= %00000010
		.label SPRITE_SPRITE_COLL 	= %00000100
		.label LP 					= %00001000
		.label ACK					= %10000000
	}

}

.macro Vic_AckInterrupts() {
	asl	Vic.Interrupts.Status
}

.macro Vic_EnableInterrupts(mask) {
	lda #mask
	sta Vic.Interrupts.Enabled
}

.macro Vic_FillScreen(screenAddr, value) {
	lda #value
	ldx #0
!:
	sta screenAddr, x
	sta screenAddr + $100, x
	sta screenAddr + $200, x
	sta screenAddr + $300, x
	inx
	bne !-
}

.macro Vic_FillColorRam(value) {
	lda #value
	ldx #0
!:
	sta Vic.COLOR_RAM_ADDR, x
	sta Vic.COLOR_RAM_ADDR + $100, x
	sta Vic.COLOR_RAM_ADDR + $200, x
	sta Vic.COLOR_RAM_ADDR + $300, x
	inx
	bne !-
}

.macro Vic_SetBackgoundColors(bg0Color, bg1Color, bg2Color, bg3Color) {
	lda #bg0Color
	sta Vic.Color.Background0
	lda #bg1Color
	sta Vic.Color.Background1
	lda #bg2Color
	sta Vic.Color.Background2
	lda #bg3Color
	sta Vic.Color.Background3
}

.macro Vic_SetBorderColor(color) {
	lda #color
	sta Vic.Color.Border
}

.macro Vic_SetRasterLine(value) {
	lda #<value
	sta Vic.Screen.RasterLine
	lda Vic.Screen.Control1
	.if(value > 255){
		ora #$80
	}
	else{
		and #$7f
	}
	sta Vic.Screen.Control1
}

.macro Vic_SetLSBRasterLine(value) {
	lda #value
	sta Vic.Screen.RasterLine
}

.macro Vic_SetMSBRasterLine() {
	lda Vic.Screen.Control1
	ora #$80
	sta Vic.Screen.Control1
}

.macro Vic_ClearMSBRasterLine() {
	lda Vic.Screen.Control1
	and #$7f
	sta Vic.Screen.Control1
}

.macro Vic_SetSpriteDataAddr(screenAddr, spriteNum, dataAddr) {
	lda #[dataAddr/64]
	sta screenAddr + Vic.SPRITE_DATA_PTR_DELTA + spriteNum
}

.macro Vic_SetSpriteDataAddrByRegA(screenAddr, spriteNum) {
	sta screenAddr + Vic.SPRITE_DATA_PTR_DELTA + spriteNum
}

.macro Vic_SetSpriteFrame(screenAddr, spriteNum, dataAddr, frameNum){
	lda #[dataAddr/64 + frameNum]
	sta screenAddr + Vic.SPRITE_DATA_PTR_DELTA + spriteNum
}

.macro Vic_SetSpritePos(spriteNum, posX, posY){
	Vic_SetSpritePosY(spriteNum, posY)
	Vic_SetSpritePosX(spriteNum, posX)
}

.macro Vic_SetSpritePosX(spriteNum, posX){
	lda #<posX
	sta Vic.SPRITES_POS_BASE_ADDR + spriteNum*2
	lda Vic.Sprites.PosX
	.if(posX > 255){
		ora #[pow(2, spriteNum)]
	}
	else{
		and #[255 - pow(2, spriteNum)] 
	}
	sta Vic.Sprites.PosX
}

.macro Vic_SetSpritePosXLByRegA(spriteNum){
	sta Vic.SPRITES_POS_BASE_ADDR + spriteNum*2
}

.macro Vic_SetSpritePosXHBit(spriteNum){
	lda Vic.Sprites.PosX
	ora #[pow(2, spriteNum)]
	sta Vic.Sprites.PosX
}

.macro Vic_ClearSpritePosXHBit(spriteNum){
	lda Vic.Sprites.PosX
	and #[255 - pow(2, spriteNum)] 
	sta Vic.Sprites.PosX
}

.macro Vic_SetSpritePosY(spriteNum, posY){
	lda #<posY
	sta Vic.SPRITES_POS_BASE_ADDR + spriteNum*2 + 1
}

.macro Vic_SetSpritePosYByRegA(spriteNum){
	sta Vic.SPRITES_POS_BASE_ADDR + spriteNum*2 + 1
}

.macro Vic_SetSpriteColor(spriteNum, color){
	lda #color
	sta Vic.SPRITES_COLOR_BASE_ADDR + spriteNum
}

.macro Vic_SetSpriteColorByRegA(spriteNum){
	sta Vic.SPRITES_COLOR_BASE_ADDR + spriteNum
}

.macro Vic_SetSpriteEnabled(spriteNum, state) {
	lda Vic.Sprites.Enabled
	.if(state){
		ora #[pow(2, spriteNum)]
	}
	else{
		and #[255 - pow(2, spriteNum)]
	}
	sta Vic.Sprites.Enabled
}

.macro Vic_SetSpriteEnabledBit(spriteNum) {
	lda Vic.Sprites.Enabled
	ora #[pow(2, spriteNum)]
	sta Vic.Sprites.Enabled
}

.macro Vic_ClearSpriteEnabledBit(spriteNum) {
	lda Vic.Sprites.Enabled
	and #[255 - pow(2, spriteNum)]
	sta Vic.Sprites.Enabled
}

.macro Vic_ScreenSetup(mask) {
	lda Vic.Screen.Control1
	and #Vic.Screen.CTRL1_SCREEN_SETUP_BITMASK
	ora #mask
	sta Vic.Screen.Control1
}

.macro Vic_WaitNextRasteLine(){
	lda Vic.Screen.RasterLine
	cmp Vic.Screen.RasterLine
	beq *-3
}

.macro Vic_WaitLSBRasterLine(line) {
	lda #line
	cmp Vic.Screen.RasterLine
	bne *-3
}
