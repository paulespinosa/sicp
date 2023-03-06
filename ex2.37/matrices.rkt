#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op
                      initial
                      (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (row)
         (accumulate +
                     0
                     (accumulate-n *
                                   1
                                   (list row v))))
       m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row)
           (map (lambda (col)
                  (dot-product row col))
                cols))
         m)))

(define A (list (list 1 2 3 4)
                (list 4 5 6 6)
                (list 6 7 8 9)))
(define B (list (list 2 1 4)
                (list 5 8 9)
                (list 6 6 4)
                (list 3 7 3)))
(define C (list (list -1 2 0)
                (list 2 -1 3)
                (list -1 3 0)))
(define I (list (list 1 0 0)
                (list 0 1 0)
                (list 0 0 1)))
(define v (list 1 2 1 3))
(define w (list 3 1 -2 -1))

(dot-product v w)
(matrix-*-vector A v)
(matrix-*-vector I w)
(transpose B)
(matrix-*-matrix A B)
(matrix-*-matrix I C)
(matrix-*-matrix C I)
