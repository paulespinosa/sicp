; Exercise 2.2
#lang sicp

; Point abstraction layer

; A point can be represented as a pair of numbers: x-coordinate and y-coordinate.
; Define a constructor `make-point` and selectors `x-point` and `y-point` to
; define this representation.
(define (make-point x y)
  (cons x y))
(define (x-point point)
  (car point))
(define (y-point point)
  (cdr point))

; Define a procedure to print points
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

; Line Segment abstraction layer

; Define a constructor `make-segment` and selectors `start-segment` and `end-segment`
; to define the representation of segments in terms of points.
(define (make-segment start-point end-point)
  (cons start-point end-point))
(define (start-segment line-segment)
  (car line-segment))
(define (end-segment line-segment)
  (cdr line-segment))

; Define a procedure `mid-point-segment` that takes a line segment as an argument and returns its midpoint.
(define (mid-point-segment line-segment)
  (define (average a b)
    (/ (+ a b) 2.0))
  (let ((start (start-segment line-segment))
        (end (end-segment line-segment)))
        (make-point (average (x-point start) (x-point end))
              (average (y-point start) (y-point end)))))

; Program that uses the Point and Line Segment abstraction layers

(define my-line-segment (make-segment (make-point 3 2) (make-point 5 -1)))
(print-point (mid-point-segment my-line-segment))
