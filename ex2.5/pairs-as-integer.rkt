#lang sicp

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (div x d c)
  (if (= (modulo x d) 0)
      (div (/ x d) d (inc c))
      c))

(define (car z)
    (div z 2 0))

(define (cdr z)
    (div z 3 0))
