#lang scheme

(define reset (lambda (q) (vector-ref q 0)))
(define empty? (lambda (q) (vector-ref q 1)))
(define enqueue (lambda (q) (vector-ref q 2)))
(define dequeue (lambda (q) (vector-ref q 3)))

(define Q (create-queue))

((enqueue Q) 55)

(create-queue)