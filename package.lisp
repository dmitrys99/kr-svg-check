;;; -*- Mode: Lisp indent-tabs-mode: nil -*-
;;;
;;; package.lisp --- Определение пакета
;;;
;;; Copyright (c) 2024 Дмитрий Соломенников <dmitrys99@mail.ru>
;;;

(cl:defpackage #:kr-svg-check
  (:use #:cl)
  (:nicknames :check)
  (:export
   #:loader))
