# Kuis-OAK-Pak-Adi

Materi: Array
![Cuplikan layar 2025-04-14 141720](https://github.com/user-attachments/assets/488452f8-db9c-483d-b373-5c36c9050f93)


# Penjelasan kode:

Bagian ini berisi instruksi utama program


 section .text
    
     global _start
    
Menandai titik masuk program (entry point) sebagai _start.

# Inisialisasi dan Penjumlahan Loop
_start:

    mov eax, 3             ; set counter 3 (jumlah elemen array)
    mov ebx, 0             ; set accumulator 0 (penampung hasil jumlah)
    mov ecx, x             ; set pointer ke array x

1. eax= penghitung (loop counter) → 3 elemen

2. ebx= penampung hasil jumlah (akumulator)

3. ecx= penunjuk ke array x



top: 

    add ebx, [ecx]         ; tambahkan elemen array ke accumulator
    add ecx, 1             ; pindah pointer ke elemen berikutnya
    dec eax                ; decrement counter
    jnz top                ; jika counter tidak 0, ulangi loop

1. add ebx, [ecx]: Tambahkan nilai dari xkeebx

2. add ecx, 1: Geser pointer ke elemen berikutnya (array xberisi byte)

3. dec eax: Penghitung Kurangi

4. jnz top: Ulangi loop kalau counter belum 0

= 2 , 4 , 3 Maka loop akan melakukan :Misalnya, array x= 2, 4, 3
Maka loop akan melakukan:2 + 4 + 3 = 9

# Konversi ke ASCII (digit satuan)
done:

    mov ecx, 10            ; divisor untuk konversi ke string
    xor edx, edx           ; clear edx (register untuk sisa)
    div ecx                ; bagi ebx dengan 10

div ecx: dibagi ebx dengan 10

Hasil:

1. eax= hasil bagi (tidak digunakan di sini)

2. edx= sisa pembagian → angka satuan

     add dl, '0'            ; konversi sisa ke karakter ASCII

    mov [sum], dl          ; simpan karakter ke variable sum

 1. Misalnya, hasil penjumlahan 9→9 % 10 = 9

 2. ASCII dari '9' = 57, jadi: 9 + '0'='9'


# Menampilkan ke Layar
display:

    mov edx, 1             ; panjang data (1 byte)
    mov ecx, sum           ; pointer ke karakter yang mau ditampilkan
    mov ebx, 1             ; file descriptor stdout
    mov eax, 4             ; syscall write
    int 0x80               ; jalankan syscall

1. Menampilkan sum(karakter hasil penjumlahan) ke layar

# keluar Dari Program
exit:

    mov eax, 1             ; syscall exit
    xor ebx, ebx           ; status exit = 0
    int 0x80               ; jalankan syscall

1. Keluar dari program dengan status 0 (normal exit)

# Bagian Data
Berisi data program statistik (array dan hasil penjumlahan)

section .data

    x db 2, 4, 3           ; array data
    sum db 0               ; tempat hasil (dalam bentuk ASCII)

