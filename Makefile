LISP ?= sbcl
SYSNAME = cl-wgpu

.PHONY: repl

repl:
	$(LISP) \
		--eval '(asdf:load-asd (merge-pathnames "$(SYSNAME).asd" (uiop:getcwd)))' \
		--eval '(ql:quickload "$(SYSNAME)")'
