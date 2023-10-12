#lang scheme 


(define (sqr lst)
  (if (null? lst) '()
      (cons (* (car lst) (car lst))
            (sqr (cdr lst))
            )
      )
  )
(display (sqr '(1 2 3 4)))


(define (lstOfList lst)
  (if (null? lst) '()
      (cons (list (car lst))
            (lstOfList (cdr lst))
            )
      )
  )
(newline)
(display (lstOfList '(1 2 3 4)))

(define (map fn lst)
  (if (null? lst) '()
      (cons (fn (car lst))
            (map fn (cdr lst))
            )
      )
  )

(newline)
(display (map (lambda (x) (* x x)) '(1 2 3 4)))
(newline)
(display (map (lambda (x) (list x)) '(1 2 3 4)))