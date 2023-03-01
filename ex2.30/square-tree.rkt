#lang sicp

(define (sqr x) (* x x))

(define (square-tree-directly t)
  (cond ((null? t) '())
        ((not (pair? t)) (sqr t))
        (else (cons (square-tree-directly (car t)) (square-tree-directly (cdr t))))))

(square-tree-directly (list 1
                            (list 2 (list 3 4) 5)
                            (list 6 7)))

(define (square-tree-map t)
  (map (lambda (n) (if (not (pair? n)) (sqr n) (square-tree-map n)))
       t))

(square-tree-map (list 1
                       (list 2 (list 3 4) 5)
                       (list 6 7)))
