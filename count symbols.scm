#lang scheme

(define (countSymbols x)
  (cond ((null? x) 0)
        ((or (number? (car x)) (string? (car x))) (countSymbols (cdr x)))
        ((symbol? (car x)) (+ (countSymbols (cdr x)) 1))
        (else (+ (countSymbols (car x)) (countSymbols (cdr x))))
        )
  )

(display (countSymbols '(a)))
(display (countSymbols '(2 56 x (1 y))))
(display (countSymbols '(((a)) -2 (2 (ab b) (-1 0 1)))))