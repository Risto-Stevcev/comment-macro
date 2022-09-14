(defpackage   :comment
  (:use       :cl)
  (:import-from :named-readtables :defreadtable)
  (:export    :comment-syntax :syntax)
  (:documentation "Clojure-like comment macros"))

(in-package :comment)


(defun comment-syntax (stream subchar arg)
  (declare (ignore subchar arg))
  (handler-case
      (let ((stack '())
            (chr (peek-char nil stream nil nil)))
        (if (eq chr #\()
            (progn
              (push (read-char stream nil nil) stack)
              (loop for chr = (peek-char nil stream nil nil)
                    until (or (alexandria:emptyp stack) (not chr))
                    do
                       (let ((chr (read-char stream nil nil)))
                         (case chr
                           (#\( (push #\( stack))
                           (#\) (if (eq (first stack) #\() (pop stack)))))
                    ))))
    (end-of-file () (values)))
  (values))

(defreadtable comment:syntax
   (:merge :standard)
   (:dispatch-macro-char #\# #\_ #'comment-syntax)
   (:case :preserve))
