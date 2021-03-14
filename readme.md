SMLUnit:  Unit Testing Framework for SML(#)
============================================================

This is **unofficial** repository for SMLUnit.

If you get official information, see http://www.pllab.riec.tohoku.ac.jp/smlsharp/?SMLUnit .

What is **not** this
------------------------------

 * This is not official repository.
 * There is no relationship with SML# deveploment team or Tohoku University.

What is this
------------------------------

 * A general unit testing frame work for SML system(# is not required)
 * This is imported from SML#v3.6.0 unofficial repository (https://github.com/smlsharp/smlsharp/tree/v3.6.0)
 * This framework support SML#, SML/NJ and MLton explicitly
 ** build scripts Makefile(for SML#), CM file(for SML/NJ) and MLB file(for MLton) are included.

Setup
------------------------------

### SML&#x23;

Build object files with `Make`:

```sh
$ make
Makefile:56: Assert.d: No such file or directory
Makefile:56: SMLUnit.d: No such file or directory
Makefile:56: Test.d: No such file or directory
Makefile:56: TextUITestRunner.d: No such file or directory
 GEN [TextUITestRunner.d]
 GEN [Test.d]
 GEN [SMLUnit.d]
 GEN [Assert.d]
 SML# [Assert.o]
 SML# [SMLUnit.o]
 SML# [Test.o]
 SML# [TextUITestRunner.o]
```

then, you can use `smlunit-lib` from any other projects.
For using from other project, refer to `smlunit-lib.smi`:

```sml
(* test_foo.smi *)
..
(* refer to this library *)
_require "smlunit-lib.smi"
..
```

Build the project with `-I` and `-L` flags.

```sh
$ smlsharp -I/path/to/smlunit -L/path/to/smlunit -o test_foo test_foo.smi
```

### SML/NJ

#### Install

To install SMLUnit for SML/NJ, run `make install` with `Makefile.smlnj`:

```sh
$ make -f Makefile.smlnj install
```

To specify the directory to install to, run `make` with the variable `PREFIX`:

```sh
$ make -f Makefile.smlnj install PREFIX=~/.sml/smlnj
```

The `install` target uses `SMLDoc` to generate the documentations for SMLUnit.
If you do not need to generate documentation, run the `install-nodoc` target.

```sh
$ make -f Makefile.smlnj install-nodoc
```

After running the `install` or `install-nodoc` target, add an entry for `smlunit-lib.cm` to the pathconfig file to complete the installation.

```sh
$ echo 'smlunit-lib.cm /usr/local/smlnj/lib/smlunit-lib.cm' >> ~/.smlnj-pathconfig
```

or

```sh
$ echo 'smlunit-lib.cm PREFIX/lib/smlunit-lib.cm' >> ~/.smlnj-pathconfig
```


#### Test

To run SMLUnit unit tests, run the `test` target:

```sh
$ make -f Makefile.smlnj test
```

Depending on the test case, it will fails.


#### Examples

To run the example program, run `example` target:

```sh
$ make -f Makefile.smlnj example
```


### MLton

#### Install

To install SMLUnit for MLton, run `make install` with `Makefile.mlton`:

```sh
$ make -f Makefile.mlton install
```

Above command install SMLUnit to `/usr/local/mlton`.
This install location can be set with `PREFIX` variable like:

```sh
$ make -f Makefile.mlton PREFIX=~/.sml/mlton install
```

After running the `install` target, add an entry for `SMLUNIT_LIB` to your mlb path mapping file:

```sh
$ echo 'SMLUNIT_LIB /path/to/$PREFIX' >> /path/to/mlb-path-map
```


For using SMLUnit, refer to `$(SMLUNIT_LIB)/smlunit-lib.mlb` from your mlbasis file.

```
$(SML_LIB)/basis/basis.mlb
$(SMLUNIT_LIB)/smlunit-lib.mlb
.
.
```


#### Test

To run SMLUnit unit tests, run the `test` target:

```sh
$ make -f Makefile.mlton test
```

Depending on the test case, it will fails.


#### Examples

To run the example program, run `example` target:

```sh
$ make -f Makefile.smlnj example
```


### PolyML

To build, just `make`:

```sh
$ make -f Makefile.polyml
  [POLYML] libsmlunit.poly
Making main
Making SMLUnit
..
Created structure SMLUnit
```

Then you will get `./libsmlunit.poly` which is the collection of SMLUnit entities that can be loaded.

It is possible to load directly into the REPL:

```sh
$ poly
> PolyML.loadModule "/path/to/libsmlunit.poly";
signature ASSERT =
  sig
..
signature TESTRUNNER =
  sig type parameter val runTest: parameter -> Test.test -> unit end
val it = (): unit
```

#### Test

Execute unit tests for SMLUnit, run `test` target:

```sh
$ make -f Makefile.polyml test
```

In some test cases, it will fails.


#### Install

To install [SMLUnit] for [PolyML], perform `install` target.

```sh
$ make -f Makefile.polyml install
install -D -m 644 -t /usr/local/polyml/lib libsmlunit.poly
```

You can change installation directory with `PREFIX` variable:

```sh
$ make -f Makefile.polyml PREFIX=~/.sml install
install -D -m 644 -t /home/<user>/.sml/polyml/lib libsmlunit.poly
```

#### Examples

To run examples with Poly/ML, run the `example` target:

```sh

$ make -f Makefile.polyml example
  [POLYML] libsmlunit.poly
..
  [POLYML] smlunit-example-poly.o
..
  [POLYC] smlunit-example-poly
./smlunit-example-poly
.....
tests = 5, failures = 0, errors = 0
Failures:
Errors:
```

