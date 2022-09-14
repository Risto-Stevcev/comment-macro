(defpackage   :comment-test
  (:use       :cl :named-readtables)
  (:documentation "doc"))

(in-package :comment-test)
(in-readtable comment:syntax)

(+ 1 2 #_(+ 3 4) 5)
