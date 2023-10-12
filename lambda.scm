#lang scheme

(define add
  (lambda x
    (if (null? x)
        0
        (+ (car x) 
           (apply add 
                  (cdr x)
                  )
           )
        )
    )
  )

(define mul
  (lambda x
    (if (null? x)
        1
        (* (car x) 
           (apply mul  
                  (cdr x)
                  )
           )
        )
    )
  )

(define mul-v2
  (lambda (x)
    (if (null? x)
        1
        (* (car x) 
           (mul-v2  
                  (cdr x)
                  )
           )
        )
    )
  )

(display (add 0)) ; Should print 16
(newline)
(display (add 1 2 3 4 5))
(newline)
(display (mul 2 (+ 2 2) 5))

(newline)
(display (mul-v2 '(2 4 5)))
                