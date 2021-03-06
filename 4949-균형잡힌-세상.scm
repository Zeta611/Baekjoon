(import (chicken io))

(define (balanced? str)
  (define (open bp)
    (cond ((equal? bp #\)) #\()
          ((equal? bp #\]) #\[)))

  (define (opener? bp)
    (or (equal? bp #\()
        (equal? bp #\[)))

  (define (closer? bp)
    (or (equal? bp #\))
        (equal? bp #\])))

  (define (helper lst stack)
    (if (null? lst)
        (null? stack)
        (let ((hd (car lst))
              (tl (cdr lst)))
          (cond ((opener? hd)
                 (helper tl (cons hd stack)))
                ((closer? hd)
                 (cond ((null? stack) #f)
                       ((equal? (car stack) (open hd))
                        (helper tl (cdr stack)))
                       (else #f)))
                (else
                 (helper tl stack))))))
  (helper (string->list str) '()))

(define (main)
  (let ((input (read-line)))
    (unless (equal? input ".")
      (if (balanced? input)
          (display "yes\n")
          (display "no\n"))
      (main))))

(main)
