;; THIS FILE IS FORMAT-SENSITIVE.

#lang racket/base

(provide define/sobj sobj)

(require racket/stxparam
         syntax/parse/define
         (for-syntax racket/base))

(module+ test (require rackunit))

(define-syntax-parameter sobj
  (λ (stx) (raise-syntax-error #f "the keyword is used out of context")))

(define-syntax-parser define/sobj
  [(_ (name . args) body:expr ...+)
   #'(begin
       (define (internal-name the-sobj . args)
         (syntax-parameterize ([sobj (make-rename-transformer #'the-sobj)])
           body ...))
       (define-syntax-parse-rule (name . operands)
         #:with the-sobj #`(quote-syntax #,this-syntax)
         (internal-name the-sobj . operands)))])

(module+ test
  (define/sobj (test cmd)
    (case cmd
      [(line) (syntax-line sobj)]
      [(col) (syntax-column sobj)]))
  (check-equal? (test 'line) (test 'line))
  (check-not-equal? (test 'line)
                    (test 'line))
  (check-not-equal? (test 'col) (test 'col)))
