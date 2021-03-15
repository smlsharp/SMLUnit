(**
 * @author YAMATODANI Kiyoshi
 * @copyright 2010, Tohoku University.
 *)
structure TestMain =
struct

  fun main (name, args) =
      (
        TestAssert.runTest ();
        TestTest.runTest ();
        TestTextUITestRunner.runTest ();
        OS.Process.success
      )

  fun test () =
    ignore (main (CommandLine.name(), CommandLine.arguments()))

end
