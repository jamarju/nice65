; Test: -C flag aligns inline comments on various line types
;
; Mnemonics
fill:
   lda #$a0 ; PETSCII space
   ldx #$fd       ; counter
   sta $1dff , x ;first page
   dex
   bne fill ; loop

; Control commands: .byte
  .byte $a9       ; LDA immediate
 .byte $1d ; value
   .byte $60                ; RTS

; Control commands: .org
  .org $2000         ; relocated base

; Constant definitions
my_var = $15 ; player color
long_variable_name = $1234       ; a longer name
x = $00   ; short

; Standalone comments should not be affected
   ; indented standalone
; col-1 standalone

; Tail comment on label+instruction
foo:   rts ; done
