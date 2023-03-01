#lang sicp

(define (square x) (* x x))

; This reverses the order of the list
; because it conses the squares to
; existing answers on each iteration.
;; (define (square-list items)
;;   (define (iter things answer)
;;     (if (null? things)
;;         answer
;;         (iter (cdr things)
;;               (cons (square (car things))
;;                     answer))))
;;   (iter items nil))


; This procedure creates pairs where the first item is a pair (cons)
; and the second item is a number (cons nil 1) => (() . 2)
(define (square-list items)
       (define (iter things answer)
         (if (null? things)
             answer
             (iter (cdr things)
                   (cons answer
                         (square
                          (car things))))))
  (iter items nil))
