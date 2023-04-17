#lang sicp

; 2.60

(define (filter op? seq)
  (cond ((null? seq) nil)
        ((not (op? (car seq))) (filter op? (cdr seq)))
        (else (cons (car seq) (filter op? (cdr seq))))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op
                      initial
                      (cdr sequence)))))

; multiset example: (2 3 2 1 3 2 2)

; O((length set))
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

; O((length set))
(define (count-element x set)
  (accumulate (lambda (element rest)
                (if (equal? x element)
                    (+ 1 rest)
                    rest))
              0
              set))

; O(1)
(define (adjoin-set x set)
  (cons x set))

; O(n)
(define (adjoin-set-n x n set)
  (if (<= n 0) set (adjoin-set x (adjoin-set-n x (- n 1) set))))

; O((length set))
(define (subtract-set element set)
  (filter (lambda (x) (not (equal? x element))) set))

; (2 3 2 1 3 2 2) U (4 3 1 2 3 2 1) = max{a, b} = (1 1 2 2 2 3 3 4)
; (append A B) -> O(A)
; (max-set A B) -> O((max (length A) (length B)) + (length A) + (length B))
;               -> O((max (length A) (length B)))
; (subtract-set A) -> O((length A))
; (subtract-set B) -> O((length B))
;
; O((length set1) * (max (length set1) (length set2)))
(define (union-set set1 set2)
  (define (max-set element set1 set2)
    (let ((set1-count (count-element element set1))
          (set2-count (count-element element set2)))
      (adjoin-set-n element (max set1-count set2-count) '())))
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else (append (max-set (car set1) set1 set2)
                      (union-set
                       (subtract-set (car set1) set1)
                       (subtract-set (car set1) set2))))))

; O((length set1) * (max (length set1) (length set2)))
(define (intersection-set set1 set2)
  (define (min-set element set1 set2)
    (let ((set1-count (count-element element set1))
          (set2-count (count-element element set2)))
      (adjoin-set-n element (min set1-count set2-count) '())))
  (cond ((null? set1) '())
        ((null? set2) '())
        (else (append (min-set (car set1) set1 set2)
                      (intersection-set
                        (subtract-set (car set1) set1)
                        (subtract-set (car set1) set2))))))

(union-set '() (list 1 2 2 3 3 3))
(union-set (list 1 2 2 3 3 3) '())
(union-set (list 'a 'a 'b 'c) (list 'a 'e 'e 'd))
(union-set (list 'a 'b 'b) (list 'a 'e 'd))
(union-set (list 'a 'b 'c) (list 'a))
(union-set (list 'a 'b 'c 'd) (list 'a 'b 'c))
(union-set (list 2 3 2 1 3 2 2) (list 1 3 2 4 2 1 1))
(display "\n")
(intersection-set '() (list 1 2 2 3 3 3))
(intersection-set (list 1 2 2 3 3 3) '())
(intersection-set (list 'a 'a 'b 'c) (list 'a 'e 'e 'd))
(intersection-set (list 'a 'b 'b) (list 'a 'e 'd))
(intersection-set (list 'a 'b 'c) (list 'a))
(intersection-set (list 'a 'b 'c 'd) (list 'a 'b 'c))
(intersection-set (list 2 3 2 1 3 2 2) (list 1 3 2 4 2 1 1))
