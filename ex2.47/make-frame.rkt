#lang sicp

; (list 1 2 3) => (cons 1 (cons 2 (cons 3 nil)))
; To get 3:
;                      car *cdr*
;                              car *cdr*
;                                      *car* cdr
(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))
(define (frame-origin frame)
  (car frame))
(define (frame-edge1 frame)
  (cadr frame))
(define (frame-edge2 frame)
  (caddr frame))

(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))
(define (frame-origin frame)
  (car frame))
(define (frame-edge1 frame)
  (cadr frame))
(define (frame-edge2 frame)
  (cddr frame))
