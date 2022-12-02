(defpackage #:aoc2022.day01
  (:nicknames #:day01)
  (:use #:cl #:cl-ppcre))

(in-package #:aoc2022.day01)

(defparameter input (uiop:read-file-string "resources/day01.txt"))

(defun parse-entry (entry)
  (reduce #'+ (mapcar #'read-from-string
                      (ppcre:split "\\n" entry))))

(defun parse-input (input)
  (mapcar #'parse-entry
    (ppcre:split "\\n\\n" input)))


(defun part-1 (data)
  (apply #'max data))

(defun part-2 (data)
  (apply #'+ (subseq (sort data #'>) 0 3)))

(defun main ()
  (let ((data (parse-input input)))
    (format t "Solution to Part 1 is : ~A~%" (part-1 data))
    (format t "Solution to Part 2 is : ~A~%" (part-2 data))))

(main)
