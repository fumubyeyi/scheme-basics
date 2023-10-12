;guile 2.2.3

; EOPL 2nd ed. Text. Pages 26. Exercises 1:17: 2
; Develop (sort long) that returns a list of long type elements in increasing order
; (sort `(8 2 5 2 3)) should return (2 2 3 5 8)

; CONTRACT: sort: number -> list number
; PURPOSE: sort take a list of numbers and returns a sorted list in increasing order

; CODE:
(define (sort numbers)
    (let ((mid (quotient (length numbers) 2)))
         (if (zero? mid)
            numbers
            (merge (sort (take numbers mid))
                   (sort (list-tail numbers mid))
            )
        )
    )
)
;; Merge two sorted function
(define (merge left right)
    (cond
        ((null? left)
            right)
        ((null? right)
            left)
        ((> (car left) (car right))
            (cons (car right)
                  (merge left (cdr right))))
        (else
            (cons (car left)
                  (merge (cdr left) right)))
        )
    )
;; Take the first n elements of a list
;; recursive call that create a new array
(define (take lst n)
    (if (zero? n) 
        '()
        (cons (car lst)
              (take (cdr lst) (- n 1))
        )
    )
)

;TEST CASES and EXPECTED OUTCOMES 
(display (sort '(8 2 5 2 3))) ;; (2 2 3 5 8)
(display "\n")
(display (sort '()))    ;; ()
(display "\n")
(display (sort '(5 -3))) ;; (-3 5)

