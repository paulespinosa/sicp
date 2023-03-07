#lang sicp

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op
                      initial
                      (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (A sequence)
  (define (reverse sequence)
    (fold-right
     (lambda (x y) (append y (list x))) nil sequence))
  (reverse sequence))

(define (B sequence)
  (define (reverse sequence)
    (fold-left
     (lambda (x y) (cons y x)) nil sequence))
  (reverse sequence))

(A (list 1 2 3 4))
(B (list 1 2 3 4))
