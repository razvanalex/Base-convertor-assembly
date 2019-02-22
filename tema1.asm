%include "io.inc"

section .data
    %include "input.inc"

section .text
global CMAIN

CMAIN:
    mov ebp, esp
    
    xor edi, edi                        
    mov ecx, [nums]
    
each_number:
    xor esi, esi                         
    mov eax, [nums_array + edi * 4]     ; eax va contine numarul 
    xor edx, edx                        
    mov ebx, [base_array + edi * 4]     ; ebx va contine baza
    
    ; Verificare contidii la baza
    cmp ebx, 0x2
    jl incorect_base
    cmp ebx, 0x10
    jg incorect_base
    jmp extract_digit
    
incorect_base:
    PRINT_STRING "Baza incorecta"
    NEWLINE
    jmp next
 
    ; Conversia numarului in baza din ebx

extract_digit:
    div ebx
    cmp edx, 0x9
    jle number_char
    jg letter_char
    
number_char: 
    add edx, '0'
    jmp continue
    
letter_char:
    add edx, 'a' - 10
    jmp continue
    
continue:
    push edx
    inc esi
    xor edx, edx
    cmp eax, 0x0
    jnz extract_digit

    ; Printare numar in baza din ebx

print_character:
    pop eax
    PRINT_CHAR eax
    dec esi
    cmp esi, 0x0
    jnz print_character
    
    NEWLINE
    
    ; Trece la urmatorul numar

next:
    inc edi
    dec ecx
    cmp ecx, 0x0
    jg each_number
    
    xor eax, eax
    ret
