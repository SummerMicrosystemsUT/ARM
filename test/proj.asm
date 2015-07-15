.model small
.8086
.stack 100h
.data
.code
proj proc
	mov	ax, @data
	mov	dx, ax

	call theproc 

	mov ah, 04ch
	int	21h
proj endp

theproc proc
	
	ret
theproc endp
end proj
