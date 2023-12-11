	org		7C00H				; 告诉编译器程序加载到7c00处
	mov		ax, cs
	mov		ds, ax
	mov		es, ax
	call	ShowInfo			; 调用显示字符串例程
	jmp		$					; 无Int
ShowInfo:

	mov		ax, BootMessage
	mov		bp, ax				; ES:BP = 串地址
	mov		cx, 16				; CX = 串长度
	mov		ax, 01301h			; AH = 13,  AL = 01h
	mov		bx, 000ch			; 页号为0(BH = 0) 黑底红字(BL = 0Ch,高亮)
	mov		dl, 0
	int		10H					; 10H号中断(BIOS Int)
	ret
BootMessage:		db	"Hello, OS world!"
times 	(512-2)-($-$$)	db	0	; 填充剩下的空间
dw 	0xAA55						; MBR有效结束标志Int

    
