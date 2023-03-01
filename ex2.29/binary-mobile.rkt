#lang sicp

(define (make-mobile left-branch right-branch)
  ;; The structure looks like this:
  ;; (list (list l s) (list l s))
  (list left-branch right-branch))
;; With cons the structure looks like (cons (cons l s) (cons l s))
;; Would only have to change to use (cdr m) to get the right branch.

(define (left-branch m)
  (car m))
(define (right-branch m)
  ;; The (cdr m) is ((right-branch))
  (cadr m))

(define (make-branch length structure)
  ;; The structure looks like this:
  ;; (list l w)
  ;; OR
  ;; (list l (list (list l s) (list l s)))
  (list length structure))
(define (branch-length b)
  (car b))
(define (branch-structure b)
  ;; In both representations, the structure is the cadr
  (cadr b))

;; (define (total-weight m)
;;   (define (branch-weight b)
;;     (cond ((null? b) 0)
;;           ((number? (branch-structure b)) (branch-structure b))
;;           (else (total-weight (branch-structure b)))))
;;   (+ (branch-weight (left-branch m)) (branch-weight (right-branch m))))

(define (total-weight m)
  (if (number? m)
      m
      (+ (total-weight (branch-structure (left-branch m)))
         (total-weight (branch-structure (right-branch m))))))

(define mobile-a (make-mobile (make-branch 1 3) (make-branch 1 4)))

(total-weight mobile-a)

(define mobile-b (make-mobile
                  (make-branch 1
                               (make-mobile (make-branch 2 3) (make-branch 2 1)))
                  (make-branch 1
                               (make-mobile (make-branch 2 2) (make-branch 2 2)))))

(total-weight mobile-b)

(define mobile-c (make-mobile
                  (make-branch 2
                               (make-mobile (make-branch 2 3) (make-branch 2 3)))
                  (make-branch 1
                               (make-mobile (make-branch 1 6) (make-branch 1 6)))))
(total-weight mobile-c)

(define (torque b)
  (* (branch-length b)
     (total-weight (branch-structure b))))

(define (branch-balanced? b)
  (or (number? (branch-structure b))
      (balanced? (branch-structure b))))

(define (balanced? m)
  (and (= (torque (left-branch m))
          (torque (right-branch m)))
       (branch-balanced? (left-branch m))
       (branch-balanced? (right-branch m))))

;; There might be a way to check this in O(n) time.

(balanced? mobile-a)
(balanced? mobile-b)
(balanced? mobile-c)

