#lang sicp

(define x (list (list 1 2) (list 3 4)))

(define (fringe tree)
  (define (help node result)
    (cond ((null? node) result)
          ((not (pair? node)) (cons node result))
          (else (help (car node) (help (cdr node) result)))))
  (help tree '()))

(fringe x)
(fringe (list x x))

(define y (list (list 1 2) (list 3 4) (list 5 (list 6 7) 8)))
(fringe y)
