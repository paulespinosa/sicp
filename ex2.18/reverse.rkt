#lang sicp

(define (append l v)
  (if (null? l)
      (list v)
      (cons (car l) (append (cdr l) v))))

; 1 2 3 4    4 3 2 1
;   2 3 4    4 3 2
;     3 4    4 3
;       4    4
;         ()
;; (define (reverse l)
;;   (if (null? l)
;;       (list)
;;       (append (reverse (cdr l)) (car l))))

; (1 2 3 4) '()
;   (2 3 4) (1)
;     (3 4) (2 1)
;       (4) (3 2 1)
;        () (4 3 2 1)
(define (reverse x)
  (define (iter tail result)
    (if (null? tail) result
        (iter (cdr tail)
              (cons (car tail) result))))
  (iter x '()))

