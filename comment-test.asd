(asdf:defsystem :comment-test
  :version      "0.1.0"
  :description  "Test comment macros"
  :author       "Risto Stevcev <risto1@gmail.com>"
  :serial       t
  :license      "BSD-3-Clause"
  :components   ((:file "comment-test"))
  :depends-on   (#:comment-macro :fiveam))
