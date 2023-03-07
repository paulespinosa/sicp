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

(define (unique-triples n)
  (flatmap
   (lambda (i)
     (flatmap (lambda (j)
            (map (lambda (k) (list i j k))
                 (enumerate-interval 1 (- j 1))))
          (enumerate-interval 1 (- i 1))))
   (enumerate-interval 1 n)))

(define (sum-triple t)
  (+ (car t) (cadr t) (caddr t)))

(define (ordered-triples n sum)
  (filter (lambda (t) (= sum (sum-triple t)))
          (unique-triples n) ))

(ordered-triples 4 6)
(ordered-triples 4 3)
(ordered-triples 6 9)
