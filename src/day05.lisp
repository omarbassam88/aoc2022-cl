(defpackage #:aoc2022.day05
  (:use :cl :cl-ppcre))

(defparameter input (uiop:read-file-string "resources/day05.txt"))

(defun parse-row (s)
  (ppcre:all-matches-as-strings "\\w|\\*"
               (ppcre:regex-replace-all "\\s{4}" s " * ")))

(defun parse-stacks (stacks-str)
  (let* ((rows (butlast (mapcar #'parse-row
                               (ppcre:split "\\n" stacks-str))))
         (cols (apply #'mapcar #'list rows)))
    (mapcar (lambda (col) (remove-if (lambda (s) (string= s "*")) col))
            cols)))

(defun parse-moves (moves-str)
  (mapcar (lambda (s) (mapcar #'read-from-string
                         (ppcre:all-matches-as-strings "\\d+" s)))
          (ppcre:split "\\n" moves-str)))

(defun parse-input (input)
  (destructuring-bind (stacks-str moves-str) (ppcre:split "\\n\\n" input)
    (list (parse-stacks stacks-str) (parse-moves moves-str))))

(defun make-move (stacks n from to)
  (dotimes (i n)
    (push (pop (nth (1- from) stacks))
          (nth (1- to) stacks)))
  stacks)

(defun move-multiple (stacks n from to)
  (setf (nth (1- to) stacks)
        (append (subseq (nth (1- from) stacks) 0 n)
                (nth (1- to) stacks)))
  (setf (nth (1- from) stacks)
        (subseq (nth (1- from) stacks) n))
  stacks)

(defun part-1 (data)
  (destructuring-bind (stacks moves) data
    (loop :for move :in moves
          :do (destructuring-bind (n from to) move
                (make-move stacks n from to)))
    (apply #'concatenate 'string
           (mapcar #'first stacks))))

(defun part-2 (data)
  (destructuring-bind (stacks moves) data
    (loop :for move :in moves
          :do (destructuring-bind (n from to) move
                (move-multiple stacks n from to)))
    (apply #'concatenate 'string
           (mapcar #'first stacks))))

(defun main ()
  (format t "Advent of Code Day 05~%")
  (format t "Solution to Part 1 is: ~A~%" (part-1 (parse-input input)))
  (format t "Solution to Part 2 is: ~A~%" (part-2 (parse-input input))))
