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

Compile with `CM` like below:

```sh
$ LOCAL_LIB=~/.smlnj/lib
$ mkdir -p $LOCAL_LIB
$ echo 'CM.stabilize true "smlunit-lib.cm";' | sml
$ echo "smlunit-lib.cm $LOCAL_LIB/smlunit-lib.cm" >> ~/.smlnj-pathconfig
$ mkdir -p $LOCAL_LIB/smlunit-lib.cm
$ cp -R .cm $LOCAL_LIB/smlunit-lib.cm/.cm
```

Refer to `$/smlunit-lib.cm` from your `sources.cm`.

```
library
is
  $/basis.cm
  $/smlunit-lib.cm
  foo_test.sml
```


### MLton

#### Install

There is a `Makefile.mlton` for MLton.

To install SMLUnit, `make install` with the file:

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

Some test cases will fail.


### PolyML

To build, just `make`:

```sh
$ make -f Makefile.polyml
echo "" | poly -q --error-exit --eval 'PolyML.suffixes := ".sig"::(!PolyML.suffixes)' \
        --eval 'PolyML.make "src/main"' \
        --use export.sml \
        --eval 'PolyML.SaveState.saveModule ("libsmlunit.poly", SMLUnit)'
Making main
Making SMLUnit
..
Created structure SMLUnit
```

Then you will get `./libsmlunit.poly` which is the collection of SMLUnit entities that can be loaded.

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

It is possible to loading directly to the REPL:

```sh
$ poly --eval 'PolyML.suffixes := ".sig"::(!PolyML.suffixes)'
> PolyML.make "src/main";
Making main
Making SMLUnit
..
structure SMLUnit: SMLUNIT
val it = (): unit
```


