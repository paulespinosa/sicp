#lang sicp

; 2.61

(define (adjoin-set x set)
  (cond ((null? set) (cons x set))
        ((= (car set) x) set)
        ((> (car set) x) (cons x set))
        (else (cons (car set) (adjoin-set x (cdr set))))))


(adjoin-set 3 (adjoin-set 2 (adjoin-set 1 '())) )
(adjoin-set 1 (adjoin-set 2 (adjoin-set 3 '())) )
(adjoin-set 1 (adjoin-set 1 (adjoin-set 3 '())) )
