#lang racket

(define (numberExists targetNumber list)
    (if (> (length list) 0)
        (if (= targetNumber (car list))
            #t
            (numberExists targetNumber (cdr list))
        )
        #f
    )
)

(define (bubbleSort list tempList count result)
    (if (> count 0)
        (if (> (length (cdr tempList)) 0)
            (if (numberExists (car (cdr tempList)) result)
                (bubbleSort list (cons (car tempList) (cdr (cdr tempList))) count result)
                (if (and (> (car tempList) (car (cdr tempList))) (not (numberExists (car tempList) result)))
                    (bubbleSort list (cons (car tempList) (cdr (cdr tempList))) count result)
                    (bubbleSort list (cdr tempList) count result)
                )
            )
            (bubbleSort list list (- count 1) (cons (car tempList) result))
        )
        (display result)
    )
)

(define targetList '(3 10 4 8 2 12 7 1))

(bubbleSort targetList targetList (length targetList) '())

;; (1 2 3 4 7 8 10 12)
