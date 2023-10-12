;guile 2.2.3

; EOPL 2nd ed. Text. Pages 26. Exercise 1:17:1
; (path n bst), where n is a number and bst is a binary search tree that contains the number n
; returns a list of lefts and rights showing how to find the node containing n. 
; returns the empty list if n is found at the root.
; (path 17 '(14 (7 () (12 () ())) (26 (20 (17 () ()) ()) (31 () ())))) -> (right left left)

; CONTRACT: path: number list -> list string
; PURPOSE: return the path with a list of lefts and rights showing how to find a node

; CODE:
(define (path n bst)
  (cond ((null? bst) '())
        ((= (car bst) n) '())
        ((< n (car bst))
         (cons "left" (path n (cadr bst)))
         )
        (else 
         (cons "right" (path n (caddr bst)))
        )
     )
  )

;TEST CASES and EXPECTED OUTCOMES 
(display (path 17 '(14 (7 () (12 () ())) (26 (20 (17 () ()) ()))))) 
; should output: (right left left)
(display "\n")
(display (path 10 '()))   ; ()
(display "\n")
(display (path 5 '(5)))   ; ()
(display "\n")
(display (path 3 '(1 () (2 (3) ())))) ; (right right)

