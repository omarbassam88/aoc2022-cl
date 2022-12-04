(defpackage #:aoc2022.day03
  (:use :cl :cl-ppcre))

(in-package #:aoc2022.day03)

(defparameter input (uiop:read-file-string "resources/day03.txt"))

(defun parse-input (input)
  (ppcre:split "\\n" input))
  
(defun common-letters (&rest strs)
  (case (length strs)
    (2 (destructuring-bind (s1 s2) strs
         (intersection
          (ppcre:split "" s1) (ppcre:split "" s2) :test #'string=)))
    (t (destructuring-bind (s1 s2 s3) strs
         (intersection (common-letters s1 s2) (common-letters s1 s3) :test #'string=)))))

(defun cut-in-half (s)
  (let* ((end (length s))
         (mid (floor end 2)))
    (list  (subseq s 0 mid) (subseq s mid end))))

(defun priority (c)
  (let ((code (char-int (char c 0))))
    (if (>= code 97)
        (- code 96)
        (- code 38))))

(defun partition (n lst)
  (loop :for i :from 0 :to (1- (floor (length lst) n))
        :collect (subseq lst (*  i n) (+ (* i n) n))))

(defun score (entries)
  (reduce #'+
          (mapcar #'(lambda (x) (priority (first (apply #'common-letters x))))
                  entries)))

(defun part-1 (data)
  (score (mapcar #'cut-in-half data)))

(defun part-2 (data)
  (score (partition 3 data)))

(defun main ()
  (format t "Advent of Code Day 03~%")
  (let ((data (parse-input input)))
    (format t "Solution to Part 1 is: ~A~%" (part-1 data))
    (format t "Solution to Part 2 is: ~A~%" (part-2 data))))
