#!/usr/bin/sbcl --script

(load "~/.sbclrc")

(load "aoc2022-cl.asd")

(ql:quickload :aoc2022-cl
  :silent t)

(day01::main)
