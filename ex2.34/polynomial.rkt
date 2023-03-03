#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op
                      initial
                      (cdr sequence)))))

;; a_nx^n + a_n1x^n1 + a_n2*x^n2 + ... + a_1 + a_0
;; (...(a_n * x + a_n1) * x + ...+ a_1) * x + a_0
;; a_0 + x * (a_1 + ... + x * (a_n1 + x * a_n)...)
(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
                (+ this-coeff (* x higher-terms)))
              0
              coefficient-sequence))

;; 1 + 3x + 0x^2 + 5x^3 + 0x^4 + x^5
;; 1 + x * (0 + x * (5 + x * (0 + x * (3 + x * 1))))
(horner-eval 2 (list 1 3 0 5 0 1))

(horner-eval 2 (list 0 1))
(horner-eval 2 (list 0 0 1))
(horner-eval 2 (list 0 0 0 1))
