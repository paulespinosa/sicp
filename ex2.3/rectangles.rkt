; Exercise 2.3
#lang sicp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; From exercise 2.2
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

;; End from exercise 2.2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Additional helper procedures

(define (sqr x) (* x x))

(define (point-distance p1 p2)
  (sqrt (+ (sqr (- (x-point p2) (x-point p1))) (sqr (- (y-point p2) (y-point p1))))))

(define (line-segment-length s)
  (point-distance (start-segment s) (end-segment s)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Rectangle 1 abstraction layer

; Define a constructor `make-rectangle` and selectors `rectangle-height` and
; `rectangle-width` to represent a rectangle in terms of a line segment representing the
; base and a number representing the height of its perpendicular.
(define (make-rectangle base-line-segment perp-height)
  (cons base-line-segment perp-height))
(define (rectangle-width r)
  (line-segment-length (car r)))
(define (rectangle-height r)
  (cdr r))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Public interface layer that any representation of a rectangle should adhere to

; Define procedures that compute the perimeter and area of a rectangle
; regardless of its representation.
(define (rectangle-perimeter r)
  (* 2.0 (+ (rectangle-width r) (rectangle-height r))))
(define (rectangle-area r)
  (* (rectangle-width r) (rectangle-height r)))

; Define a procedure to print points
(define (print-rectangle r)
  (newline)
  (display "Perimeter: ")
  (display (rectangle-perimeter r))
  (newline)
  (display "Area: ")
  (display (rectangle-area r)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Program that uses the Rectangle 1 representation

(define rectangle-1 (make-rectangle (make-segment (make-point 1 1) (make-point 5.58 3.1))
                                         4.0))
(print-rectangle rectangle-1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Rectangle 2 abstraction layer

; Helper
(define (dot-product p1 p2)
  (+ (* (x-point p1) (x-point p2))
     (* (y-point p1) (y-point p2))))

(define (add-vector v1 v2)
  (make-point (+ (x-point v1) (x-point v2))
              (+ (y-point v1) (y-point v2))))

(define (sub-vector v1 v2)
  (make-point (- (x-point v1) (x-point v2))
              (- (y-point v1) (y-point v2))))

(define (orthogonal? v1 v2)
  (= 0.0 (dot-product v1 v2))) ; should it be better with an small range?

; Define a constructor `make-rectangle` and selectors `rectangle-width` and `rectangle-height`
(define (make-rectangle origin p1 p2)
  (if (orthogonal? (sub-vector p2 p1) (sub-vector p3 p1))
      (cons p1 (cons p2 p3))
      (error "Points should make an rectangle."))) ; check orthogonality, which is longer? (error "Argument not 0 or 1: CONS" m)

(define (rectangle-height r) (distance-point (p1-rect r) (p2-rect r)))
(define (rectangle-width  r) (distance-point (p1-rect r) (p3-rect r)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Program that uses the Rectangle 2 representation

(define origin (make-point 1 1))
(define p1 (make-point 0.5 3))
(define p2 (make-point 5.58 3.1))
(define rectangle-2 (make-rectangle origin p1 p2))

(print-rectangle rectangle-2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
