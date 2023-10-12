;guile 2.2.3

; EOPL 2nd ed. Text. Pages 26. Exercises 1:17:3
; Develop (sort p long) that returns a list of long type elements sorted based on the passed predicate
; (sort > `(8 2 5 2 3)) should return (2 2 3 5 8)

; CONTRACT: sort-predicate: fn number -> list number
; PURPOSE: sort-predicate take a list of numbers and returns a sorted list in increasing order

; CODE:
(define (sort-predicate p numbers)
    (let ((mid (quotient (length numbers) 2)))
         (if (zero? mid)
            numbers
            (if (equal? p ">")     ;; use equal to 
                (merge-increasing (sort-predicate p (take numbers mid))
                       (sort-predicate p (list-tail numbers mid))
                )
                (merge-decreasing (sort-predicate p (take numbers mid))
                       (sort-predicate p (list-tail numbers mid))
                )
            )
                
        )
    )
)
;; Merge two sorted list in increasing order 
(define (merge-increasing left right)
    (cond
        ((null? left)
            right)
        ((null? right)
            left)
        ((> (car left) (car right))
            (cons (car right)
                  (merge-increasing left (cdr right))))
        (else
            (cons (car left)
                  (merge-increasing (cdr left) right)))
        )
    )

;; Merge two sorted lists in decreasing order
(define (merge-decreasing left right)
    (cond
        ((null? left)
            right)
        ((null? right)
            left)
        ((< (car left) (car right))
            (cons (car right)
                  (merge-decreasing left (cdr right))))
        (else
            (cons (car left)
                  (merge-decreasing (cdr left) right)))
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
(display (sort-predicate ">" '(8 2 5 2 3))) ;; (2 2 3 5 8)
(display "\n")
(display (sort-predicate "<" '(8 2 5 2 3))) ;; (2 2 3 5 8)
(display "\n")
(display (sort-predicate ">" '(5 2 -3))) ;; (-3 5)
(display "\n")
(display (sort-predicate "<" '(5 0 -3))) ;; (-3 5)
