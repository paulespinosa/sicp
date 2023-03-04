#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op
                      initial
                      (cdr sequence)))))

(define (enumerate-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append
               (enumerate-tree (car tree))
               (enumerate-tree (cdr tree))))))

;; 2.2.2
;; (define (count-leaves x)
;;   (cond ((null? x) 0)
;;         ((not (pair? x))) 1
;;         (else (+ (count-leaves (car x))
;;                  (count-leaves (cdr x))))))


;; (cons (list (list 1 2) 3) (list (list 4 5) (list 6 7)))
;; ( ((1 2) 3)    ((4 5) (6 7)) )
(define (count-leaves t)
  (accumulate +
             0
             (map (lambda (_) 1) (enumerate-tree t))))

(define t1 (cons (list (list 1 2) 3) (list (list 4 5) (list 6 7))))
(count-leaves t1)

(define t2 (cons (list (list 1 2) (list 3 4)) (list (list 5 6) (list 7 (list 8 9)))))
(count-leaves t2)
