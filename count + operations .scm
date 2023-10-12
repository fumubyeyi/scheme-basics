#lang scheme


(define (ops e)
  (cond ((symbol? e) 0)
        ((eq? (car e) '+)
         (+ 1 (ops (cadr e))
               (ops (caddr e))
            )
         )
        ((eq? (car e) 'if)
         (+ (ops (cadr e))
            (ops (caddr e))
            (ops (cadddr e))
            )
         )
        (else (display "ILLEGAL"))
        )
  )

(display (ops '(+ 1 '(+ 2 3))))