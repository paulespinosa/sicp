#lang sicp

; 2.63

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

; Procedure 1
(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append
       (tree->list-1
        (left-branch tree))
       (cons (entry tree)
             (tree->list-1
              (right-branch tree))))))
(tree->list-1 (list 7 (list 3 (list 1 '() '()) (list 5 '() '())) (list 9 '() (list 11 '() '()))))
(tree->list-1 (list 3 (list 1 '() '()) (list 7 (list 5 '() '()) (list 9 '() (list 11 '() '())))))
(tree->list-1 (list 5 (list 3 (list 1 '() '()) '()) (list 9 (list 7 '() '()) (list 11 '() '()))))
(tree->list-1 (list 4 (list 3 (list 2 (list 1 '() '()) '()) '()) '()))
(tree->list-1 (list 1 '() (list 2 '() (list 3 '() (list 4 '() '())))))
(tree->list-1 (list 2 (list 1 '() '()) (list 3 '() '())))

;; 1. Procedure 1
;; Tree 1: (append (tl1 (3 (1) (5))) (7 (tl1 (9 () (11)))))
;; (append (append (tl1 (1)) (3 (tl1 (5)))) (7 (append (tl1 ()) (9 (tr1 (11))))))
;; (append (append (append () (1 ())) (3 (append () (5 ())))) (7 (append () (9 (append () (11))))))
;; (1 3 5 7 9 11)

;; Tree 2: (1 3 5 7 9 11)

;; Tree 3: (1 3 5 7 9 11)

; Procedure 2
(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list
         (left-branch tree)
         (cons (entry tree)
               (copy-to-list
                (right-branch tree)
                result-list)))))
  (copy-to-list tree '()))

(tree->list-2 (list 7 (list 3 (list 1 '() '()) (list 5 '() '())) (list 9 '() (list 11 '() '()))))
(tree->list-2 (list 3 (list 1 '() '()) (list 7 (list 5 '() '()) (list 9 '() (list 11 '() '())))))
(tree->list-2 (list 5 (list 3 (list 1 '() '()) '()) (list 9 (list 7 '() '()) (list 11 '() '()))))
(tree->list-2 (list 4 (list 3 (list 2 (list 1 '() '()) '()) '()) '()))
(tree->list-2 (list 1 '() (list 2 '() (list 3 '() (list 4 '() '())))))
(tree->list-2 (list 2 (list 1 '() '()) (list 3 '() '())))

;; 1. Procedure 2
;; Tree 1: (1 3 5 7 9 11)
;; Tree 2: (clt (3 (1 () ())
;;                 (7 (5 () ())
;;                    (9 ()
;;                       (11 () ()))))
;;              ())

;; (clt (1 () ())
;;      (cons 3
;;           (ctl (7 (5 () ())
;;               (9 ()
;;                 (11 () ())))
;;                 ())))

;; (clt (1 () ())
;;      (cons 3
;;            (ctl (5 () ())
;;                 (cons 7
;;                    (ctl (9 ()
;;                            (11 () ()))
;;                         ()))
;;                 ())))

;; (clt (1 () ())
;;      (cons 3
;;            (ctl (5 () ())
;;                 (cons 7
;;                       (ctl ()
;;                            (cons 9
;;                                 (ctl (11 () ()) )
;;                                 ())
;;                            ()))
;;                 ())))

;; (clt (1 () ())
;;      (cons 3
;;            (ctl (5 () ())
;;                 (cons 7
;;                       (ctl ()
;;                            (cons 9
;;                                  (ctl ()
;;                                       (cons 11
;;                                             (ctl ())
;;                                             ()) )
;;                                  ())
;;                            ()))
;;                 ())))

;; ; compute
;; (clt (1 () ())
;;      (cons 3
;;            (ctl (5 () ())
;;                 (cons 7
;;                       (ctl ()
;;                            (cons 9
;;                                  (ctl ()
;;                                       (cons 11
;;                                             (ctl () ())))
;;                                  ())
;;                            ()))
;;                 ())))

;; (clt (1 () ())
;;      (cons 3
;;            (ctl (5 () ())
;;                 (cons 7
;;                       (ctl ()
;;                            (cons 9
;;                                  (ctl ()
;;                                       (cons 11
;;                                             ()))
;;                                  ())
;;                            ()))
;;                 ())))

;; (clt (1 () ())
;;      (cons 3
;;            (ctl (5 () ())
;;                 (cons 7
;;                       (ctl ()
;;                            (cons 9
;;                                  (ctl ()
;;                                       (11))
;;                                  ())
;;                            ()))
;;                 ())))

;; (clt (1 () ())
;;      (cons 3
;;            (ctl (5 () ())
;;                 (7 9 11))))

;; Tree 2: (1 3 5 7 9 11)

;; Tree 3: (1 3 5 7 9 11)

; The two procedures produce the same results.
; 2. tree->list-1 has an O(n*log(n)) order of growth because the append procedure has an order of growth of O(n). Since append is called n times with halved amount of items n/2, you get t(n) = 2*t(n/2) + O(n/2) [tree->list-1 is called twice and append called once each time]. This results in a order of growth of O(n*log(n)).
; tree->list-2 has an O(n) order of growth because cons is has a constant time order of growth. The procedure is called for each node in the tree.
