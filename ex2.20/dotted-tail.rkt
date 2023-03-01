#lang sicp

;; (define (same-parity a . b)
;;   (define even?  (lambda (x) (= (modulo x 2) 0)))
;;   (define odd?  (lambda (x) (not (= (modulo x 2) 0))))
;;   (define (loop l parity)
;;     (if (null? l)
;;         nil
;;         (if (parity (car l))
;;             (cons (car l) (loop (cdr l) parity))
;;             (loop (cdr l) parity))))
;;   (loop b (if (even? a) even? odd?)))

(define (filter f l)
  (if (null? l)
      nil
      (let ((head (car l))
            (tail (cdr l)))
        (if (f head)
            (cons head (filter f tail))
            (filter f tail))))
  )

(define (same-parity a . b)
  (cons a
        (filter (if (even? a) even? odd?) b)))
