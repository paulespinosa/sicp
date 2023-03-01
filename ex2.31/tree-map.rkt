#lang sicp

(define (sqr x) (* x x))

(define (tree-map f tree)
  (map (lambda (n) (if (not (pair? n)) (f n) (tree-map f n)))
       tree))

(define (square-tree-map tree)
  (tree-map sqr tree))

(square-tree-map (list 1
                       (list 2 (list 3 4) 5)
                       (list 6 7)))
