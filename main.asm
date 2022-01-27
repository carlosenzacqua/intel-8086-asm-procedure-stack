title procedurestack
.model small
.stack
.data
.code
.startup

    mov ax,3    ; op 1
    mov bx,5    ; op 2
    mov cx,0    

    push ax    
    push bx 
    push cx
    
    call sum

    pop cx      ; result of ax + bx
    pop bx
    pop ax

    end:
    mov ah,04ch
    int 21h
    
    sum proc 
            pusha
            
            mov bp,sp
            
            mov ax,[bp+18]
            mov bx,[bp+20]
            mov [bp+22],ax
            add [bp+22],bx
            
            popa
        
        ret
    sum endp
   
end