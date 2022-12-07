(defpackage #:aoc2022.day06
  (:use :cl :cl-ppcre))

(defparameter input (uiop:read-file-string "resources/day06.txt"))

(defun partition (s n)
  (loop :for i :from 0 :to (- (length s) n)
        :collect (subseq s i (+ i n))))

(defun unique? (s)
  (if (= (length s) 0)
      t
      (if (find (subseq s 0 1) (subseq s 1) :test #'string=)
          nil
          (unique? (subseq s 1)))))

(defun part-1 (data)
  (+ 4 (position-if #'unique? (partition data 4))))

(defun part-2 (data)
  (+ 14 (position-if #'unique? (partition data 14))))

(defun main ()
  (format t "Advent of Code Day 06~%")
  (format t "Solution to Part 1 is: ~A~%" (part-1 input))
  (format t "Solution to Part 2 is: ~A~%" (part-2 input)))
