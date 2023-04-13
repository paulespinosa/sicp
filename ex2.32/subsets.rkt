#lang sicp

; (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))
(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (e) (cons (car s) e)) rest)))))

(length (subsets (list 1 2 3)))
(length (subsets (list 1 2 3 4)) )
(length (subsets (list 1 2 3 4 5 6 7 8 9 10)) )

;; (define (accumulate op initial sequence)
;;   (if (null? sequence)
;;       initial
;;       (op (car sequence)
;;           (accumulate op
;;                       initial
;;                       (cdr sequence)))))

;; (define (canEqualTarget elements T)
;;   (accumulate (lambda (head rest) (or rest (= T (accumulate + 0 head) )))
;;               #f
;;               (subsets elements)))

;; (canEqualTarget (list 2 4 8) 10) ; t
;; (canEqualTarget (list 2 4 8) 12) ; t
;; (canEqualTarget (list -2 4 8 18 3) 24) ; t
;; (canEqualTarget (list 2 4 8 6) 11) ; f
;; (canEqualTarget '() 0) ; t
;; (canEqualTarget (list 1 -5 3) 4) ; t
