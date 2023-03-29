#lang sicp

; Some notes:
; '(x y) is a list i.e. (list 'x 'y)
; (cdr (list a b)) is the list (b)
; (cadr (list a b)) is the first item of (cdr (list a b)) which is b

; (list 'a 'b 'c)
; -> (a b c) a list of symbols themselves

; (list (list 'george))
; -> ((george)) a list of a list containing a single symbol

; (cdr '((x1 x2) (y1 y2)))
; -> ((y1 y2)) cdr gets the rest of the list which is a list of a list of two symbols

; (cadr '((x1 x2) (y1 y2)))
; -> (y1 y2) cadr gets the first item of the rest of the list which is a list of two symbols

; (pair? (car '(a short list)))
; -> false the first item of the list is not a pair, it is a symbol

; (memq 'red '((red shoes) (blue socks)))
; -> false because 'red does not match any item in the list

; (memq 'red '(red shoes blue socks))
; -> '(red shoes blue socks) because 'red matches the first item of the list

(list 'a 'b 'c)                            ; (a b c)
(list (list 'george))                      ; ((george))
(cdr '((x1 x2) (y1 y2)))                   ; ((y1 y2))
(cadr '((x1 x2) (y1 y2)))                  ; (y1 y2)
(pair? (car '(a short list)))              ; #f
(memq 'red '((red shoes) (blue socks)))    ; #f
(memq 'red '(red shoes blue socks))        ; (red shoes blue socks)
