(in-package :kr-svg-check)

(defparameter *версия* "1.0")

(defun run (опции)
  (let ((входной-файл (gethash 'input опции))
	(тест         (gethash 'test  опции)))
    (when (not (probe-file входной-файл))
      (adopt:print-error-and-exit
       (format nil
	       "Не удалось загрузить входной файл ~A"
	       входной-файл)))
    (let ((текст (alexandria:read-file-into-string входной-файл))
	  (кусок (if (probe-file тест)
		     (alexandria:read-file-into-string тест)
		     тест)))
      (if (xml-nested-p (ensure-xml текст)
			(ensure-xml кусок))
	  (progn
	    (print "OK")
	    (adopt:exit 0))
	  (progn
	    (print "FAIL")
	    (adopt:exit 1))))))

(defun loader ()
  (setf adopt:*error-string* "Ошибка")
  (handler-case
      (multiple-value-bind (arguments options)
	  (adopt:parse-options *командная-строка* (adopt:argv))
	;; (print (alexandria:hash-table-alist options))
	;; Показываем справку?
        (when (or (= 1 (length (adopt:argv)))
		  (gethash 'help options))
          (adopt:print-help-and-exit *командная-строка*
				     :option-width 23
				     :width 80))
	;; Показываем версию?
	(when (gethash 'version options)
          (format t "~A~%" *версия*)
          (adopt:exit))

	;; Проверяем наличие входного файла
	(when (not (gethash 'input options))
	  (adopt:print-error-and-exit
	   (format nil
		   "Должен быть указан входной файл (параметр '-~A' или '--~A')"
		   (adopt::short *опция-входной-файл*)
		   (adopt::long  *опция-входной-файл*))))

	(when (not (gethash 'test options))
	  (adopt:print-error-and-exit
	   (format nil
		   "Должен быть указан тестовый фрагмент (файл или строка) (параметр '-~A' или '--~A')"
		   (adopt::short *опция-тест*)
		   (adopt::long  *опция-тест*))))
	;; Запускаем
        (run options))
    (error (c)
      (adopt:print-error-and-exit c))))
