(defpackage #:aoc2022.day04
  (:use :cl :cl-ppcre))

(in-package #:aoc2022.day04)

(defparameter input (uiop:read-file-string "resources/day04.txt"))

(defun parse-ranges (ranges)
  (mapcar #'parse-integer ranges))

(defun parse-input (input)
  (mapcar #'parse-ranges
          (mapcar (lambda (s) (ppcre:all-matches-as-strings "\\d+" s))
                  (ppcre:split "\\n" input))))

(defun fully-contains? (ranges)
  (destructuring-bind (s1 e1 s2 e2) ranges
    (or (<= s1 s2 e2 e1)
        (<= s2 s1 e1 e2))))

(defun overlaps? (ranges)
  (destructuring-bind (s1 e1 s2 e2) ranges
    (or (fully-contains? ranges)
        (<= s2 e1 e2)
        (<= s1 e2 e1))))

(defun part-1 (data)
  (length (remove-if-not #'identity (mapcar #'fully-contains? data))))

(defun part-2 (data)
  (length (remove-if-not #'identity (mapcar #'overlaps? data))))

(defun main ()
  (format t "Advent of Code Day 03~%")
  (let ((data (parse-input input)))
    (format t "Solution to Part 1 is: ~A~%" (part-1 data))
    (format t "Solution to Part 2 is: ~A~%" (part-2 data))))
