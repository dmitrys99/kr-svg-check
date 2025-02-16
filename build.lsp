(ql:quickload 'kr-svg-check)
(asdf:make-build :kr-svg-check :type :program :move-here #P"./" :monolithic t :epilogue-code '(kr-svg-check:loader))
(si:exit)
