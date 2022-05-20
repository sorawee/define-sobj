#lang info
(define collection "define-sobj")
(define deps '("base"))
(define build-deps '("scribble-lib" "racket-doc" "rackunit-lib"))
(define scribblings '(("scribblings/define-sobj.scrbl" ())))
(define pkg-desc "An anaphoric macro that binds sobj to call syntax object")
(define version "0.0")
(define pkg-authors '(sorawee))
(define license '(Apache-2.0 OR MIT))
