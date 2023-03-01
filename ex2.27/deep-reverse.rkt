#lang sicp

;; (define x (list (list 1 2) (list 3 4)))
(define x (list 0 (list (list 1 2) 3) 4 (list 5 6)))
; ((4 3) (2 1))

;; (define (deep-reverse x)
;;   (define (iter tail result)
;;     (cond ((null? tail) result)
;;           ((pair? (car tail)) (iter (cdr tail) (cons (deep-reverse (car tail)) result)))
;;           (else (iter (cdr tail) (cons (car tail) result)))))
;;   (iter x '()))

(define (deep-reverse x)
  (define (iter tail result)
    (if (null? tail)
        result
        (let ((new-head (if (pair? (car tail)) (deep-reverse (car tail)) (car tail))))
          (iter (cdr tail) (cons new-head result)))))
  (iter x '()))

;; https://adrianstoll.com/post/sicp-structure-and-interpretation-of-computer-programs-solutions/2.27.txt
;; (define (deep-reverse x)
;;   (define (iter tail result)
;;     (if (null? tail) result
;;         (iter (cdr tail)
;;               (cons (deep-reverse (car tail)) result))))
;;   (cond ((null? x) x)
;;         ((not (pair? x)) x)
;;         (else (iter x '()))))

(deep-reverse x)
