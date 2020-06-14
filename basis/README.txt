Standard ML Basis library test suite.

@author YAMATODANI Kiyoshi
@copyright 2010, Tohoku University.

One of advantages of Standard ML is that implementations share the specification of the language and Basis library.
It encourages portability and stable long life of softwares written in Standard ML.

We present a test suite for Standard ML Basis library.
Compiler implementors can use it to check the conformance of their implementation to the Basis specification.
We hope that this test suite helps to eliminate differences remaining among implementations of Basis library.

NOTE:
Assertion failures reported by this test suite do not necessarily indicate bugs of Basis implementation.
Some of them may be for our misinterpretation of Basis specification.
And, for some test cases, we could not decide what behavior conforms to Basis specification.

--------------------
Usage.

-----
SML#:

 $ make -C test
 $ ./test/testExec

-----
SML/NJ:

 $ cd test/
 $ sml -32
 Standard ML of New Jersey (32-bit) v110.97 [built: Tue May 12 00:13:26 2020]
 - CM.make "sources.cm";
      :
 val it = true : bool
 - TestMain.test();

-----
MLton:

 $ cd test/
 $ mlton sources.mlb
 $ ./sources

On some platform, compilation by MLton fails with an error message: 
  CreateFile failed with error 80.
In such cases, you have to comment out some test cases in TestMain.sml
to reduce the number of test cases, and retry it.

--------------------
