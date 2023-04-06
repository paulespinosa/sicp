#lang sicp

; 2.59

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))


(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        ((not (element-of-set? (car set1) set2))
         (cons (car set1) (union-set (cdr set1) set2)))
        (else (union-set (cdr set1) set2))))

(union-set '() (list 1 2 3))
(union-set (list 1 2 3) '())
(union-set (list 'a 'b 'c) (list 'a 'e 'd))
(union-set (list 'a 'b) (list 'a 'e 'd))
(union-set (list 'a 'b 'c) (list 'a))
(union-set (list 'a 'b 'c 'd) (list 'a 'b 'c))
