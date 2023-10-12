#lang scheme
; EOPL 2nd ed. Text. Pages 26. Exercises 1:17: 2
; Develop (sort long) that returns a list of long type elements in increasing order
; (sort `(8 2 5 2 3)) should return (2 2 3 5 8)

; CONTRACT: sort: number -> list number
; PUROPOSE: sort take a list of numbers and returns a sorted list in increasing order
; CODE:
(define (insertion-sort lst)
    (if (null? lst)
        '()
        (insert (car lst) 
                (insertion-sort (cdr lst))
        )
    )
)
;; Insert two sorted function
(define (insert n lst)
    (cond
        ((null? lst) (list n))
        ((> n (car lst))
             (cons (car lst) (insert n (cdr lst))))
        (else (cons n lst))
    )
  )

;; TESTS
(display (insertion-sort '(8 2 5 2 3))) ;; (2 2 3 5 8)
(display "\n")
(display (insertion-sort '()))    ;; ()
(display "\n")
(display (insertion-sort '(5 -3))) ;; (-3 5)
