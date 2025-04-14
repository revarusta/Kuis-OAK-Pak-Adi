section .text
    global _start

_start:
    mov eax, 3             ; set counter 3 (jumlah elemen array)
    mov ebx, 0             ; set accumulator 0 (penampung hasil jumlah)
    mov ecx, x             ; set pointer ke array x

top: 
    movzx edx, byte [ecx]  ; ambil 1 byte dari [ecx] dan simpan di edx
    add ebx, edx           ; tambahkan ke accumulator (ebx)
    add ecx, 1             ; pindah pointer ke elemen berikutnya
    dec eax                ; decrement counter
    jnz top                ; jika counter tidak 0, ulangi loop

done:
    ; Konversi hasil penjumlahan (ebx) menjadi karakter ASCII
    mov ecx, 10            ; divisor untuk konversi ke string
    xor edx, edx           ; clear edx (register untuk sisa)
    div ecx                ; bagi ebx dengan 10, hasilnya ada di eax, sisanya di edx

    ; Pisahkan angka pertama (ratusan, puluhan, atau satuan) ke dalam sum
    add dl, '0'            ; konversi sisa menjadi karakter ASCII
    mov [sum], dl          ; simpan karakter pertama ke sum

    ; Tampilkan hasil
display:
    mov edx, 1             ; panjang data (1 byte)
    mov ecx, sum           ; pointer ke sum
    mov ebx, 1             ; file descriptor stdout
    mov eax, 4             ; sistem call untuk menulis ke stdout
    int 0x80               ; panggil interrupt untuk sistem call

exit:
    mov eax, 1             ; sistem call untuk keluar dari program
    xor ebx, ebx           ; status exit 0
    int 0x80               ; panggil interrupt untuk sistem call exit

section .data
    x db 2, 4, 3           ; data array x
    sum db 0               ; tempat untuk menyimpan hasil
