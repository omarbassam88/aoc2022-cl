(defpackage #:aoc2022.day02
  (:nicknames #:day02)
  (:use #:cl #:cl-ppcre #:alexandria)
  (:local-nicknames (:alex :alexandria)))

(in-package #:aoc2022.day02)

(defparameter input (uiop:read-file-string "resources/day02.txt"))

(defun parse-entry (entry)
  (reduce #'+ (mapcar #'read-from-string
                      (ppcre:split "\\n" entry))))

(defun parse-input (input)
  (mapcar (lambda (s) (ppcre:split " " s))
    (ppcre:split "\\n" input)))

(defun parse-entry (entry rules)
  (getf (getf rules (alex:make-keyword (first entry)))
        (alex:make-keyword (second entry))))

(defun part-1 (data)
  ;;Rock   A X 1
  ;;Paper  B Y 2
  ;;Sciss  C Z 3
  (let ((scores '(:A (:X 4 :Y 8 :Z 3)
                  :B (:X 1 :Y 5 :Z 9)
                  :C (:X 7 :Y 2 :Z 6))))
    (reduce #'+ (mapcar #'(lambda (x) (parse-entry x scores)) data))))

(defun part-2 (data)
  ;; A Rock  1 | X Lose
  ;; B Paper 2 | Y Draw
  ;; C Sciss 3 | Z Win
  (let ((scores '(:A (:X 3 :Y 4 :Z 8)
                  :B (:X 1 :Y 5 :Z 9)
                  :C (:X 2 :Y 6 :Z 7))))
    (reduce #'+ (mapcar #'(lambda (x) (parse-entry x scores)) data))))

(defun main ()
  (let ((data (parse-input input)))
    (format t "Solution to Part 1 is : ~A~%" (part-1 data))
    (format t "Solution to Part 2 is : ~A~%" (part-2 data))))

(main)
