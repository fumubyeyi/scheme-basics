;guile 2.2.3

;---------------------------------------------------------------;
; ADT Map
;
; OPERATIONS
;  emap:          Map
;  clear:         Map    -> Map
;  containsKey:   Map x Key -> boolean
;  containsValue: Map x Value -> boolean
;  equals:        Map x Map -> boolean
;  get:           Map x Key -> Value
;  isEmpty:       Map -> boolean
;  put:           Map x Key x Value -> Map
;  remove:        Map x Key -> Map
;  size:          Map -> Number

; CLASSIFICATIONS
;  Observers:  containsKey, containsValue, equals, get, isEmpty, size
;  Constructors: emap, put
;  Non-contructors: clear, remove

; ADT SPECIFICATION
; 
; for all m, n in Map, k, ki in Key, v, vi in Value:
    ; containsKey(emap, k) = false
    ; containsKey(put(m, ki, vi), k) = 
        ; (k = ki) orelse containsKey(m, k)
        
    ; containsValue(emap, v) = false
    ; containsValue(put(m, ki, vi), v) = 
        ; (v = vi) orelse containsValue(m, v)
        
    ; equals(m, n) = (eqv? m n)
    
    ; get(put(m, ki, vi) k) = 
        ; if ( k = ki) then vi else get(m , k)
        
    ; isEmpty(emap) = true
    ; isEmpty(put(m, ki, vi)) = false
    
    ; remove(emap) = ?error?
    ; remove(put(m, ki, vi) k) =
        ; if (k = ki) then remove(m ki) else remove(m, k)
    ; clear(emap) = emap
    ; clear(put(m, ki, vi)) = clear(remove(m, ki))  
    
    ;size(emap) = 0;
    ;size(put(m, ki, vi)) = 1 + size(m)
    
    
; IMPLEMETATION 
;
(define clear (lambda (m) (vector-ref m 0)))
(define containsKey (lambda (m) (vector-ref m 1)))
(define containsValue (lambda (m) (vector-ref m 2)))
(define equals (lambda (m) (vector-ref m 3)))
(define get (lambda (m) (vector-ref m 4)))
(define isEmpty (lambda (m) (vector-ref m 5)))
(define put (lambda (m) (vector-ref m 6)))
(define remove (lambda (m) (vector-ref m 7)))
(define size (lambda (m) (vector-ref m 8)))
  
  
(define create-map
  (lambda 
    )
  
  )

(define M (create-map)) ; instantiation

; will continue from here... I don't think this was covered in class yet
 
                     