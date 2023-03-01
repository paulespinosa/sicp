#lang sicp

(define (sqr x) (* x x))

;; (define (square-list items)
;;   (if (null? items)
;;       nil
;;       (cons (sqr (car items)) (square-list (cdr items)))))

(define (square-list items)
  (map sqr items))
