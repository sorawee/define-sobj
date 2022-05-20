#lang scribble/manual
@require[scribble/example
         @for-label[define-sobj
                    racket/base]]

@(define evaluator (make-base-eval))
@(evaluator '(require define-sobj))

@title{define-sobj}
@author[@author+email["Sorawee Porncharoenwase" "sorawee.pwase@gmail.com"]]

@defmodule[define-sobj]

This library provides a macro @racket[define/sobj], which is similar to
@racket[define], but it has an access to syntax objects for the function call, via the variable @racket[sobj].
In return, the function must be used in the first-order fashion.

@defform[(define/sobj function-header body ...+)]{
  @examples[#:eval evaluator
    (define/sobj (test x)
      (list x sobj))
    (test 42)
    (test 7)
  ]
}


@defidform[sobj]{
  Recognized specially within forms like @racket[define/sobj].
  A @racket[sobj] form out of context is a syntax error.
}
