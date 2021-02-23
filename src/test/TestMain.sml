(**
 * @author YAMATODANI Kiyoshi
 * @copyright 2010, Tohoku University.
 *)
structure TestMain =
struct

  fun test (name, args) =
      (
        TestAssert.runTest ();
        TestTest.runTest ();
        TestTextUITestRunner.runTest ();
        OS.Process.success
      )

end
