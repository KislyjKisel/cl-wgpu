(in-package #:%wgpu)

(cffi:define-foreign-library wgpu_native
  (:darwin (:or "libwgpu_native.dylib" "libwgpu_native"))
  (:unix (:or "libwgpu_native.so" "libwgpu_native" "wgpu_native"))
  (:windows (:or "wgpu_native.dll" "wgpu_native"))
  (t (:default "libwgpu_native")))
(cffi:use-foreign-library wgpu_native)

(autowrap:c-include
  '(cl-wgpu c-src "wgpu.h")
  :spec-path '(cl-wgpu autowrap-spec)
  :exclude-sources ("/usr/include/" "/usr/lib64/clang/[^/]*/include/.*")
  :include-sources ("stdint.h" "bits/types.h" "sys/types.h" "bits/stdint" "machine/_types.h" "stddef.h")
  :symbol-regex (("^wgpu(.+)" () "\\1")
                 ("^WGPU(.+)" () "\\1"))
  :symbol-exceptions ()
  :include-definitions ()
  :exclude-definitions ("^_[A-Z]" "max_align_t"))
