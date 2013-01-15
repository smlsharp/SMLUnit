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
 * This is imported from SML#v0.90 unofficial repository (https://github.com/smlsharp/smlsharp/tree/v0.90)
 * This framework support SML#, SML/NJ and MLton explicitly
 ** build scripts Makefile(for SML#), CM file(for SML/NJ) and MLB file(for MLton) are included.

Setup
------------------------------

### SML#

```sh
$ make
```
then, you can _\_require_ smlunitlib.smi from any SML# resource files :)

### SML/NJ

```sh
$ echo 'CM.stabilize true "smlunitlib.cm";' | sml
$ echo "smlunitlib.cm smlunitlib.cm" >> $SMLNJ_ROOT/lib/pathconfig
$ mkdir -p $SMLNJ_ROOT/lib/smlunitlib.cm
$ cp -R src/main/.cm $SMLNJ_ROOT/lib/smlunitlib.cm/.cm
```
use from CompileManager as '$/smlunitlib.cm'.


### MLton

```sh
$ echo 'SMLUNIT_LIB /path/to/this/lib' >> $MLTON_ROOT/mlb-path-map
```
use from MLB as '$(SMLUNIT_LIB)/smlunitlib.mlb'.


