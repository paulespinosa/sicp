#lang sicp

;; Conventional Interface

(define (enumerate-interval start end)
  (if (> start end)
      nil
      (cons start (enumerate-interval (+ 1 start) end))))

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

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

;; / Conventional Interface

; Each position of the list represents the column.
; The value in the position represents the row.
; The right most element of the list is the first column.
; The left most element of the list is the Nth column.
(define empty-board '())

; board represents the board containing k-1 queens
; This procedure will produce another board with the kth queen
;   c_k c_k1 ... c_1  (c is the column)
;  (q_k q_k1 ... q_1) (k1 means k - 1, the value represents the row)
; column is ignored because the position of the row in the list
; represents the column.
(define (adjoin-position new-row _column board)
  (cons new-row board))

(define (=any? seq-a seq-b)
  (cond ((or (null? seq-a) (null? seq-b)) #f)
        ((= (car seq-a) (car seq-b)) #t)
        (else (=any? (cdr seq-a) (cdr seq-b)))))

; Same row
; Diagonal
; - up (row - n, col - n)
; - down (row + n, col - n)
(define (safe? column board)
  (let ((row (car board))
        (k-1 (cdr board)))
    (and (null? (filter (lambda (r) (= r row)) (cdr board)))
        (not (=any? k-1 (map (lambda (x) (+ row x)) (enumerate-interval 1 column))))
        (not (=any? k-1 (map (lambda (x) (- row x)) (enumerate-interval 1 column)))))))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions)
           (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(map (lambda (n) (length (queens n))) (enumerate-interval 0 8))
