(asdf:defsystem :comment-macro
  :version      "0.1.0"
  :description  "Clojure-esque comment reader macro"
  :author       "Risto Stevcev <risto1@gmail.com>"
  :serial       t
  :license      "GNU GPL, version 3"
  :components   ((:file "comment"))
  :depends-on   (#:alexandria #:named-readtables))
