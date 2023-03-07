#lang sicp

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

; (fold-right / 1 (list 1 2 3)) = (/ 1 (/ 2 (/ 3 1)))
;                               = (/ 1 (/ 2 3))
;                               = (/ 1 2/3)
;                               = 3/2
(fold-left / 1 (list 1 2 3))
;                               = (/ (/ (/ 1 1) 2) 3)
;                               = (/ (/ 1 2) 3)
;                               = (/ 1/2 3)
;                               = 1/6

; (fold-right list nil (list 1 2 3)) = (list 1 (list 2 (list 3 nil)))
;                                    = (list 1 (list 2 (3 ())))
;                                    = (list 1 (2 (3 ())))
;                                    = (1 (2 (3 ())))
(fold-left list nil (list 1 2 3))
;                                    = (list (list (list nil 1) 2) 3)
;                                    = (list (list (() 1) 2))
;                                    = (list ((() 1) 2) 3)
;                                    = (((() 1) 2) 3)

; op must be associative
; (fold-right + 0 (list 1 2 3)) = 6
(fold-left + 0 (list 1 2 3))  ; = 6

