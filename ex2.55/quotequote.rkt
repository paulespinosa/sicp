#lang sicp

; (car ''abracadabra)
; -> quote
; ''abracadabra is the result of evaluating (list 'quote 'abracadabra)
; therefore, the first item of the above list is quote.

(car ''abracadabra)
(car (list 'quote 'abracadabra))
''abracadabra
(list 'quote 'abracadabra)
