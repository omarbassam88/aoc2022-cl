(in-package :asdf-user)

(defsystem #:aoc2022-cl
  :description "hello-lisp: a sample Lisp system."
  :version "0.0.1"
  :author "Joe User <joe@example.com>"
  :licence "Public Domain"
  :depends-on (:cl-ppcre :alexandria)
  :components
  ((:module "src"
    :components ((:file "day01")))))
