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

To install SMLUnit for SML/NJ, run `make install` using `Makefile.smlnj`:

```sh
$ make -f Makefile.smlnj install
```

To specify destination directory, run make with the variable `PREFIX`:

```sh
$ make -f Makefile.smlnj install PREFIX=~/.sml/smlnj
```

The `install` target use `SMLDoc` to generate the documentations of SMLUnit.
If you do not need to generate documentation, run the `install-nodoc` target.

```sh
$ make -f Makefile.smlnj install-nodoc
```

When the execution of the `install` or `install-nodoc` target is completed, add an entry for `smlunit-lib.cm` to the pathconfig file and the installation is complete.

```sh
$ echo 'smlunit-lib.cm /usr/local/smlnj/lib/smlunit-lib.cm'
```

or

```sh
$ echo 'smlunit-lib.cm PREFIX/lib/smlunit-lib.cm'
```


### MLton

#### Install

To install SMLUnit for MLton, run `make install` using `Makefile.mlton`:

```sh
$ make -f Makefile.mlton install
```

Above command install SMLUnit to `/usr/local/mlton`.
This install location can be set with `PREFIX` variable.

```sh
$ make -f Makefile.mlton PREFIX=~/.sml/mlton install
```

After `make install`, you need to add an entry in your mlb path mapping file:

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

Perform unit tests for SMLUnit, execute `test` target:

```sh
$ make -f Makefile.mlton test
```

In some test cases, it will fails.


#### Examples

This directory contains an example project to `example/`.

`Makefile.mlton` have target `example` build the project.
And the target is required by default target `all`.


```sh
$ make -f Makefile.mlton
.
.
  [MLTON] example/sources
$ ./example/sources
.....
tests = 5, failures = 0, errors = 0
Failures:
Errors:
.....
tests = 5, failures = 0, errors = 0
Failures:
Errors:
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

Perform unit tests for SMLUnit, execute `test` target:

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

To perform examples with Poly/ML, build target `example` of `Makefile.polyml`.


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

