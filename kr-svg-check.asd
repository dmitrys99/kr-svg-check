(asdf:defsystem :kr-svg-check
  :version "0.1"
  :author "Дмитрий Соломенников <dmitrys99@mail.ru>"
  :license "BSD"
  :description "Тестовая система для SVG-файлов"
  :depends-on (:alexandria :adopt :s-xml :cl-svg)
  :components ((:file "package")
	       (:file "options")
	       (:file "xml-utils")
	       (:file "toplevel" :depends-on ("package" "options" "xml-utils"))))
