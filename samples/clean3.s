; Test: -C flag aligns inline comments on various line types
;
; Mnemonics
fill:
        LDA #$a0                        ; PETSCII space
        LDX #$fd                        ; counter
        STA $1dff, X                    ; first page
        DEX
        BNE fill                        ; loop

; Control commands: .byte
        .byte $a9                       ; LDA immediate
        .byte $1d                       ; value
        .byte $60                       ; RTS

; Control commands: .org
        .org $2000                      ; relocated base

; Constant definitions
my_var = $15                            ; player color
long_variable_name = $1234              ; a longer name
x = $00                                 ; short

; Standalone comments should not be affected
        ; indented standalone
; col-1 standalone

; Tail comment on label+instruction
foo:    RTS                             ; done
