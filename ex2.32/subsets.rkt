#lang sicp

; (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))
(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (e) (cons (car s) e)) rest)))))

(subsets (list 1 2 3))
(subsets (list 1 2 3 4))

