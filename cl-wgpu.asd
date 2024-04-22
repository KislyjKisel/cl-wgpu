(asdf:defsystem #:cl-wgpu
    :depends-on (#:cl-autowrap/libffi)
    :serial t
    :components ((:module c-src
                  :pathname "wgpu"
                  :components ((:static-file "wgpu.h")
                               (:static-file "webgpu.h")))
                 (:module autowrap-spec
                  :pathname "spec"
                  :components ((:static-file "wgpu.x86_64-pc-linux-gnu.spec")
                               (:static-file "webgpu.x86_64-pc-linux-gnu.spec")))
                 (:module src
                  :pathname "src"
                  :components ((:file "package")
                               (:file "autowrap")
                               (:file "wrapped")))))
