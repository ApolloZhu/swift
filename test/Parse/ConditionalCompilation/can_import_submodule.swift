// RUN: %target-typecheck-verify-swift -I %S/Inputs/can-import-submodule/ 

#if canImport(A)
import A
#else
import A
#error("canImport checked wrong")
#endif

#if canImport(A.B)
import A.B
#else
import A.B
#error("canImport checked wrong")
#endif

#if canImport(A.B.C)
import A.B.C
#else
import A.B.C
#error("canImport checked wrong")
#endif


#if canImport(A(_:).B) // expected-error {{unexpected platform condition argument: expected module name}}
#endif

#if canImport(A.B(c: "arg")) // expected-error {{unexpected platform condition argument: expected module name}}
#endif

#if canImport(A(b: 1, c: 2).B.C) // expected-error {{unexpected platform condition argument: expected module name}}
#endif

#if canImport(A.B("arg")(3).C) // expected-error {{unexpected platform condition argument: expected module name}}
#endif

#if canImport(A.B.C()) // expected-error {{unexpected platform condition argument: expected module name}}
#endif
