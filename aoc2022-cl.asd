(in-package :asdf-user)

(defsystem #:aoc2022-cl
  :description "Advent Of Code 2022"
  :version "0.0.1"
  :author "Omar Bassam"
  :licence "Public Domain"
  :depends-on (:cl-ppcre :alexandria)
  :components
  ((:module "src"
    :components ((:file "day01")
                 (:file "day02")
                 (:file "day03")
                 (:file "day04")
                 (:file "day05")))))
