(in-package #:kr-svg-check)

(defparameter *опция-справка*
  (adopt:make-option 'help
		     :help "Показать справку и выйти"
		     :long "help"
		     :short #\h
		     :reduce (constantly t)))

(defparameter *опция-версия*
  (adopt:make-option 'version
		     :long "version"
		     :short #\v
		     :help "Показать номер версии и выйти"
		     :reduce (constantly t)))

(defparameter *опция-входной-файл*
  (adopt:make-option 'input
		     :long "input"
		     :short #\i
		     :parameter "файл"
		     :help "Входной файл в формате SVG"
		     :reduce #'adopt:last))

(defparameter *опция-тест*
  (adopt:make-option 'test
		     :long "test"
		     :short #\t
		     :parameter "тест"
		     :help "Проверяемое значение, строка или имя файла"
		     :initial-value ""
		     :reduce #'adopt:last))

(adopt:define-string *текст-справки*
  "Утилита получает на вход файл SVG и фрагмент 
XML-документа и проверяет наличие фрагмента в SVG-файле")

(defparameter *командная-строка*
  (adopt:make-interface :name "kr-check"
			:usage "опции"
			:usage-string "Вызов"
			:options-string "Опции"
			:summary "Проверка содержимого SVG-файла"
			:help *текст-справки*
			:contents (list *опция-входной-файл*
					*опция-тест*
					*опция-версия*
					*опция-справка*)))
