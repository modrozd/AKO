; program przykladowy (wersja 32-bitowa)
.686
.model flat
extern _ExitProcess@4 : PROC
extern __write : PROC
public _main

.data
tekst db 10, 'Ten tekst sie wyswietli. ' , 10
db 'Test 32 bitowego programu, '
db 'chyba dziala!', 10

.code
_main PROC
mov ecx, 85 ; liczba znakow wyswietlanego tekstu

; wywolanie funkcji 'write' z biblioteki jezyka C
push ecx ; liczba znakow wyswietlanego tekstu
push dword PTR OFFSET tekst ; polozenie obszaru
; ze znakami
push dword PTR 1 ; uchwyt urzadzenia wyjsciowego
call __write ; wyswietlenie znakow, zwrocic uwage na dwa znaki podkreslenia
add esp, 12 ; usuniecie parametrow ze stosu

; zakonczenie wykonywania programu
push dword PTR 0 ; kod powrotu programu
call _ExitProcess@4
_main ENDP
END
